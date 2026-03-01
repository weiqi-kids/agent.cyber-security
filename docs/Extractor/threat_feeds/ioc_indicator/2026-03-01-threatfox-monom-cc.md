# StrelaStealer Payload Delivery Domain: monom.cc

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-01 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | other |
| **惡意程式家族** | StrelaStealer |
| **狀態** | unknown |
| **威脅等級** | 高 |
| **信心水準** | 100% |

## 威脅描述

abuse.ch ThreatFox 於 2026-03-01 回報此域名為 StrelaStealer 惡意程式的 payload 投遞域名。此域名標記為已遭入侵（is_compromised: true），使用 .cc 頂級域名（科科斯群島），由研究員 threatcat_ch 回報。StrelaStealer 以竊取 Microsoft Outlook 和 Mozilla Thunderbird 電子郵件憑證為主要目標。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `monom.cc` |

## 關聯分析

此域名為同一 StrelaStealer 活動集群（回報者：threatcat_ch，時間：2026-03-01 約 18:40 UTC）的一部分，與 montagne-emotion.fr、montagnaitalia.it、monokerka.com、monnier.com.br 相關。.cc 域名的使用與其他歐洲 ccTLD（.fr、.it、.br）域名不同，顯示攻擊者廣泛入侵不同地區和域名類型的合法網站。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756460/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox ID:1756460
