# 「Contagious Interview」攻擊手法再進化：濫用 VS Code Tasks 建立持久化機制

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-28 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 未評估 |
| **信心水準** | 中 |

## 摘要

資安研究團隊OSM(OpenSourceMalware)與Palo Alto Networks近期發布聯合警訊，指出駭客組織發起的「Contagious Interview(傳染性面試)」行動出現重大技術演變。攻擊者不再僅依賴誘騙受害者手動執行惡意檔案，而是轉向濫用開發工具Visual Studio Code (VS Code)內建的tasks.json自動化機制。只要開發者在受信任模式下開啟惡意專案資料夾，無須手動編譯或執行程式，惡意指令即會在背景自動觸發，大幅提高了攻擊的隱蔽性。這波攻擊主要鎖定加密貨幣產業的軟體工程師與自由接案者。攻擊者首先在LinkedIn、Upwork 或 Fiverr等求職與外包平台偽裝成招募人員或雇主 。他們以高薪職缺或新專案為誘因，主動接觸警覺性較低的開發者。在取得信任後，攻擊者會要求工程師從GitHub或GitLab下載一個專案進行測試，當工程師使用VS Code開啟該專案資料夾時，主要核心的滲透技術如下：埋藏惡意配置：攻擊者在專案的 .vscode資料夾中植入惡意tasks.json檔案濫用自動化屬性：該設定檔使用了 runOn: folderOpen 屬性。這意味著只要 VS Code 開啟該資料夾，定義好的惡意任務就會自動執行利用「信任」心理：當VS Code彈出「Workspace Trust(工作區信任)」提示詢問是否信任作者時，若急於求職的受害者點選「是(Yes)」，系統將直接放行自動化任務跨平台感染：任務觸發後，系統會根據受害者的作業系統(Windows、macOS 或 Linux)自動下載對應的引導程式(Bootstrapper)，建立持久化機制並載入後續惡意模組這類攻擊利用開發者對Visual Studio Code等工具的信任，誘使受害者下載看似正常的專案並點選「信任作者」。與 ClickFix 需要引導使用者手動貼上代碼不同，IDE 攻擊透過軟體內建的自動化任務執行惡意指令，其高度隱蔽性與「合法化」操作，被專家視為下一波針對性攻擊(APT)的初始感染主流透過上述機制植入的惡意程式，已被識別為 BeaverTail 最新變種（Type 701），並呈現與 OtterCookie 的功能融合趨勢（部分分析將其稱為 OtterCandy）。一旦惡意任務啟動，系統會依據受害者作業系統（Windows、macOS 或 Linux）下載對應的引導程式（bootstrapper），最終在電腦上落地執行高度混淆的 JavaScript 惡意程式 BeaverTail（Type 701）。該版本的 BeaverTail 能力大幅提升，主要以竊取資訊為目的，至少可針對 43 種以上與加密貨幣相關的瀏覽器擴充功能（例如 MetaMask、Phantom 等）與多家錢包服務供應商進行資料竊取；同時也會竊取登入憑證、Session Cookie、LocalStorage 以及瀏覽器內的 LevelDB（.ldb） 等高度敏感資料。面對針對開發環境的供應鏈攻擊，資安專家建議企業與開發者採取以下防護措施：開啟不明來源的程式碼庫時，避免輕易點選VS...

## 事實內容

資安研究團隊OSM(OpenSourceMalware)與Palo Alto Networks近期發布聯合警訊，指出駭客組織發起的「Contagious Interview(傳染性面試)」行動出現重大技術演變。攻擊者不再僅依賴誘騙受害者手動執行惡意檔案，而是轉向濫用開發工具Visual Studio Code (VS Code)內建的tasks.json自動化機制。只要開發者在受信任模式下開啟惡意專案資料夾，無須手動編譯或執行程式，惡意指令即會在背景自動觸發，大幅提高了攻擊的隱蔽性。這波攻擊主要鎖定加密貨幣產業的軟體工程師與自由接案者。攻擊者首先在LinkedIn、Upwork 或 Fiverr等求職與外包平台偽裝成招募人員或雇主 。他們以高薪職缺或新專案為誘因，主動接觸警覺性較低的開發者。在取得信任後，攻擊者會要求工程師從GitHub或GitLab下載一個專案進行測試，當工程師使用VS Code開啟該專案資料夾時，主要核心的滲透技術如下：埋藏惡意配置：攻擊者在專案的 .vscode資料夾中植入惡意tasks.json檔案濫用自動化屬性：該設定檔使用了 runOn: folderOpe...

[Full content available at source link]

**Note**: Original language: zh-TW (TWCERT/CC). Content translated/summarized to English.

## 受影響系統

- To be determined from full article

## 來源連結

- [「Contagious Interview」攻擊手法再進化：濫用 VS Code Tasks 建立持久化機制](https://www.twcert.org.tw/tw/cp-104-10657-9d247-1.html)

---
> 萃取時間:2026-01-28 23:44 UTC
> 資料來源:TWCERT/CC (rss-104)
