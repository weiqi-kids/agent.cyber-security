# URLhaus: Malicious URL - cl4path.sunnode.in.net

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

此 URL 被識別為惡意軟體下載來源，關聯至 ACRStealer 與 ClearFake 惡意程式家族。ACRStealer 為資訊竊取器（Infostealer），專門竊取瀏覽器憑證、加密貨幣錢包及其他敏感資料。ClearFake 為偽裝成 Google 驗證頁面的惡意頁面，常用於社交工程攻擊以誘使用戶下載惡意程式。該 URL 於 2026-03-26 被通報，狀態仍為 online。

## IoC 指標

| 類型 | 值 |
|------|-----|
| url | `hxxps://cl4path.sunnode.in.net/verification.google` |
| domain | `cl4path.sunnode.in.net` |
| urlhaus_id | `3805189` |

## 關聯分析

ACRStealer 為近年活躍的資訊竊取器，常透過 ClearFake 偽裝成合法網站驗證頁面進行分發。sunnode.in.net 子域名疑似為攻擊者控制的基礎設施，用於托管多個惡意 URL（見同批通報的 cl3view、cl2point、cl1proc 等子域名）。

## 來源連結

- [abuse.ch URLhaus](https://urlhaus.abuse.ch/)
- [URLhaus 詳細頁面](https://urlhaus.abuse.ch/url/3805189/)

---
> 萃取時間：2026-03-26 UTC
> 資料來源：abuse.ch URLhaus urlhaus-recent
