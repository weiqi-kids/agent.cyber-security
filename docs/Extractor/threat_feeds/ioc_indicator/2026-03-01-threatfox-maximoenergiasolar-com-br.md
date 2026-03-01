# StrelaStealer 惡意網域 - maximoenergiasolar.com.br (ThreatFox)

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

此 IoC 為 **StrelaStealer** 惡意程式的 Payload 投遞網域。`maximoenergiasolar.com.br` 為巴西（.com.br）頂級網域的太陽能相關商業網站，遭入侵後被用於分發 StrelaStealer。

巴西是拉丁美洲最大的網際網路用戶市場，此類巴西網域的入侵顯示攻擊者的攻擊範圍延伸至南美洲。

## IoC 指標

| 類型 | 值 |
|------|-----|
| 網域 | `maximoenergiasolar.com.br` |
| IoC 類型 | Domain |
| ThreatFox ID | `1756479` |
| 標籤 | StrelaStealer |
| 已遭入侵 | 是 |

## 關聯分析

批次中唯一的巴西 (.com.br) 頂級網域，進一步確認此次 StrelaStealer 活動廣泛利用全球多個國家的遭入侵網站作為 Payload 投遞基礎設施，是一種典型的分散式攻擊基礎設施策略。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756479/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
