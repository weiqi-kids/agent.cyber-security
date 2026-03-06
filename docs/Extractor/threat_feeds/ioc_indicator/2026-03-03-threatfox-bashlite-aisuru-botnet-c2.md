# Bashlite (Gafgyt) / Aisuru IoT 殭屍網路 C2 指標（2026-03-03）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet_cc |
| **惡意程式家族** | Bashlite (Gafgyt), Aisuru |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 高（Aisuru）/ 中（Bashlite） |

## 威脅描述

2026-03-03 UTC 發現 Bashlite（別名 Gafgyt、QBOT）及 Aisuru IoT DDoS 殭屍網路的 C2 指標。Bashlite 是最早的 Linux IoT 殭屍網路之一，專門針對路由器和 IP 攝影機。Aisuru 為較新的 IoT 殭屍網路，由 Bitsight 回報，Bashlite 由 abuse.ch 分析樣本關聯確認。ThreatFox ID：1757485–1757498。

## IoC 指標

### Aisuru 殭屍網路

| 類型 | 值 | 狀態（ThreatFox last_seen） | 信心 | ThreatFox ID |
|------|-----|---------------------------|------|--------------|
| ip:port | `89.106.65.100:9035` | 2026-03-03 18:53 UTC（活躍） | 100% | 1757485 |

### Bashlite (Gafgyt)

| 類型 | 值 | 信心 | ThreatFox ID |
|------|-----|------|--------------|
| domain | `asteriaproject.dstat.click` | 100% | 1757498 |
| ip:port | `91.92.242.13:35342` | 75% | 1757497 |
| ip:port | `212.118.43.167:7777` | 75% | 1757496 |

### 其他 C2（未知惡意程式）

| 類型 | 值 | 回報者 | ThreatFox ID |
|------|-----|--------|--------------|
| domain | `jkoyz.tollabemakki.info` | burger | 1757494 |

## 關聯分析

- Aisuru C2（89.106.65.100:9035）的 `last_seen_utc` 為 2026-03-03 18:53 UTC，確認當天仍活躍。
- Bashlite 三個 C2 均由相同 MalwareBazaar 樣本（`a3a0dcd8d8a9bc8a4172589724f2969cafdb7942ab83f23f918338e7f8df9e2a`）關聯確認。
- `asteriaproject.dstat.click` 使用 `.click` 域名，`dstat` 可能與 DDoS 狀態監控相關。
- `jkoyz.tollabemakki.info` 由 MalwareBazaar 樣本（`c5cbcc786d5f4c5a53611f9c1738bdeaa3e76e0aa91f459438f79b099d5d7064`）關聯。
- MalwareBazaar 樣本：`hxxps://bazaar.abuse.ch/sample/a3a0dcd8d8a9bc8a4172589724f2969cafdb7942ab83f23f918338e7f8df9e2a/`

## 來源連結

- [abuse.ch ThreatFox Aisuru](https://threatfox.abuse.ch/ioc/1757485/)
- [abuse.ch ThreatFox Bashlite](https://threatfox.abuse.ch/ioc/1757498/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
