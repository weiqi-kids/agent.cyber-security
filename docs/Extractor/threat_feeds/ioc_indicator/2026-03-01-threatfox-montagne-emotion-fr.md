# StrelaStealer Payload Delivery Domain: montagne-emotion.fr

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

abuse.ch ThreatFox 於 2026-03-01 回報此域名為 StrelaStealer 惡意程式的 payload 投遞（payload_delivery）域名。StrelaStealer 是一款以竊取電子郵件憑證（特別是 Outlook 和 Thunderbird）為主要目標的資訊竊取程式。此域名標記為已遭入侵（is_compromised: true），顯示攻擊者劫持了合法的法國戶外運動商業網站用於惡意程式投遞，由研究員 threatcat_ch 回報。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `montagne-emotion.fr` |

## 關聯分析

此域名是 StrelaStealer 大規模感染活動的一部分，同時段（2026-03-01 18:xx UTC）另有多個遭入侵網站用於相同目的：
- montagnaitalia.it (ID: 1756462) - 義大利山地主題網站
- monom.cc (ID: 1756460)
- monokerka.com (ID: 1756459)
- monnier.com.br (ID: 1756458)

攻擊者偏好入侵合法商業網站作為 payload 投遞平台，以利用其既有的信譽規避基於域名信譽的安全控制。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756463/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox ID:1756463
