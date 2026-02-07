# 社交工程手法再升級:結合雲端服務與短期憑證規避防禦

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-29 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 中 |

## 摘要
Advanced social engineering attacks combining cloud services and spoofed domains with short-term SSL certificates to evade defenses.

## 事實內容
TWCERT/CC received external intelligence about a wave of social engineering attack activities combining cloud services and spoofed domains. Hackers rent Microsoft 365 services, register domains similar to official ones, and apply for short-term SSL certificates, attempting to evade email and web defense mechanisms to launch phishing email attacks.

In the first wave, hackers used rented legitimate Microsoft 365 email accounts to impersonate "Microsoft account abnormal login activity notifications," targeting multiple internal enterprise targets with phishing emails requesting targets to log in to accounts and check abnormal login notifications. Additionally, attackers use URL Pattern filtering for targets; if rules match, display customized phishing pages to steal account passwords; if not, redirect to official legitimate login pages.

In the second wave, hackers adopted spear phishing tactics, also using Microsoft 365 services but targeting specific targets by "continuously" sending multiple spoofed "Microsoft one-time code notifications," attempting to create the illusion that target accounts are being repeatedly attempted to log in, then sending spoofed "Microsoft account abnormal login activity notifications" again to entice targets to click links and immediately log in to accounts to check abnormal login records, thereby stealing target account passwords.

## 受影響系統
- Enterprise email systems
- Microsoft 365 users
- Employee workstations

## 來源連結
- [社交工程手法再升級:結合雲端服務與短期憑證規避防禦](https://www.twcert.org.tw/tw/cp-104-10473-991dd-1.html)

---
> 萃取時間：2026-01-27 10:00 UTC
> 資料來源：TWCERT/CC rss-104
> Original language: Chinese (TWCERT/CC)
