# IntelMQ 3.0.2 improves the performance of high-load data collection

| 項目 | 內容 |
|------|------|
| **日期** | 2021-09-13 |
| **來源** | CERT.at (Austria) |
| **分類** | industry_trend |
| **嚴重程度** | 低 |
| **信心水準** | 高 |

## 摘要

IntelMQ 3.0.2 修復了高負載資料收集元件的兩個效能問題，該版本已於 2021-09-10 發布。

## 事實內容

CERT.at 發布 IntelMQ 3.0.2，修復了 3.0.1 版本後使用者回報的效能問題。經調查，兩個根本原因均源自 IntelMQ 3.0 核心的複雜重構：(1) 高負載下的串流資料收集器效能下降；(2) 使用執行緒的收集器（API collector、STOMP collector）受到影響。一般串流或少量大型報告不受影響。新版本已於 2021-09-10（週五）發布，可透過 GitHub、PyPI、deb/rpm 套件庫及 DockerHub 取得。此工作為 CERT.at 的 2020-AT-IA-0254 計畫的一部分。

## 受影響系統

- IntelMQ 3.0.x（高負載收集器元件）
- IntelMQ API collector
- IntelMQ STOMP collector

## 來源連結

- [IntelMQ 3.0.2 improves the performance of high-load data collection](https://www.cert.at/en/blog/2021/9/intelmq-302-improves-the-performance-of-high-load-data-collection)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：CERT.at (Austria) cert-at
