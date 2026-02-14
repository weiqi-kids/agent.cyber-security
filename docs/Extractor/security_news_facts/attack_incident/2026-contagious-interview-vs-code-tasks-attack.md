# 「Contagious Interview」攻擊手法再進化：濫用 VS Code Tasks 建立持久化機制

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-28 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | high |
| **信心水準** | high |

## 摘要

資安研究團隊 OSM（OpenSourceMalware）與 Palo Alto Networks 聯合發布警訊，指出駭客組織發起的「Contagious Interview（傳染性面試）」行動出現重大技術演變。攻擊者不再僅依賴誘騙受害者手動執行惡意檔案，而是轉向濫用開發工具 Visual Studio Code（VS Code）內建的 tasks.json 自動化機制。只要開發者在受信任模式下開啟惡意專案資料夾，無須手動編譯或執行程式，惡意指令即會在背景自動觸發。

## 事實內容

### 攻擊目標與手法

**主要目標**：
- 加密貨幣產業的軟體工程師
- 自由接案者（Freelancer）

**攻擊流程**：

1. **社交工程階段**：
   - 攻擊者在 LinkedIn、Upwork 或 Fiverr 等求職與外包平台偽裝成招募人員或雇主
   - 以高薪職缺或新專案為誘因，主動接觸警覺性較低的開發者
   - 取得信任後，要求工程師從 GitHub 或 GitLab 下載專案進行測試

2. **技術滲透機制**：
   - **埋藏惡意配置**：在專案的 .vscode 資料夾中植入惡意 tasks.json 檔案
   - **濫用自動化屬性**：使用 `runOn: folderOpen` 屬性，只要 VS Code 開啟該資料夾，定義好的惡意任務就會自動執行
   - **利用「信任」心理**：當 VS Code 彈出「Workspace Trust（工作區信任）」提示時，若急於求職的受害者點選「是（Yes）」，系統將直接放行自動化任務
   - **跨平台感染**：任務觸發後，系統會根據受害者的作業系統（Windows、macOS 或 Linux）自動下載對應的引導程式（Bootstrapper），建立持久化機制並載入後續惡意模組

### 與 ClickFix 的差異

- **ClickFix**：需要引導使用者手動貼上代碼
- **IDE 攻擊**：透過軟體內建的自動化任務執行惡意指令，具有更高的隱蔽性與「合法化」操作
- 專家視為下一波針對性攻擊（APT）的初始感染主流

### 惡意程式載荷

**BeaverTail（Type 701）**：
- 與 OtterCookie 功能融合（部分分析稱為 OtterCandy）
- 高度混淆的 JavaScript 惡意程式
- 主要功能：
  - 針對 43 種以上與加密貨幣相關的瀏覽器擴充功能進行資料竊取（例如 MetaMask、Phantom 等）
  - 竊取多家錢包服務供應商的資料
  - 竊取登入憑證、Session Cookie、LocalStorage
  - 竊取瀏覽器內的 LevelDB（.ldb）等高度敏感資料

### 防護建議

1. **謹慎使用 VS Code 信任功能**：
   - 開啟不明來源的程式碼庫時，避免輕易點選 VS Code 的「信任」選項
   - 定期檢查 .vscode/tasks.json 是否存在異常或自動執行的設定

2. **權限分離**：
   - 將開發環境與日常使用帳號進行權限分離，以降低風險

3. **技術控制措施**：
   - 部署郵件閘道掃描機制
   - 建立 VS Code 擴展功能白名單
   - 限制或停用不必要的任務自動執行功能

4. **針對加密產業的特別建議**：
   - 加密產業相關人員應特別提高警覺
   - 搭配端點防護與行為監控機制

## 受影響系統

- **軟體**：Visual Studio Code（所有版本）
- **作業系統**：Windows、macOS、Linux
- **主要目標產業**：加密貨幣、區塊鏈相關企業
- **受影響人群**：軟體工程師、自由接案開發者

## 來源連結

- https://www.twcert.org.tw/tw/cp-104-10657-9d247-1.html
