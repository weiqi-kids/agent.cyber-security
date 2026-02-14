---
title: "「Contagious Interview」攻擊手法再進化:濫用VS Code Tasks建立持久化機制"
date: 2026-01-28
source: TWCERT/CC
source_url: https://www.twcert.org.tw/tw/cp-104-10657-9d247-1.html
feed_id: rss-104
category: attack_incident
confidence: 高
---

## 摘要

駭客組織發起的「Contagious Interview(傳染性面試)」行動出現重大技術演變。攻擊者不再僅依賴誘騙受害者手動執行惡意檔案,而是轉向濫用開發工具Visual Studio Code (VS Code)內建的tasks.json自動化機制。只要開發者在受信任模式下開啟惡意專案資料夾,無須手動編譯或執行程式,惡意指令即會在背景自動觸發。

## 攻擊手法

**目標族群:**
- 加密貨幣產業的軟體工程師與自由接案者

**攻擊流程:**

1. **社交工程階段**: 攻擊者在LinkedIn、Upwork或Fiverr等求職與外包平台偽裝成招募人員或雇主,以高薪職缺或新專案為誘因接觸開發者

2. **技術滲透階段**:
   - **埋藏惡意配置**: 在專案的.vscode資料夾中植入惡意tasks.json檔案
   - **濫用自動化屬性**: 使用runOn: folderOpen屬性,當VS Code開啟該資料夾時,定義好的惡意任務就會自動執行
   - **利用「信任」心理**: 當VS Code彈出「Workspace Trust(工作區信任)」提示詢問是否信任作者時,若受害者點選「是(Yes)」,系統將直接放行自動化任務
   - **跨平台感染**: 任務觸發後,系統會根據受害者的作業系統(Windows、macOS或Linux)自動下載對應的引導程式(Bootstrapper),建立持久化機制並載入後續惡意模組

## 惡意程式分析

**BeaverTail最新變種(Type 701):**
- 與OtterCookie功能融合(部分分析稱為OtterCandy)
- 針對43種以上與加密貨幣相關的瀏覽器擴充功能進行資料竊取(如MetaMask、Phantom等)
- 竊取登入憑證、Session Cookie、LocalStorage以及瀏覽器內的LevelDB(.ldb)等高度敏感資料

## 攻擊特點

與ClickFix需要引導使用者手動貼上代碼不同,IDE攻擊透過軟體內建的自動化任務執行惡意指令,其高度隱蔽性與「合法化」操作,被專家視為下一波針對性攻擊(APT)的初始感染主流。

## 防護建議

1. 開啟不明來源的程式碼庫時,避免輕易點選VS Code的「信任」選項

2. 定期檢查.vscode/tasks.json是否存在異常或自動執行的設定

3. 建議將開發環境與日常使用帳號進行權限分離,以降低風險

4. 部署郵件閘道掃描機制與VS Code擴展功能白名單,並限制或停用不必要的任務自動執行功能

5. 加密產業相關人員應特別提高警覺,並搭配端點防護與行為監控機制

## 時間軸

- 2026-01-28: TWCERT/CC發布警訊

## 標籤

#ContagiousInterview #VSCode #社交工程 #BeaverTail #OtterCookie #加密貨幣 #APT #IDE攻擊
