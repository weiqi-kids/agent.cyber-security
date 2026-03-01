# StrelaStealer 惡意網域 - morgans-construction.nitrolic.com (ThreatFox)

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

此 IoC 為 **StrelaStealer** 惡意程式的 Payload 投遞網域，為子網域格式。`morgans-construction.nitrolic.com` 使用 `nitrolic.com` 作為父網域，採用子網域分發的方式，可能利用免費/低成本子網域服務進行惡意活動。

此類子網域濫用手法（Subdomain Abuse）常見於快速輪換攻擊基礎設施，以規避封鎖清單。已標記為遭入侵域。

## IoC 指標

| 類型 | 值 |
|------|-----|
| 網域 | `morgans-construction.nitrolic.com` |
| IoC 類型 | Domain |
| ThreatFox ID | `1756486` |
| 標籤 | StrelaStealer |
| 已遭入侵 | 是 |

## 關聯分析

此網域使用子網域結構，與批次中其他使用獨立網域的 StrelaStealer IoC 有所不同，顯示攻擊者同時使用多種基礎設施佈建策略。`nitrolic.com` 父網域本身可能也遭到攻擊者控制或濫用。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756486/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
