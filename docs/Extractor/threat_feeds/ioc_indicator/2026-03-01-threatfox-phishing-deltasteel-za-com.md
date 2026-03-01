# AsyncRAT C2 Domain: phishing.deltasteel.za.com

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

abuse.ch ThreatFox 於 2026-03-01 回報此域名為 AsyncRAT 殭屍網路的指揮控制（C2）域名。此域名極為特殊，其子域名明確標示為 "phishing"（phishing.deltasteel.za.com），公然使用欺詐性名稱作為 C2 端點，搭配模仿南非鋼鐵公司的 deltasteel.za.com 父域名。由研究員 DonPasci 通過 Triage 沙盒動態分析確認，標籤包含 asyncrat、C2、domain、rat、triage。

觀測時間：
- 首次發現：2026-03-01 18:00:55 UTC
- 最後確認：2026-03-01 19:00:11 UTC

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `phishing.deltasteel.za.com` |
| 父域名 | `deltasteel.za.com` |

## 關聯分析

此域名與 malware.deltasteel.za.com（ID: 1756453）共用相同父域名 deltasteel.za.com，同屬一個 Triage 分析報告（260301-ts4rdsct4c）和相同回報者（DonPasci）。攻擊者使用 "phishing" 和 "malware" 等明確描述性子域名，顯示這是攻擊者自控基礎設施（非入侵合法網站），且對安全研究社群的偵測能力不加掩飾。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756454/)
- [Triage 分析報告](https://tria.ge/260301-ts4rdsct4c)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox ID:1756454
