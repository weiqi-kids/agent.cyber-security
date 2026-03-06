# ClearFake 分發網路：goldtrail / oaktrail / suncrest 子域叢集

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | payload_delivery / botnet_cc |
| **惡意程式家族** | ClearFake |
| **狀態** | unknown |
| **威脅等級** | Medium |
| **信心水準** | 高 |

## 威脅描述

2026-03-03 UTC 發現 ClearFake 惡意 JavaScript 框架使用的多個 payload delivery 及 C2 域名，分屬三個基礎設施叢集：`goldtrail.in.net`、`oaktrail.in.net`、`suncrest.in.net`。ClearFake 常用於偽造瀏覽器更新提示，誘使使用者執行惡意腳本。由 threatcat_ch、ttakvam、Gi7w0rm 等研究人員回報。ThreatFox ID 範圍：1757563–1757627。

## IoC 指標

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| domain | `trail-net.goldtrail.in.net` | 1757627 |
| domain | `gold04.goldtrail.in.net` | 1757622 |
| domain | `red09.redhaven.in.net` | 1757597 |
| domain | `haven-x.redhaven.in.net` | 1757594 |
| domain | `redbase.redhaven.in.net` | 1757593 |
| domain | `forest-run.oaktrail.in.net` | 1757583 |
| domain | `oak05.oaktrail.in.net` | 1757582 |
| domain | `trail-v2.oaktrail.in.net` | 1757575 |
| domain | `oakpath.oaktrail.in.net` | 1757563 |
| domain | `oakpath.oaktrail.in.net@80` | 1757561 |
| domain | `sunflow.suncrest.in.net` | 1757564 |
| domain | `solarbase.suncrest.in.net` | 1757565 |
| domain | `crest01.suncrest.in.net` | 1757566 |
| domain | `sun-node.suncrest.in.net` | 1757567 |

## 關聯分析

- 多個子域共用 `.in.net` 第三層域名，為 ClearFake 常見基礎設施模式（快速輪換子域）。
- 部分域名（如 `oakpath.oaktrail.in.net@80`）以帶端口格式回報，顯示特定 HTTP 端口監聽。
- `last_seen_utc` 時間短暫（數分鐘到數十分鐘），符合 ClearFake 快速上下線特徵。
- 標籤含 `3March2026,ClearFake,Commandline,Windows`，確認為 2026-03-03 活躍 campaign。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1757627/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
