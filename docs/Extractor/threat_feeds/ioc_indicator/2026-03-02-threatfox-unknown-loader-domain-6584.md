---
title: "ThreatFox IoC: Unknown Loader C2 Domain gunbear.xyz"
source: abuse.ch ThreatFox
source_id: threatfox-recent
category: ioc_indicator
threat_type: botnet
malware_family: Unknown Loader
ioc_type: domain
ioc_value: "gunbear.xyz"
threat_level: High
confidence: 高
first_seen: "2026-03-02T07:45:21Z"
last_seen: null
reporter: abuse_ch
tags:
  - OffLoader
is_compromised: false
threatfox_id: "1756584"
---

# ThreatFox IoC: Unknown Loader C2 Domain gunbear.xyz

## 基本資訊

| 欄位 | 值 |
|------|----|
| IoC 類型 | domain |
| IoC 值 | gunbear.xyz |
| 威脅類型 | botnet（C2 通訊） |
| 惡意程式家族 | Unknown Loader |
| 威脅等級 | High |
| 可信度 | 高（100%） |
| 首次發現 | 2026-03-02 07:45:21 UTC |
| 最後發現 | — |
| 回報者 | abuse_ch |
| ThreatFox ID | 1756584 |

## IoC 詳情

- **Domain**：gunbear.xyz
- **用途**：Unknown Loader（OffLoader）惡意程式 C2 域名
- **標籤**：OffLoader

## 惡意程式說明

Unknown Loader（OffLoader）是一款下載器型惡意程式，用於從 C2 伺服器拉取並執行後續惡意酬載。此域名與多個 OffLoader C2 域名同時出現（passengerbrake.space、bagcare.space、birthdaymagic.xyz、townquiver.xyz），顯示可能為同一基礎設施。

## 封鎖建議

- 封鎖對域名 gunbear.xyz 的 DNS 解析及連線
- 監控內部 DNS 查詢日誌是否有此域名出現
- 搜尋端點是否存在 OffLoader 相關 IoC
- 建議一併封鎖相關 OffLoader 域名群組

## 來源

- [ThreatFox #1756584](https://threatfox.abuse.ch/ioc/1756584/)
