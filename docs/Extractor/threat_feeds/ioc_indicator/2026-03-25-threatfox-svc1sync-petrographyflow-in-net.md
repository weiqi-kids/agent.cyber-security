# ClearFake Payload Delivery Domain: svc1sync.petrographyflow.in.net

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

ThreatFox 回報的 ClearFake 惡意程式 payload delivery 網域指標。此網域 `svc1sync.petrographyflow.in.net` 首次發現於 2026-03-25，信心水準 100%，由回報者 threatcat_ch 提交。為 ClearFake 偽裝瀏覽器更新活動的分發網域之一。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `svc1sync.petrographyflow.in.net` |

## 關聯分析

與 `petrographyflow.in.net` 父網域下多個子網域（svc1sync、svc2data、svc3edge、svc4static）構成 ClearFake 活動基礎設施叢集。標籤：ClearFake。

## 來源連結

- [abuse.ch ThreatFox IoC #1775203](hxxps://threatfox.abuse.ch/ioc/1775203/)

---
> 萃取時間：2026-03-25 01:04 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
