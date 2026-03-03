# URLhaus: Malicious URL (2ts-engineering.by)

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
URLhaus 偵測到一個惡意 URL，位於 2ts-engineering.by（白俄羅斯 .by 域名），用於 malware_download 活動。URL 包含 cfcw_captcha_page 參數，疑似使用 CAPTCHA 頁面繞過自動掃描。

## IoC 指標
| 類型 | 值 |
|------|-----|
| url | `hxxps://2ts-engineering.by/?cfcw_captcha_page=1` |
| host | 2ts-engineering.by |

## 關聯分析
標籤：無
reporter: SanchoZZ

## 來源連結
- [URLhaus](hxxps://urlhaus.abuse.ch/url/3788373/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch URLhaus urlhaus-recent
