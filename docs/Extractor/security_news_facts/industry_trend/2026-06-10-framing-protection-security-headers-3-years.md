# How has use of framing protection security headers changed in the past 3 years?

| 項目 | 內容 |
|------|------|
| **日期** | 2026-06-10 |
| **來源** | SANS ISC |
| **分類** | industry_trend |
| **嚴重程度** | 低 |
| **信心水準** | 高 |

## 摘要

SANS ISC 分析三年間網站採用 X-Frame-Options 與 CSP frame-ancestors 防護標頭的趨勢，Top 1M 網域覆蓋率從 14.4% 成長至 29.7%，但多數主流網域仍無此保護。

## 事實內容

SANS ISC 研究員 Jan Kopriva 於 2026-06-10 發布分析，重複 2023 年的研究，比對 Tranco 百萬熱門網域在過去三年內採用防框架點擊劫持（framing protection）安全標頭的變化趨勢。

**統計數據（2023 vs 2026）**：

| 範圍 | 2023 覆蓋率 | 2026 覆蓋率 | 變化 |
|------|------------|------------|------|
| Top 1,000,000 | 14.4% | 29.7% | +15.3pp |
| Top 100,000 | 20.6% | 37.4% | +16.8pp |
| Top 1,000 | 27.1% | 23.1% | -4.0pp（下降） |

**CSP frame-ancestors 成長**：
- Top 1,000,000：從 1.9% 成長至 7.1%
- Top 100,000：從 3.8% 成長至 7.9%（超過一倍）

**X-Frame-Options 使用情況**：
- SAMEORIGIN 仍為最常見設定
- DENY 指令略有增加
- ALLOW-FROM 使用率可忽略

**安全意涵**：防框架保護標頭可防範「覆蓋釣魚」攻擊（攻擊者在 iframe 中載入合法網站並疊加假登入頁面）。儘管整體有所進步，但多數熱門網域仍未採用此防護，用戶仍面臨相關風險。

## 受影響系統

- 所有未設定 X-Frame-Options 或 CSP frame-ancestors 的網站
- 使用主流瀏覽器的終端用戶

## 來源連結

- [How has use of framing protection security headers changed in the past 3 years?](https://isc.sans.edu/diary/rss/33068)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：SANS ISC sans-isc
