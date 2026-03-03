---
title: "ThreatFox IoC: Cobalt Strike C2 180.76.111.89:80"
source: abuse.ch ThreatFox
source_id: threatfox-recent
category: ioc_indicator
threat_type: botnet
malware_family: Cobalt Strike
malware_alias: "Agentemis, BEACON, CobaltStrike, cobeacon"
ioc_type: ip:port
ioc_value: "180.76.111.89:80"
threat_level: High
confidence: 高
first_seen: "2026-03-02T07:28:43Z"
last_seen: null
reporter: abuse_ch
tags:
  - CobaltStrike
  - cs-watermark-666666666
is_compromised: false
threatfox_id: "1756577"
---

# ThreatFox IoC: Cobalt Strike C2 180.76.111.89:80

## 基本資訊

| 欄位 | 值 |
|------|----|
| IoC 類型 | ip:port |
| IoC 值 | 180.76.111.89:80 |
| 威脅類型 | botnet（C2 通訊） |
| 惡意程式家族 | Cobalt Strike（BEACON） |
| 威脅等級 | High |
| 可信度 | 高（100%） |
| 首次發現 | 2026-03-02 07:28:43 UTC |
| 最後發現 | — |
| 回報者 | abuse_ch |
| ThreatFox ID | 1756577 |

## IoC 詳情

- **IP:Port**：180.76.111.89:80
- **用途**：Cobalt Strike Beacon C2（Command & Control）伺服器
- **通訊埠**：80（HTTP，偽裝正常 Web 流量）
- **Watermark**：666666666（與 Watermark 987654321 群組不同，顯示獨立的攻擊基礎設施）
- **標籤**：CobaltStrike, cs-watermark-666666666

## 惡意程式說明

Cobalt Strike 是一款滲透測試工具，但其 Beacon 後門被 APT 組織及勒索軟體攻擊者廣泛濫用作為 C2 框架。Watermark 666666666 為另一盜版或洩露版本識別標記，顯示與同批次其他 Cobalt Strike IoC（#1756577-1756580）屬不同攻擊者或活動。

## 封鎖建議

- 封鎖對 180.76.111.89:80 的連線
- 注意：此 C2 使用 HTTP（Port 80），可能偽裝成正常網頁流量，需深度封包檢測
- 監控 Cobalt Strike Beacon 特徵流量（HTTP Malleable C2 Profile）
- 搜尋端點是否存在 Cobalt Strike 植入程式（stageless/staged Beacon）
- 使用 Watermark 666666666 進行全面掃描

## 來源

- [ThreatFox #1756577](https://threatfox.abuse.ch/ioc/1756577/)
