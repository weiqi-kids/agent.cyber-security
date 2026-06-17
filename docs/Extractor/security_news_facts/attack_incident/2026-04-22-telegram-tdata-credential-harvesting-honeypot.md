# [Guest Diary] Beyond Cryptojacking: Telegram tdata as a Credential Harvesting Vector

| 項目 | 內容 |
|------|------|
| **日期** | 2026-04-22 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

Honeypot incident reveals threat actors harvesting Telegram credentials via tdata files, going beyond simple cryptojacking to steal session data.

## 事實內容

- Guest diary by L. Carty, SANS.edu Bachelor's Degree in Applied Cybersecurity (BACS) program intern
- Threat actors are leveraging Telegram's tdata (session data) files as a credential harvesting vector
- Attack goes beyond traditional cryptojacking, targeting Telegram session files to hijack accounts
- Incident was observed and documented through a honeypot deployment
- tdata files contain Telegram session data that can allow account takeover without needing credentials
- Lessons drawn from real honeypot incident analysis

## 受影響系統

- Telegram Desktop application (Windows/Linux)
- Systems where Telegram tdata directory is accessible
- Endpoints compromised by malware capable of exfiltrating local application data

## 來源連結

- [[Guest Diary] Beyond Cryptojacking: Telegram tdata as a Credential Harvesting Vector](https://isc.sans.edu/diary/rss/32888)

---
> 萃取時間：2026-04-26 UTC
> 資料來源：SANS ISC sans-isc
