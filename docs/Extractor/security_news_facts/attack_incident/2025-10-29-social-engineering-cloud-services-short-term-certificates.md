# Social Engineering Escalation: Combining Cloud Services and Short-Term Certificates to Evade Defenses

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-29 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | High |
| **信心水準** | 中 |

## 摘要
TWCERT/CC received intelligence on a phishing campaign combining legitimate Microsoft 365 email services, lookalike domains, and short-term SSL certificates to bypass email and web security defenses. Two attack waves were observed: mass Microsoft login impersonation and targeted spear-phishing with MFA fatigue tactics.

## 事實內容
- **攻擊手法**: Rented Microsoft 365 accounts to send phishing emails impersonating official Microsoft notifications
- **技術特徵**:
  - Registered domains closely resembling official Microsoft domains
  - Obtained short-term SSL certificates to appear legitimate
  - Used URL Pattern filtering to serve customized phishing pages only to targeted victims; non-targets redirected to legitimate login pages
- **第一波攻擊**: Mass phishing impersonating "Microsoft abnormal login activity notifications," targeting multiple internal recipients
- **第二波攻擊**: Spear-phishing targeting specific individuals with repeated "Microsoft one-time code" notifications to create urgency (MFA fatigue technique), followed by "abnormal login" emails to harvest credentials
- **目的**: Credential harvesting leading to unauthorized account access and sensitive data exfiltration
- **防護建議**:
  1. Verify email source before responding; avoid clicking suspicious links
  2. Enable MFA and use complex passwords rotated regularly
  3. Network administrators should implement preventive blocking based on threat indicators
  4. Strengthen internal security awareness training

## 受影響系統
- Microsoft 365 email environments
- Enterprise authentication systems

## 來源連結
- [社交工程手法再升級：結合雲端服務與短期憑證規避防禦](https://www.twcert.org.tw/tw/cp-104-10473-991dd-1.html)

---
> 萃取時間：2026-03-10 UTC
> 資料來源：TWCERT/CC rss-104
