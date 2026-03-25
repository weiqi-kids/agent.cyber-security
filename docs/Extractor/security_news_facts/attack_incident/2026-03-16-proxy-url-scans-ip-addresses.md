# /proxy/ URL Scans with IP Addresses

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-16 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 低 |
| **信心水準** | 高 |

## 摘要

攻擊者透過掃描 `/proxy/` URL 路徑尋找開放代理伺服器，此類掃描是蜜罐偵測到的最常見活動之一。

## 事實內容

- SANS ISC 蜜罐偵測到大量針對 `/proxy/` URL 路徑的掃描行為
- 攻擊者嘗試發現暴露在網際網路上的代理伺服器（proxy servers）
- 開放代理伺服器常被濫用於匿名化惡意流量、繞過地理限制或發動後續攻擊
- 掃描模式包含攜帶 IP 位址的請求，試圖探測代理轉發功能
- 此類掃描在 SANS ISC 蜜罐中屬最常見偵測項目之一

## 受影響系統

- 暴露於網際網路的代理伺服器
- 配置不當的 Web 伺服器（含代理模組）
- Nginx、Apache 等含反向代理配置的伺服器

## 來源連結

- [/proxy/ URL scans with IP addresses, (Mon, Mar 16th)](https://isc.sans.edu/diary/rss/32800)

---
> 萃取時間：2026-03-22 UTC
> 資料來源：SANS ISC sans-isc
