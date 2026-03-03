---
title: "ThreatFox IoC: ClearFake Payload Delivery Domain 20t2lqnx.grosstable.digital"
source: abuse.ch ThreatFox
source_id: threatfox-recent
category: ioc_indicator
threat_type: malware
malware_family: ClearFake
ioc_type: domain
ioc_value: "20t2lqnx.grosstable.digital"
threat_level: High
confidence: 高
first_seen: "2026-03-02T07:30:00Z"
last_seen: null
reporter: ttakvam
tags:
  - clearfake
is_compromised: false
threatfox_id: "1756582"
---

# ThreatFox IoC: ClearFake Payload Delivery Domain 20t2lqnx.grosstable.digital

## 基本資訊

| 欄位 | 值 |
|------|----|
| IoC 類型 | domain |
| IoC 值 | 20t2lqnx.grosstable.digital |
| 威脅類型 | malware（Payload 投遞） |
| 惡意程式家族 | ClearFake |
| 威脅等級 | High |
| 可信度 | 高（100%） |
| 首次發現 | 2026-03-02 07:30:00 UTC |
| 最後發現 | — |
| 回報者 | ttakvam（匿名） |
| ThreatFox ID | 1756582 |

## IoC 詳情

- **Domain**：20t2lqnx.grosstable.digital
- **用途**：ClearFake 惡意程式酬載投遞域名
- **基礎設施**：使用 grosstable.digital 子域名（與 #1756581 共用父域）
- **標籤**：clearfake

## 惡意程式說明

ClearFake 是一種瀏覽器更新假冒（Fake Browser Update）社交工程攻擊框架，透過入侵合法網站植入惡意 JavaScript，偽裝為瀏覽器更新提示，誘使使用者下載執行惡意程式（通常為資訊竊取程式如 Lumma Stealer、RedLine 等）。

## 封鎖建議

- 封鎖對域名 20t2lqnx.grosstable.digital 及父域 grosstable.digital 的 DNS 解析
- 監控偽裝瀏覽器更新的社交工程攻擊
- 搜尋端點是否有不明 PowerShell 或 JavaScript 執行記錄

## 來源

- [ThreatFox #1756582](https://threatfox.abuse.ch/ioc/1756582/)
