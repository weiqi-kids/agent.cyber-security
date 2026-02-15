# Hackers Exploit SonicWall Devices to Plant "Invisible Backdoor," Potentially Long-term Stealing Organizational Secrets

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-20 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Google TIG revealed UNC6148 hacker organization attacks on SonicWall SMA100 devices, planting OVERSTEP backdoor that persists even after patching using stolen admin credentials and OTP.

## 事實內容

Google Threat Intelligence Group (GTIG) revealed a hacker organization named "UNC6148" launching attacks on SonicWall network security devices (SMA100 series). Even if devices installed official update patches, hackers can still regain privileges using previously stolen management credentials and one-time passwords (OTP), showing this attack's targeted and covert nature.

**Attack Background:**
Mandiant investigation found hacker organization has mastered target device local administrator credentials, but credential acquisition methods remain unknown. Based on SonicWall published firmware patch timeline and vulnerability public reports, GTIG speculates hacker organization may have exploited vulnerabilities to steal administrator credentials before target device updates.

**Exploited Vulnerabilities (Suspected):**
- CVE-2021-20038 (CVSS: 9.8): Stack buffer overflow allowing unauthenticated remote code execution
- CVE-2024-38475 (CVSS: 9.1): Apache HTTP Server unauthenticated path traversal affecting SAM 100 series. watchTowr revealed this vulnerability can combine with CVE-2023-44221 as attack chain. Currently no evidence UNC6148 used this vulnerability chain
- CVE-2021-20035 (CVSS: 6.5) and CVE-2021-20039 (CVSS: 8.8): Command injection vulnerabilities allowing authenticated remote attackers to inject arbitrary commands
- CVE-2025-32819 (CVSS: 8.8): Allows remote attackers with SSLVPN user privileges to bypass path traversal protection mechanism, deleting arbitrary system files

**OVERSTEP Backdoor:**
Once UNC6148 intrudes SonicWall SMA100 series devices, plants malicious program named "OVERSTEP." This is a C language backdoor specifically designed for SonicWall SMA100 series devices, capable of:
- Continuous operation after device reboot (persistence)
- Establishing reverse connections (reverse shell) with hacker servers
- Stealing enterprise internal accounts, passwords, credentials, and other sensitive data
- Potential further ransomware attacks
- Disguising as system files to evade detection
- Deleting system logs and attack records, making tracking difficult for security personnel

**Victim Scope:**
Currently known affected enterprises and organizations span wide range including SMEs, government agencies, medical institutions, etc. GTIG discovered some enterprises after compromise had confidential data publicly posted on "World Leaks" website. Additionally, hacker organization linked to Abyss ransomware deployment, indicating attack purposes beyond data theft possibly evolving into ransomware operations.

**Attack Characteristics:**
This attack activity unlike typical hacker intrusions represents carefully planned and continuous infiltration advanced attack. Even with device updates, hackers can still re-intrude using past stolen credentials and passwords. Once attacked, entire organization and partners may be affected.

**Recommended Mitigations:**
- Immediately check if using SonicWall SMA 100 series devices
- Reset all passwords and one-time passwords (OTP)
- Replace all credentials and private keys on devices
- Check system logs for anomalies or suspicious program execution
- When necessary seek SonicWall or security company assistance for digital forensics analysis

## 受影響系統

- SonicWall SMA 100 series network security devices
- SSLVPN services and remote access infrastructure
- Enterprise internal networks and partner connections

## 來源連結

- [駭客利用SonicWall裝置植入「隱形後門」，恐長期竊取組織機密](https://www.twcert.org.tw/tw/cp-104-10327-984d9-1.html)

---
> 萃取時間: 2026-02-15 23:48 UTC
> 資料來源: TWCERT/CC rss-104
