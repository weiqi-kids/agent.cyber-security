# Microsoft Azure Monitor Alerts Abused in Callback Phishing Campaigns

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-22 |
| **來源** | NCSC-FI (Finland) |
| **分類** | attack_incident |
| **嚴重程度** | Medium |
| **信心水準** | 高 |

## 摘要

Threat actors are abusing Microsoft Azure Monitor alerts to send callback phishing emails that impersonate Microsoft Security Team warnings about unauthorized charges. The campaign exploits the legitimacy of Azure monitoring infrastructure to bypass email security controls.

## 事實內容

Attackers are leveraging Microsoft Azure Monitor's legitimate alert infrastructure to send phishing emails that appear to originate from Microsoft Security Team, warning recipients about unauthorized charges on their accounts. This technique abuses legitimate cloud services to evade spam filters and email security systems.

Key points:
- Attack vector: Abuse of Microsoft Azure Monitor alert emails
- Lure: Fake warnings about unauthorized charges on user accounts
- Impersonation: Microsoft Security Team
- Technique: Callback phishing (victims are prompted to call a phone number)
- Evasion: Legitimate Azure infrastructure bypasses email security controls

How callback phishing works:
1. Victim receives an email appearing to be from Microsoft (sent via Azure Monitor)
2. Email claims unauthorized charges have occurred
3. Victim is instructed to call a provided phone number
4. Attackers on the phone attempt to steal credentials, install remote access software, or obtain payment information

This technique is part of a broader trend of abusing legitimate cloud services for phishing delivery.

## 受影響系統

- Microsoft Azure customers
- Organizations and individuals using Microsoft cloud services
- Email recipients across all sectors

## 來源連結

- [Microsoft Azure Monitor alerts abused in callback phishing campaigns](https://www.bleepingcomputer.com/news/security/microsoft-azure-monitor-alerts-abused-in-callback-phishing-campaigns/)

---
> 萃取時間：2026-03-23 01:30 UTC
> 資料來源：NCSC-FI (Finland) ncsc-fi-news
