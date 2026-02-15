#!/usr/bin/env python3
"""
NVD CVE 批次萃取腳本
處理 nvd-cve.jsonl 並產出 Markdown 檔案
"""

import json
import os
import re
from datetime import datetime, timedelta
from pathlib import Path

# 設定路徑
BASE_DIR = Path("/Users/lightman/weiqi.kids/agent.cyber-security")
INPUT_FILE = BASE_DIR / "docs/Extractor/vulnerability_tracking/raw/nvd-cve.jsonl"
OUTPUT_BASE = BASE_DIR / "docs/Extractor/vulnerability_tracking"

# 分類目錄
CATEGORIES = {
    "critical_high": OUTPUT_BASE / "critical_high",
    "medium": OUTPUT_BASE / "medium",
    "low_info": OUTPUT_BASE / "low_info"
}

# 建立目錄
for category_dir in CATEGORIES.values():
    category_dir.mkdir(parents=True, exist_ok=True)

def get_cvss_score(cve_data):
    """從 CVE 資料中取得 CVSS 分數"""
    metrics = cve_data.get("metrics", {})

    # 優先 CVSS v3.1
    if "cvssMetricV31" in metrics and metrics["cvssMetricV31"]:
        return metrics["cvssMetricV31"][0]["cvssData"]["baseScore"]

    # 次要 CVSS v3.0
    if "cvssMetricV30" in metrics and metrics["cvssMetricV30"]:
        return metrics["cvssMetricV30"][0]["cvssData"]["baseScore"]

    # 最後 CVSS v2.0
    if "cvssMetricV2" in metrics and metrics["cvssMetricV2"]:
        return metrics["cvssMetricV2"][0]["cvssData"]["baseScore"]

    return None

def get_severity(cve_data):
    """從 CVE 資料中取得嚴重程度"""
    metrics = cve_data.get("metrics", {})

    # 優先 CVSS v3.1
    if "cvssMetricV31" in metrics and metrics["cvssMetricV31"]:
        return metrics["cvssMetricV31"][0]["cvssData"]["baseSeverity"]

    # 次要 CVSS v3.0
    if "cvssMetricV30" in metrics and metrics["cvssMetricV30"]:
        return metrics["cvssMetricV30"][0]["cvssData"]["baseSeverity"]

    # CVSS v2.0 需要根據分數判斷
    if "cvssMetricV2" in metrics and metrics["cvssMetricV2"]:
        score = metrics["cvssMetricV2"][0]["cvssData"]["baseScore"]
        if score >= 7.0:
            return "HIGH"
        elif score >= 4.0:
            return "MEDIUM"
        else:
            return "LOW"

    return "UNKNOWN"

def get_category(cvss_score, severity):
    """判定分類"""
    if cvss_score is None:
        return "low_info"

    if cvss_score >= 7.0 or severity in ["CRITICAL", "HIGH"]:
        return "critical_high"
    elif cvss_score >= 4.0 or severity == "MEDIUM":
        return "medium"
    else:
        return "low_info"

def extract_vendor_product(description):
    """從描述中推斷廠商與產品"""
    # 簡單的推斷邏輯，可根據需要改進
    description_lower = description.lower()

    # 常見廠商模式
    vendors = {
        "microsoft": "Microsoft",
        "apple": "Apple",
        "google": "Google",
        "adobe": "Adobe",
        "cisco": "Cisco",
        "oracle": "Oracle",
        "linux": "Linux",
        "debian": "Debian",
        "ubuntu": "Ubuntu",
        "redhat": "Red Hat",
        "mozilla": "Mozilla",
        "apache": "Apache",
        "wordpress": "WordPress",
        "drupal": "Drupal",
        "joomla": "Joomla"
    }

    vendor = "未指定"
    for key, name in vendors.items():
        if key in description_lower:
            vendor = name
            break

    # 產品通常在廠商後面
    product = "請參閱 NVD 頁面"

    return vendor, product

def sanitize_filename(text):
    """清理檔名，移除不合法字元"""
    # 移除或替換不合法字元
    text = re.sub(r'[<>:"/\\|?*]', '', text)
    # 限制長度
    if len(text) > 100:
        text = text[:100]
    return text.strip()

def process_cve(line):
    """處理單筆 CVE 資料"""
    try:
        data = json.loads(line)
        cve_data = data.get("cve", {})

        # 取得基本資訊
        cve_id = cve_data.get("id", "")
        if not cve_id:
            return None

        # 取得描述（英文）
        descriptions = cve_data.get("descriptions", [])
        description = ""
        for desc in descriptions:
            if desc.get("lang") == "en":
                description = desc.get("value", "")
                break

        if not description:
            description = "No description available"

        # 取得時間
        published = cve_data.get("published", "")
        last_modified = cve_data.get("lastModified", "")
        date = last_modified if last_modified else published

        # 取得 CVSS 與嚴重程度
        cvss_score = get_cvss_score(cve_data)
        severity = get_severity(cve_data)
        category = get_category(cvss_score, severity)

        # 推斷廠商與產品
        vendor, product = extract_vendor_product(description)

        # 取得年份
        try:
            year = datetime.fromisoformat(date.replace("Z", "+00:00")).year
        except:
            year = 2026

        # 產生檔名
        filename = f"{year}-{cve_id}.md"
        output_path = CATEGORIES[category] / filename

        # 檢查檔案是否已存在
        if output_path.exists():
            return {"status": "skipped", "cve_id": cve_id, "category": category}

        # 產生 Markdown 內容
        cvss_display = f"{cvss_score:.1f}" if cvss_score is not None else "待評估"

        markdown = f"""# {cve_id}

| 項目 | 內容 |
|------|------|
| **CVE** | {cve_id} |
| **日期** | {date} |
| **來源** | NIST NVD |
| **廠商** | {vendor} |
| **產品** | {product} |
| **嚴重程度** | {severity} |
| **CVSS** | {cvss_display} |
| **信心水準** | 高 |

## 漏洞描述

{description}

## 修補建議

請參閱廠商公告或 NVD 頁面取得修補資訊。

## 來源連結

- [NVD](https://nvd.nist.gov/vuln/detail/{cve_id})

---
> 萃取時間：{datetime.utcnow().strftime('%Y-%m-%d')} UTC
> 資料來源：NIST NVD nvd-cve
"""

        # 寫入檔案
        output_path.write_text(markdown, encoding="utf-8")

        return {"status": "created", "cve_id": cve_id, "category": category, "cvss": cvss_score}

    except Exception as e:
        return {"status": "error", "error": str(e), "line": line[:100]}

def main():
    """主程式"""
    print(f"開始處理 NVD CVE 資料...")
    print(f"輸入檔案: {INPUT_FILE}")
    print(f"輸出目錄: {OUTPUT_BASE}")
    print()

    # 統計
    stats = {
        "total": 0,
        "created": 0,
        "skipped": 0,
        "error": 0,
        "by_category": {
            "critical_high": 0,
            "medium": 0,
            "low_info": 0
        }
    }

    # 僅處理最近 7 天的資料（可選）
    # cutoff_date = datetime.utcnow() - timedelta(days=7)

    # 處理每一行
    with open(INPUT_FILE, "r", encoding="utf-8") as f:
        for line_num, line in enumerate(f, 1):
            if not line.strip():
                continue

            stats["total"] += 1
            result = process_cve(line)

            if result:
                status = result["status"]
                stats[status] += 1

                if status == "created":
                    category = result["category"]
                    stats["by_category"][category] += 1
                    cve_id = result["cve_id"]
                    cvss = result.get("cvss", "N/A")
                    print(f"[{line_num:4d}] ✓ {cve_id:20s} | {category:15s} | CVSS: {cvss}")
                elif status == "error":
                    print(f"[{line_num:4d}] ✗ 錯誤: {result.get('error', 'Unknown')}")

            # 每 100 行顯示進度
            if line_num % 100 == 0:
                print(f"--- 已處理 {line_num} 行 ---")

    # 輸出統計
    print("\n" + "=" * 60)
    print("處理完成！")
    print("=" * 60)
    print(f"總計處理: {stats['total']} 筆")
    print(f"新建檔案: {stats['created']} 筆")
    print(f"跳過（已存在）: {stats['skipped']} 筆")
    print(f"錯誤: {stats['error']} 筆")
    print()
    print("分類統計:")
    print(f"  - Critical/High: {stats['by_category']['critical_high']} 筆")
    print(f"  - Medium: {stats['by_category']['medium']} 筆")
    print(f"  - Low/Info: {stats['by_category']['low_info']} 筆")
    print("=" * 60)

if __name__ == "__main__":
    main()
