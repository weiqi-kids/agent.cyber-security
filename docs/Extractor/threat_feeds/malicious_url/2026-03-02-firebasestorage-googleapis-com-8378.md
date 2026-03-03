# URLhaus: Malicious URL (firebasestorage.googleapis.com)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-02 |
| **來源** | abuse.ch URLhaus |
| **分類** | malicious_url |
| **威脅類型** | malware |
| **惡意程式家族** | Unknown |
| **狀態** | offline |
| **威脅等級** | Medium |
| **信心水準** | 高 |

## 威脅描述
URLhaus 偵測到一個惡意 URL，位於 firebasestorage.googleapis.com，用於 malware_download 活動。疑似透過 Firebase 雲端儲存服務散布偽裝為 PNG 的惡意 MSI 安裝檔（MSI_PRO_with_b64.png）。

## IoC 指標
| 類型 | 值 |
|------|-----|
| url | `hxxps://firebasestorage.googleapis.com/v0/b/tropa-14f0e.appspot.com/o/MSI_PRO_with_b64.png?alt=media&token=e0e091d3-b9b4-4781-a64c-44688f073ae4` |
| host | firebasestorage.googleapis.com |
| path | /v0/b/tropa-14f0e.appspot.com/o/MSI_PRO_with_b64.png |

## 關聯分析
標籤：無
reporter: JAMESWT_WT

## 來源連結
- [URLhaus](hxxps://urlhaus.abuse.ch/url/3788378/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch URLhaus urlhaus-recent
