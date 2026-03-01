# StrelaStealer 惡意網域 - morganhillmarblepolishing.com (ThreatFox)

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

此 IoC 為 **StrelaStealer** 惡意程式的 Payload 投遞網域。`morganhillmarblepolishing.com` 疑似為遭入侵的小型企業網站（大理石拋光服務），攻擊者利用合法商業網站托管惡意 Payload，以規避基於聲譽的安全防護。

利用合法但低流量的小型企業網站作為攻擊跳板是一種成熟的攻擊技術，此類網站往往缺乏完善的安全監控。

## IoC 指標

| 類型 | 值 |
|------|-----|
| 網域 | `morganhillmarblepolishing.com` |
| IoC 類型 | Domain |
| ThreatFox ID | `1756485` |
| 標籤 | StrelaStealer |
| 已遭入侵 | 是 |

## 關聯分析

屬於 2026-03-01 StrelaStealer 大規模活動的一部分，網域特徵顯示為遭入侵的合法小型企業網站。攻擊者選擇此類網站可能是因為其域名聲譽較高、較不容易被安全工具封鎖。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756485/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
