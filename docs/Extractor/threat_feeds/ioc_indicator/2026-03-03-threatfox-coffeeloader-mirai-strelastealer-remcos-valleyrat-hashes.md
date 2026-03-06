# CoffeeLoader / Mirai / StrelaStealer / Remcos / ValleyRAT 雜湊指標（2026-03-03）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | payload |
| **惡意程式家族** | CoffeeLoader, Mirai, StrelaStealer, Remcos, ValleyRAT (Winos) |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 高（confidence_level: 95%） |

## 威脅描述

2026-03-03 UTC 由研究人員 Grim 提交多個惡意程式家族的雜湊指標，涵蓋 CoffeeLoader（下載器）、Mirai（IoT 殭屍網路）、StrelaStealer（憑證竊取）、Remcos RAT 及 ValleyRAT（Winos，遊戲平台相關 RAT）。ThreatFox ID：1757438–1757453。

## IoC 指標

### CoffeeLoader

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| md5_hash | `2825162eb8738e9adbe32773619eb634` | 1757453 |
| sha256_hash | `0dd2c3aed88099df279f0f86ed2aea8cbd378ebebd553fde9760131ab157c34d` | 1757452 |
| sha1_hash | `c3aaf78e5e4fdf00340f8f8937afce0358e5f918` | 1757451 |

### Mirai（樣本 A）

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| md5_hash | `6c7dc8d90ecbbf30ac991bde84c2ceb0` | 1757450 |
| sha256_hash | `e23f8ba7bf289df08075b13c8957fa5d89583ed7d4e7cb52d14fe95b64143c2e` | 1757449 |
| sha1_hash | `c031ca5b18ddfe763f7d471b5100882e08fe3072` | 1757448 |

### StrelaStealer

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| md5_hash | `73a8e38f92a174ba34c711226da24291` | 1757447 |
| sha256_hash | `c671c87dce61b1596076ea91342f1a6f353913596154a9b3cb2a3d39e35bfd79` | 1757446 |
| sha1_hash | `ff8e52d4625a62c79d437303402ba031c8363409` | 1757445 |

### Remcos

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| md5_hash | `49efd867be8b4c8337d2064b6c3749d5` | 1757444 |
| sha256_hash | `0f1425848b9b390461924a03c4c9bac804cf1f9694ea66469d3222b730a816b5` | 1757443 |
| sha1_hash | `a9cbc113409fca4bc5a635cb69f587d6cf986525` | 1757442 |

### Mirai（樣本 B）

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| md5_hash | `b8e0ea374aafc4fc9196a13ad2b0e3d7` | 1757441 |
| sha256_hash | `c76590bd3c27c485dac2c5fd4c3c2cbee803e2b963e6a272323a9f88cbfc773e` | 1757440 |
| sha1_hash | `238447ccf96b6ce0e61e96afee15e3562c27bc43` | 1757439 |

### ValleyRAT (Winos)

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| md5_hash | `80cfb32b29b00d05415b4990da151da7` | 1757438 |

## 關聯分析

- **CoffeeLoader**：2024 年底發現的新型下載器，透過代碼混淆逃避靜態分析，常作為 Cobalt Strike 的前置 loader。
- **Mirai 兩個樣本**：Mirai 標記為 `win.mirai`（非 `elf.mirai`），可能為 Windows 版本或交叉編譯樣本。
- **StrelaStealer 雜湊**：與批次 039 中發現的 StrelaStealer 域名 IoC 相關聯，為同一 campaign 的不同面向。
- **ValleyRAT (Winos)**：近年針對中文遊戲社群的 RAT，ValleyRAT（僅 MD5，無完整三組雜湊）可能為最新樣本，尚未完整分析。
- **Remcos 雜湊**：與批次 045 中的 Remcos C2（belaijobackup1/2.com，209.90.234.55）可能為同一 campaign。

## 來源連結

- [abuse.ch ThreatFox CoffeeLoader](https://threatfox.abuse.ch/ioc/1757453/)
- [abuse.ch ThreatFox ValleyRAT](https://threatfox.abuse.ch/ioc/1757438/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
