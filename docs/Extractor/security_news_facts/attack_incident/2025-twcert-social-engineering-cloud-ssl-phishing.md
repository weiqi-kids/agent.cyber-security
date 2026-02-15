# Advanced Social Engineering: Combining Cloud Services and Short-term SSL Certificates

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-29 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

TWCERT/CC received intelligence on social engineering attacks combining Microsoft 365 services, lookalike domains, and short-term SSL certificates to bypass email and web defenses.

## 事實內容

TWCERT/CC received external intelligence on a new wave of social engineering attacks combining cloud services and spoofed domains. Attackers rent Microsoft 365 services, register domains similar to official ones, and apply for short-term SSL certificates to evade email and web defense mechanisms.

**First Wave Attack:**
Attackers used rented Microsoft 365 legitimate email accounts to impersonate "Microsoft account abnormal login activity notifications," launching phishing email attacks against multiple enterprise targets. Attackers utilized URL Pattern filtering: if targets match rules, customized phishing pages display to steal credentials; otherwise, redirect to official legitimate login pages.

**URL Pattern Mechanism:**
A rule to determine if URLs match specific formats. For example, "/*" represents all pages under login.example.com. Attackers can use such URL Patterns to precisely filter targets, deciding when to display phishing pages.

**Second Wave Attack (Spear Phishing):**
Attackers continued using Microsoft 365 services but changed tactics, targeting specific individuals with multiple consecutive fake "Microsoft one-time code notifications" to create the illusion of repeated login attempts. Subsequently, they sent fake "Microsoft account abnormal login activity notifications" again, luring targets to click links to immediately log in and check abnormal login records, thereby stealing target account credentials.

**Attack Characteristics:**
- Continuously upgraded social engineering and phishing attack techniques
- Adopted advanced strategies with repeated fake Microsoft system notifications
- Attempted to create urgent atmosphere using recipient trust in official notifications and time pressure
- Tricked recipients into clicking malicious links without full verification
- Caused unauthorized account access and sensitive data leakage

**Recommended Mitigations:**
1. Be vigilant about suspicious emails, verify email source authenticity, avoid clicking unknown URLs or links. Do not input personal information, account passwords, or financial data on suspicious websites.
2. Regularly update passwords meeting complexity requirements and enable multi-factor authentication (MFA) to enhance security protection.
3. Network administrators should reference latest compromise indicators, properly implement preventive blocking measures to intercept and filter suspicious emails.
4. Strengthen internal awareness training to improve personnel security consciousness and prevent hackers from using email for social engineering attacks.

## 受影響系統

- Microsoft 365 email systems
- Enterprise email infrastructure
- User workstations and endpoints

## 來源連結

- [社交工程手法再升級:結合雲端服務與短期憑證規避防禦](https://www.twcert.org.tw/tw/cp-104-10473-991dd-1.html)

---
> 萃取時間: 2026-02-15 23:35 UTC
> 資料來源: TWCERT/CC rss-104
