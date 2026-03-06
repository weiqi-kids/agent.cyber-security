# Meterpreter / Sliver / Hook / SectopRAT C2 指標（2026-03-03）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet_cc |
| **惡意程式家族** | Meterpreter, Sliver, Hook (Hookbot), SectopRAT |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

2026-03-03 UTC 發現多個滲透測試框架與進階木馬的 C2 指標。Meterpreter（Metasploit）及 Sliver 為常見 red team / APT 工具，Hook 為 Android 銀行木馬，SectopRAT（ArechClient）為 .NET 開發的資訊竊取 RAT。均由 DonPasci 透過 Censys 偵測回報。ThreatFox ID 範圍：1757570–1757580。

## IoC 指標

### Meterpreter（Metasploit）

| 類型 | 值 | ASN | ThreatFox ID |
|------|-----|-----|--------------|
| ip:port | `3.113.26.115:38423` | AS16509 (Amazon) | 1757580 |
| ip:port | `3.113.26.115:14773` | AS16509 (Amazon) | 1757579 |
| ip:port | `51.16.49.54:47001` | AS16509 (Amazon) | 1757578 |
| ip:port | `51.16.49.54:11101` | AS16509 (Amazon) | 1757577 |

### Covenant（未知惡意程式）

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| ip:port | `63.179.100.153:7443` | 1757576 |

### Sliver

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| ip:port | `89.44.9.85:12696` | 1757570 |

### Hook (Android RAT)

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| ip:port | `185.196.11.203:8089` | 1757573 |

### SectopRAT (ArechClient)

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| ip:port | `89.124.85.4:9000` | 1757572 |

## 關聯分析

- `3.113.26.115` 及 `51.16.49.54` 均在 Amazon AWS（AS16509）上，兩個 IP 各監聽兩個不同端口，顯示同一主機部署多個 Meterpreter listener。
- Covenant 為另一個 .NET 滲透測試框架，標籤 `Covenant` 由 Censys 識別特徵檢測。
- Sliver 為 Go 語言開發的開源 C2 框架，近年被 APT 組織採用。
- Hook（AS42624，SWISSNETWORK02）為進階 Android 銀行木馬，支援 RAT 功能。
- SectopRAT（AS216071，VDSINA）主要竊取瀏覽器憑證及加密貨幣錢包資料。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1757580/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
