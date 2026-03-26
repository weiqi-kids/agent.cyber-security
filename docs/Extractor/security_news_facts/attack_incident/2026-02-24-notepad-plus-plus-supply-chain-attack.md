# Notepad++ Auto-Update Mechanism Compromised — Manual Update Required

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-24 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

Chinese APT group Lotus Blossom (Violet Typhoon/Billbug) compromised Notepad++ hosting infrastructure between June–December 2025, hijacking the WinGUp auto-updater to serve malicious packages. Users must manually update to v8.9.2.

## 事實內容

Security research teams Rapid7 Labs and Rapid7 MDR jointly disclosed a sophisticated supply chain attack targeting the open-source text editor Notepad++. The attack was attributed to the Chinese APT group Lotus Blossom (also tracked as Violet Typhoon or Billbug).

Timeline and method:
- **Period**: June to December 2025
- The attackers compromised the infrastructure of Notepad++'s hosting service provider
- Instead of tampering with source code, attackers seized internal service credentials
- When users ran the built-in update program (WinGUp), traffic was redirected to malicious servers that served fake installation packages

Impact and response:
- Notepad++ officially called for all users to immediately stop using the auto-update feature
- Users must manually download and install the latest v8.9.2 from the official website
- The attack demonstrates sophisticated supply chain compromise targeting software update mechanisms rather than source code

## 受影響系統

- Notepad++ (all versions with auto-update enabled)
- Users who ran WinGUp during June–December 2025 period

## 來源連結

- [Notepad++自動更新機制遭攻陷，請儘速手動更新 - TWCERT/CC](https://www.twcert.org.tw/tw/cp-104-10725-feaeb-1.html)

---
> 萃取時間：2026-03-25 09:00 UTC
> 資料來源：TWCERT/CC rss-104
> Notes: Original language: Traditional Chinese (TWCERT/CC). Translated to English for extraction. APT attribution: Lotus Blossom / Violet Typhoon / Billbug (Chinese state-sponsored).
