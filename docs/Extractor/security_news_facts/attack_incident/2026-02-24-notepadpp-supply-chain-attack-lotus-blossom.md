# Notepad++ Auto-Update Mechanism Compromised in Supply Chain Attack

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-24 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

Chinese APT group Lotus Blossom (Violet Typhoon/Billbug) compromised Notepad++ hosting provider infrastructure from June-December 2025, redirecting auto-update traffic to malicious servers. Users must manually update to v8.9.2.

## 事實內容

Security research teams Rapid7 Labs and Rapid7 MDR jointly disclosed a sophisticated supply chain attack targeting the popular open-source text editor Notepad++. The attack was attributed to Chinese APT group **Lotus Blossom** (also tracked as Violet Typhoon or Billbug).

Timeline: June to December 2025, attackers successfully compromised the infrastructure of Notepad++'s hosting service provider.

Attack method: Unlike traditional source code tampering, the attackers obtained internal service credentials. When users ran the built-in update program (WinGUp), traffic was redirected to malicious servers, causing fake installation packages to be downloaded.

Impact: Users who used the auto-update feature may have downloaded trojanized versions of Notepad++.

Recommended action: Immediately stop using the auto-update function and manually download and install the latest v8.9.2 from the official website.

## 受影響系統

- Notepad++ (all versions using the built-in auto-update/WinGUp mechanism)
- Windows systems running affected Notepad++ versions

## 來源連結

- [Notepad++自動更新機制遭攻陷，請儘速手動更新 - TWCERT/CC](https://www.twcert.org.tw/tw/cp-104-10725-feaeb-1.html)

---
> 萃取時間：2026-03-25 09:00 UTC
> 資料來源：TWCERT/CC rss-104
> Notes: Original language: Traditional Chinese (TWCERT/CC). Translated to English for extraction.
