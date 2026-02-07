# CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-14 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Sept-Dec 2024 incidents confirmed CrossC2 usage for Linux/macOS Cobalt Strike Beacon, using DLL sideloading and in-memory execution with potential BlackBasta links.

## 事實內容

JPCERT/CC confirmed CrossC2 incidents from September to December 2024:

**Attack Methods:**
- DLL Sideloading: Legitimate java.exe loads malicious jli.dll (ReadNimeLoader)
- In-Memory Execution: Payload decrypted and executed without disk writing
- Task Scheduler: Jobs registered to execute legitimate processes
- Lateral Movement: PsExec, Plink SSH client, AD penetration attempts

**Tools Used:**
- CrossC2 (Linux/macOS Cobalt Strike extension)
- ReadNimeLoader (Nim-based loader)
- OdinLdr (shellcode loader)
- Cobalt Strike Beacon
- SystemBC (ELF version for Linux)
- GetNPUsers (AS-REP Roasting)
- Privilege escalation utilities

**Targets:**
- Linux servers in internal networks
- Active Directory infrastructure
- Multiple countries (not limited to Japan)

**Technical Characteristics:**

**CrossC2 Features:**
- Operates on Linux (x86, x64) and macOS architectures
- Single-byte XOR string encoding with junk code insertion
- AES128-CBC configuration encryption

**ReadNimeLoader Defenses:**
- Anti-debugging via PEB BeingDebugged checks
- Exception handler detection
- Decryption key fragmented across anti-analysis functions
- AES256-ECB payload encryption

**Attribution:**
Potential connection to BlackBasta based on shared C2 domains, file naming conventions (jli.dll, readme.txt), and SystemBC usage.

## 受影響系統

- Linux servers (x86, x64)
- macOS systems
- Windows Active Directory infrastructure
- Internal networks

## 來源連結

- [CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks](https://blogs.jpcert.or.jp/en/2025/08/crossc2.html)

---
> 萃取時間：2026-01-27 UTC
> 資料來源：JPCERT/CC Blog jpcert-blog
