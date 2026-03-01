# AsyncRAT C2 Domain: mushroomgummies.us.com

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

abuse.ch ThreatFox 於 2026-03-01 回報此域名為 AsyncRAT 殭屍網路指揮控制（C2）域名。此域名偽裝成消費性商品（蘑菇軟糖）網站，使用 .us.com 後綴，由研究員 dyingbreeds_ 通過 Triage 沙盒動態分析確認，屬於第二組 AsyncRAT 活動集群（Triage 報告 260301-xeglgset7g）。攻擊者使用看似合法的消費品域名可能是為了規避人工審查。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `mushroomgummies.us.com` |

## 關聯分析

此域名屬於 Triage 分析報告（260301-xeglgset7g）同一 AsyncRAT 活動集群。相較於其他使用短暫無意義字串的域名（如 ax88.day、zx88.de.com），此域名使用消費品名稱偽裝，顯示攻擊者有意混淆分析人員視線。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756466/)
- [Triage 分析報告](https://tria.ge/260301-xeglgset7g)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox ID:1756466
