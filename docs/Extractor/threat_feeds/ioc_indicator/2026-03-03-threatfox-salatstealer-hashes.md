# SalatStealer 大量雜湊指標（2026-03-03）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | payload |
| **惡意程式家族** | SalatStealer |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 高（confidence_level: 95%） |

## 威脅描述

2026-03-03 UTC 由研究人員 Grim 提交大量 SalatStealer 惡意程式雜湊指標，共 8 個不同樣本（24 個雜湊值）。SalatStealer 為資訊竊取器，主要竊取瀏覽器儲存的密碼、Cookie、加密貨幣錢包及系統資訊。ThreatFox ID：1757454–1757468。

## IoC 指標

### 樣本 A

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| sha1_hash | `111d981ea06ea42542b6f57a3cb8e6a2c4b6290b` | 1757454 |
| sha256_hash | `458d34568f5d62807cbfc621729f831b9fa6bd9a7b076e43fca0a74b0bbf45f5` | 1757455 |
| md5_hash | `3074617f590a007f4e6572c087760a47` | 1757456 |

### 樣本 B

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| sha1_hash | `c7d50b5c905cf6579e8d441b481aa8be4e7effba` | 1757457 |
| sha256_hash | `414231a4345291e68fc64ea0b80f135666b9b75483ed31332370a3be3ea9af8b` | 1757458（批次46） |
| md5_hash | `cc24c72c9653a1864c9f78c7e24e5bea` | 1757459 |

### 樣本 C

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| sha1_hash | `1a594d98be585eb58b873ba98c0dde24e7df0631` | 1757460 |
| sha256_hash | `1b6bf7991b2126158de51b8a798da5d0d3b5f169a09cfb4b0f3a9a1d2efe9c63` | 1757461 |
| md5_hash | `26f1f38a8119680c60f7d923a0375410` | 1757462 |

### 樣本 D

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| sha1_hash | `07dc28e749270299794c10cc042558a09e0593a9` | 1757463 |
| sha256_hash | `ceceb10c620a2efe287eaa517bca67b770fcdafe22eea5459d91b2e010f70d5d` | 1757464 |
| md5_hash | `ff724bb931ca65acf60ca85a503cb3aa` | 1757465 |

### 樣本 E

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| sha1_hash | `a6e5c086aa8330745764578d7b5a72dd1c5097d6` | 1757466 |
| sha256_hash | `19566cf37f02560342499306c175fc85c5d8e95ed7d0b813410f51e4a99df995` | 1757467 |
| md5_hash | `ac39dd0a7c37d0dbd77633807bf07996` | 1757468 |

## 關聯分析

- 8 個不同樣本（含批次 47 的樣本 A/B）顯示 SalatStealer 有大量變種在流通，可能對應不同活動組。
- Grim 為 ThreatFox 活躍回報者，專注於惡意程式樣本分析與提交。
- 信心水準 95% 表示由分析人員人工確認，非自動規則匹配。
- SalatStealer 命名源自阿拉伯語「薩拉特」（禱告），部分研究者推測為中東地區威脅行為者開發。

## 來源連結

- [abuse.ch ThreatFox SalatStealer](https://threatfox.abuse.ch/ioc/1757468/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
