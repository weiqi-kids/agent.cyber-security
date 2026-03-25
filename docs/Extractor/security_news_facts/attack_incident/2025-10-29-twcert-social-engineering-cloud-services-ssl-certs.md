# Social Engineering Escalation: Attackers Combine Cloud Services and Short-Lived Certificates to Evade Defences

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-29 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

TWCERT/CC reports a wave of sophisticated phishing campaigns combining Microsoft 365 services, lookalike domains, and short-lived SSL certificates to bypass email and web defences.

## 事實內容

TWCERT/CC received threat intelligence indicating a new wave of social engineering attacks that combine cloud services and short-lived SSL certificates to evade traditional security defences.

Attack methodology:
- **Step 1 — Infrastructure setup**: Attackers rent Microsoft 365 services using legitimate accounts, register lookalike domains resembling official organizations, and obtain short-lived SSL certificates (to establish HTTPS trust indicators)
- **Step 2 — Phishing campaign**: Using the rented Microsoft 365 legitimate email infrastructure, attackers send phishing emails impersonating "Microsoft Account Abnormal Login Activity Notifications" targeting multiple individuals within enterprise organizations
- **Step 3 — Evasion techniques**:
  - Use of legitimate Microsoft 365 sending infrastructure bypasses email reputation filters
  - Short-lived SSL certificates evade domain reputation blocklists (certificates expire before feeds update)
  - Lookalike domains pass casual visual inspection
- **Goal**: Credential harvesting — victims are directed to fake login pages to capture Microsoft account credentials

This campaign demonstrates sophisticated operational security by threat actors who understand and systematically circumvent traditional email and web security controls.

Defence recommendations:
- Implement advanced email security with AI-based anomaly detection beyond sender reputation
- Train employees to verify login notifications via direct browser navigation (not clicking email links)
- Use FIDO2/passkey authentication to prevent credential replay attacks
- Monitor for lookalike domain registrations targeting your organization

## 受影響系統

- Microsoft 365 / Azure AD accounts
- Corporate email systems
- Enterprise employees targeted by spear-phishing

## 來源連結

- [社交工程手法再升級：結合雲端服務與短期憑證規避防禦 (TWCERT/CC)](https://www.twcert.org.tw/tw/cp-104-10473-991dd-1.html)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：TWCERT/CC rss-104
> 注意：Original language: Traditional Chinese (zh-TW). Translated to English.
