# 解密「長線佈局」與跨領域攻擊：CrowdStrike 深入解析 2025 駭客戰術演進

| 項目 | 內容 |
|------|------|
| **日期** | 2025-09-17 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 低 |
| **信心水準** | 中 |

## 摘要

CrowdStrike 最新威脅報告指出，在2024年7月1日至2025年6月30日期間，互動式入侵（interactive intrusion）事件年增27%，此類攻擊不同於以往的自動化入侵，駭客會在取得權限後，主動與受害電腦環境互動，蒐集資訊並依據情境客製化攻擊策略。其中，超過八成的案例涉及無檔案惡意軟體（fileless malware），顯示傳統依賴檔案檢測的防禦方式已面臨挑戰。 雲端與語...

## 事實內容

CrowdStrike 最新威脅報告指出，在2024年7月1日至2025年6月30日期間，互動式入侵（interactive intrusion）事件年增27%，此類攻擊不同於以往的自動化入侵，駭客會在取得權限後，主動與受害電腦環境互動，蒐集資訊並依據情境客製化攻擊策略。其中，超過八成的案例涉及無檔案惡意軟體（fileless malware），顯示傳統依賴檔案檢測的防禦方式已面臨挑戰。 雲端與語音詐騙成為新焦點 報告同時揭示，中國針對雲端的攻擊年增40%，突顯雲端服務仍是國家級攻擊者的主要戰場。此外，語音詐騙在2024下半年成長率高達442%，並於2025上半年已超越2024全年數量，顯示AI技術的普及正加速此類詐騙的規模與影響。 國家級攻擊與產業目標 科技業至今已連續8年成為遭攻擊最多的產業，主要來自網路犯罪活動，而APT攻擊則鎖定電信與政府單位。其中，俄羅斯行為者以PRIMITIVE BEAR 與 VENOMOUS BEAR 為主，攻擊目的與俄烏戰爭相關；中國行為者則將電信產業視為高價值目標，藉此取得用戶資料、滲透下游客戶，相關攻擊在過去一年成長130%。 製造與零售業的高風險處境 製造與零售產業在過去一年也成為攻擊熱點。CURLY SPIDER 駭客組織頻繁施以勒索軟體並結合語音詐騙，利用這些產業對營運不中斷的高度依賴迫使受害者快速付款。如製造業無法承擔生產中斷的損失；零售業在購物旺季期間若資料外洩或系統停擺，將損失客戶與營收。此外，其產業具有龐大預算、複雜且可能過時的 IT 架構，使得這些產業持續吸引網路犯罪集團的目光。 生成式AI成為攻擊加速器 CrowdStrike 指出，攻擊者正積極將生成式 AI（GenAI）整合於作戰流程，並非取代而是強化原有戰術與技術。APT 組織透過 GenAI 加快滲透與作業效率，而一般網路犯罪者則利用 GenAI 自動化腳本撰寫與問題排解。其影響主要體現在以下三個面向： 1. 撰寫更自然和符合應對情境的釣魚信件，並持續針對歐盟和美國發動釣魚攻擊，且能進行身分偽造 2. 更容易生成虛假影片、音訊和圖片，並冒充知名人物（deepfake） 3. 降低資安攻擊門檻，加速提高惡意攻擊程式生成 實際案例與新興威脅 北韓 FAMOUS CHOLLIMA 組織便是典型案例。他們透過 GenAI 偽造求職者身份、製作 deepfake 視訊，並藉由 LLM 增強英文對答與技術能力，以成功取得遠端工程師職位。過去一年已觀察到超過 320 起相關資安事件。此外，2025 年 4 月，駭客組織更將攻擊目標轉向 AI 開發工具 Langflow AI（CVE-2025-3248），顯示 AI 平台本身也成為潛在的攻擊面。 面對上述威脅，CrowdStrike提供以下防禦建議： 1. 企業應加強對應徵者的身分驗證，例如透過背景調查及查證其線上職涯紀錄，以避免遭遇假身分風險 2. 導入即時deepfake 偵測技術，應用於視訊面試與錄音評估中，辨識虛假影音資料 3. 加強遠端存取控管，防範位置偽裝與端點繞過，保護企業資源不受濫用 4. 全面檢查USB及周邊裝置，且驗證外接設備安全性，阻斷可能載入的遠端控制工具 5. 監控使用者的通訊與操作行為，藉由檢測異常翻譯與帳號同步操作等情形，判斷是否存在AI操控的可能 6. 針對招募與IT團隊設計AI滲透識別訓練課程，強化識別與應對能力 報告總結指出，生成式AI不會單方面完全傾向攻擊方或防禦方，真正的差異在於使用者的技術能力，唯有同步強化技術偵測、治理政策及人員訓練，才能在不斷演進的攻防環境中維持韌性。 圖1：過去一年活躍的 APT 組織。圖片來源：CrowdStrike CrowdStrike對威脅組織的定義與命名遵循特定規則，如下表 1 所示。例如，代表中國的高階持續性威脅（APT）組織名稱通常會包含「Panda」字樣，舉例來說，「Mustang Panda」便是此類命名規則的典型代表。 名稱（ Adversary ） 國家 / 類別 BEAR Russia BUFFALO Vietnam CHOLLIMA DPRK (North Korea) CRANE ROK (Republic of Korea) HAWK Syria JACKAL Hacktivist KITTEN Iran LEOPARD Pakistan LYNX Georgia OCELOT Colombia PANDA People’s Republic of China SAIGA Kazakhstan SPHINX Egypt SPIDER eCrime TIGER India WOLF Türkiye 表1：CrowdStrike命名APT威脅組織的規則。由TWCERT/CC整理 Threat Actor Country Target Industries SCATTERED PANDA China Retail ETHEREAL PANDA China Healthcare, Retail GLACIAL PANDA China Telecoms*, Technology, Retail CIRCUIT PANDA China Healthcare, Manufacturing, NGO, Technology SUNRISE PANDA China Manufacturing, Services*, Technology, Government, Telecoms* MURKY PANDA China Government, Services*, Technology, Telecoms* OPERATOR PANDA China Services*, Technology, Telecoms* VAULT PANDA China Financial* NOMAD PANDA China Government PHANTOM PANDA China Telecoms* SCATTERED PANDA China Retail ETHEREAL PANDA China Healthcare, Retail GLACIAL PANDA China Telecoms*, Technology, Retail CIRCUIT PANDA China Healthcare, Manufacturing, NGO, Technology SUNRISE PANDA China Manufacturing, Services*, Technology, Government, Telecoms* KRYPTONITE PANDA China Government MUSTANG PANDA China Government, Technology, Services*, Hospitality PRIMITIVE BEAR Russia Government VENOMOUS BEAR Russia Government FAMOUS CHOLLIMA North Korea (DPRK) Technology, Services*, Financial* PLUMP SPIDER eCrime / Cybercriminal Financial*, Retail, Technology VICE SPIDER eCrime / Cybercriminal Technology, Services*, Real Estate, Telecoms* MUTANT SPIDER eCrime / Cybercriminal Services*, Financial*, Retail SCATTERED SPIDER eCrime / Cybercriminal Retail, Aviation CURLY SPIDER eCrime / Cybercriminal Retail, Manufacturing, Services TUNNEL SPIDER eCrime / Cybercriminal Real Estate, Automotive, Financial*, Technology PUNK SPIDER eCrime / Cybercriminal Manufacturing, Financial*, Technology SINFUL SPIDER eCrime / Cybercriminal Opportunistic, Technology, Services* FROZEN SPIDER eCrime / Cybercriminal Hospitality, Manufacturing NIMBLE SPIDER eCrime / Cybercriminal Hospitality, Manufacturing, Retail, Energy, Government, Utilities STATIC KITTEN Iran Academic, Healthcare, Government PULSAR KITTEN Iran Government, Healthcare, Real Estate, Technology 表2：CrowdStrike 整理報告期間活躍的APT組織。由TWCERT/CC整理

## 受影響系統

- N/A (需進一步分析)

## 來源連結

- [解密「長線佈局」與跨領域攻擊：CrowdStrike 深入解析 2025 駭客戰術演進](https://www.twcert.org.tw/tw/cp-104-10384-cbfaa-1.html)

---
> 萃取時間：2026-02-17 08:10 UTC
> 資料來源：TWCERT/CC (rss-104)
> 備註：Original language: zh-TW (TWCERT/CC)
