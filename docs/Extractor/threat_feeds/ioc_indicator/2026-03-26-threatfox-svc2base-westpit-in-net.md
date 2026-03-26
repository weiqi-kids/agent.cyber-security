# ClearFake 惡意程式 Payload 傳遞域名：svc2base.westpit.in.net

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-26 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | payload_delivery |
| **惡意程式家族** | ClearFake (js.clearfake) |
| **狀態** | online |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

此域名被識別為 ClearFake 惡意程式的 Payload 傳遞節點。ClearFake 是一種基於 JavaScript 的惡意框架，通常偽裝成瀏覽器更新提示，誘使使用者下載並執行惡意程式。該域名於 2026-03-26 被報告，信心水準為 100%。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `svc2base[.]westpit[.]in[.]net` |

## 關聯分析

此 IoC 屬於 ClearFake（js.clearfake）惡意程式家族。ClearFake 活動通常透過受感染網站植入惡意 JavaScript，引導訪客下載偽裝成瀏覽器更新的惡意載荷，目標為 Windows 系統用戶。與同期其他 westpit.in.net 子域名（svc1infra、svc3user、svc4link）屬同一活動基礎設施。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/)
- [ThreatFox IoC ID 1776527](https://threatfox.abuse.ch/ioc/1776527/)

---
> 萃取時間：2026-03-26 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
