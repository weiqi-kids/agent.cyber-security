---
title: "ThreatFox IoC: DCRat C2 Domain km-ok365.site"
source: abuse.ch ThreatFox
source_id: threatfox-recent
category: ioc_indicator
threat_type: botnet
malware_family: DCRat
malware_alias: DarkCrystal RAT
ioc_type: domain
ioc_value: "km-ok365.site"
threat_level: Medium
confidence: 中
first_seen: "2026-03-02T08:14:58Z"
last_seen: null
reporter: juroots
tags:
  - c2
  - dcrat
is_compromised: false
threatfox_id: "1756593"
---

# ThreatFox IoC: DCRat C2 Domain km-ok365.site

## 基本資訊

| 欄位 | 值 |
|------|----|
| IoC 類型 | domain |
| IoC 值 | km-ok365.site |
| 威脅類型 | botnet（C2 通訊） |
| 惡意程式家族 | DCRat（DarkCrystal RAT） |
| 威脅等級 | Medium |
| 可信度 | 中（50%） |
| 首次發現 | 2026-03-02 08:14:58 UTC |
| 最後發現 | — |
| 回報者 | juroots |
| ThreatFox ID | 1756593 |

## IoC 詳情

- **Domain**：km-ok365.site
- **用途**：DCRat 惡意程式 C2（Command & Control）域名
- **標籤**：c2, dcrat

## 惡意程式說明

DCRat（DarkCrystal RAT）是一款功能完整的遠端存取木馬，具備鍵盤記錄、螢幕截圖、憑證竊取及遠端指令執行等功能，常透過釣魚郵件或惡意文件傳播。

## 封鎖建議

- 封鎖對域名 km-ok365.site 的 DNS 解析及連線
- 監控內部 DNS 查詢日誌是否有此域名出現
- 搜尋端點是否存在 DCRat 相關 IoC

## 來源

- [ThreatFox #1756593](https://threatfox.abuse.ch/ioc/1756593/)
