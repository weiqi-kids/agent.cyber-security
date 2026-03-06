# Remcos RAT C2 指標（2026-03-03）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet_cc |
| **惡意程式家族** | Remcos (RemcosRAT) |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 中（confidence_level: 75%） |

## 威脅描述

2026-03-03 UTC 發現 Remcos RAT（別名 RemcosRAT、Remvio、Socmer）的 C2 指標。Remcos 為商業 RAT，常被威脅行為者用於網路間諜及資料竊取。本批指標由 MalwareBazaar 樣本分析確認，並附有 IP 及域名 C2。ThreatFox ID：1757484–1757487。

## IoC 指標

| 類型 | 值 | last_seen_utc | 信心 | ThreatFox ID |
|------|-----|--------------|------|--------------|
| ip:port | `209.90.234.55:2404` | 2026-03-03 15:00:52 | 75% | 1757484 |
| domain | `www.belaijobackup1.com` | 2026-03-03 15:00:54 | 75% | 1757486 |
| domain | `www.belaijobackup2.com` | 2026-03-03 15:00:54 | 75% | 1757487 |

## 關聯分析

- 三個 IoC 均由同一 MalwareBazaar 樣本（`19be387664e72c18ee90523d33cb19780d4f8500ed961b721baec81a0af9d37f`）關聯確認。
- `belaijobackup1.com` 及 `belaijobackup2.com` 命名模式相似，顯示為同一操作者部署的冗余 C2。
- 兩個域名的 `last_seen_utc` 相同（2026-03-03 15:00:54），顯示同批次活動。
- MalwareBazaar 樣本：`hxxps://bazaar.abuse.ch/sample/19be387664e72c18ee90523d33cb19780d4f8500ed961b721baec81a0af9d37f/`

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1757487/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
