# Interesting Message Stored in Cowrie Logs - Iranbot Honeypot Activity

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-19 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

SANS ISC DShield sensor captured activity from IP 64.89.161.198 between Jan 30 - Feb 22, 2026, including an "IRANBOT" marker in Cowrie honeypot logs via echo commands, with successful Telnet login and web access also recorded.

## 事實內容

Activity found and reported by BACS student Adam Thorman as part of an academic assignment, based on analysis published by SANS ISC. The activity was detected on February 19, 2026, when at least 2 DShield sensors captured an echo command containing a distinctive marker string in Cowrie honeypot logs:

**Marker string:** `"MAGIC_PAYLOAD_KILLER_HERE_OR_LEAVE_EMPTY_iranbot_was_here"`

**Attack activity from source IP 64.89.161.198 (Jan 30 – Feb 22, 2026):**
- Port scans
- Successful Telnet (TCP/23) login
- Web access attempts
- Activity captured across cowrie logs, webhoneypot, and iptables logs

The "iranbot" marker string suggests this activity may be associated with an Iranian threat actor or botnet operation, though attribution based solely on embedded strings is uncertain.

## 受影響系統

- Linux/Unix systems with Telnet (TCP/23) exposure
- Internet-facing systems targeted by scanning and exploitation

## 來源連結

- [Interesting Message Stored in Cowrie Logs - SANS ISC](https://isc.sans.edu/diary/rss/32810)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：SANS ISC sans-isc
