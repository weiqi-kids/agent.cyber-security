#!/usr/bin/env python3
"""ThreatFox IoC 萃取腳本"""

import json
import os
import re
from datetime import datetime
from pathlib import Path

def sanitize_url(url):
    """URL 脫敏處理"""
    url = url.replace('http://', 'hxxp://')
    url = url.replace('https://', 'hxxps://')
    url = url.replace('.', '[.]', url.count('.') - 1 if url.count('.') > 1 else 0)
    return url

def get_confidence_level(level):
    """轉換信心水準"""
    if level >= 75:
        return "高"
    elif level >= 50:
        return "中"
    else:
        return "低"

def get_threat_level(confidence):
    """根據信心水準判斷威脅等級"""
    if confidence >= 75:
        return "High"
    elif confidence >= 50:
        return "Medium"
    else:
        return "Low"

def generate_filename(data):
    """產生檔名"""
    date_str = data['first_seen_utc'][:10]

    # 優先使用 ID
    if data.get('id'):
        return f"{date_str}-threatfox-{data['id']}.md"

    # 或使用 IoC 前 8 字元
    ioc = data['ioc_value']
    ioc_prefix = re.sub(r'[^a-zA-Z0-9]', '', ioc)[:8]
    return f"{date_str}-threatfox-{ioc_prefix}.md"

def format_ioc_value(ioc_value, ioc_type):
    """格式化 IoC 值"""
    if ioc_type in ['url', 'payload_url']:
        return sanitize_url(ioc_value)
    return ioc_value

def extract_record(record):
    """萃取單筆記錄"""
    data = json.loads(record)

    # 準備資料
    first_seen = data.get('first_seen_utc', '')
    date_str = first_seen[:10] if first_seen else datetime.now().strftime('%Y-%m-%d')

    malware = data.get('malware_printable') or data.get('malware', 'Unknown')
    threat_type = data.get('threat_type', 'unknown')
    ioc_type = data.get('ioc_type', 'unknown')
    ioc_value = data.get('ioc_value', '')
    confidence = data.get('confidence_level', 0)
    is_compromised = data.get('is_compromised', False)
    tags = data.get('tags', '')

    # 格式化值
    ioc_display = format_ioc_value(ioc_value, ioc_type)
    confidence_level = get_confidence_level(confidence)
    threat_level = get_threat_level(confidence)

    # 產生威脅描述
    if is_compromised:
        threat_desc = f"此 IoC 由 ThreatFox 收錄，屬於遭入侵的合法基礎設施，被用於投放 {malware} 惡意程式。"
    else:
        threat_desc = f"此 IoC 由 ThreatFox 收錄，與 {malware} 惡意程式相關。"

    # 關聯分析
    correlation = f"此指標屬於 {malware} 惡意程式家族"
    if tags:
        correlation += f"，標記為 {tags}"
    correlation += f"，用於 {threat_type} 階段。"

    if is_compromised:
        correlation += " 此為遭入侵的合法基礎設施，建議通報原網域所有者。"

    # 生成 Markdown
    content = f"""# IoC 指標: {malware}

| 項目 | 內容 |
|------|------|
| **日期** | {date_str} |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | {threat_type} |
| **惡意程式家族** | {malware} |
| **狀態** | {"compromised" if is_compromised else "unknown"} |
| **威脅等級** | {threat_level} |
| **信心水準** | {confidence_level} ({confidence}%) |

## 威脅描述

{threat_desc}

## IoC 指標

| 類型 | 值 |
|------|-----|
| {ioc_type} | `{ioc_display}` |

## 關聯分析

{correlation}

## 來源連結

- [ThreatFox](https://threatfox.abuse.ch/)
- [IoC 詳情](https://threatfox.abuse.ch/ioc/{data.get('id', '')})

---
> 萃取時間：{datetime.utcnow().strftime('%Y-%m-%d %H:%M UTC')}
> 資料來源：abuse.ch ThreatFox threatfox-recent
> IoC ID: {data.get('id', 'N/A')}
"""

    return generate_filename(data), content

def main():
    base_dir = Path('/Users/lightman/weiqi.kids/agent.cyber-security')
    input_file = base_dir / 'docs/Extractor/threat_feeds/raw/threatfox-recent.jsonl'
    output_dir = base_dir / 'docs/Extractor/threat_feeds/ioc_indicator'

    # 確保輸出目錄存在
    output_dir.mkdir(parents=True, exist_ok=True)

    # 讀取已存在的檔案
    existing_files = set(f.name for f in output_dir.glob('*-threatfox-*.md'))

    # 處理 JSONL
    new_count = 0
    skip_count = 0
    error_count = 0

    with open(input_file, 'r', encoding='utf-8') as f:
        for line_num, line in enumerate(f, 1):
            line = line.strip()
            if not line:
                continue

            try:
                filename, content = extract_record(line)

                # 檢查是否已存在
                if filename in existing_files:
                    skip_count += 1
                    continue

                # 寫入檔案
                output_path = output_dir / filename
                with open(output_path, 'w', encoding='utf-8') as out:
                    out.write(content)

                new_count += 1

                if new_count % 50 == 0:
                    print(f"已處理 {new_count} 筆新資料...")

            except Exception as e:
                error_count += 1
                print(f"行 {line_num} 處理失敗: {e}")

    print(f"\n處理完成:")
    print(f"- 新增: {new_count} 筆")
    print(f"- 跳過: {skip_count} 筆")
    print(f"- 錯誤: {error_count} 筆")
    print(f"- 總計: {new_count + skip_count} 筆")

if __name__ == '__main__':
    main()
