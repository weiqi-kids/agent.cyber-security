# URLhaus: Malicious URL - cl3view.sunnode.in.net

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

此 URL 被識別為惡意軟體下載來源，關聯至 ACRStealer 與 ClearFake 惡意程式家族。該 URL 偽裝成 Google 驗證頁面（verification.google 路徑），為 ClearFake 社交工程手法的典型特徵，誘使用戶執行惡意程式碼以部署 ACRStealer 資訊竊取器。該 URL 於 2026-03-26 被通報，狀態仍為 online。

## IoC 指標

| 類型 | 值 |
|------|-----|
| url | `hxxps://cl3view.sunnode.in.net/verification.google` |
| domain | `cl3view.sunnode.in.net` |
| urlhaus_id | `3805186` |

## 關聯分析

cl3view.sunnode.in.net 為同一攻擊基礎設施的子域名，與 cl4path、cl2point、cl1proc 等子域名同屬 sunnode.in.net 網域，顯示攻擊者使用大量動態子域名進行 ACRStealer/ClearFake 分發活動。

## 來源連結

- [abuse.ch URLhaus](https://urlhaus.abuse.ch/)
- [URLhaus 詳細頁面](https://urlhaus.abuse.ch/url/3805186/)

---
> 萃取時間：2026-03-26 UTC
> 資料來源：abuse.ch URLhaus urlhaus-recent
