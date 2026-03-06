# QuantLoader / XWorm 惡意程式雜湊指標（2026-03-03）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | payload |
| **惡意程式家族** | QuantLoader, XWorm |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 高（confidence_level: 95%） |

## 威脅描述

2026-03-03 UTC 由研究人員 Grim 提交 QuantLoader 及 XWorm 惡意程式的雜湊指標，各含兩個不同樣本（每樣本三種雜湊）。QuantLoader 為下載器（Downloader），用於分發次要 payload。XWorm 為多功能 RAT，支援 C2 通訊、鍵盤紀錄、勒索軟體模組。ThreatFox ID：1757469–1757477。

## IoC 指標

### QuantLoader（樣本 A）

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| md5_hash | `16f325fb9ba51287f83f893ff0638a7d` | 1757477 |
| sha256_hash | `b75dc565e8102e579c1a6f8272280e9727347666f98f6d163c68d5a714131bbc` | 1757476 |
| sha1_hash | `6a3f294368bfd6ffd2c3a83fe5296b99d22ff465` | 1757475 |

### QuantLoader（樣本 B）

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| md5_hash | `d28a0ba347b26cf5a4051918ff94f482` | 1757474 |
| sha256_hash | `5f24edd66b3d3d956016c8172546e0186b0008bb16a338290a9e0aaf11fd3cff` | 1757473 |
| sha1_hash | `9f90f541e2b46deb317297bc569ce39ef00a5999` | 1757472 |

### XWorm

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| md5_hash | `ed22eea89ee3207e18847b0110e9c124` | 1757471 |
| sha256_hash | `a874812d5f6518587a09b679236e71a2555702fb99458400613626651dc83f3b` | 1757470 |
| sha1_hash | `351774e894c603bd12e23791d626cb11b522d215` | 1757469 |

## 關聯分析

- QuantLoader 兩個不同樣本顯示此下載器有多個版本/變種在流通。
- QuantLoader 常與 FormBook、Remcos 等次要 payload 搭配使用，是惡意程式分發鏈的中間環節。
- XWorm 雜湊與批次 039 中發現的 XWorm C2（194.87.54.114:6666、1.230.16.57:5050）可能關聯。

## 來源連結

- [abuse.ch ThreatFox QuantLoader](https://threatfox.abuse.ch/ioc/1757477/)
- [abuse.ch ThreatFox XWorm](https://threatfox.abuse.ch/ioc/1757471/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
