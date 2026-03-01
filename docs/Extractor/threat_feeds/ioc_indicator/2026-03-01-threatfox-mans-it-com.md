# AsyncRAT C2 Domain: mans.it.com

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-01 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet |
| **惡意程式家族** | AsyncRAT |
| **狀態** | online |
| **威脅等級** | 高 |
| **信心水準** | 100% |

## 威脅描述

abuse.ch ThreatFox 於 2026-03-01 回報此域名為 AsyncRAT 殭屍網路的指揮控制（C2）域名。由研究員 DonPasci 通過 Triage 沙盒動態分析確認，標籤包含 asyncrat、C2、domain、rat、triage。此域名使用 .it.com 後綴，最後確認時間為 2026-03-01 19:00:13 UTC，顯示在回報時仍為活躍狀態。

觀測時間：
- 首次發現：2026-03-01 18:00:57 UTC
- 最後確認：2026-03-01 19:00:13 UTC

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `mans.it.com` |

## 關聯分析

此域名與同一研究員（DonPasci）回報的 5.83.128.112:3333（ID: 1756457）和 5.83.128.112:4444（ID: 1756456）屬不同 Triage 分析報告（260301-tl5p4sbw9h vs 260301-sd558sfv8c），但均為 AsyncRAT C2 基礎設施，可能屬同一攻擊者或相關威脅組織的不同攻擊活動。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756455/)
- [Triage 分析報告](https://tria.ge/260301-tl5p4sbw9h)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox ID:1756455
