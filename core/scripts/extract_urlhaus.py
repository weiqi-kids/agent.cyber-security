#!/usr/bin/env python3
"""URLhaus 資料萃取腳本"""

import json
import sys
import re
from datetime import datetime
from pathlib import Path
from urllib.parse import urlparse

def sanitize_url(url):
    """URL 脫敏處理"""
    sanitized = url.replace('http://', 'hxxp://').replace('https://', 'hxxps://')
    sanitized = sanitized.replace('.', '[.]')
    return sanitized

def extract_domain(url):
    """提取域名或 IP"""
    try:
        parsed = urlparse(url)
        netloc = parsed.netloc if parsed.netloc else parsed.path.split('/')[0]
        return netloc.split(':')[0]  # 移除端口號
    except:
        return "unknown"

def infer_malware_family(threat, tags):
    """從 threat 和 tags 推斷惡意程式家族"""
    # 檢查 tags 中的已知家族
    if tags:
        known_families = ['Mozi', 'Mirai', 'Gafgyt', 'Emotet', 'TrickBot', 'IcedID', 'Qakbot']
        for family in known_families:
            for tag in tags:
                if family.lower() in tag.lower():
                    return family

    # 根據 threat 類型推斷
    if threat == 'malware_download':
        return '未知惡意軟體'
    elif threat == 'phishing':
        return '釣魚網站'
    else:
        return '未分類'

def format_date(dateadded):
    """轉換日期格式"""
    try:
        dt = datetime.strptime(dateadded, '%Y-%m-%d %H:%M:%S UTC')
        return dt.strftime('%Y-%m-%d')
    except:
        return dateadded.split()[0] if ' ' in dateadded else dateadded

def translate_status(status):
    """翻譯狀態"""
    status_map = {
        'online': '活躍',
        'offline': '已下線',
        'unknown': '未知'
    }
    return status_map.get(status, status)

def translate_threat(threat):
    """翻譯威脅類型"""
    threat_map = {
        'malware_download': '惡意軟體下載',
        'phishing': '釣魚攻擊',
        'exploit_kit': '漏洞利用套件',
        'payload_delivery': '載荷投遞'
    }
    return threat_map.get(threat, threat)

def process_record(record):
    """處理單筆記錄"""
    try:
        data = json.loads(record.strip())

        # 提取欄位
        url = data.get('url', '')
        url_id = data.get('id', '')
        threat = data.get('threat', 'unknown')
        tags = data.get('tags', [])
        dateadded = data.get('dateadded', '')
        url_status = data.get('url_status', 'unknown')

        # 處理資料
        sanitized_url = sanitize_url(url)
        domain = extract_domain(url)
        malware_family = infer_malware_family(threat, tags)
        date = format_date(dateadded)
        status = translate_status(url_status)
        threat_cn = translate_threat(threat)
        year = date.split('-')[0]

        # 生成 Markdown
        markdown = f"""# URLhaus: {threat_cn} - {domain}

| 項目 | 內容 |
|------|------|
| **日期** | {date} |
| **來源** | abuse.ch URLhaus |
| **分類** | malicious_url |
| **威脅類型** | {threat_cn} |
| **惡意程式家族** | {malware_family} |
| **狀態** | {status} |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

惡意 URL，威脅類型: {threat_cn}

## IoC 指標

| 類型 | 值 |
|------|-----|
| url | `{sanitized_url}` |

## 關聯分析

威脅類型: {threat_cn}

## 來源連結

- [URLhaus](https://urlhaus.abuse.ch/url/{url_id}/)

---
> 萃取時間：{datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S UTC')}
> 資料來源：abuse.ch URLhaus urlhaus-recent
"""

        # 檔案路徑
        filename = f"{year}-{url_id}.md"
        filepath = Path(f"/Users/lightman/weiqi.kids/agent.cyber-security/docs/Extractor/threat_feeds/malicious_url/{filename}")

        # 寫入檔案
        filepath.write_text(markdown, encoding='utf-8')

        return True, filename

    except Exception as e:
        return False, str(e)

def main():
    if len(sys.argv) < 4:
        print("Usage: extract_urlhaus.py <jsonl_file> <start_line> <end_line>")
        sys.exit(1)

    jsonl_file = sys.argv[1]
    start_line = int(sys.argv[2])
    end_line = int(sys.argv[3])

    success_count = 0
    fail_count = 0

    # 讀取指定行範圍
    with open(jsonl_file, 'r', encoding='utf-8') as f:
        for i, line in enumerate(f, 1):
            if i < start_line:
                continue
            if i > end_line:
                break

            success, result = process_record(line)
            if success:
                success_count += 1
            else:
                fail_count += 1
                print(f"Error at line {i}: {result}", file=sys.stderr)

    print(f"Processed lines {start_line}-{end_line}: {success_count} success, {fail_count} failed")

if __name__ == '__main__':
    main()
