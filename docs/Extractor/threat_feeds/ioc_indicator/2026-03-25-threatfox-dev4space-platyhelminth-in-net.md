# ClearFake Payload Delivery Domain: dev4space.platyhelminth.in.net

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

ThreatFox 回報的 ClearFake 惡意程式 payload delivery 網域指標。此網域 `dev4space.platyhelminth.in.net` 首次發現於 2026-03-25，信心水準 100%，由回報者 threatcat_ch 提交。為 ClearFake 偽瀏覽器更新活動的分發基礎設施節點，屬本次活動中第四個不同父網域的叢集。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `dev4space.platyhelminth.in.net` |

## 關聯分析

屬 `platyhelminth.in.net` 父網域下的 ClearFake 活動節點。本次 ThreatFox 批量回報顯示 ClearFake 行動使用多個不同父網域（petrographyflow、chordatamatrix、nematodastream、platyhelminth），均以 `*.in.net` 結尾，構成大規模分散式分發架構。標籤：ClearFake。

## 來源連結

- [abuse.ch ThreatFox IoC #1775193](hxxps://threatfox.abuse.ch/ioc/1775193/)

---
> 萃取時間：2026-03-25 00:04 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
