#!/usr/bin/env python3
"""Process threatfox-recent.jsonl and create MD files for ioc_indicator category."""

import json
import os
import re
import sys
from datetime import datetime

JSONL_FILE = "/Users/zhang/agent/agent.cyber-security/docs/Extractor/threat_feeds/raw/threatfox-recent.jsonl"
OUTPUT_DIR = "/Users/zhang/agent/agent.cyber-security/docs/Extractor/threat_feeds/ioc_indicator"
DATE = "2026-03-25"
EXTRACT_TIME = "2026-03-25 14:00 UTC"

def sanitize_domain(domain):
    """Convert domain to safe filename slug."""
    # Remove port if present
    domain = domain.split(':')[0]
    # Remove protocol if present
    domain = re.sub(r'^https?://', '', domain)
    # Remove trailing slashes and paths
    domain = domain.split('/')[0]
    # Replace dots and special chars with dashes
    slug = re.sub(r'[^a-zA-Z0-9-]', '-', domain)
    # Collapse multiple dashes
    slug = re.sub(r'-+', '-', slug).strip('-').lower()
    return slug

def sanitize_ip(ip_port):
    """Convert IP:port to safe filename slug."""
    # Get just the IP
    ip = ip_port.split(':')[0]
    # Replace dots with dashes
    return ip.replace('.', '-')

def sanitize_url(url):
    """Extract domain from URL for filename."""
    url = re.sub(r'^https?://', '', url)
    domain = url.split('/')[0].split(':')[0]
    return sanitize_domain(domain)

def defang_url(url):
    """Defang URL for safe display."""
    url = url.replace('http://', 'hxxp://')
    url = url.replace('https://', 'hxxps://')
    return url

def confidence_to_text(level):
    """Convert numeric confidence to text."""
    if level >= 90:
        return "高"
    elif level >= 50:
        return "中"
    else:
        return "低"

def threat_type_to_enum(threat_type, malware_printable):
    """Map ThreatFox threat_type to our threat_type enum."""
    threat_type_lower = threat_type.lower()
    malware_lower = malware_printable.lower() if malware_printable else ""

    if 'ransom' in malware_lower or 'ransom' in threat_type_lower:
        return "ransomware"
    elif 'botnet' in threat_type_lower or 'cc' in threat_type_lower:
        return "botnet"
    elif 'phish' in threat_type_lower:
        return "phishing"
    elif 'malware' in threat_type_lower or 'payload' in threat_type_lower or 'delivery' in threat_type_lower:
        return "malware"
    else:
        return "other"

def get_threat_level(confidence, threat_type, malware_printable):
    """Determine threat level."""
    malware_lower = (malware_printable or '').lower()

    # High severity malware families
    high_families = ['ransomware', 'cobalt strike', 'brute ratel', 'sliver', 'metasploit',
                     'kimsuky', 'apt', 'lockbit', 'blackcat', 'alphv']

    for family in high_families:
        if family in malware_lower:
            return "High"

    if confidence >= 90 and threat_type in ['botnet_cc', 'c2']:
        return "High"
    elif confidence >= 75:
        return "Medium"
    else:
        return "Low"

def get_ioc_type(ioc_type_raw):
    """Map ThreatFox ioc_type to our enum."""
    mapping = {
        'domain': 'domain',
        'url': 'url',
        'ip:port': 'ip',
        'ip': 'ip',
        'md5_hash': 'hash_md5',
        'sha256_hash': 'hash_sha256',
        'sha1_hash': 'hash_sha1',
    }
    return mapping.get(ioc_type_raw, 'domain')

def build_filename(ioc_value, ioc_type_raw, ioc_id):
    """Build filename for ioc_indicator category."""
    if ioc_type_raw in ('ip:port', 'ip'):
        slug = sanitize_ip(ioc_value)
    elif ioc_type_raw == 'url':
        slug = sanitize_url(ioc_value)
    elif ioc_type_raw == 'domain':
        slug = sanitize_domain(ioc_value)
    elif 'hash' in ioc_type_raw:
        slug = ioc_value[:16].lower()
    else:
        slug = sanitize_domain(ioc_value)

    # Truncate slug if too long
    if len(slug) > 60:
        slug = slug[:60].rstrip('-')

    return f"{DATE}-threatfox-{slug}.md"

def get_display_ioc(ioc_value, ioc_type_raw):
    """Get display-safe IoC value."""
    if ioc_type_raw == 'url':
        return defang_url(ioc_value)
    elif ioc_type_raw == 'domain':
        return ioc_value  # domains don't need defanging
    else:
        return ioc_value

def generate_md(record):
    """Generate markdown content for a ThreatFox record."""
    ioc_value = record.get('ioc_value', '')
    ioc_type_raw = record.get('ioc_type', 'domain')
    threat_type = record.get('threat_type', 'other')
    malware = record.get('malware', 'unknown')
    malware_printable = record.get('malware_printable', 'Unknown')
    malware_alias = record.get('malware_alias', '')
    confidence_level = record.get('confidence_level', 50)
    first_seen = record.get('first_seen_utc', DATE)
    last_seen = record.get('last_seen_utc', '')
    reference = record.get('reference', '')
    tags = record.get('tags', '')
    reporter = record.get('reporter', 'unknown')
    is_compromised = record.get('is_compromised', False)
    ioc_id = record.get('id', '')

    # Derived fields
    ioc_type_display = get_ioc_type(ioc_type_raw)
    display_ioc = get_display_ioc(ioc_value, ioc_type_raw)
    confidence_text = confidence_to_text(confidence_level)
    threat_enum = threat_type_to_enum(threat_type, malware_printable)
    threat_level = get_threat_level(confidence_level, threat_type, malware_printable)

    # Status
    if last_seen:
        status = "offline"  # Has last_seen means it was seen and possibly gone
    elif is_compromised:
        status = "online"
    else:
        status = "unknown"

    # Better status logic for botnet C2
    if threat_type == 'botnet_cc' and not last_seen:
        status = "online"  # Active C2
    elif last_seen:
        status = "offline"

    # Title
    if malware_printable and malware_printable != 'Unknown malware':
        title = f"{malware_printable} IoC — {ioc_value}"
    else:
        title = f"ThreatFox IoC — {ioc_value}"

    # Truncate title if too long
    if len(title) > 100:
        title = title[:97] + "..."

    # Threat type display
    threat_type_map = {
        'botnet_cc': 'Botnet C2 (殭屍網路指揮控制)',
        'payload_delivery': 'Payload Delivery (惡意載荷傳遞)',
        'c2': 'C2 (指揮控制)',
        'malware_download': 'Malware Download (惡意程式下載)',
        'phishing': 'Phishing (網路釣魚)',
    }
    threat_type_display = threat_type_map.get(threat_type, threat_type)

    # Malware family info
    malware_family_line = malware_printable if malware_printable else "Unknown"
    if malware_alias:
        malware_family_line += f"（別名：{malware_alias}）"

    # Reference/association section
    assoc_lines = []
    if reference and reference.strip():
        assoc_lines.append(f"- 參考樣本：{reference}")
    if malware_alias:
        assoc_lines.append(f"- 已知別名：{malware_alias}")
    if tags and tags.strip():
        assoc_lines.append(f"- 標籤：{tags}")
    if is_compromised:
        assoc_lines.append("- 注意：此 IoC 來自遭入侵的合法系統")

    assoc_text = "\n".join(assoc_lines) if assoc_lines else "無已知關聯資訊。"

    # Source URL
    source_url = f"https://threatfox.abuse.ch/ioc/{ioc_id}/" if ioc_id else "https://threatfox.abuse.ch/"

    # Date for display (extract date part from first_seen_utc)
    date_display = first_seen.split(' ')[0] if first_seen else DATE

    content = f"""# {title}

| 項目 | 內容 |
|------|------|
| **日期** | {date_display} |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | {threat_type_display} |
| **惡意程式家族** | {malware_family_line} |
| **狀態** | {status} |
| **威脅等級** | {threat_level} |
| **信心水準** | {confidence_text}（{confidence_level}%） |

## 威脅描述

ThreatFox 報告的 IoC 指標，由報告者 `{reporter}` 提交。惡意程式家族為 **{malware_printable}**，威脅類型為 {threat_type_display}。首次發現於 {first_seen} UTC{f'，最後確認於 {last_seen} UTC' if last_seen else ''}。

## IoC 指標

| 類型 | 值 |
|------|-----|
| {ioc_type_display} | `{display_ioc}` |

## 關聯分析

{assoc_text}

## 來源連結

- [abuse.ch ThreatFox]({source_url})

---
> 萃取時間：{EXTRACT_TIME}
> 資料來源：abuse.ch ThreatFox (threatfox-recent)
"""
    return content

def process_all():
    """Process all records in JSONL file."""
    stats = {
        'total': 0,
        'new': 0,
        'skip': 0,
        'review_needed': 0,
        'duplicate_slugs': {}
    }

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    # Track slugs used in this run to handle duplicates within the same file
    used_filenames = set()
    # Pre-load existing filenames
    existing_files = set(os.listdir(OUTPUT_DIR))

    with open(JSONL_FILE, 'r', encoding='utf-8') as f:
        for line_num, line in enumerate(f, 1):
            line = line.strip()
            if not line:
                continue

            try:
                record = json.loads(line)
            except json.JSONDecodeError as e:
                print(f"SKIP: Line {line_num} JSON parse error: {e}", file=sys.stderr)
                stats['total'] += 1
                continue

            stats['total'] += 1

            ioc_value = record.get('ioc_value', '')
            ioc_type_raw = record.get('ioc_type', 'domain')
            ioc_id = record.get('id', '')

            if not ioc_value:
                print(f"REVIEW_NEEDED: Line {line_num} - missing ioc_value")
                stats['review_needed'] += 1
                continue

            # Build filename
            filename = build_filename(ioc_value, ioc_type_raw, ioc_id)

            # Handle duplicates within this run
            if filename in used_filenames or filename in existing_files:
                # Try with ID suffix
                base = filename.replace('.md', '')
                filename_with_id = f"{base}-{ioc_id}.md"
                if filename_with_id in used_filenames or filename_with_id in existing_files:
                    print(f"SKIP: {ioc_value} 已存在於 {OUTPUT_DIR}/{filename_with_id}")
                    stats['skip'] += 1
                    continue
                filename = filename_with_id

            used_filenames.add(filename)
            filepath = os.path.join(OUTPUT_DIR, filename)

            # Generate content
            content = generate_md(record)

            # Write file
            with open(filepath, 'w', encoding='utf-8') as out:
                out.write(content)

            stats['new'] += 1

    return stats

if __name__ == '__main__':
    stats = process_all()
    print(f"\n=== threatfox-recent.jsonl 處理完成 ===")
    print(f"處理筆數: {stats['total']}")
    print(f"新增筆數: {stats['new']}")
    print(f"SKIP 筆數: {stats['skip']}")
    print(f"REVIEW_NEEDED 筆數: {stats['review_needed']}")
