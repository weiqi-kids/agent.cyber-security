# YAMAGoya: A Real-time Client Monitoring Tool Using Sigma and YARA Rules

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-18 |
| **來源** | JPCERT/CC Blog |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC released YAMAGoya, an open-source threat hunting tool combining ETW monitoring with memory scanning to detect fileless malware using Sigma and YARA rules.

## 事實內容

JPCERT/CC announced the release of YAMAGoya, a real-time client monitoring tool designed to counter modern threats such as fileless malware and obfuscation techniques. The tool addresses the growing difficulty of detecting suspicious activity through file scanning alone.

**Key Capabilities:**
- Real-time monitoring of files, processes, registry, DNS, network, PowerShell, and WMI activities
- Memory scanning capabilities for detecting fileless or packed malware
- Support for Sigma and YARA detection rules
- Custom YAML rules for correlation analysis across multiple events

**Technical Architecture:**
- Operates at userland level without requiring kernel drivers
- Provides both GUI and command-line interfaces
- Can run in system tray for background monitoring
- Integrates with existing SIEMs through text logs and Windows Event Log output
- Requires administrative privileges for ETW session initialization

**Detection Approach:**
The tool combines ETW (Event Tracing for Windows) event monitoring with memory scanning to provide comprehensive endpoint visibility. It accepts three rule formats: Sigma rules (Windows-focused), YARA rules (memory scanning), and custom YAML rules (correlation analysis).

Custom YAML rules enable multi-event detection by correlating activities like file creation, process execution, DLL loading, and network communication within configurable time windows (default 10 seconds).

Detected alerts generate event IDs 8001-8018 recorded in Windows Event Log, with alerts also viewable through the GUI Alert tab.

## 受影響系統

- Windows endpoints (requires administrative privileges)

## 來源連結

- [YAMAGoya: A Real-time Client Monitoring Tool Using Sigma and YARA Rules](https://blogs.jpcert.or.jp/en/2025/11/YAMAGoya.html)

---
> 萃取時間: 2026-02-06 00:00 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
