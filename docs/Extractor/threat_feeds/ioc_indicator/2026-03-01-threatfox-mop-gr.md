# StrelaStealer 惡意網域 - mop.gr (ThreatFox)

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

此 IoC 為 **StrelaStealer** 惡意程式的 Payload 投遞網域。`mop.gr` 為希臘（.gr）頂級網域的短域名，遭入侵後被用於分發 StrelaStealer 惡意 Payload。

使用不同國家頂級網域（ccTLD）的網站是此次活動的特徵之一，顯示攻擊者廣泛尋求並利用全球各地的遭入侵網站，以分散攻擊基礎設施並規避地區性封鎖。

## IoC 指標

| 類型 | 值 |
|------|-----|
| 網域 | `mop.gr` |
| IoC 類型 | Domain |
| ThreatFox ID | `1756483` |
| 標籤 | StrelaStealer |
| 已遭入侵 | 是 |

## 關聯分析

批次中唯一的希臘 (.gr) 頂級網域，與 `.com`、`.ie`、`.de`、`.br` 等不同 TLD 的網域共同出現，顯示此次 StrelaStealer 活動的攻擊基礎設施具有明顯的地理多樣性。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756483/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
