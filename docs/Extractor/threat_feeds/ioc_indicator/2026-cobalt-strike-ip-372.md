# ThreatFox IoC 指標 - Cobalt Strike

## 基本資訊

| 欄位 | 內容 |
|------|------|
| **IoC 類型** | ip |
| **IoC 值** | `156.234.71.16:4037` |
| **惡意軟體家族** | Cobalt Strike |
| **威脅類型** | botnet_cc |
| **信心水準** | 100% |
| **首次發現** | 2026-01-25 |
| **來源** | abuse.ch ThreatFox |
| **標籤** | AS138415,C2,censys |

## 威脅描述

此 IoC 指標於 2026-01-25 由 abuse.ch ThreatFox 收錄，與惡意軟體家族 Cobalt Strike 相關聯。威脅類型識別為 botnet_cc，信心水準為 100%。

## IoC 指標

### IP
```
156.234.71.16:4037
```

### 惡意軟體資訊
- **惡意軟體**: win.cobalt_strike
- **別名**: Agentemis,BEACON,CobaltStrike,cobeacon
- **威脅類型**: botnet_cc

## 關聯分析

此 IoC 已被識別為可疑但未確認為受害主機。建議加入防護規則進行攔截監控。

信心水準 100% 表示此指標具有高度可信度。

## 來源連結

- [參考連結](https://search.censys.io/hosts/156.234.71.16)
- 資料來源: abuse.ch ThreatFox

---

**時間戳記**: 2026-01-27 14:06:23
**來源 ID**: threatfox-recent
**分類**: ioc_indicator
