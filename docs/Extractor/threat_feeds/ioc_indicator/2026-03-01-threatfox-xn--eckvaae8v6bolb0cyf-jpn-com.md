# AsyncRAT C2 Domain: xn--eckvaae8v6bolb0cyf.jpn.com

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

abuse.ch ThreatFox 於 2026-03-01 回報此域名為 AsyncRAT 殭屍網路指揮控制（C2）域名。此域名使用長型 Punycode 編碼（xn-- 前綴）搭配 .jpn.com 後綴，由研究員 dyingbreeds_ 通過 Triage 沙盒動態分析確認，屬於第二組 AsyncRAT 活動集群（Triage 報告 260301-xeglgset7g）。長型 Punycode 字串更難以手動分析，具有更強的混淆效果。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain (Punycode) | `xn--eckvaae8v6bolb0cyf.jpn.com` |

## 關聯分析

此域名與 xn--vcktcwa4eh.jpn.com 共同使用 Punycode 編碼和 .jpn.com 後綴，屬於同一 Triage 分析報告（260301-xeglgset7g）集群。兩個 Punycode 域名的使用顯示攻擊者可能針對能處理 IDN（國際化域名）的受害系統，或旨在規避基於 ASCII 的安全工具偵測。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756467/)
- [Triage 分析報告](https://tria.ge/260301-xeglgset7g)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox ID:1756467
