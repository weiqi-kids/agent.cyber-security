# 機密早已外洩！GitHub Actions 成內鬼溫床，寫入權限竟等同全權存取！

| 項目 | 內容 |
|------|------|
| **日期** | 2025-07-28 |
| **來源** | TWCERT/CC |
| **分類** | other |
| **嚴重程度** | 低 |
| **信心水準** | 中 |

## 摘要

在開發流程自動化日益普及的時代，GitHub Actions 成為許多開發者不可或缺的工具。然而，資安研究人員提醒， GitHub Repository secrets 的設計存在潛在風險，只要擁有儲存庫寫入權限的使用者，就可能存取甚至竊取secrets。為了降低風險，建議使用 GitHub Environment secrets的保護規則和正確配置的 OIDC（OpenID Connect）信任...

## 事實內容

在開發流程自動化日益普及的時代，GitHub Actions 成為許多開發者不可或缺的工具。然而，資安研究人員提醒， GitHub Repository secrets 的設計存在潛在風險，只要擁有儲存庫寫入權限的使用者，就可能存取甚至竊取secrets。為了降低風險，建議使用 GitHub Environment secrets的保護規則和正確配置的 OIDC（OpenID Connect）信任策略，以強化憑證與密鑰的安全性。 除了機制設計問題外，初學者在撰寫GitHub Action Workflow 時的錯誤用法，也常造成機密洩漏風險。最常見的情況是直接將 secrets值寫入工作流程檔案中，使得敏感資訊如金鑰或密碼暴露於公開程式碼之中，嚴重威脅系統安全，如圖1所示。 圖1：將secrets直接寫入Workflow上。圖片內容取自github: airman604 目前網路上廣為流傳的做法，是透過Github的介面在路徑「settings → secrets and variables → actions」中，設定Repository secrets，如圖2所示。設定完成後，開發者便可在GitHub Actions的Workflow中直接寫入變數的名稱，如圖3所示。這種方式表面上來看具備一定隱蔽性，因為 UI 中無法直接查看密文內容，但實際上卻潛藏重大風險。 圖2：設定Repository secrets。TWCERT/CC整理 圖3：在Workflow中設定 Repository secrets 。圖片內容取自 github: airman604 根據GitHub官方文件說明，如圖4所示， 任何擁有儲存庫「寫入權限」的使用者，都能藉由修改 Workflow，間接「讀取」並外洩這些secrets (機密資料)。因此，建議你確保在Workflow中使用的憑證權限要設為「最低必要權限」。 若未妥善設定，攻擊者可建立自訂的 Workflow，將secrets輸出到日誌或將其傳送至外部伺服器等手法，達到外洩目的，對組織資安造成實質威脅。圖5為使用者擁有寫入權限，即可輸出儲存在Workflow的機密資料。 圖4: Github 官方說明。圖片內容取自 airman604 圖5: 示範列印Secrets。圖片內容取自 github: airman604 為了因應上述風險，推薦使用Github的Environment secrets搭配部署保護規則（deployment protection rules）。這項機制允許開發者在每個環境設定獨立的secrets，並透過細緻的保護規則控管其使用條件。當Workflow中的某個job嘗試存取指定環境的secrets時，必須先通過該環境設定的保護規則，才能取得執行權限。設定的路徑為「settings→ secrets and variables→ actions」，如圖 6 所示。 圖6: 設定 Environment secrets 位置。TWCERT/CC整理 另一項有效強化措施是利用OIDC（OpenID Connect）結合AWS IAM，以避免在 GitHub 儲存庫中長期儲存敏感憑證。當使用者有請求時，透過Github Action 動態請求AWS所提供的短期憑證，即使工作流程被竄改，也只有在允許的條件下才取得憑證。 以下是Environment Secrets和OIDC + IAM Role二種方式比較表： 項目 Environment Secrets OIDC + IAM Role 憑證型態 長期憑證 短期憑證（每次執行產生） 存取控制細緻度 中等（只能限制環境） 高（可限制分支、環境、儲存庫、觸發者） 風險 一旦洩漏可長期使用 洩漏後短期失效 可審核性 有一定限制 高，可搭配AWS CloudTrail、IAM認證紀錄 複雜度 簡單 稍高，需要AWS IAM與信任策略設定

## 受影響系統

- N/A (需進一步分析)

## 來源連結

- [機密早已外洩！GitHub Actions 成內鬼溫床，寫入權限竟等同全權存取！](https://www.twcert.org.tw/tw/cp-104-10284-dc03a-1.html)

---
> 萃取時間：2026-02-17 08:10 UTC
> 資料來源：TWCERT/CC (rss-104)
> 備註：Original language: zh-TW (TWCERT/CC)
