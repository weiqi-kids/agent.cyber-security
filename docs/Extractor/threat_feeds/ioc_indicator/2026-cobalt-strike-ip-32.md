# ThreatFox IoC 指標 - Cobalt Strike

## 基本資訊

| 欄位 | 內容 |
|------|------|
| **IoC 類型** | ip |
| **IoC 值** | `106.12.219.245:8072` |
| **惡意軟體家族** | Cobalt Strike |
| **威脅類型** | botnet_cc |
| **信心水準** | 75% |
| **首次發現** | 2026-01-27 |
| **來源** | abuse.ch ThreatFox |
| **標籤** | CobaltStrike,drb-ra |

## 威脅描述

此 IoC 指標於 2026-01-27 由 abuse.ch ThreatFox 收錄，與惡意軟體家族 Cobalt Strike 相關聯。威脅類型識別為 botnet_cc，信心水準為 75%。

## IoC 指標

### IP
```
106.12.219.245:8072
```

### 惡意軟體資訊
- **惡意軟體**: win.cobalt_strike
- **別名**: Agentemis,BEACON,CobaltStrike,cobeacon
- **威脅類型**: botnet_cc

## 關聯分析

此 IoC 已被識別為可疑但未確認為受害主機。建議加入防護規則進行攔截監控。

信心水準 75% 表示此指標具有高度可信度。

## 來源連結

- 無參考連結
- 資料來源: abuse.ch ThreatFox

---

**時間戳記**: 2026-01-27 14:06:23
**來源 ID**: threatfox-recent
**分類**: ioc_indicator
