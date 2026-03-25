# Scans for Adminer Web Database Management Tool

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-18 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

攻擊者針對 Adminer 網頁資料庫管理工具發動掃描，與常見的 phpMyAdmin 掃描並列為蜜罐偵測到的最熱門攻擊目標。

## 事實內容

- SANS ISC 蜜罐偵測到針對 Adminer 的大量掃描活動
- phpMyAdmin 一向是攻擊者掃描最熱門目標之一，Adminer 同樣受到高度關注
- Adminer 是一款單一 PHP 檔案的資料庫管理工具，支援 MySQL、PostgreSQL、SQLite 等
- 攻擊者透過掃描尋找未受保護或預設部署的 Adminer 實例
- 成功存取 Adminer 可讓攻擊者讀取、修改或刪除資料庫資料

## 受影響系統

- 暴露於網際網路的 Adminer 實例
- 暴露於網際網路的 phpMyAdmin 實例
- 執行 PHP 的網頁伺服器

## 來源連結

- [Scans for adminer, (Wed, Mar 18th)](https://isc.sans.edu/diary/rss/32808)

---
> 萃取時間：2026-03-22 UTC
> 資料來源：SANS ISC sans-isc
