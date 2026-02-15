# SPAWNCHIMERA Malware: The Chimera Spawning from Ivanti Connect Secure Vulnerability

| 項目 | 內容 |
|------|------|
| **日期** | 2025-02-20 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

SPAWNCHIMERA exploited CVE-2025-0282 in Ivanti Connect Secure since December 2024, evolving to use UNIX domain sockets for stealth, self-patching the vulnerability to prevent competing attackers, and integrating SPAWN malware family capabilities.

## 事實內容

**Vulnerability Exploited:**
SPAWNCHIMERA exploits CVE-2025-0282, a buffer overflow vulnerability in Ivanti Connect Secure caused by improper use of the `strncpy function`. Exploitation occurred in Japan since late December 2024, prior to official disclosure in January 2025.

**Malware Capabilities:**
SPAWNCHIMERA represents an evolved integration of the SPAWN malware family (SPAWNANT, SPAWNMOLE, and SPAWNSNAIL). Key capabilities:
- Process injection across multiple system processes
- SSH server functionality with embedded private keys
- Inter-process communication via UNIX domain sockets
- Remote code execution capabilities following initial exploitation

**Communication Method Evolution:**
The malware shifted from localhost port 8300 communication to UNIX domain socket communication at `/home/runtime/tmp/.logsrv`, making detection "more difficult, as netstat command results from the Integrity Checker Tool (ICT) may not be displayed."

**Vulnerability Self-Patching:**
Notably, SPAWNCHIMERA includes "a new function to fix the CVE-2025-0282 vulnerability" by hooking the `strncpy` function and limiting copy size to 256 bytes. This prevents competing attackers from exploiting the same flaw.

**Stealth Enhancements:**
- SSH private keys now encoded with XOR-based decryption rather than stored in plaintext
- Deletion of debug messages throughout code
- New decode functions replacing hardcoded traffic identification patterns

**Affected Systems:**
- Ivanti Connect Secure VPN appliances
- Specifically the `web` and `dsmdm` processes

**Indicators of Compromise:**

Hash Values:
- SPAWNCHIMERA: 94b1087af3120ae22cea734d9eea88ede4ad5abe4bdeab2cc890e893c09be955
- SPAWNSLOTH: 9bdf41a178e09f65bf1981c86324cd40cb27054bf34228efdcfee880f8014baf

File Paths:
- /lib/libdsupgrade.so
- /tmp/.liblogblock.so

## 受影響系統

- Ivanti Connect Secure VPN appliances
- Systems running `web` and `dsmdm` processes

## 來源連結

- [SPAWNCHIMERA Malware: The Chimera Spawning from Ivanti Connect Secure Vulnerability](https://blogs.jpcert.or.jp/en/2025/02/spawnchimera.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
