# KongTuke ClickFix Abuse of Compromised WordPress Sites

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-12 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Trend Micro MDR 分析 KongTuke 惡意活動，利用 ClickFix 技術濫用受感染 WordPress 網站散布惡意軟體。

## 事實內容

- Trend Micro MDR（Managed Detection and Response）發布 KongTuke 威脅分析報告
- KongTuke 利用 ClickFix 技術（社交工程手法，誘使用戶執行惡意指令）進行攻擊
- 攻擊者入侵合法 WordPress 網站作為攻擊基礎設施
- 受感染的 WordPress 網站被用於投遞惡意內容，藉由合法網站信任度規避偵測
- ClickFix 攻擊通常顯示假錯誤訊息，誘使用戶執行 PowerShell 或其他惡意腳本
- 此攻擊模式在 2025-2026 年間快速增長，成為主要威脅向量

## 受影響系統

- WordPress 網站（遭入侵作為攻擊跳板）
- Windows 終端用戶（ClickFix 社交工程目標）

## 來源連結

- [Through the Lens of MDR: Analysis of KongTuke's ClickFix Abuse of Compromised WordPress Sites](https://www.trendmicro.com/en_us/research/26/c/kongtuke-clickfix-abuse-of-compromised-wordpress-sites.html)

---
> 萃取時間：2026-03-12 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
