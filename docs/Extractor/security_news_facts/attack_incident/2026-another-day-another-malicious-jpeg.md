# Another day, another malicious JPEG

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-23 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | medium |
| **信心水準** | high |

## 摘要
惡意軟體活動使用 JPEG 檔案嵌入惡意 payload，延續近期攻擊手法。

## 事實內容
SANS ISC 分析師在客戶的電子郵件代理伺服器攔截的惡意軟體樣本中，發現使用 JPEG 圖片嵌入惡意 payload 的攻擊手法。此技術與近期 Xavier 研究員報告的「MSI image」攻擊活動相同，顯示攻擊者持續利用此技術進行惡意軟體散播。

此攻擊活動的特徵：
- 利用電子郵件作為初始入侵管道
- 下載偽裝為 JPEG 的檔案
- JPEG 檔案中嵌入可執行的惡意 payload
- 與先前報告的活動使用相同技術

## 來源連結
- [Another day, another malicious JPEG](https://isc.sans.edu/diary/rss/32738)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：SANS ISC sans-isc
