---
title: "ThreatFox IoC: Cobalt Strike C2 1.94.186.19:8888"
source: abuse.ch ThreatFox
source_id: threatfox-recent
category: ioc_indicator
threat_type: botnet
malware_family: Cobalt Strike
malware_alias: "Agentemis, BEACON, CobaltStrike, cobeacon"
ioc_type: ip:port
ioc_value: "1.94.186.19:8888"
threat_level: High
confidence: 高
first_seen: "2026-03-02T07:28:44Z"
last_seen: null
reporter: abuse_ch
tags:
  - CobaltStrike
  - cs-watermark-987654321
is_compromised: false
threatfox_id: "1756578"
---

# ThreatFox IoC: Cobalt Strike C2 1.94.186.19:8888

## 基本資訊

| 欄位 | 值 |
|------|----|
| IoC 類型 | ip:port |
| IoC 值 | 1.94.186.19:8888 |
| 威脅類型 | botnet（C2 通訊） |
| 惡意程式家族 | Cobalt Strike（BEACON） |
| 威脅等級 | High |
| 可信度 | 高（100%） |
| 首次發現 | 2026-03-02 07:28:44 UTC |
| 最後發現 | — |
| 回報者 | abuse_ch |
| ThreatFox ID | 1756578 |

## IoC 詳情

- **IP:Port**：1.94.186.19:8888
- **用途**：Cobalt Strike Beacon C2（Command & Control）伺服器
- **通訊埠**：8888（非標準埠）
- **Watermark**：987654321（與 #1756579、#1756580 共用，顯示同一 Cobalt Strike 授權或設定檔）
- **標籤**：CobaltStrike, cs-watermark-987654321

## 惡意程式說明

Cobalt Strike 是一款滲透測試工具，但其 Beacon 後門被 APT 組織及勒索軟體攻擊者廣泛濫用作為 C2 框架。Watermark 987654321 為盜版或洩露版本的常見識別標記，顯示攻擊者使用未授權副本。

## 相關 IoC（同 Watermark 群組）

此 IoC 與以下 IP 共用相同 Watermark（987654321）：
- 150.241.73.11:443（ThreatFox #1756579）
- 59.110.166.104:4444（ThreatFox #1756580）

## 封鎖建議

- 封鎖對 1.94.186.19:8888 的連線
- 監控 Cobalt Strike Beacon 特徵流量
- 搜尋端點是否存在 Cobalt Strike 植入程式（stageless/staged Beacon）
- 使用 Watermark 987654321 進行全面掃描

## 來源

- [ThreatFox #1756578](https://threatfox.abuse.ch/ioc/1756578/)
