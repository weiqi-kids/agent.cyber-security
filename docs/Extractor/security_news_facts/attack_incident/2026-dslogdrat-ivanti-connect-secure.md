# DslogdRAT Malware Installed in Ivanti Connect Secure

| 項目 | 內容 |
|------|------|
| **日期** | 2025-04-24 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | critical |
| **信心水準** | high |

## 摘要
JPCERT/CC 發現 DslogdRAT 惡意軟體感染 Ivanti Connect Secure 設備，不同於先前報告的 SPAWNCHIMERA。

## 事實內容
在先前的 JPCERT/CC Eyes 文章中，報告了利用 Ivanti Connect Secure 漏洞植入 SPAWNCHIMERA 惡意軟體的攻擊。然而，這並非攻擊者使用的唯一惡意軟體。本次報告聚焦於另一個在近期攻擊中觀察到的惡意軟體：DslogdRAT。

DslogdRAT 特徵：
- 針對 Ivanti Connect Secure 設備設計
- 與 SPAWNCHIMERA 不同的惡意軟體家族
- 顯示多個威脅行為者正在利用相同漏洞
- 可能具備遠端存取和控制能力（RAT 功能）

這個發現顯示 Ivanti Connect Secure 的漏洞被多個攻擊者群體積極利用，且不同群體使用不同的惡意軟體工具。組織需要進行全面的入侵指標（IoC）掃描，以確保未被多種惡意軟體感染。

## 來源連結
- [DslogdRAT Malware Installed in Ivanti Connect Secure](https://blogs.jpcert.or.jp/en/2025/04/dslogdrat.html)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：JPCERT/CC Blog jpcert-blog
