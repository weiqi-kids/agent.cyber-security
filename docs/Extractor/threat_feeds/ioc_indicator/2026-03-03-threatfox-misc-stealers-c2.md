# 雜項竊取器及未知惡意程式 C2 指標（2026-03-03）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet_cc |
| **惡意程式家族** | Unknown Stealer, Floridamovietheaters MacSync, VShell, Unknown Covenant |
| **狀態** | unknown |
| **威脅等級** | Medium |
| **信心水準** | 高 |

## 威脅描述

2026-03-03 UTC 發現多個雜項竊取器及未識別惡意程式的 C2 指標。包含：Unknown Stealer（solostalking 回報）、floridamovietheaters.com（MacSync Stealer，針對 macOS）、VShell C2 及 techcross-wne.com（已知惡意 URL）。ThreatFox ID：1757277、1757499、1757592、1757596。

## IoC 指標

### Unknown Stealer

| 類型 | 值 | 回報者 | ThreatFox ID |
|------|-----|--------|--------------|
| ip:port | `178.16.54.80:3000` | solostalking | 1757596 |

### MacSync Stealer (macOS)

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| domain | `floridamovietheaters.com` | 1757592 |

### VShell C2

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| ip:port | `170.64.238.23:32561` | 1757499 |

### 已知惡意 URL（已脫敏）

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| url | `hxxps://techcross-wne.com/include/plugin/snoopy/board/register.php` | 1757277 |

## 關聯分析

- `floridamovietheaters.com` 標籤含 `c2,domain,macsync,stealer`，為針對 macOS 的竊取器 C2，由 DonPasci 回報。
- VShell（170.64.238.23，AS14061 DigitalOcean）由 VirusTotal 分析確認：`hxxps://www.virustotal.com/gui/file/437e0ff815bab1fefe8e4594774e9faa9aadc6821a824731db7e778c864748ce`
- `techcross-wne.com` 的 PHP 路徑（`/include/plugin/snoopy/board/register.php`）顯示可能利用已知 CMS 漏洞或後門。MalwareBazaar 樣本：`hxxps://bazaar.abuse.ch/sample/47cc83176cd36abf0b5624f33bcf044b8f880cf521689981f891e52fbb3dbfa3/`

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1757596/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
