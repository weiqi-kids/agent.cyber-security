# TSUBAME Report Overflow (Apr-Jun 2025)

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-28 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC TSUBAME sensors detected Iran IP traffic drop (170-200 to 20-100) during June 13-25 cyberattacks, with Telnet/SSH/HTTP as top targets.

## 事實內容

JPCERT/CC's TSUBAME Report for April-June 2025 reveals key monitoring trends:

**Geographic Threat Observations:**

**Iran-Israel Conflict Impact:**
- June 13-25, 2025: Iranian IP addresses dropped from 170-200 to 20-100
- Attributed to Iranian government internet connectivity restrictions
- Coincided with cyberattacks targeting Iranian "state broadcaster, banks, and cryptocurrency exchanges"
- Israel's traffic showed no corresponding changes

**Attack Trends by Port:**

Most frequently targeted services across all regions:
- Telnet (23/TCP): Most targeted protocol
- SSH (22/TCP): Widespread scanning activity
- HTTP/HTTPS (80/TCP, 443/TCP): Universal targets
- Custom services (8728/TCP, 8080/TCP): Regular reconnaissance

**Regional Variations:**
- Port 445 (SMB) and 3389 (RDP) in North American/other regional top 10
- Indicates persistent remote access exploitation attempts

**Statistical Patterns:**
- Peak packet volume: April 2025 (gradual decline through June)
- Overseas sensors consistently received higher traffic than Japan-based monitors
- Suggests international scanning campaigns originating outside Japan

**Strategic Observations:**
Geographically distributed monitoring enables distinguishing between localized and global-scale attacks.

## 受影響系統

- Telnet services (23/TCP)
- SSH servers (22/TCP)
- HTTP/HTTPS services (80/443/TCP)
- SMB (445/TCP)
- RDP (3389/TCP)
- Iranian state broadcaster, banks, cryptocurrency exchanges

## 來源連結

- [TSUBAME Report Overflow (Apr-Jun 2025)](https://blogs.jpcert.or.jp/en/2025/10/tsubame_overflow_2025-04-06.html)

---
> 萃取時間：2026-01-27 UTC
> 資料來源：JPCERT/CC Blog jpcert-blog
