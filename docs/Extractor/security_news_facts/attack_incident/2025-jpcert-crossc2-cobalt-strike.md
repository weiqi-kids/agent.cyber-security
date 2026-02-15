# CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-14 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC confirmed incidents involving CrossC2 (Cobalt Strike extension for Linux/macOS) from September-December 2024, with sophisticated multi-stage attack chains using DLL sideloading and custom loaders, linked to BlackBasta.

## 事實內容

**What is CrossC2:**
CrossC2 is an unofficial Beacon and builder compatible with Cobalt Strike 4.1+, written in C. It extends Cobalt Strike's functionality to Linux (x86, x64) and macOS (x86, x64, M1) systems. The builder is publicly available on GitHub.

**Incident Timeline:**
JPCERT/CC documented incidents from September-December 2024 across multiple countries, suggesting broader geographic distribution beyond Japan.

**Attack Chain:**
1. Legitimate Process Abuse: Attackers executed legitimate java.exe via Task Scheduler
2. DLL Sideloading: java.exe loaded jli.dll (ReadNimeLoader) through sideloading
3. Custom Loader: ReadNimeLoader (written in Nim) decrypted and executed OdinLdr shellcode loader
4. In-Memory Execution: OdinLdr decoded and ran Cobalt Strike Beacon directly in memory

Files were strategically placed in `C:\$recycle.bin\` to evade detection.

**Tools Used in Combination:**
- PsExec: For lateral movement
- Plink: SSH client tool
- GetNPUsers: For AS-REP Roasting attacks against Active Directory
- ELF-SystemBC: Linux-compatible RAT variant
- Privilege Escalation Tools: Windows system elevation utilities

**Technical Defense Features:**
- Single-byte XOR string encoding
- Extensive junk code insertion
- Configuration stored encrypted with AES128-CBC at file end
- UPX packing (requiring configuration removal before unpacking)

**ReadNimeLoader Protections:**
- Debugger detection via PEB checks
- CONTEXT_DEBUG_REGISTER inspection
- Timing analysis
- Exception handler verification
- Decryption keys split across anti-analysis functions

**Attribution Connection:**
Technical similarities link this campaign to BlackBasta:
- Identical C2 domains
- Comparable file structures (jli.dll, readme.txt)
- SystemBC usage
- AS-REP Roasting tactics

**Defense Resources:**
JPCERT/CC released configuration parser: parse_crossc2beacon_config.py on GitHub repository.

## 受影響系統

- Linux (x86, x64)
- macOS (x86, x64, M1)
- Windows systems (for lateral movement)
- Active Directory environments

## 來源連結

- [CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks](https://blogs.jpcert.or.jp/en/2025/08/crossc2.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
