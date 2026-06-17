# EvilTokens: A phishing attack that doesn't steal your password

| 項目 | 內容 |
|------|------|
| **日期** | 2026-06-17 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

EvilTokens 是一款網路釣魚即服務（PhaaS）工具包，透過濫用 OAuth 2.0 設備授權流程竊取 Microsoft 365 帳號，無需竊取密碼。

## 事實內容

EvilTokens 是一款專門入侵 Microsoft 365 帳號的網路釣魚即服務（PhaaS）工具包，透過濫用 OAuth 2.0 設備授權授予流程（device authorization grant flow）運作。由於攻擊依賴設備代碼網路釣魚（device code phishing），因此不需要製作真實登入頁面的仿冒品，受害者反而在真實的 Microsoft 登入頁面完成合法的身份驗證流程，包括雙因素驗證（2FA）。

該工具包自 2026 年 2 月起透過 Telegram 頻道宣傳，並已被發現用於實際攻擊。2026 年 3 月，一次針對多個國家超過 340 個組織的帳號接管和商業電子郵件詐騙（BEC）攻擊活動中使用了此工具包。微軟也描述了一個 AI 賦能的攻擊活動，使用動態設備代碼生成和客製化誘餌來提高 EvilTokens 攻擊的成功率。

- 攻擊手法：OAuth 2.0 設備代碼網路釣魚（Device Code Phishing）
- 目標：Microsoft 365 帳號
- 受影響範圍：2026 年 3 月活動涉及多個國家超過 340 個組織

## 受影響系統

- Microsoft 365
- Microsoft Azure AD（支援設備代碼授權流程的組織）

## 來源連結

- [EvilTokens: A phishing attack that doesn't steal your password](https://www.welivesecurity.com/en/cybercrime/eviltokens-phishing-doesnt-steal-password/)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
