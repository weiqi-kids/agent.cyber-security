#!/usr/bin/env python3
"""
Threat Feeds Layer 萃取腳本
處理 ThreatFox 和 MalwareBazaar 的 JSONL 資料
"""

import json
import sys
from pathlib import Path
from datetime import datetime
from typing import Dict, Any

PROJECT_ROOT = Path(__file__).parent.parent.parent
DOCS_DIR = PROJECT_ROOT / "docs" / "Extractor" / "threat_feeds"

def sanitize_url(url: str) -> str:
    """將惡意 URL 脫敏處理（僅用於 IoC 值，不處理來源連結）"""
    return url.replace("http://", "hxxp://").replace("https://", "hxxps://")

def slugify(text: str) -> str:
    """產生 URL-safe 的 slug"""
    return text.lower().replace(" ", "-").replace("/", "-").replace(".", "-")

def extract_threatfox(record: Dict[str, Any], line_num: int) -> Dict[str, Any]:
    """萃取 ThreatFox IoC"""
    ioc_type = record.get("ioc_type", "")
    threat_type = record.get("threat_type", "")
    malware = record.get("malware_printable", record.get("malware", "Unknown"))
    ioc_value = record.get("ioc_value", "")
    ioc_id = record.get("id", line_num)
    first_seen = record.get("first_seen_utc", "")[:10]  # YYYY-MM-DD
    confidence = record.get("confidence_level", 0)
    reference = record.get("reference", "")
    tags = record.get("tags", "").split(",") if record.get("tags") else []

    # 判定分類
    if "botnet_cc" in threat_type or "C2" in tags:
        category = "c2_infrastructure"
    else:
        category = "ioc_indicator"

    # 判定威脅等級
    if "botnet_cc" in threat_type or "C2" in tags:
        threat_level = "Critical"
    elif "payload_delivery" in threat_type:
        threat_level = "High"
    else:
        threat_level = "Medium"

    # IoC 值處理
    if ioc_type in ["url", "domain"]:
        ioc_value_display = sanitize_url(ioc_value) if ioc_type == "url" else ioc_value
    else:
        ioc_value_display = ioc_value

    # 產生檔名
    date_str = first_seen or "2026-02-20"
    malware_slug = slugify(malware)
    filename = f"{date_str}-{malware_slug}-{ioc_id}.md"

    return {
        "filename": filename,
        "category": category,
        "title": f"{malware} - {ioc_value}",
        "date": date_str,
        "source": "abuse.ch ThreatFox",
        "threat_type": "botnet" if "botnet" in threat_type else "malware",
        "malware_family": malware,
        "status": "online",
        "threat_level": threat_level,
        "confidence": "高" if confidence >= 80 else "中" if confidence >= 50 else "低",
        "ioc_type": ioc_type,
        "ioc_value": ioc_value_display,
        "reference": reference,
        "tags": tags,
        "ioc_id": ioc_id,
        "description": f"偵測到 {malware} 相關的 {ioc_type} 指標。",
    }

def extract_malwarebazaar(record: Dict[str, Any], line_num: int) -> Dict[str, Any]:
    """萃取 MalwareBazaar 樣本"""
    sha256 = record.get("sha256", "").strip()
    signature = record.get("signature", "n/a").strip()
    file_type = record.get("file_type", "unknown").strip()
    first_seen = record.get("first_seen", "")[:10]  # YYYY-MM-DD
    file_name = record.get("file_name", "unknown").strip()
    md5 = record.get("md5", "").strip()
    sha1 = record.get("sha1", "").strip()

    # 產生檔名
    date_str = first_seen or "2026-02-20"
    sig_slug = slugify(signature) if signature != "n/a" else "unknown"
    filename = f"{date_str}-{sig_slug}-{sha256[:16]}.md"

    return {
        "filename": filename,
        "category": "malware_sample",
        "title": f"{signature} 惡意程式樣本",
        "date": date_str,
        "source": "abuse.ch MalwareBazaar",
        "threat_type": "malware",
        "malware_family": signature if signature != "n/a" else "Unknown",
        "status": "unknown",
        "threat_level": "High",
        "confidence": "高",
        "ioc_type": "hash_sha256",
        "ioc_value": sha256,
        "md5": md5,
        "sha1": sha1,
        "file_type": file_type,
        "file_name": file_name,
        "description": f"偵測到惡意程式樣本，檔案類型為 {file_type}。",
    }

def generate_markdown(data: Dict[str, Any], source_type: str) -> str:
    """產生 Markdown 格式"""
    if source_type == "threatfox":
        return f"""# {data['title']}

| 項目 | 內容 |
|------|------|
| **日期** | {data['date']} |
| **來源** | {data['source']} |
| **分類** | {data['category']} |
| **威脅類型** | {data['threat_type']} |
| **惡意程式家族** | {data['malware_family']} |
| **狀態** | {data['status']} |
| **威脅等級** | {data['threat_level']} |
| **信心水準** | {data['confidence']} |

## 威脅描述

{data['description']}

首次觀測時間：{data['date']}

## IoC 指標

| 類型 | 值 |
|------|-----|
| {data['ioc_type']} | `{data['ioc_value']}` |

## 關聯分析

{f"標籤：{', '.join(data['tags'])}" if data['tags'] else "無額外關聯資訊。"}

{f"參考來源：{data['reference']}" if data['reference'] else ""}

## 來源連結

- [ThreatFox IoC #{data['ioc_id']}](https://threatfox.abuse.ch/ioc/{data['ioc_id']}/)

---
> 萃取時間：{datetime.utcnow().strftime("%Y-%m-%d %H:%M UTC")}
> 資料來源：abuse.ch ThreatFox (threatfox-recent)
"""
    else:  # malwarebazaar
        return f"""# {data['title']}

| 項目 | 內容 |
|------|------|
| **日期** | {data['date']} |
| **來源** | {data['source']} |
| **分類** | {data['category']} |
| **威脅類型** | {data['threat_type']} |
| **惡意程式家族** | {data['malware_family']} |
| **狀態** | {data['status']} |
| **威脅等級** | {data['threat_level']} |
| **信心水準** | {data['confidence']} |

## 威脅描述

{data['description']}

首次觀測時間：{data['date']}

## 檔案資訊

| 項目 | 值 |
|------|-----|
| **檔案名稱** | `{data['file_name']}` |
| **檔案類型** | {data['file_type']} |

## IoC 指標

| 類型 | 值 |
|------|-----|
| SHA256 | `{data['ioc_value']}` |
| MD5 | `{data['md5']}` |
| SHA1 | `{data['sha1']}` |

## 來源連結

- [MalwareBazaar 樣本](https://bazaar.abuse.ch/sample/{data['ioc_value']}/)

---
> 萃取時間：{datetime.utcnow().strftime("%Y-%m-%d %H:%M UTC")}
> 資料來源：abuse.ch MalwareBazaar (malwarebazaar-recent)
"""

def process_jsonl(input_file: Path, source_type: str):
    """處理 JSONL 檔案"""
    extract_func = extract_threatfox if source_type == "threatfox" else extract_malwarebazaar

    with open(input_file, 'r', encoding='utf-8') as f:
        for line_num, line in enumerate(f, 1):
            try:
                record = json.loads(line.strip())
                data = extract_func(record, line_num)

                # 確保分類目錄存在
                category_dir = DOCS_DIR / data['category']
                category_dir.mkdir(parents=True, exist_ok=True)

                # 寫入 Markdown 檔案
                output_file = category_dir / data['filename']
                markdown = generate_markdown(data, source_type)
                output_file.write_text(markdown, encoding='utf-8')

                print(f"✓ {data['category']}/{data['filename']}", file=sys.stderr)

            except Exception as e:
                print(f"✗ Line {line_num}: {e}", file=sys.stderr)
                continue

def main():
    raw_dir = DOCS_DIR / "raw"

    # 處理 ThreatFox
    threatfox_file = raw_dir / "threatfox-recent.jsonl"
    if threatfox_file.exists():
        print(f"處理 ThreatFox 資料...", file=sys.stderr)
        process_jsonl(threatfox_file, "threatfox")

    # 處理 MalwareBazaar
    malwarebazaar_file = raw_dir / "malwarebazaar-recent.jsonl"
    if malwarebazaar_file.exists():
        print(f"處理 MalwareBazaar 資料...", file=sys.stderr)
        process_jsonl(malwarebazaar_file, "malwarebazaar")

    print("萃取完成", file=sys.stderr)

if __name__ == "__main__":
    main()
