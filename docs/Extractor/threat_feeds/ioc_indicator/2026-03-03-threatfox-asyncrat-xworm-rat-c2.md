# AsyncRAT / XWorm / Quasar RAT C2 指標（2026-03-03）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet_cc |
| **惡意程式家族** | AsyncRAT, XWorm, Quasar RAT |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

2026-03-03 UTC 發現多個遠端存取木馬（RAT）的 C2 指標，涵蓋 AsyncRAT、XWorm 及 Quasar RAT 三個常見 RAT 家族。部分透過 Triage 沙箱分析確認（tria.ge），部分透過 Censys 掃描偵測。由 DonPasci、dyingbreeds_ 等回報。ThreatFox ID 範圍：1757488–1757603。

## IoC 指標

### AsyncRAT

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| ip:port | `83.8.129.208:4444` | 1757571 |
| domain | `p-89qeketo.ru.com` | 1757603 |
| domain | `americas.us.com` | 1757602 |
| domain | `pjnwbd.za.com` | 1757491 |
| domain | `pubs.eu.com` | 1757490 |
| domain | `vee.uk.com` | 1757489 |
| domain | `buy-cheap-online.us.org` | 1757488 |

### XWorm

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| ip:port | `194.87.54.114:6666` | 1757601 |
| ip:port | `1.230.16.57:5050` | 1757492 |

### Quasar RAT

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| ip:port | `94.26.106.198:2222` | 1757574 |

## 關聯分析

- AsyncRAT C2 域名使用 `.ru.com`、`.us.com`、`.eu.com`、`.za.com`、`.us.org` 等國家仿冒 ccTLD，為常見混淆技術。
- `194.87.54.114`（AS57043）XWorm C2 由 Triage 沙箱分析確認。
- `94.26.106.198:2222`（AS215607，DF-TRANSIT）為 Quasar RAT，使用標準 SSH 端口 2222 作為 C2。
- AsyncRAT 及 XWorm 為市場上流通廣泛的開源/商業 RAT，常被多個威脅行為者使用。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1757603/)
- [Triage 分析 - p-89qeketo.ru.com](hxxps://tria.ge/260303-sdc5fsd19k)
- [Triage 分析 - XWorm](hxxps://tria.ge/260303-lj59vsbx6h)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
