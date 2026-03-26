# URLhaus: Malicious URL - cl2point.sunnode.in.net

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-26 |
| **來源** | abuse.ch URLhaus |
| **分類** | malicious_url |
| **威脅類型** | malware_download |
| **惡意程式家族** | ACRStealer, ClearFake |
| **狀態** | online |
| **威脅等級** | 高 |
| **信心水準** | 高 |

## 威脅描述

此 URL 被識別為惡意軟體下載來源，關聯至 ACRStealer 與 ClearFake 惡意程式家族。URL 路徑 `/verification.google` 為 ClearFake 手法，偽裝成 Google 合法驗證服務，誘使不知情使用者執行惡意腳本，最終部署 ACRStealer 竊取憑證、Cookie、加密貨幣資產等。該 URL 於 2026-03-26 被通報，狀態仍為 online。

## IoC 指標

| 類型 | 值 |
|------|-----|
| url | `hxxps://cl2point.sunnode.in.net/verification.google` |
| domain | `cl2point.sunnode.in.net` |
| urlhaus_id | `3805182` |

## 關聯分析

cl2point.sunnode.in.net 為 sunnode.in.net 攻擊基礎設施的子域名之一，與 cl4path、cl3view、cl1proc 等子域名共同構成 ACRStealer/ClearFake 分發網路。此類多子域名模式可能用於繞過單一域名封鎖。

## 來源連結

- [abuse.ch URLhaus](https://urlhaus.abuse.ch/)
- [URLhaus 詳細頁面](https://urlhaus.abuse.ch/url/3805182/)

---
> 萃取時間：2026-03-26 UTC
> 資料來源：abuse.ch URLhaus urlhaus-recent
