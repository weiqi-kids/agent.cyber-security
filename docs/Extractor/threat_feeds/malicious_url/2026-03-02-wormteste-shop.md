# URLhaus: Malicious URL (wormteste.shop)

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
URLhaus 偵測到一個惡意 URL，位於 wormteste.shop，用於 malware_download 活動。疑似散布偽裝為 PNG 的惡意 MSI 安裝檔（optimized_MSI.png）。域名命名（wormteste）具有高度惡意特徵。

## IoC 指標
| 類型 | 值 |
|------|-----|
| url | `hxxp://wormteste.shop/optimized_MSI.png` |
| host | wormteste.shop |
| path | /optimized_MSI.png |

## 關聯分析
標籤：無
reporter: JAMESWT_WT

## 來源連結
- [URLhaus](hxxps://urlhaus.abuse.ch/url/3788375/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch URLhaus urlhaus-recent
