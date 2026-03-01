# StrelaStealer 惡意網域 - moonlightmakers.ie (ThreatFox)

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

此 IoC 為 **StrelaStealer** 惡意程式的 Payload 投遞網域。`moonlightmakers.ie` 為愛爾蘭（.ie）頂級網域的創意/手工藝類商業網站，遭入侵後被用於分發 StrelaStealer 惡意 Payload。

.ie 頂級網域需要愛爾蘭本地聯繫才能註冊，因此遭入侵的 .ie 網站通常具有較高的聲譽，有助於規避某些安全過濾機制。

## IoC 指標

| 類型 | 值 |
|------|-----|
| 網域 | `moonlightmakers.ie` |
| IoC 類型 | Domain |
| ThreatFox ID | `1756480` |
| 標籤 | StrelaStealer |
| 已遭入侵 | 是 |

## 關聯分析

批次中唯一的愛爾蘭 (.ie) 頂級網域，與 `mop.gr`（希臘）、`maximoenergiasolar.com.br`（巴西）等非美國 ccTLD 共同顯示此次攻擊活動的全球性特徵。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756480/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
