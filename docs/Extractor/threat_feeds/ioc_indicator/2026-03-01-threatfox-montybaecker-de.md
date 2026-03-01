# StrelaStealer 惡意網域 - montybaecker.de (ThreatFox)

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

此 IoC 為 **StrelaStealer** 惡意程式的 Payload 投遞網域。`montybaecker.de` 為德國（.de）頂級網域的個人/商業網站，遭入侵後被攻擊者用於分發 StrelaStealer。

.de 是全球最大的國家頂級網域之一，德語區網站通常具有較高的信譽評分，攻擊者選擇入侵此類網站可有效提高 Payload 投遞的成功率。

## IoC 指標

| 類型 | 值 |
|------|-----|
| 網域 | `montybaecker.de` |
| IoC 類型 | Domain |
| ThreatFox ID | `1756478` |
| 標籤 | StrelaStealer |
| 已遭入侵 | 是 |

## 關聯分析

批次中唯一的德國 (.de) 頂級網域，與其他歐洲（.gr、.ie）及全球網域共同構成此次攻擊的多地理分布基礎設施。StrelaStealer 對 Outlook/Thunderbird 的針對性使其特別適合用於攻擊德國大量使用這些電子郵件客戶端的企業用戶。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756478/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
