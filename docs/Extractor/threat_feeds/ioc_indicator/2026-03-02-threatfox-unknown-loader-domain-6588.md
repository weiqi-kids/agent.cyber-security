---
title: "ThreatFox IoC: Unknown Loader C2 Domain townquiver.xyz"
source: abuse.ch ThreatFox
source_id: threatfox-recent
category: ioc_indicator
threat_type: botnet
malware_family: Unknown Loader
ioc_type: domain
ioc_value: "townquiver.xyz"
threat_level: High
confidence: 高
first_seen: "2026-03-02T07:51:59Z"
last_seen: null
reporter: abuse_ch
tags:
  - OffLoader
is_compromised: false
threatfox_id: "1756588"
---

# ThreatFox IoC: Unknown Loader C2 Domain townquiver.xyz

## 基本資訊

| 欄位 | 值 |
|------|----|
| IoC 類型 | domain |
| IoC 值 | townquiver.xyz |
| 威脅類型 | botnet（C2 通訊） |
| 惡意程式家族 | Unknown Loader |
| 威脅等級 | High |
| 可信度 | 高（100%） |
| 首次發現 | 2026-03-02 07:51:59 UTC |
| 最後發現 | — |
| 回報者 | abuse_ch |
| ThreatFox ID | 1756588 |

## IoC 詳情

- **Domain**：townquiver.xyz
- **用途**：Unknown Loader（OffLoader）惡意程式 C2 域名
- **標籤**：OffLoader

## 惡意程式說明

Unknown Loader（OffLoader）是一款下載器型惡意程式，用於從 C2 伺服器拉取並執行後續惡意酬載。此類惡意程式通常作為多階段攻擊的第一階段載具。

## 封鎖建議

- 封鎖對域名 townquiver.xyz 的 DNS 解析及連線
- 監控內部 DNS 查詢日誌是否有此域名出現
- 搜尋端點是否存在 OffLoader 相關 IoC

## 來源

- [ThreatFox #1756588](https://threatfox.abuse.ch/ioc/1756588/)
