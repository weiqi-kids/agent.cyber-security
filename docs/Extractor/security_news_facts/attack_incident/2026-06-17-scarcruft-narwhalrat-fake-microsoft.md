# Fake Microsoft Alerts Used to Deploy North Korean NarwhalRAT Malware

| 項目 | 內容 |
|------|------|
| **日期** | 2026-06-17 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

北韓國家支持的 APT37（ScarCruft）使用仿冒 Microsoft 帳號安全通知的魚叉式網路釣魚郵件投遞 NarwhalRAT 惡意軟體。

## 事實內容

北韓國家支持的駭客組織 ScarCruft（又名 APT37）被觀察到使用仿冒 Microsoft 帳號安全通知的魚叉式網路釣魚郵件，投遞名為 NarwhalRAT 的惡意軟體。

Genians Security Center（GSC）分析指出：
- 攻擊郵件仿冒 MS 帳號安全警報
- 聲稱帳號存在異常活動，包括重複產生一次性密碼（OTP），並偽裝成第三方試圖網路釣魚目標的 Microsoft 帳號
- 目的是製造緊迫感，誘使受害者執行附件
- 郵件正文指示收件人參考附件中的諮詢文件
- 實際附件並非 HWP（韓文文字處理器）文件，而是包含惡意 LNK 檔案的 ZIP 壓縮檔

攻擊手法利用社交工程讓受害者將郵件誤認為合法安全警報，最終執行惡意載荷 NarwhalRAT。

- 威脅行為者：ScarCruft / APT37（北韓國家支持）
- 惡意軟體：NarwhalRAT
- 攻擊手法：魚叉式網路釣魚 + 偽造安全通知 + 惡意 LNK 檔案

## 受影響系統

- Microsoft 帳號使用者（特別是韓國相關目標）
- Windows 系統（LNK 檔案感染向量）

## 來源連結

- [Fake Microsoft Alerts Used to Deploy North Korean NarwhalRAT Malware](https://thehackernews.com/2026/06/fake-microsoft-alerts-used-to-deploy.html)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
