---
title: "ThreatFox IoC: DarkComet C2 Domain anonymous5334.duckdns.org"
source: abuse.ch ThreatFox
source_id: threatfox-recent
category: ioc_indicator
threat_type: botnet
malware_family: DarkComet
malware_alias: "Breut, Fynloski, klovbot"
ioc_type: domain
ioc_value: "anonymous5334.duckdns.org"
threat_level: Medium
confidence: 中
first_seen: "2026-03-02T08:14:36Z"
last_seen: null
reporter: juroots
tags:
  - c2
  - darkcomet
is_compromised: false
threatfox_id: "1756591"
---

# ThreatFox IoC: DarkComet C2 Domain anonymous5334.duckdns.org

## 基本資訊

| 欄位 | 值 |
|------|----|
| IoC 類型 | domain |
| IoC 值 | anonymous5334.duckdns.org |
| 威脅類型 | botnet（C2 通訊） |
| 惡意程式家族 | DarkComet |
| 別名 | Breut, Fynloski, klovbot |
| 威脅等級 | Medium |
| 可信度 | 中（50%） |
| 首次發現 | 2026-03-02 08:14:36 UTC |
| 最後發現 | — |
| 回報者 | juroots |
| ThreatFox ID | 1756591 |

## IoC 詳情

- **Domain**：anonymous5334.duckdns.org
- **用途**：DarkComet 惡意程式 C2（Command & Control）域名
- **動態 DNS**：使用 DuckDNS 動態域名服務（常見於低成本惡意程式基礎設施）
- **標籤**：c2, darkcomet

## 惡意程式說明

DarkComet 是一款老牌遠端存取木馬（RAT），具備完整的遠端控制功能，包含鍵盤記錄、攝影機存取、文件管理及密碼竊取等功能。雖然開發已終止，但仍被低技術攻擊者廣泛使用。

## 封鎖建議

- 封鎖對域名 anonymous5334.duckdns.org 的 DNS 解析及連線
- 監控 DuckDNS（duckdns.org）子域名的非預期連線
- 搜尋端點是否存在 DarkComet 相關 IoC

## 來源

- [ThreatFox #1756591](https://threatfox.abuse.ch/ioc/1756591/)
