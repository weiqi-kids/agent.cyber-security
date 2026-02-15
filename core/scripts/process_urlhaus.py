#!/usr/bin/env python3
"""
URLhaus 資料批次處理腳本
讀取 JSONL，產生脫敏的 Markdown 檔案
"""

import json
import os
from datetime import datetime
from pathlib import Path

# 路徑設定
BASE_DIR = Path("/Users/lightman/weiqi.kids/agent.cyber-security")
JSONL_FILE = BASE_DIR / "docs/Extractor/threat_feeds/raw/urlhaus-recent.jsonl"
OUTPUT_DIR = BASE_DIR / "docs/Extractor/threat_feeds/malicious_url"

def sanitize_url(url):
    """URL 脫敏處理"""
    return url.replace("http://", "hxxp://").replace("https://", "hxxps://")

def extract_malware_family(threat_str, tags_list):
    """從 threat 字串或 tags 推斷惡意程式家族"""
    if not threat_str or threat_str == "malware_download":
        if tags_list:
            return ", ".join(tags_list)
        return "未知"
    return threat_str

def format_date(date_str):
    """轉換日期格式 YYYY-MM-DD HH:MM:SS -> YYYY-MM-DD"""
    try:
        dt = datetime.fromisoformat(date_str.replace("Z", "+00:00"))
        return dt.strftime("%Y-%m-%d")
    except:
        return date_str.split()[0] if " " in date_str else date_str

def generate_markdown(record):
    """產生 Markdown 內容"""
    url_id = record.get("id", "unknown")
    url = record.get("url", "")
    url_status = record.get("url_status", "unknown")
    threat = record.get("threat", "malware_download")
    date_added = record.get("dateadded", "")  # 修正欄位名稱
    tags = record.get("tags", [])

    sanitized_url = sanitize_url(url)
    formatted_date = format_date(date_added)
    malware_family = extract_malware_family(threat, tags)

    # 狀態對應
    status_map = {
        "online": "線上（活躍）",
        "offline": "離線",
        "unknown": "未知"
    }
    status_display = status_map.get(url_status, url_status)

    # 威脅類型中文化
    threat_display = threat if threat else "惡意軟體下載"

    # 關聯分析
    correlation = ""
    if malware_family != "未知":
        correlation = f"此 URL 與 {malware_family} 惡意程式家族相關，建議進行封鎖與監控。"
    else:
        correlation = "此 URL 被識別為惡意來源，建議進行進一步分析。"

    md_content = f"""# 惡意 URL: {threat_display}

| 項目 | 內容 |
|------|------|
| **日期** | {formatted_date} |
| **來源** | abuse.ch URLhaus |
| **分類** | malicious_url |
| **威脅類型** | {threat_display} |
| **惡意程式家族** | {malware_family} |
| **狀態** | {status_display} |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

此惡意 URL 由 URLhaus 收錄，被標記為 {threat_display}。URLhaus 是由 abuse.ch 營運的惡意 URL 即時追蹤平台，專門收集用於散布惡意軟體的 URL。

## IoC 指標

| 類型 | 值 |
|------|-----|
| url | `{sanitized_url}` |

## 關聯分析

{correlation}

## 來源連結

- [URLhaus](https://urlhaus.abuse.ch/)
- [URLhaus ID: {url_id}](https://urlhaus.abuse.ch/url/{url_id}/)

---
> 萃取時間：{datetime.utcnow().strftime("%Y-%m-%d %H:%M UTC")}
> 資料來源：abuse.ch URLhaus urlhaus-recent
"""

    return md_content

def main():
    processed_count = 0
    skipped_count = 0
    error_count = 0

    # 確保輸出目錄存在
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    # 讀取現有檔案 ID
    existing_ids = set()
    for file_path in OUTPUT_DIR.glob("2026-urlhaus-*.md"):
        # 從檔名提取 ID: 2026-urlhaus-12345.md -> 12345
        try:
            url_id = file_path.stem.replace("2026-urlhaus-", "")
            existing_ids.add(url_id)
        except:
            pass

    print(f"現有檔案數量: {len(existing_ids)}")

    # 逐行處理 JSONL
    with open(JSONL_FILE, "r", encoding="utf-8") as f:
        for line_num, line in enumerate(f, 1):
            try:
                line = line.strip()
                if not line:
                    continue

                record = json.loads(line)
                url_id = record.get("id", "")

                if not url_id:
                    print(f"[警告] 第 {line_num} 行缺少 ID，跳過")
                    skipped_count += 1
                    continue

                # 檢查是否已存在
                if url_id in existing_ids:
                    skipped_count += 1
                    continue

                # 產生 Markdown
                md_content = generate_markdown(record)

                # 寫入檔案
                output_file = OUTPUT_DIR / f"2026-urlhaus-{url_id}.md"
                with open(output_file, "w", encoding="utf-8") as out_f:
                    out_f.write(md_content)

                processed_count += 1

                if processed_count % 50 == 0:
                    print(f"已處理 {processed_count} 筆新資料...")

            except json.JSONDecodeError as e:
                print(f"[錯誤] 第 {line_num} 行 JSON 解析失敗: {e}")
                error_count += 1
            except Exception as e:
                print(f"[錯誤] 第 {line_num} 行處理失敗: {e}")
                error_count += 1

    print(f"\n處理完成:")
    print(f"  新增: {processed_count} 筆")
    print(f"  跳過: {skipped_count} 筆")
    print(f"  錯誤: {error_count} 筆")
    print(f"  總計: {processed_count + skipped_count} 筆")

if __name__ == "__main__":
    main()
