# YAMAGoya: A Real-time Client Monitoring Tool Using Sigma and YARA Rules

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-18 |
| **來源** | JPCERT/CC Blog |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC released YAMAGoya, an open-source real-time threat monitoring tool using ETW and memory scanning with Sigma/YARA rules, available on GitHub.

## 事實內容

JPCERT/CC released YAMAGoya, addressing detection challenges from fileless malware and obfuscation techniques:

**Purpose:**
- Enable real-time threat monitoring through community-driven detection rules
- Address limitations of traditional file scanning against fileless malware

**Core Features:**
- Combines ETW (Event Tracing for Windows) event monitoring with memory scanning
- Userland operation (no kernel driver required)
- Real-time monitoring: files, processes, registry, DNS, network, PowerShell, WMI
- Support for Sigma, YARA, and custom YAML detection rules
- Memory scanning for fileless and packed threats
- Both GUI and CLI interfaces

**Rule Implementation:**
- Sigma rules targeting Windows OS (specific category limitations)
- YARA rules for memory analysis
- Custom YAML rules enabling correlation analysis across multiple activities
- Detection patterns: file operations, process execution, DLL loading, network communication

**Target Audience:**
- Security researchers
- Malware analysts
- Threat hunting teams
- Incident response professionals

**Availability:**
- Open-source on GitHub: JPCERTCC/YAMAGoya
- Pre-built binaries on Releases page
- Source code available for custom builds
- Requires administrative privileges

**Note:** Complements rather than replaces traditional antivirus software.

## 受影響系統

- Windows endpoint monitoring
- Threat hunting infrastructure
- Security Operations Centers (SOCs)

## 來源連結

- [YAMAGoya: A Real-time Client Monitoring Tool Using Sigma and YARA Rules](https://blogs.jpcert.or.jp/en/2025/11/YAMAGoya.html)

---
> 萃取時間：2026-01-27 UTC
> 資料來源：JPCERT/CC Blog jpcert-blog
