# URLhaus: Malicious URL - cl1proc.sunnode.in.net

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

此 URL 被識別為惡意軟體下載來源，關聯至 ACRStealer 與 ClearFake 惡意程式家族。cl1proc.sunnode.in.net 為 sunnode.in.net 攻擊基礎設施的最早通報子域名（2026-03-26 02:25:10 UTC），整個 cl[N]*.sunnode.in.net 系列在短時間內相繼被通報，顯示攻擊者正在快速輪換或部署多個分發節點。

## IoC 指標

| 類型 | 值 |
|------|-----|
| url | `hxxps://cl1proc.sunnode.in.net/verification.google` |
| domain | `cl1proc.sunnode.in.net` |
| urlhaus_id | `3805178` |

## 關聯分析

sunnode.in.net 攻擊活動時間線（UTC）：
- 02:25 — cl1proc（本條目）
- 02:31 — cl2point
- 02:38 — cl3view
- 02:44 — cl4path

此序列顯示攻擊者依序啟用多個 ClearFake/ACRStealer 分發節點，可能為自動化部署或手動輪換規避偵測。建議封鎖整個 sunnode.in.net 父域名。

## 來源連結

- [abuse.ch URLhaus](https://urlhaus.abuse.ch/)
- [URLhaus 詳細頁面](https://urlhaus.abuse.ch/url/3805178/)

---
> 萃取時間：2026-03-26 UTC
> 資料來源：abuse.ch URLhaus urlhaus-recent
