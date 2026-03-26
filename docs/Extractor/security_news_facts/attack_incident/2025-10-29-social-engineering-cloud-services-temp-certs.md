# Social Engineering Escalation: Combining Cloud Services and Short-term Certificates to Evade Defenses

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-29 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 中 |

## 摘要

TWCERT/CC received intelligence on phishing campaigns combining Microsoft 365 services, fake domains mimicking official sites, and short-term SSL certificates with URL-pattern-based target filtering to evade email and web defenses.

## 事實內容

TWCERT/CC received external threat intelligence about a wave of social engineering attacks combining cloud services and fake domains.

Attack method:
- **First wave**: Attackers rent legitimate Microsoft 365 accounts to send phishing emails impersonating "Microsoft account abnormal login activity notifications"
- **URL-based targeting**: Attackers use URL patterns to filter targets — matching targets see a customized phishing page to steal credentials; non-matching requests redirect to the legitimate Microsoft login page
- **Evasion techniques**:
  - Using legitimate Microsoft 365 services bypasses email filters
  - Registering domains similar to official domains
  - Obtaining short-term SSL certificates to appear legitimate
  - URL-pattern filtering prevents easy detection

This sophisticated multi-layer attack demonstrates advanced evasion techniques specifically designed to bypass enterprise email security gateways and web proxies.

## 受影響系統

- Enterprise email users (phishing target)
- Microsoft 365 account holders

## 來源連結

- [社交工程手法再升級：結合雲端服務與短期憑證規避防禦 - TWCERT/CC](https://www.twcert.org.tw/tw/cp-104-10473-991dd-1.html)

---
> 萃取時間：2026-03-25 09:00 UTC
> 資料來源：TWCERT/CC rss-104
> Notes: Original language: Traditional Chinese (TWCERT/CC). Translated to English for extraction.
