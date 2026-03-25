# IPv4 Mapped IPv6 Addresses Used to Obfuscate Attacks

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-17 |
| **來源** | SANS ISC |
| **分類** | industry_trend |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

攻擊者利用 IPv4 映射的 IPv6 位址（RFC 4038）混淆攻擊來源，繞過以 IPv4 為基礎的過濾與偵測機制。

## 事實內容

- 攻擊者使用 IPv4 映射的 IPv6 位址（格式如 `::ffff:192.0.2.1`）進行攻擊
- 此技術定義於 RFC 4038，是合法的網路協定功能
- 部分安全工具若僅解析 IPv4 格式，可能無法正確識別此類位址
- 可用於規避 IP 黑名單、防火牆規則及入侵偵測系統（IDS）
- 此手法適用於支援雙協定棧（dual-stack）的系統環境

## 受影響系統

- 雙協定棧（IPv4/IPv6）網路環境
- 以 IPv4 格式為主的防火牆與 IDS/IPS 系統
- Web 應用程式防火牆（WAF）

## 來源連結

- [IPv4 Mapped IPv6 Addresses, (Tue, Mar 17th)](https://isc.sans.edu/diary/rss/32804)

---
> 萃取時間：2026-03-22 UTC
> 資料來源：SANS ISC sans-isc
