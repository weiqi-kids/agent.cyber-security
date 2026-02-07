# IoC 指標 - Cobalt Strike C2 URL

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-06 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet_cc |
| **惡意程式家族** | Cobalt Strike |
| **狀態** | active |
| **威脅等級** | High |
| **信心水準** | 中 (75%) |

## 威脅描述

此 URL 已被 ThreatFox 標記為 Cobalt Strike 殭屍網路的指揮與控制（C2）通訊端點。Cobalt Strike 是一種合法的滲透測試工具,但經常被威脅行為者濫用於惡意活動,包括網路間諜、資料竊取和勒索軟體部署。

該 IoC 與 Cobalt Strike BEACON 植入程式相關,惡意程式別名包括 Agentemis、BEACON、CobaltStrike、cobeacon。信心水準為 75%,首次發現時間為 2026 年 2 月 6 日 09:16:02 UTC。

此 IoC 可能與已遭入侵的基礎設施有關,建議在防火牆和網路安全設備上封鎖此 URL,並監控內部網路是否有與該端點的通訊記錄。

標籤: cobaltstrike

## IoC 指標

| 類型 | 值 |
|------|-----|
| URL | `hxxp://110.44.126.45:50443/KXEu` |

## 關聯分析

該 URL 與 MalwareBazaar 上的樣本 3d8d0c15272b1c4f73a22af7599aad7c34b7c7bbff4030f11e8e15a1999b176f 相關聯,顯示此 C2 基礎設施正在被主動使用。

## 來源連結

- [abuse.ch ThreatFox](hxxps://threatfox.abuse.ch/)
- [參考來源](hxxps://bazaar.abuse.ch/sample/3d8d0c15272b1c4f73a22af7599aad7c34b7c7bbff4030f11e8e15a1999b176f/)

---
> 萃取時間：2026-02-06T10:30:00Z
> 資料來源：abuse.ch ThreatFox
