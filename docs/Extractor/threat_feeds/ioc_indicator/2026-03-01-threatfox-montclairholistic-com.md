# StrelaStealer 惡意網域 - montclairholistic.com (ThreatFox)

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

此 IoC 為 **StrelaStealer** 惡意程式的 Payload 投遞網域。`montclairholistic.com` 為整體健康/身心靈相關服務業者的遭入侵網站（最早上報的一個，時間為 2026-03-01 19:00:37 UTC），被攻擊者用於分發 StrelaStealer。

此為批次 4 中 ThreatFox 上報的最後一個（最早發生）StrelaStealer 域名，顯示此波攻擊活動從 19:00 UTC 開始至 22:10 UTC，持續時間超過 3 小時，期間陸續有 10+ 個受入侵網域被發現並上報。

## IoC 指標

| 類型 | 值 |
|------|-----|
| 網域 | `montclairholistic.com` |
| IoC 類型 | Domain |
| ThreatFox ID | `1756476` |
| 標籤 | StrelaStealer |
| 已遭入侵 | 是 |

## 關聯分析

此為此批次中最早上報的 StrelaStealer IoC（19:00:37 UTC），標誌著此波活動的最初發現時間。整個活動的時間軸（19:00-22:10 UTC）顯示攻擊者可能正在持續部署新的 Payload 投遞基礎設施。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756476/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
