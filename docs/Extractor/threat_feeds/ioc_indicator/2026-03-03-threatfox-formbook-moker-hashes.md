# Formbook / Moker 惡意程式雜湊指標（2026-03-03）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | payload |
| **惡意程式家族** | Formbook (XLoader), Moker |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 高（confidence_level: 95%） |

## 威脅描述

2026-03-03 UTC 由研究人員 Grim 提交 Formbook（別名 win.xloader）及 Moker 惡意程式的雜湊指標。Formbook/XLoader 為廣泛使用的表單竊取器（Form Grabber），能竊取登入憑證、鍵盤紀錄及螢幕截圖。Moker 為鮮為人知的進階 RAT，具備強大的持久化及逃避機制。ThreatFox ID：1757478–1757483。

## IoC 指標

### Formbook (XLoader)

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| md5_hash | `4ef033bc6262a87752a2c4fa9af179d2` | 1757483 |
| sha256_hash | `8406e19b242c41f5556732b329901830c70d46840daa2f499b19aea02bc42f58` | 1757482 |
| sha1_hash | `73cf80e53a072e9a2aadf20883c5a4e98f92ecb6` | 1757481 |

### Moker

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| md5_hash | `cf1c554e93a371e7ef74e5390dd2ba39` | 1757480 |
| sha256_hash | `2414141dd238daf74d27e7c3395bf35e506071d1dd948d0a5553123dd4f10a05` | 1757479 |
| sha1_hash | `ee4b69c7be2c152f968e7a6ac3f003d79bc03fb9` | 1757478 |

## 關聯分析

- Formbook/XLoader 三個雜湊值（MD5/SHA256/SHA1）對應同一惡意程式樣本。
- Moker 為高度專業化 RAT，具備 bypassing 沙箱分析的特性，歷史上被用於 APT 活動。
- 信心水準 95% 表示由分析人員直接確認，非僅基於規則匹配。

## 來源連結

- [abuse.ch ThreatFox Formbook](https://threatfox.abuse.ch/ioc/1757483/)
- [abuse.ch ThreatFox Moker](https://threatfox.abuse.ch/ioc/1757480/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
