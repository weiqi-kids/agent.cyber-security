# StrelaStealer 惡意網域 - mori-bankin.com (ThreatFox)

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

此 IoC 為 **StrelaStealer** 惡意程式的 Payload 投遞網域。`mori-bankin.com` 被標記為已遭入侵（`is_compromised: true`），疑似仿冒金融機構或銀行相關服務（"bankin" 可能為 "banking" 的縮寫），具備更高的社交工程欺騙性。

StrelaStealer 竊取目標包括 Outlook 和 Thunderbird 的認證憑證，對企業用戶造成高度風險。由 ThreatFox 情報分析師 `threatcat_ch` 回報。

## IoC 指標

| 類型 | 值 |
|------|-----|
| 網域 | `mori-bankin.com` |
| IoC 類型 | Domain |
| ThreatFox ID | `1756487` |
| 標籤 | StrelaStealer |
| 已遭入侵 | 是 |

## 關聯分析

屬於 2026-03-01 StrelaStealer 大規模 Payload 投遞活動的一部分。網域名稱中包含 "bankin" 詞彙，可能針對金融服務業用戶或對金融相關主題感興趣的受害者。與同批次其他 StrelaStealer 網域共同構成攻擊基礎設施。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756487/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
