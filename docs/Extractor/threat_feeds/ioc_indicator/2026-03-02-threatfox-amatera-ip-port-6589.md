---
title: "ThreatFox IoC: Amatera Stealer C2 185.121.235.118:443"
source: abuse.ch ThreatFox
source_id: threatfox-recent
category: ioc_indicator
threat_type: botnet
malware_family: Amatera
malware_alias: AmateraStealer
ioc_type: ip:port
ioc_value: "185.121.235.118:443"
threat_level: High
confidence: 高
first_seen: "2026-03-02T07:54:45Z"
last_seen: null
reporter: abuse_ch
tags:
  - AmateraStealer
is_compromised: false
threatfox_id: "1756589"
reference: "hxxps://bazaar.abuse.ch/sample/5775367d227515a556a10cb29fe0272509911b26699f3c59681cae9bc3886d03/"
---

# ThreatFox IoC: Amatera Stealer C2 185.121.235.118:443

## 基本資訊

| 欄位 | 值 |
|------|----|
| IoC 類型 | ip:port |
| IoC 值 | 185.121.235.118:443 |
| 威脅類型 | botnet（C2 通訊） |
| 惡意程式家族 | Amatera（AmateraStealer） |
| 威脅等級 | High |
| 可信度 | 高（75%） |
| 首次發現 | 2026-03-02 07:54:45 UTC |
| 最後發現 | — |
| 回報者 | abuse_ch |
| ThreatFox ID | 1756589 |

## IoC 詳情

- **IP:Port**：185.121.235.118:443
- **用途**：Amatera 資訊竊取程式 C2（Command & Control）伺服器
- **通訊埠**：443（HTTPS，偽裝正常 TLS 流量）
- **標籤**：AmateraStealer

## 惡意程式說明

AmateraStealer 是一款新興資訊竊取惡意程式，目標為瀏覽器儲存的憑證、加密貨幣錢包及敏感文件，透過 C2 伺服器回傳竊取資料。

## 參考資料

- 惡意程式樣本：hxxps://bazaar.abuse.ch/sample/5775367d227515a556a10cb29fe0272509911b26699f3c59681cae9bc3886d03/

## 封鎖建議

- 封鎖對 185.121.235.118:443 的連線
- 監控 443 埠的非預期外部連線（可能偽裝為 HTTPS）
- 搜尋端點是否存在 AmateraStealer 相關 IoC

## 來源

- [ThreatFox #1756589](https://threatfox.abuse.ch/ioc/1756589/)
