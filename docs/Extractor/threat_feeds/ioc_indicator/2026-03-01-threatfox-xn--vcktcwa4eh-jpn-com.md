# AsyncRAT C2 Domain: xn--vcktcwa4eh.jpn.com

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-01 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet |
| **惡意程式家族** | AsyncRAT |
| **狀態** | unknown |
| **威脅等級** | 高 |
| **信心水準** | 100% |

## 威脅描述

abuse.ch ThreatFox 於 2026-03-01 回報此域名為 AsyncRAT 殭屍網路指揮控制（C2）域名。此域名使用 Punycode 編碼（xn-- 前綴）表示非 ASCII 字符，搭配 .jpn.com 後綴，由研究員 dyingbreeds_ 通過 Triage 沙盒分析確認，屬同一 AsyncRAT 活動集群（Triage 報告 260301-xeglgset7g）。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain (Punycode) | `xn--vcktcwa4eh.jpn.com` |

## 關聯分析

此域名屬於 Triage 分析報告（260301-xeglgset7g）同一 AsyncRAT 活動集群，與 zx88.de.com、ax88.day、kcj.uk.com、mushroomgummies.us.com、xn--eckvaae8v6bolb0cyf.jpn.com 等 C2 域名相關。攻擊者使用 Punycode 編碼域名可能是為了規避基於字串的偵測規則。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756468/)
- [Triage 分析報告](https://tria.ge/260301-xeglgset7g)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox ID:1756468
