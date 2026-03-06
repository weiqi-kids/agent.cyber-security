# SpyNote (Android) / Amatera Stealer C2 指標（2026-03-03）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet_cc |
| **惡意程式家族** | SpyNote, Amatera Stealer |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 高（SpyNote）/ 中（Amatera） |

## 威脅描述

2026-03-03 UTC 發現 SpyNote Android 木馬及 Amatera Stealer 的 C2 指標。SpyNote（別名 CypherRat）為功能完整的 Android RAT，支援麥克風/相機竊聽、GPS 追蹤及簡訊攔截。Amatera Stealer 為 Windows 資訊竊取器。SpyNote 由 Triage 沙箱分析確認，Amatera 由 MalwareBazaar 樣本關聯。ThreatFox ID：1757598、1757606、1757493。

## IoC 指標

### SpyNote (CypherRat)

| 類型 | 值 | 信心 | ThreatFox ID |
|------|-----|------|--------------|
| ip:port | `102.217.238.0:5214` | 100% | 1757606 |

### Amatera Stealer

| 類型 | 值 | 信心 | ThreatFox ID |
|------|-----|------|--------------|
| ip:port | `89.124.82.121:443` | 75% | 1757598 |
| ip:port | `144.124.235.102:443` | 75% | 1757493 |

## 關聯分析

- SpyNote C2（102.217.238.0，AS138915）標籤含 `android`，確認為 Android 平台目標。
- Triage 分析連結：`hxxps://tria.ge/260303-rd357sat3x`
- Amatera Stealer 兩個 C2 均使用 HTTPS 端口（443），信心 75%（由 MalwareBazaar 樣本關聯推斷）。
- MalwareBazaar 樣本連結：`hxxps://bazaar.abuse.ch/sample/ecf674e913f5fd7429886d419978470bb2f0d7832225dc51d98aa79c5f62c3d5/`

## 來源連結

- [abuse.ch ThreatFox SpyNote](https://threatfox.abuse.ch/ioc/1757606/)
- [abuse.ch ThreatFox Amatera](https://threatfox.abuse.ch/ioc/1757598/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
