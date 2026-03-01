# StrelaStealer 惡意網域 - msi-us.com (ThreatFox)

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

此 IoC 為 **StrelaStealer** 惡意程式的 Payload 投遞網域。StrelaStealer 是一種資訊竊取程式（Infostealer），主要針對電子郵件客戶端（Outlook、Thunderbird）的帳號認證資訊。

網域 `msi-us.com` 被標記為已遭入侵（`is_compromised: true`），顯示此為遭攻擊者劫持的合法網域，用於分發 StrelaStealer 惡意 Payload。由 ThreatFox 情報分析師 `threatcat_ch` 回報，信心等級為 100%。

StrelaStealer 通常透過垃圾郵件活動（Spam Campaign）傳播，利用 .zip 附件中的 .js 或 .html 檔案啟動感染鏈。

## IoC 指標

| 類型 | 值 |
|------|-----|
| 網域 | `msi-us.com` |
| IoC 類型 | Domain |
| ThreatFox ID | `1756488` |
| 標籤 | StrelaStealer |
| 已遭入侵 | 是 |

## 關聯分析

與同批次其他 StrelaStealer 相關網域（mori-bankin.com、morgans-construction.nitrolic.com 等）構成同一 StrelaStealer 垃圾郵件活動的基礎設施。此波活動於 2026-03-01 19:00-22:10 UTC 期間集中上報，涵蓋超過 10 個受入侵網域。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756488/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
