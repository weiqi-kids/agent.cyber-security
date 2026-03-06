# A patch for the NIS2 Directive

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-21 |
| **來源** | CERT.at (Austria) |
| **分類** | policy_regulation |
| **嚴重程度** | medium |
| **信心水準** | 高 |

## 摘要
EU 委員會於 2026 年 1 月 20 日提出包含 NIS2 指令修訂在內的立法修正套件，修正已知執行問題並新增勒索軟體通報要求及數位身分錢包提供者範疇。

## 事實內容
- **觸發事件**：2026 年 1 月 20 日，EU 委員會提出立法修正套件。
- **NIS2 修訂的主要變更（Bug Fixes）**：
  - 為 DNS 伺服器營運商設定最小規模門檻（避免過小機構被納入管轄）
  - 排除僅因擁有少量太陽能板而被錯誤歸類為能源業者的大型企業
- **新增涵蓋範圍**：
  - 歐洲數位身分錢包（European Digital Identity Wallets）提供者
  - 勒索軟體案件的特別通報要求
- **CSIRTs 網路定義變更**：
  - 將 ENISA 正式納入 CSIRTs 網路組成
  - 新增 Article 37a，描述 ENISA 在相互協助中的角色
- **CERT.at 的立場**：
  - 對 ENISA 角色擴大持矛盾態度：認可 ENISA 日益增加的事件追蹤和警報統計工作，但指出 ENISA 並不實際處理事件，而是協調協助，此角色模糊可能造成混淆
  - 建議搭配閱讀同步提出的網路安全法（Cybersecurity Act）更新，了解 ENISA 角色的完整定義
- **背景**：NIS2 在所有 27 個 EU 成員國的落實花費比預期更長的時間，此次修訂是對執行經驗的回應。

## 受影響系統
- EU 各成員國 NIS2 合規框架
- DNS 服務提供者
- 數位身分錢包服務
- 所有 NIS2 涵蓋實體

## 來源連結
- [A patch for the NIS2 Directive](https://www.cert.at/en/blog/2026/1/a-patch-for-the-nis2-directive)

---
> 萃取時間：2026-03-04 UTC
> 資料來源：CERT.at (Austria) cert-at
