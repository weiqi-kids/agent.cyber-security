# Advanced Social Engineering Tactics - Combining Cloud Services and Short-Lived Credentials to Evade Defenses

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-29 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

Attackers upgraded social engineering tactics by combining cloud services with short-lived credentials to bypass traditional security defenses.

## 事實內容

Security researchers observed evolved social engineering attack methods where attackers leverage cloud services and short-lived authentication credentials to evade detection and bypass traditional security controls. This technique makes attacks more difficult to detect and investigate.

**Attack Techniques**:
- Abuse legitimate cloud services (AWS, Azure, GCP) for malicious infrastructure
- Utilize short-lived credentials and temporary access tokens
- Blend malicious activities with legitimate cloud traffic
- Evade traditional signature-based and reputation-based defenses

**Defense Challenges**:
- Difficulty distinguishing malicious from legitimate cloud service usage
- Short credential lifespans complicate forensic investigation
- Traditional blocklists ineffective against ephemeral infrastructure

## 受影響系統

- Organizations using cloud services
- Email and collaboration platforms
- Users targeted by social engineering campaigns

## 來源連結

- [社交工程手法再升級：結合雲端服務與短期憑證規避防禦](https://www.twcert.org.tw/tw/cp-104-10474-b4395-1.html)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：TWCERT/CC rss-104
