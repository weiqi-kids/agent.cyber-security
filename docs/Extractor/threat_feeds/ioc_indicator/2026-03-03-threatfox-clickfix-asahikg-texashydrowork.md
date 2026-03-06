# ClickFix 活動：asahikg.co / texashydrowork.com 域名及 URL 指標

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | payload_delivery |
| **惡意程式家族** | Unknown（ClickFix） |
| **狀態** | unknown |
| **威脅等級** | Medium |
| **信心水準** | 高 |

## 威脅描述

2026-03-03 UTC 發現 ClickFix 社交工程活動使用的兩個主要域名及其惡意 URL。ClickFix 透過偽造「驗證碼」或「修復」頁面，誘使使用者複製貼上惡意命令執行。由研究人員 HuntYethHounds 回報。ThreatFox ID：1757585–1757591。

## IoC 指標

### 域名

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| domain | `asahikg.co` | 1757585 |
| domain | `texashydrowork.com` | 1757586 |

### 惡意 URL（已脫敏）

| 類型 | 值（脫敏） | ThreatFox ID |
|------|-----|--------------|
| url | `hxxps://asahikg.co/nw/js/min.js` | 1757587 |
| url | `hxxps://asahikg.co/nw/config/config.js` | 1757588 |
| url | `hxxps://asahikg.co/nw/js/loader.js` | 1757589 |
| url | `hxxps://texashydrowork.com/YkU5C7Eb` | 1757590 |
| url | `hxxps://texashydrowork.com/YkU5C7Eb?s=2&p=1` | 1757591 |

## 關聯分析

- `asahikg.co` 提供三個 JavaScript 文件（`min.js`、`config.js`、`loader.js`），為完整 ClickFix 框架部署。
- `texashydrowork.com` 的隨機路徑（`YkU5C7Eb`）搭配參數（`?s=2&p=1`）顯示可能有追蹤/分流功能。
- 標籤 `ClickFix` 確認為社交工程攻擊活動。
- 惡意程式家族標記為 `unknown`，表示最終 payload 尚未明確識別。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1757585/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
