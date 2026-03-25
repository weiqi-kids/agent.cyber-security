# ClearFake Payload Delivery Domain: svc4static.petrographyflow.in.net

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-25 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | payload_delivery |
| **惡意程式家族** | ClearFake (js.clearfake) |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

ThreatFox 回報的 ClearFake 惡意程式 payload delivery 網域指標。ClearFake 是一種偽裝成瀏覽器更新提示的惡意 JavaScript 框架，用於誘騙使用者下載惡意程式。此網域 `svc4static.petrographyflow.in.net` 首次發現於 2026-03-25，信心水準 100%，由回報者 threatcat_ch 提交。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `svc4static.petrographyflow.in.net` |

## 關聯分析

此網域與同一父網域 `petrographyflow.in.net` 的多個子網域（svc1sync、svc2data、svc3edge、svc4static）同屬 ClearFake 活動基礎設施，疑似為同一次行動中使用的分發網路。標籤：ClearFake。

## 來源連結

- [abuse.ch ThreatFox IoC #1775206](hxxps://threatfox.abuse.ch/ioc/1775206/)

---
> 萃取時間：2026-03-25 01:23 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
