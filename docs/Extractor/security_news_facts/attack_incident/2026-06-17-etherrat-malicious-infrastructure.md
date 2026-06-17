# Inside a malicious infrastructure delivering EtherRAT, phishing pages, and malicious software

| 項目 | 內容 |
|------|------|
| **日期** | 2026-06-17 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

研究人員發現分發 EtherRAT 惡意軟體的大型惡意基礎設施，透過以太坊區塊鏈隱藏 C2 伺服器位址。

## 事實內容

Malwarebytes 威脅獵人發現 EtherRAT 惡意軟體透過一個具有異常首頁的網站分發，並由此揭露了一個分發惡意軟體、惡意文件、遠端桌面軟體和網路釣魚頁面的龐大惡意基礎設施。

EtherRAT 是一個以 Node.js 開發的遠端存取木馬（RAT），允許攻擊者完全控制受感染機器並執行任意程式碼。其特殊之處在於使用以太坊（Etherium）區塊鏈來獲取 C2 伺服器地址，使基礎設施更難被追蹤和封鎖。EtherRAT 通常透過 MSI、PowerShell 或 JavaScript 腳本分發。

## 受影響系統

- Windows 系統（MSI/PowerShell/JavaScript 感染向量）

## 來源連結

- [Inside a malicious infrastructure delivering EtherRAT, phishing pages, and malicious software](https://www.malwarebytes.com/blog/threat-intel/2026/06/inside-a-malicious-infrastructure-delivering-etherrat-phishing-pages-and-malicious-software)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
