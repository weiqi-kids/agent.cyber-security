# QuickLens Chrome Extension Steals Crypto, Shows ClickFix Attack

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-01 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

A Chrome extension named "QuickLens - Search Screen with Google Lens" was compromised to push malware and steal cryptocurrency from approximately 7,000 users. Version 5.8 released on February 17, 2026, introduced ClickFix attacks and info-stealing functionality. The extension has since been removed from the Chrome Web Store.

## 事實內容

- The Chrome extension "QuickLens - Search Screen with Google Lens" was initially a legitimate tool allowing users to run Google Lens searches directly in their browser.
- The extension had grown to roughly 7,000 users and had received a featured badge from Google.
- On February 17, 2026, a malicious version 5.8 was released containing:
  - ClickFix attack scripts — a social engineering technique that tricks users into executing malicious commands
  - Info-stealing functionality targeting cryptocurrency wallets
- The attack vector was a supply-chain compromise of the extension, where the attacker updated the published extension with malicious code.
- Google subsequently removed the extension from the Chrome Web Store after the compromise was discovered.
- The incident illustrates the growing use of ClickFix as an attack delivery mechanism embedded in browser extensions.

## 受影響系統

- Google Chrome browser (all versions with QuickLens v5.8 installed)
- QuickLens Chrome extension (version 5.8)
- Cryptocurrency wallets accessible via compromised browser sessions
- Users with approximately 7,000 affected installations

## 來源連結

- [QuickLens Chrome extension steals crypto, shows ClickFix attack](https://www.bleepingcomputer.com/news/security/quicklens-chrome-extension-steals-crypto-shows-clickfix-attack/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
