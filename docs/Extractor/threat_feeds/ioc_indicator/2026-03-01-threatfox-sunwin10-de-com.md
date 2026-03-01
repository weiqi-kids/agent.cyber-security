# AsyncRAT C2 Domain: sunwin10.de.com

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

abuse.ch ThreatFox 於 2026-03-01 回報此域名為 AsyncRAT 殭屍網路指揮控制（C2）域名。AsyncRAT 是一款廣泛使用的遠端存取木馬（RAT），主要針對 Windows 系統，可執行遠端控制、鍵盤記錄、螢幕截圖等惡意行為。此域名由研究員 dyingbreeds_ 通過 Triage 沙盒分析確認，與同一批次多個 AsyncRAT C2 域名相關聯。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `sunwin10.de.com` |

## 關聯分析

此域名與同一 Triage 分析報告（260301-xbnkmad12f）中的多個 AsyncRAT C2 域名相關：
- doll.us.com (ID: 1756470)
- fryd.us.com (ID: 1756471)
- in2it.uk.com (ID: 1756472)
- lima.us.com (ID: 1756473)
- n188.best (ID: 1756474)

所有域名均由同一報告員 dyingbreeds_ 提交，信心水準均為 100%，屬同一 AsyncRAT 惡意活動集群。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756475/)
- [Triage 分析報告](https://tria.ge/260301-xbnkmad12f)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox ID:1756475
