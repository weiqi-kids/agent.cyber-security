# CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-14 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC confirmed attacks from September-December 2024 using CrossC2 to deploy Cobalt Strike Beacon on Linux systems, with potential links to BlackBasta threat group.

## 事實內容

From September to December 2024, JPCERT/CC confirmed incidents involving CrossC2, an extension tool that creates Cobalt Strike Beacon for Linux operating systems. The attackers employed CrossC2 alongside other tools including PsExec, Plink, and Cobalt Strike in cross-platform attack campaigns.

**CrossC2 Technical Overview:**

CrossC2 is an unofficial Beacon builder compatible with Cobalt Strike 4.1 and above, developed in C language for cross-platform deployment.

Supported architectures:
- Linux (x86, x64)
- macOS (x86, x64, M1)

Anti-analysis features:
- Single-byte XOR string encoding
- Extensive junk code insertion
- Configuration data encrypted with AES128-CBC (no padding)

Configuration storage: Contains a "HOOK" tag followed by encrypted configuration data decryptable using AES128-CBC with OpenSSL functions.

**Attack Infrastructure:**

Multi-stage execution flow:
1. Legitimate java.exe executed from Task Scheduler
2. ReadNimeLoader (DLL sideloading via jli.dll) - custom Nim-based loader
3. OdinLdr - open-source shellcode loader
4. Cobalt Strike Beacon - deployed in memory

**Additional Tools:**
- PsExec for lateral movement
- Plink (v0.81) SSH client
- GetNPUsers for AS-REP Roasting attacks
- ELF-SystemBC Linux variant RAT
- Privilege escalation utilities

**ReadNimeLoader Technical Details:**

Custom malware with sophisticated anti-analysis mechanisms:
- Debugger detection via PEB BeingDebugged flag
- CONTEXT_DEBUG_REGISTER checking
- Timing-based debugging detection
- Exception handler validation
- Encryption: AES256-ECB mode with dynamically generated keys

**Attribution:**

Potential connection to BlackBasta threat group based on:
- Matching C2 domain confirmed in Rapid7's BlackBasta report
- Shared naming conventions (jli.dll, readme.txt files)
- SystemBC deployment patterns
- AS-REP Roasting methodology

**Network Indicators:**

13 C2 servers confirmed, including:
- 64.52.80[.]62:443
- 162.33.179[.]247:8443
- 179.60.149[.]209:443
- api.glazeceramics[.]com:443
- doc.docu-duplicator[.]com:53

**Response Resources:**

JPCERT/CC released parse_crossc2beacon_config.py tool on GitHub to support security research and incident response.

## 受影響系統

- Linux systems (x86, x64)
- macOS systems (x86, x64, M1)
- Windows systems (for initial compromise and lateral movement)
- Cobalt Strike 4.1 and above

## 來源連結

- [CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks](https://blogs.jpcert.or.jp/en/2025/08/crossc2.html)

---
> 萃取時間: 2026-02-06 00:00 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
