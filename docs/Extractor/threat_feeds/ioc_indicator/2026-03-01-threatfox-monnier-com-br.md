# StrelaStealer Payload Delivery Domain: monnier.com.br

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-01 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | other |
| **惡意程式家族** | StrelaStealer |
| **狀態** | unknown |
| **威脅等級** | 高 |
| **信心水準** | 100% |

## 威脅描述

abuse.ch ThreatFox 於 2026-03-01 回報此巴西域名（.com.br）為 StrelaStealer 惡意程式的 payload 投遞域名。此域名標記為已遭入侵（is_compromised: true），是此批 StrelaStealer 活動中最早被回報的域名（18:23 UTC），由研究員 threatcat_ch 回報。StrelaStealer 以電子郵件用戶端（Outlook/Thunderbird）憑證竊取著稱，常見於商業電子郵件攻擊場景。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `monnier.com.br` |

## 關聯分析

此域名為 StrelaStealer 活動集群（回報者：threatcat_ch）中最早被提交的域名，時間為 2026-03-01 18:23 UTC，隨後在約 30 分鐘內陸續回報了 monokerka.com（18:32）、monom.cc（18:40）、montagnaitalia.it（18:48）、montagne-emotion.fr（18:51）。遍布巴西、法國、義大利等不同國家的合法網站遭入侵，顯示攻擊者具有廣泛的初始存取能力。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756458/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox ID:1756458
