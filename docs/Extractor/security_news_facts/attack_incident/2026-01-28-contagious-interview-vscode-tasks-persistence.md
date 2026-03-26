# "Contagious Interview" Attack Evolution: Abusing VS Code Tasks for Persistence

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-28 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

OSM and Palo Alto Networks report a major evolution in "Contagious Interview" attacks: North Korean APT now abuses VS Code tasks.json to auto-execute malicious commands when developers open compromised project folders, targeting cryptocurrency sector developers.

## 事實內容

Security research teams OSM (OpenSourceMalware) and Palo Alto Networks jointly issued a warning that the "Contagious Interview" attack campaign (attributed to a North Korean APT group) has evolved significantly.

New attack technique:
- Attackers no longer only rely on tricking victims into manually executing malicious files
- Now abusing VS Code's built-in **tasks.json** automation mechanism
- When a developer opens a malicious project folder in "trusted mode," malicious commands execute automatically in the background without any manual compilation or code execution required
- This greatly increases attack stealth

Targeting:
- Primarily targeting software engineers and freelancers in the cryptocurrency industry
- Initial contact via LinkedIn, Upwork, or Fiverr (social engineering job interview scenarios)

This campaign represents a significant advancement in Living-off-the-Land (LotL) techniques using legitimate development tools.

## 受影響系統

- Visual Studio Code (when opening untrusted project folders in trusted mode)
- Developer workstations (macOS and Windows)

## 來源連結

- [「Contagious Interview」攻擊手法再進化：濫用 VS Code Tasks 建立持久化機制 - TWCERT/CC](https://www.twcert.org.tw/tw/cp-104-10657-9d247-1.html)

---
> 萃取時間：2026-03-25 09:00 UTC
> 資料來源：TWCERT/CC rss-104
> Notes: Original language: Traditional Chinese (TWCERT/CC). Translated to English for extraction. Attack attributed to North Korean APT group.
