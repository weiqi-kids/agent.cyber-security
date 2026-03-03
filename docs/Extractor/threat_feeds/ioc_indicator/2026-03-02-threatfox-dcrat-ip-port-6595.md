---
title: "ThreatFox IoC: DCRat C2 104.21.63.144:6060"
source: abuse.ch ThreatFox
source_id: threatfox-recent
category: ioc_indicator
threat_type: botnet
malware_family: DCRat
malware_alias: DarkCrystal RAT
ioc_type: ip:port
ioc_value: "104.21.63.144:6060"
threat_level: Medium
confidence: 中
first_seen: "2026-03-02T08:15:18Z"
last_seen: null
reporter: juroots
tags:
  - c2
  - dcrat
is_compromised: false
threatfox_id: "1756595"
---

# ThreatFox IoC: DCRat C2 104.21.63.144:6060

## 基本資訊

| 欄位 | 值 |
|------|----|
| IoC 類型 | ip:port |
| IoC 值 | 104.21.63.144:6060 |
| 威脅類型 | botnet（C2 通訊） |
| 惡意程式家族 | DCRat（DarkCrystal RAT） |
| 威脅等級 | Medium |
| 可信度 | 中（50%） |
| 首次發現 | 2026-03-02 08:15:18 UTC |
| 最後發現 | — |
| 回報者 | juroots |
| ThreatFox ID | 1756595 |

## IoC 詳情

- **IP:Port**：104.21.63.144:6060
- **用途**：DCRat 惡意程式 C2（Command & Control）伺服器
- **標籤**：c2, dcrat

## 惡意程式說明

DCRat（DarkCrystal RAT）是一款功能完整的遠端存取木馬，具備鍵盤記錄、螢幕截圖、憑證竊取及遠端指令執行等功能，常透過釣魚郵件或惡意文件傳播。

## 封鎖建議

- 封鎖對 104.21.63.144:6060 的連線
- 注意：此 IP 亦與 port 4782 相關聯（ThreatFox #1756594）
- 監控內部主機是否對此 IP 發起連線請求
- 搜尋端點是否存在 DCRat 相關 IoC

## 來源

- [ThreatFox #1756595](https://threatfox.abuse.ch/ioc/1756595/)
