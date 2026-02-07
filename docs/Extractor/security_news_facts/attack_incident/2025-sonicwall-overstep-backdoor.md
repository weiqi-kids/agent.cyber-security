# 駭客利用SonicWall裝置植入「隱形後門」,恐長期竊取組織機密

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-20 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要
Hacker group UNC6148 attacks SonicWall SMA100 devices, planting OVERSTEP backdoor that persists even after firmware updates.

## 事實內容
Google Threat Intelligence Group (GTIG) disclosed hacker group "UNC6148" launching attacks on SonicWall network security devices (SMA100 series). Even after installing official updates, hackers can regain access using previously stolen management credentials and OTP, demonstrating targeted and covert attack nature. Mandiant investigation found hacker group obtained target device local administrator credentials through unknown methods. GTIG speculates hackers may have exploited vulnerabilities to steal credentials before device updates. Potential exploited vulnerabilities include CVE-2021-20038 (CVSS:9.8) stack buffer overflow, CVE-2024-38475 (CVSS:9.1) Apache HTTP Server path traversal, CVE-2021-20035 (CVSS:6.5) and CVE-2021-20039 (CVSS:8.8) command injection, and CVE-2025-32819 (CVSS:8.8) path traversal protection bypass. Once compromised, hackers plant "OVERSTEP" malicious program, a C-language backdoor designed specifically for SonicWall SMA100 series devices that persists after reboot, establishes reverse shell connections, steals credentials, and evades detection by disguising as system files and deleting logs. Known victims include SMEs, government agencies, healthcare institutions. Some compromised data publicly leaked on "World Leaks" website. Group associated with Abyss ransomware deployment.

## 受影響系統
- SonicWall SMA 100 series devices

## 來源連結
- [駭客利用SonicWall裝置植入「隱形後門」,恐長期竊取組織機密](https://www.twcert.org.tw/tw/cp-104-10327-984d9-1.html)

---
> 萃取時間：2026-01-27 10:00 UTC
> 資料來源：TWCERT/CC rss-104
> Original language: Chinese (TWCERT/CC)
