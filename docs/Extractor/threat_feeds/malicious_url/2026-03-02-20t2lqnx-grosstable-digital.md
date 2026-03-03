# URLhaus: Malicious URL (20t2lqnx.grosstable.digital)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-02 |
| **來源** | abuse.ch URLhaus |
| **分類** | malicious_url |
| **威脅類型** | malware |
| **惡意程式家族** | ClearFake |
| **狀態** | offline |
| **威脅等級** | Medium |
| **信心水準** | 高 |

## 威脅描述
URLhaus 偵測到一個惡意 URL，位於 20t2lqnx.grosstable.digital，屬於 ClearFake 惡意廣告活動。ClearFake 是一種假冒瀏覽器更新頁面的社交工程攻擊，誘使使用者下載惡意程式。URL 包含 check 及隨機參數（actmn=iGiakZrubIPGLzie）用於識別目標，與同一活動的其他域名（immunizeoot.digital）使用相同 URL 結構。

## IoC 指標
| 類型 | 值 |
|------|-----|
| url | `hxxps://20t2lqnx.grosstable.digital/?=check&&actmn=iGiakZrubIPGLzie` |
| host | 20t2lqnx.grosstable.digital |
| domain | grosstable.digital |

## 關聯分析
標籤：ClearFake
reporter: anonymous
相關網域：immunizeoot.digital（同一 ClearFake 活動，ID: 3788371）

## 來源連結
- [URLhaus](hxxps://urlhaus.abuse.ch/url/3788361/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch URLhaus urlhaus-recent
