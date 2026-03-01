# StrelaStealer 惡意網域 - montgomerypoolservices.com (ThreatFox)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-01 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | payload_delivery |
| **惡意程式家族** | StrelaStealer |
| **狀態** | unknown |
| **威脅等級** | 高 |
| **信心水準** | 高（confidence: 100） |

## 威脅描述

此 IoC 為 **StrelaStealer** 惡意程式的 Payload 投遞網域。`montgomerypoolservices.com` 為美國游泳池服務業者的遭入侵網站，攻擊者利用此合法商業網站分發 StrelaStealer。

此類小型服務業網站通常使用通用 CMS（如 WordPress），安全維護程度較低，是攻擊者入侵和濫用的常見目標。

## IoC 指標

| 類型 | 值 |
|------|-----|
| 網域 | `montgomerypoolservices.com` |
| IoC 類型 | Domain |
| ThreatFox ID | `1756477` |
| 標籤 | StrelaStealer |
| 已遭入侵 | 是 |

## 關聯分析

屬於 2026-03-01 StrelaStealer 大規模 Payload 投遞活動，為美國本地商業網站遭入侵案例。CMS 漏洞（如 WordPress 外掛程式漏洞）是攻擊者入侵此類小型商業網站的主要手段。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756477/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
