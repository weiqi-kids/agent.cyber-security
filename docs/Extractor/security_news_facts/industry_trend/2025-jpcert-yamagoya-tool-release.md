# YAMAGoya: A Real-time Client Monitoring Tool Using Sigma and YARA Rules

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-18 |
| **來源** | JPCERT/CC Blog |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC released YAMAGoya, an open-source threat hunting tool combining ETW monitoring with memory analysis, supporting Sigma and YARA rules for real-time client monitoring without kernel drivers.

## 事實內容

YAMAGoya is an open-source threat hunting tool released by JPCERT/CC that addresses limitations in modern malware detection by combining Event Tracing for Windows (ETW) monitoring with memory analysis capabilities.

**Purpose:**
The tool was created to counter fileless malware and obfuscation techniques that evade traditional file-based scanning. It enables organizations to leverage community-created detection signatures rather than relying on proprietary security engines.

**Core Capabilities:**
- Userland-only operation: No kernel driver required, making implementation straightforward
- Real-time monitoring of files, processes, registry, DNS, network traffic, PowerShell, WMI, and other system events
- Supports Sigma rules and YARA rules for detection
- Memory scanning to identify fileless or packed malware
- Both GUI and CLI interfaces for flexibility

**Rule Support:**
- Sigma rules designed for Windows OS
- YARA rules for pattern-based memory scanning
- Custom YAML rules with regex/binary patterns
- Target event categories: file, process, registry, DNS, network, etc.
- Correlation-based detection: Multiple rules within a file trigger alerts when all conditions occur within 10 seconds

**Technical Implementation:**
YAMAGoya requires administrative privileges to establish ETW sessions and can operate as a background service with system tray integration while outputting alerts to Windows Event Log and text files for SIEM integration.

## 受影響系統

- Windows operating systems

## 來源連結

- [YAMAGoya: A Real-time Client Monitoring Tool Using Sigma and YARA Rules](https://blogs.jpcert.or.jp/en/2025/11/YAMAGoya.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
