# Malicious Script Delivering More Maliciousness

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-04 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

惡意附件包含批次腳本，部署 Chrome Injector 竊取資料，腳本源自 GitHub 專案的分支版本。

## 事實內容

安全研究人員收到一封帶有惡意附件的電子郵件。自動掃描結果顯示這是一個惡意腳本，用於建立 Chrome Injector 以竊取資料。雖然 InfoStealers（資訊竊取程式）是當前的常見威脅，但此樣本有所不同。

該 .bat 批次檔案看起來是許多 GitHub 存儲庫中找到的腳本的分支版本。攻擊者利用現有的開源工具或程式碼，修改後用於惡意目的。這種做法降低了攻擊者的開發成本，同時增加了檢測難度。

此攻擊針對 Chrome 瀏覽器用戶，透過注入程式碼竊取瀏覽器中的敏感資料，如登入憑證、Cookie、表單資料等。

## 受影響系統

- Chrome 瀏覽器用戶
- Windows 系統

## 來源連結

- [Malicious Script Delivering More Maliciousness, (Wed, Feb 4th)](https://isc.sans.edu/diary/rss/32682)

---
> 萃取時間：2026-02-08 17:30 UTC
> 資料來源：SANS ISC sans-isc
