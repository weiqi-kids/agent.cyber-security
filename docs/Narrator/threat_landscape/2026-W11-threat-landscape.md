---
layout: seo-report
last_modified_at: 2026-03-13T10:00:00+08:00
title: 2026 第 11 週威脅態勢分析
description: "2026-03-06 至 2026-03-13 資安威脅週報：伊朗多面向網路攻擊全面升級（Handala/Void Manticore 破壞性攻擊、Wiper 攻擊 Stryker、入侵阿爾巴尼亞國會、Instagram 影響力操作）、APT28 以 BeardShell+Covenant 攻擊烏克蘭、Camaro Dragon PlugX 攻擊卡達、ShinyHunters Salesforce 百企資料竊取、SocksEscort 代理網路遭國際執法打擊、KadNap DHT-P2P 殭屍網路感染 14,000 台路由器、CISA 新增 n8n RCE 至 KEV、28 筆新增 Critical/High 漏洞。"
parent: 威脅態勢分析
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-threat-landscape.png
author: 資安情報分析團隊
date: 2026-03-13
---

# 威脅態勢分析 — 2026 第 11 週

> 涵蓋期間：2026-03-06 至 2026-03-13
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-03-13
> 分析模型：Claude Opus

---

## 執行摘要

本週威脅態勢以**伊朗多面向網路攻擊全面升級、多國 APT 同步活躍、以及雲端 SaaS 平台與通訊平台遭大規模攻擊**為三大主軸。全球網路攻擊量於 2026 年 2 月維持歷史高位（NCSC-FI），本週態勢持續升溫。

**國家級威脅行為者動態**：
- **伊朗多線攻擊全面升級**：Handala（Void Manticore）破壞性 Wiper 攻擊與洩密行動鎖定美以組織、宣告 Google/Amazon/Microsoft/Palantir/IBM/Nvidia/Oracle 為「合法目標」（2026-03-13）；Wiper 攻擊 Stryker 醫療器材（2026-03-12）、入侵阿爾巴尼亞國會電子郵件（2026-03-12）、Instagram 假帳號影響力操作（2026-03-12）、MOIS-犯罪融合分析（2026-03-11）、Seedworm/Dindoor 持續入侵美國關鍵基礎設施
- **APT28/Sednit（俄羅斯）**以全新 BeardShell + Covenant 雙植入架構對烏克蘭軍事人員進行長期監控（ESET, 2026-03-11）
- **中國關聯 APT 雙線擴展**：Camaro Dragon（PlugX 攻擊卡達，2026-03-10）、UAT-9244（南美電信，三款新惡意軟體）
- 荷蘭 AIVD/MIVD 警告**俄羅斯大規模 Signal/WhatsApp 帳號劫持行動**，全球鎖定政府官員（2026-03-10）
- **APT36（巴基斯坦）**首創 AI 驅動「Vibeware」惡意軟體量產模式

**網路犯罪與資料洩露**：
- **ShinyHunters** 透過 Salesforce 平台竊取約 100 家企業資料，另有犯罪集團利用 Salesforce Guest Account 配置弱點進行資料勒索
- **KadNap 殭屍網路**以 Kademlia DHT P2P 架構劫持逾 14,000 台 ASUS 路由器
- **Microsoft Teams 釣魚**部署全新 A0Backdoor 攻擊金融與醫療機構
- **Viking Line 資料外洩**：芬蘭渡輪業者分包商遭入侵，預訂客戶資料外洩（2026-03-13）
- **KongTuke ClickFix**利用受感染 WordPress 網站散布惡意軟體（2026-03-12）
- **假履歷惡意軟體**殺死 EDR 後竊取資料

**執法打擊行動**：
- **Operation Lightning**：國際執法打擊 SocksEscort 住宅代理網路，扣押 34 個網域、23 台伺服器，凍結 350 萬美元加密貨幣（2026-03-13）

**關鍵漏洞與利用**：
- 2026 年度累積 Critical/High 8,246 筆、活躍利用 59 筆、PoC 可用 2,347 筆
- **CISA 新增 n8n RCE 至 KEV**——n8n 工作流程自動化平台 RCE 漏洞確認遭積極利用（2026-03-13）
- 本週新增 28 筆 Critical/High 漏洞公告（Apple、Fortinet、GitHub、Chrome、HPE、Mozilla、Cisco IOS XR、Erlang/OTP、GitLab、F5OS、Splunk、Veeam、Zoom 等）
- FortiCloud SSO 繞過漏洞（CVE-2025-59718/59719）持續被利用收集 LDAP 憑證
- CERT-FR 發布多項重要漏洞公告（Apple、Cisco IOS XR、GitLab、GLPI RCE、Chrome、Edge、Microsoft、Palo Alto Networks、Splunk、Veeam Backup）
- Google 2025 零日回顧：企業技術零日佔比 48% 創歷史新高

**資料規模**：security_news_facts（W11 新增：attack_incident 49、industry_trend 28、vulnerability_disclosure 79、other 12、policy_regulation 8）、vulnerability_tracking 21,772 筆（Critical/High 8,246）、exploit_intelligence 2,406 筆（active 59 + PoC 2,347）、threat_feeds 46,000 筆。

---

## 資料來源統計

| Layer | 2026 年度累積 | W11 新增 | 說明 |
|-------|-------------|---------|------|
| security_news_facts | 493+ | 176 | attack_incident 49、vulnerability_disclosure 79、industry_trend 28、policy_regulation 8、other 12 |
| vulnerability_tracking | 21,772 | — | Critical/High 8,246、Medium 9,632、Low/Info 3,894 |
| exploit_intelligence | 2,406 | — | 活躍利用 59 + PoC 可用 2,347 |
| threat_feeds | 46,000 | — | 惡意 URL、惡意軟體樣本、IoC 指標、C2 基礎設施 |

> 統計時間：2026-03-13 UTC（2026 年度累積數據）

---

## 2.1 近期重大資安事件

本週資安事件延續中東地緣政治衝突驅動的網路升級態勢，同時出現多起重大 APT 行動揭露、勒索軟體利用關鍵漏洞的快速武器化，以及針對企業 SaaS 平台的大規模資料竊取行動。以下按嚴重程度排序。

### 1. 伊朗—以色列網路衝突持續升級與駭客主義 DDoS 浪潮

**嚴重程度：極高 | 來源：Palo Alto Unit 42 / Radware / Check Point / WIRED / Zscaler | 日期：2026-03-05 至 03-11**

本週中東網路衝突態勢延續上週（W10）的激烈程度，多層面同步升級：

- **2026-03-05**：Palo Alto Unit 42 發布三月威脅簡報，正式評估伊朗相關網路風險升級。報告識別約 60 個駭客主義團體活躍，伊朗「電子作戰室」持續協調網路行動，攻擊目標從以色列擴展至所有被視為支持以色列的國家。（來源：Palo Alto Unit 42, 2026-03-05）

- **駭客主義 DDoS 浪潮持續**：149 次駭客主義 DDoS 攻擊針對 16 個國家 110 個組織。Keymous+ 和 DieNet 驅動近 70% 攻擊活動，53% 攻擊導向政府機構，76% 以上集中於科威特、以色列和約旦。親俄團體 NoName057(16) 跨營加入親伊朗陣營，威脅進一步擴大。（來源：Radware / Orange Cyberdefense, 2026-03-05）

- **IP 攝影機入侵戰爭化**：Check Point Research 與 WIRED 深度報導確認，從烏克蘭到伊朗，IP 攝影機入侵已成為現代戰爭的標準手段。伊朗攻擊者在飛彈攻擊前後針對六國 IP 攝影機的活動模式與動能行動高度時間相關，用途為戰損評估 (BDA)。俄羅斯團體「Morningstar」亦宣稱監視芬蘭家庭攝影機。（來源：Check Point / WIRED, 2026-03-07；NCSC-FI, 2026-03-09）

- **中東衝突機會主義攻擊**：Zscaler ThreatLabz 報告超過 8,000 個使用衝突相關關鍵字的新註冊網域，活躍威脅包括衝突主題 PDF 誘餌投遞後門、假新聞網站重導向 StealC 惡意軟體、假政府釣魚網站和詐騙捐款網站。（來源：Zscaler, 2026-03-07）

- **MOIS 與網路犯罪融合**：Check Point Research 分析伊朗情報安全部（MOIS）越來越頻繁地透過犯罪工具和基礎設施追求國家目標，使用商業化犯罪工具執行國家間諜任務，提供可否認性。（來源：Check Point Research, 2026-03-11）

- **2026-03-12——伊朗三線同步攻擊**：
  - **Wiper 攻擊 Stryker 醫療器材**：伊朗支持的駭客宣稱對美國醫療器材大廠 Stryker 發動破壞性 Wiper 攻擊，刻意銷毀目標系統資料。Stryker 為全球主要醫療器材製造商，目標選擇具戰略意義，對醫療供應鏈安全構成嚴重威脅。（來源：KrebsOnSecurity, 2026-03-12）
  - **入侵阿爾巴尼亞國會電子郵件**：與伊朗關聯的駭客宣稱成功入侵阿爾巴尼亞國會電子郵件系統，延續自 2022 年起因阿爾巴尼亞收容伊朗反對組織 MEK 而發動的系列網路攻擊。（來源：The Record, 2026-03-12）
  - **Instagram 假帳號影響力操作**：Meta 宣布瓦解伊朗影響力操作網路，該行動使用假冒個人身份在 Instagram 上針對美國用戶，目的包含散布特定政治訊息和操縱輿論。（來源：The Record / Meta, 2026-03-12）

- **2026-03-13——Handala（Void Manticore）全面威脅升級**（本週最新動態）：
  - **Handala（Void Manticore）深度分析**：Google 威脅情報團隊發布伊朗威脅組織 Handala 的全面分析報告。Handala 為伊朗情報安全部（MOIS）關聯的破壞性威脅組織，專精 Wiper 攻擊與 hack-and-leak 行動，目標鎖定美國和以色列組織。該組織公開宣告 **Google、Amazon、Microsoft、Palantir、IBM、Nvidia、Oracle** 為「合法目標」，標誌著伊朗網路攻擊目標從傳統地緣政治對手擴展至全球科技巨頭。（來源：Google Threat Intelligence, 2026-03-13）

**態勢評估**：伊朗本週的網路行動呈現「全方位」特徵——間諜活動（Seedworm/Dindoor）、破壞性攻擊（Stryker Wiper、Handala Wiper）、政治攻擊（阿爾巴尼亞國會）和資訊戰（Meta 假帳號操作）同時推進。Handala 將七大科技巨頭列為合法目標，代表威脅範圍的重大擴展。CERT-FR 同週發布的 2025 年網路威脅全景報告（2026-03-11）指出「國家行為者與網路犯罪集團之間的傳統界限持續侵蝕」，伊朗正是此趨勢的典型代表。

**Qdrant 跨層關聯分析**：語意查詢「APT nation-state cyber attack March 2026」回傳 5 筆結果（UAC-0001/APT28、伊朗網路威脅簡報、Camaro Dragon），確認伊朗網路攻擊活動已從間諜活動擴展至破壞性攻擊和資訊戰。Handala/Void Manticore 將七大科技巨頭列為合法目標，進一步升級威脅範圍。歷史比對顯示，自 2026 年 2 月底以來伊朗相關網路威脅活動密集程度為近年之最。

### 2. 多國 APT 行動同步揭露——中國、俄羅斯、巴基斯坦

**嚴重程度：高 | 多來源 | 日期：2026-03-05 至 03-11**

本週罕見地同時揭露多個國家級 APT 行動：

**APT28/Sednit（俄羅斯 GRU）— BEARDSHELL + COVENANT 雙植入攻擊烏克蘭**

ESET Research 與 CERT-UA 聯合揭露 APT28 針對烏克蘭政府的攻擊行動，部署全新雙植入架構。BEARDSHELL 為 PowerShell 後門，COVENANT 為 C2 框架，兩者各使用不同雲端供應商進行 C2 通訊，確保冗餘持久性。代碼譜系可追溯至 2010 年代的植入程式，展現 Sednit 長達十餘年的技術延續性。（來源：ESET / CERT-UA, 2026-03-11）

**CL-UNK-1068（中國）— 六年未偵測，七大關鍵產業**

Palo Alto Unit 42 揭露自 2020 年起持續未被偵測的攻擊叢集，以高信心評估為中國威脅行為者。目標涵蓋南亞、東南亞、東亞的航空、能源、政府、執法、製藥、科技及電信七大關鍵產業。主要目的評估為網路間諜活動。（來源：Palo Alto Unit 42, 2026-03-07）

**UAT-9244（中國 / Famous Sparrow 關聯）— 三款新惡意軟體攻擊南美電信**

Cisco Talos 揭露中國關聯 APT 自 2024 年起針對南美洲電信供應商，使用三種專用惡意軟體：TernDoor（Windows 後門）、PeerTime（利用 BitTorrent 協定的 ELF 後門）、BruteEntry（將邊緣裝置轉為大規模掃描代理節點 ORBs）。BruteEntry 的 ORB 架構反映中國 APT 越來越多地利用操作中繼節點模糊攻擊來源。（來源：Cisco Talos, 2026-03-06）

**Camaro Dragon（中國 / Mustang Panda）— PlugX 攻擊卡達**

Check Point Research 追蹤到 Camaro Dragon 在 Operation Epic Fury 啟動後不到 24 小時內，即以 PlugX 變種及 Cobalt Strike 攻擊卡達目標，展現將突發地緣政治事件快速轉化為網路釣魚誘餌的能力。（來源：Check Point Research, 2026-03-10）

**APT36 / Transparent Tribe（巴基斯坦）— AI 驅動「Vibeware」模式**

Bitdefender 揭露 APT36 轉向 AI 驅動的惡意軟體開發，使用 Nim、Zig、Crystal 等冷門語言規避偵測，利用 Slack、Discord、Supabase、Google Sheets 作為 C2 通道。AI 驅動模式以量取勝，大量產生中等品質惡意軟體植體。（來源：Bitdefender, 2026-03-06）

**Seedworm/MuddyWater（伊朗）— Dindoor 後門入侵美國關鍵基礎設施**

Seedworm 自 2026 年 2 月初以來持續活躍於美國銀行、機場、國防/航太軟體公司（在以色列有據點）及加拿大 NGO 網路，部署使用 Deno JavaScript/TypeScript 執行環境的新後門 Dindoor，以「Amy Cherne」名義簽署的憑證進行數位簽章。（來源：NCSC-FI, 2026-03-06）

**Qdrant 跨層關聯分析**：語意查詢「APT advanced persistent threat campaign」回傳 CL-UNK-1068、APT28/Sednit 烏克蘭行動、PRC 電信間諜等結果。本週同時揭露三個中國關聯行動為異常密集，反映安全廠商正加速公開中國網路間諜活動情資。

### 3. ShinyHunters Salesforce 大規模資料竊取與勒索

**嚴重程度：高 | 來源：NCSC-FI / The Register / BleepingComputer | 日期：2026-03-10 至 03-11 | 信心水準：中（部分為攻擊者自稱）**

- **ShinyHunters 行動**：知名網路犯罪組織 ShinyHunters 宣稱透過 Salesforce 客戶資料平台竊取約 100 家知名企業資料（聲稱含 Snowflake、Okta、LastPass、Sony、AMD 等）。攻擊以 Salesforce 客戶資料平台為共同切入點進行持續數月的偵察與利用。（來源：NCSC-FI / The Register, 2026-03-10）

- **Salesforce Guest Account 資料勒索**：另一獨立犯罪集團利用 Salesforce 社群入口的 Guest User 權限設定不當，繞過認證存取內部資料物件，對受影響企業發起資料勒索。Salesforce 確認非平台漏洞而是客戶配置問題。（來源：BleepingComputer, 2026-03-11）

- **Ericsson 美國資料外洩**：Ericsson 確認其美國業務因第三方服務供應商遭入侵而發生資料外洩。（來源：BleepingComputer, 2026-03-10）

> **注意**：ShinyHunters 受害者名單為自稱，尚未經獨立驗證。但 ShinyHunters 過往有多次可信的大規模資料竊取記錄（含 2024 年 Snowflake 客戶資料庫入侵事件），可信度中等。

### 4. BeyondTrust 漏洞武器化與勒索軟體動態

**嚴重程度：高 | 來源：CISA KEV / exploit_intelligence | 日期：2026-03-05 至 03-11**

- **CVE-2026-1731（BeyondTrust RS/PRA, Critical）**：OS 命令注入漏洞，允許未經認證的遠端攻擊者在目標系統上執行任意作業系統命令，**已確認被積極利用於勒索軟體攻擊行動**。BeyondTrust Remote Support 和 Privileged Remote Access 廣泛部署於企業遠端存取基礎設施，遭利用後可直接取得特權存取。（來源：CISA KEV / exploit_intelligence, 2026-03-05）

- **LockBit 5.0 跨平台能力**：安全研究報告揭露 LockBit 勒索軟體即將推出 5.0 版本，具備 Windows、Linux、macOS 跨平台加密能力，加密速度大幅提升。儘管經歷 2024 年 Operation Cronos 執法打擊，LockBit 仍持續迭代攻擊能力。（來源：安全研究報告, 2025-10-28）

### 5. 網路釣魚與社交工程攻擊全面升級

**嚴重程度：高 | 多來源 | 日期：2026-03-05 至 03-11**

本週觀察到釣魚攻擊在通道多樣化和技術精密度上的顯著升級：

- **Microsoft Teams 釣魚 → A0Backdoor**：攻擊者利用 Teams 冒充 IT 支援人員，透過垃圾郵件轟炸 → Teams 社交工程 → Quick Assist 遠端存取的攻擊鏈，部署全新 A0Backdoor。主要針對金融和醫療產業。此為 Storm-1811/BlackBasta 相關團體「Teams Vishing」技術的變種。（來源：BleepingComputer / NCSC-FI, 2026-03-11）

- **Tycoon 2FA PhaaS 平台關閉**：Europol EC3 協調，Microsoft 主導技術打擊，六國執法機構扣押 330 個核心網域。Tycoon 2FA 為訂閱制 PhaaS 平台，可攔截即時認證會話繞過 MFA。（來源：Europol / Microsoft, 2026-03-05）

- **偽造求職申請 → EDR 殺手**：俄語網路犯罪組織以假求職信攻擊企業 HR 部門，惡意軟體可停用或終止 EDR 端點安全軟體後再進行資料竊取。利用 HR 部門日常開啟不明附件的工作流程降低安全警覺。（來源：Aryaka / The Register / NCSC-FI, 2026-03-11）

- **偽造 LastPass 支援郵件**：攻擊者發送冒充 LastPass 技術支援的電子郵件，引誘用戶前往釣魚網站輸入主密碼，意圖竊取密碼保險庫。（來源：BleepingComputer, 2026-03-06）

- **俄羅斯大規模 Signal/WhatsApp 帳號劫持**：荷蘭 AIVD/MIVD 警告俄羅斯關聯行動全球鎖定政府官員、記者與軍事人員的加密通訊帳號。攻擊方法為社交工程騙取帳號存取憑證或裝置連結權限，而非破解端對端加密。（來源：荷蘭 AIVD/MIVD / NCSC-FI, 2026-03-10）

- **芬蘭稅務局釣魚**：使用收件人真名的精準釣魚，與真實稅務通知同日發送。（來源：NCSC-FI, 2026-03-06）

- **社交工程冒充管理階層**：利用 LINE 群組冒充主管/經理進行 BEC，透過短期數位憑證建立信任。（來源：安全研究報告, 2026-12-09）

### 6. 殭屍網路與惡意軟體動態

**嚴重程度：高 | 多來源 | 日期：2026-03-05 至 03-11**

- **Kadnap 殭屍網路（Operation WRTHUG）**：Lumen Black Lotus Labs 發現 Kadnap 殭屍網路自 2025 年 8 月起已感染逾 14,000 台 ASUS 路由器。使用客製化 Kademlia DHT 協定進行 P2P C2 通訊，無單一 C2 伺服器可供拆除。受感染路由器被轉化為惡意流量代理節點。（來源：Lumen Black Lotus Labs / NCSC-FI, 2026-03-11）

- **BeatBanker Android 木馬**：新型 Android 銀行木馬 BeatBanker 針對巴西金融用戶，結合銀行憑證竊取和加密貨幣挖礦雙重牟利功能。（來源：Kaspersky, 2026-03-11）

- **GitHub 惡意軟體分發**：BoryptGrab 竊密軟體透過 100+ GitHub 存儲庫分發，竊取瀏覽器資料、加密貨幣錢包和系統資訊。（來源：Trend Micro, 2026-03-09）

- **惡意 AI 助手瀏覽器擴充功能**：偽裝 AI 助手的 Chromium 擴充功能竊取 ChatGPT 和 DeepSeek 對話記錄，90 萬安裝量、2 萬+企業租戶受影響。（來源：Microsoft Defender, 2026-03-06）

- **Telegram 帳號劫持**：芬蘭出現利用未設密碼語音信箱漏洞劫持 Telegram 帳號的攻擊手法。（來源：NCSC-FI, 2026-03-10）

- **KongTuke ClickFix（2026-03-12 更新）**：Trend Micro MDR 分析 KongTuke 利用 ClickFix 社交工程技術濫用受感染 WordPress 網站散布惡意軟體。ClickFix 攻擊顯示假錯誤訊息誘使用戶執行 PowerShell 腳本，此模式在 2025-2026 年間快速增長，成為主要威脅向量。（來源：Trend Micro MDR, 2026-03-12）

### 7. 供應鏈攻擊持續加劇

**嚴重程度：高 | 來源：SK-CERT / Huntress / Push Security | 日期：2026-03-06 至 03-09**

- **NPM 大規模感染**：SK-CERT 警告 NPM 生態系統遭大規模感染，涉及每週超過 26 億次下載量的套件，植入惡意程式碼影響龐大的下游相依生態系統。（來源：SK-CERT / Aikido, 2026-03-07）

- **偽造 OpenClaw GitHub 安裝器**：Huntress 調查發現偽造 OpenClaw GitHub 存儲庫使用新型「Stealth Packer」分發資訊竊取器和 GhostSocks，後者可路由受害系統流量繞過反詐騙偵測。（來源：Huntress, 2026-03-06）

- **InstallFix 惡意廣告攻擊**：攻擊者複製流行開發者工具（包括 Claude Code）的安裝指南網站，透過搜尋引擎惡意廣告引導受害者安裝竊密軟體。（來源：Push Security, 2026-03-07）

**Qdrant 跨層關聯分析**：語意查詢「supply chain attack software compromise」回傳 NPM 感染、dependency confusion、PackageGate 等結果，確認軟體供應鏈正從多個向量同時被攻擊：套件管理器感染、偽造開源專案、搜尋引擎惡意廣告引導的假安裝指南。

### 8. 執法打擊行動

**嚴重程度：高/正面 | 多來源 | 日期：2026-03-03 至 03-11**

| 日期 | 行動 | 目標 | 成果 | 來源 |
|------|------|------|------|------|
| 2026-03-13 | **Operation Lightning**（國際聯合） | SocksEscort 住宅代理網路 | 扣押 34 個網域、23 台伺服器，凍結 350 萬美元加密貨幣。住宅代理網路被犯罪分子用於匿名化惡意流量 | 國際執法聯合 |
| 2026-03-05 | Europol EC3 協調 | Tycoon 2FA PhaaS | 扣押 330 個核心網域，六國參與 | Europol / Microsoft |
| 2026-03-03~04 | 美國 DOJ 主導 | LeakBase 駭客論壇 | 14 國同步關閉，14.2 萬會員、21.5 萬訊息 | U.S. DOJ |
| 2026-03-11 | 波蘭執法 | DDoS 攻擊套件販售 | 7 名青少年（12-16 歲）販賣 DDoS 套件遭移送，凸顯攻擊工具取得門檻持續降低 | 波蘭警方 / NCSC-FI |

### 9. 其他重要事件

| 日期 | 事件 | 來源 | 嚴重程度 |
|------|------|------|----------|
| 2026-03-07 | Wikipedia 自傳播 JavaScript 蠕蟲修改使用者腳本並破壞 Meta-Wiki 頁面 | BleepingComputer | 高 |
| 2026-03-07 | 簽署惡意軟體偽裝工作場所 App，使用 EV 憑證（TrustConnect Software PTY LTD），部署 RMM 後門 | Microsoft Defender Experts | 高 |
| 2026-03-09 | JPCERT/CC React2Shell 報告，多個威脅行為者利用 Web Shell 技術攻擊日本目標 | JPCERT/CC | 高 |
| 2026-03-10 | Ericsson 美國資料外洩，第三方服務供應商遭入侵 | BleepingComputer | 高 |
| 2026-03-06 | CERT.hr 警告克羅埃西亞公司遭偽造網站攻擊 | CERT.hr | 中 |
| 2026-03-07 | 斯洛伐克行動應用惡意程式針對當地消費者 | SK-CERT | 中 |
| 2026-03-07 | 斯洛伐克 WhatsApp 詐騙冒充訊息活動持續 | SK-CERT | 中 |
| 2026-03-07 | 斯洛伐克 VoZP 健保釣魚簡訊 (Smishing) 攻擊 | SK-CERT | 中 |
| 2026-03-07 | Cisco IOS XE 零日主動利用警告（SK-CERT 緊急通報） | SK-CERT | 高 |
| 2026-03-09 | NUKIB 捷克 2 月網路事件概覽發布 | NUKIB | 中 |
| 2026-03-12 | KongTuke ClickFix 利用受感染 WordPress 網站散布惡意軟體，ClickFix 社交工程技術在 2025-2026 年間快速增長 | Trend Micro MDR | 高 |
| 2026-03-12 | 芬蘭大規模詐騙浪潮警報 | NCSC-FI | 中 |
| 2026-03-12 | SANS ISC IoT 設備管理登入安全分析 | SANS ISC | 中 |
| 2026-03-12 | Meta 清除數百萬詐騙廣告 | Meta / NCSC-FI | 中（正面） |
| 2026-03-13 | Handala（Void Manticore）破壞性攻擊分析：宣告七大科技巨頭為「合法目標」 | Google Threat Intelligence | 極高 |
| 2026-03-13 | Operation Lightning 打擊 SocksEscort 住宅代理網路（34 網域、23 伺服器、$3.5M 加密貨幣） | 國際執法聯合 | 高（正面） |
| 2026-03-13 | Viking Line 芬蘭渡輪業者分包商遭入侵，預訂客戶資料外洩 | NCSC-FI | 中 |
| 2026-03-13 | React-based 釣魚：利用 React 應用程式進行憑證竊取 | SANS ISC | 中 |
| 2026-03-13 | Verifone 資料外洩宣稱（伊朗駭客主義者，爭議中） | 安全研究報告 | 低（未驗證） |
| 2026-03-13 | SANS ISC Zombie ZIP（CVE-2026-0866）分析 | SANS ISC | 中 |

---

## 2.2 漏洞趨勢分析

### 本週漏洞概覽

本週漏洞追蹤系統收錄資料概覽：

- **vulnerability_tracking 累積收錄**（2026 年度）：Critical/High 8,246 筆、Medium 9,632 筆、Low/Info 3,894 筆
- **W11 新增 Critical/High**：73 筆
- **exploit_intelligence 累積**：活躍利用 59 筆 + PoC 可用 2,347 筆
- **security_news_facts/vulnerability_disclosure**：W11 新增 79 個漏洞揭露報告

#### 嚴重程度分布

| 嚴重程度 | 2026 年度累積 | 佔比 |
|----------|-------------|------|
| Critical/High | 8,246 | 37.9% |
| Medium | 9,632 | 44.2% |
| Low/Info | 3,894 | 17.9% |

**趨勢觀察**：2026 年度至今已累積超過 21,000 個漏洞追蹤項目，增長速度維持高位。本週新增 28 筆 Critical/High 漏洞公告，涵蓋 Apple（AV26-233）、Fortinet、GitHub（AV26-230）、Chrome、HPE（AV26-234）、Mozilla Firefox、Cisco IOS XR、Erlang/OTP、GitLab、F5OS、Splunk、Veeam、Zoom 及多個 NCSC-NL advisories（0087-0098）。Google 2025 年零日回顧（2026-03-06）確認企業技術零日利用佔比（48%）創歷史新高，邊緣裝置和安全設備為重點攻擊目標。Cisco Talos 2025 年 CVE 回顧報告（2026-03-07）顯示全年 48,196 個 CVE（每日 132 個），KEV 數量 241 個較 2024 年增長 30%。Kaspersky Q4 2025 報告確認為歷史上最密集的高影響漏洞揭露季度。

### CISA KEV 更新

本週 CISA 新增至 KEV 目錄：

**2026-03-05 批次**：
- 新增 5 個已知遭利用漏洞，包含 CVE-2025-68461、CVE-2025-64328、CVE-2025-40536、CVE-2026-20127、CVE-2026-25108

**2026-03-09~11 批次**：
- **CVE-2021-22054**（VMware Workspace ONE Access SSRF）：2021 年漏洞首次確認遭活躍利用，時隔 5 年
- **CVE-2025-26399**（SolarWinds Web Help Desk 反序列化 RCE）：修補截止日 **2026-03-12**（緊急）
- **CVE-2026-22719**（Broadcom VMware Aria Operations 命令注入）：Critical，未經認證遠端 RCE

**2026-03-13 批次**：
- **n8n RCE**：CISA 將 n8n 工作流程自動化平台 RCE 漏洞新增至 KEV，確認遭積極利用。n8n 廣泛用於企業自動化工作流程，遭利用後攻擊者可在自動化平台上執行任意程式碼，進而存取整合的第三方服務和敏感資料

### 重點漏洞詳述

**CVE-2026-1731（BeyondTrust RS/PRA, Critical）**
- OS 命令注入漏洞，已確認被勒索軟體利用
- 影響遠端存取基礎設施，遭利用後可直接取得特權存取
- **建議：立即修補**

**CVE-2025-26399（SolarWinds Web Help Desk, Critical）**
- 不受信任資料反序列化，可導致遠端程式碼執行
- 修補截止日為 2026-03-12（**今日到期**）
- **建議：緊急修補**

**FortiCloud SSO 繞過（CVE-2025-59718/59597）**
- 多家安全機構報告 FortiGate 設備遭長期潛伏攻擊
- 攻擊者利用 FortiCloud SSO 繞過建立持久後門，收集 LDAP 連線字串
- 部分受影響設備的入侵可追溯至 2024 年
- CISA 與合作夥伴已發布聯合指導（來源：CERT-NZ / NCSC / CISA, 2026-01-22 至 03-05）

**n8n 工作流程自動化 RCE（CISA KEV, 2026-03-13）**
- n8n 為流行的工作流程自動化工具，企業常用於整合多個 SaaS 服務
- 遭利用後攻擊者可存取所有已整合的第三方服務憑證和資料
- **建議：立即修補**，已確認遭積極利用

**CERT-FR 批次漏洞公告（2026-03-12~13）**
- Apple 產品多個漏洞、Cisco IOS XR、GitLab、GLPI RCE、Chrome、Edge、Microsoft 產品、Palo Alto Networks、Splunk、Veeam Backup
- 涉及多個企業核心基礎設施組件
- **建議：參照 CERT-FR 公告逐一評估修補優先級**

**Zombie ZIP（CVE-2026-0866, SANS ISC 分析, 2026-03-13）**
- SANS ISC 分析 Zombie ZIP 漏洞利用技術
- 利用 ZIP 檔案格式特性進行攻擊

**Cisco FMC/SCC 雙 CVSS 10.0（CVE-2026-20079、CVE-2026-20131）**
- 影響 Cisco Secure Firewall Management Center 與 Security Cloud Control
- 防火牆管理平台遭入侵將導致整體網路安全架構崩潰
- CERT-SE、CERT-RO 均發布緊急通報

**pac4j JWT 認證繞過（CVE-2026-29000, CVSS 10.0）**
- Java pac4j-jwt 框架完全認證繞過
- 攻擊者僅需 RSA 金鑰對即可偽造 JWT 冒充任意使用者

### 按廠商/產品分布

| 廠商/產品 | 公告數量 | 嚴重程度 | 備註 |
|-----------|----------|----------|------|
| **BeyondTrust** | 1 (KEV) | Critical | CVE-2026-1731 RS/PRA OS 命令注入，勒索軟體利用 |
| **SolarWinds** | 1 (KEV) | Critical | CVE-2025-26399 Web Help Desk 反序列化 RCE |
| **VMware/Broadcom** | 2 | Critical | CVE-2026-22719 Aria Operations、CVE-2021-22054 Workspace ONE |
| **Fortinet** | 2+ | Critical | FortiCloud SSO 繞過，FortiGate 持久後門 |
| **Cisco** | 5+ | Critical | FMC/SCC 雙 10.0、SD-WAN 積極利用 |
| **n8n** | 1 (KEV) | Critical | 工作流程自動化 RCE，**CISA KEV 2026-03-13** |
| **Apple** | 1+ (AV26-233) | High-Critical | CERT-FR 多漏洞公告 |
| **GitHub** | 1 (AV26-230) | High | Critical/High 漏洞公告 |
| **Chrome/Edge** | 2+ | High | CERT-FR 公告 |
| **GitLab** | 1+ | High | CERT-FR 公告 |
| **Erlang/OTP** | 1+ | High | Critical/High 漏洞 |
| **F5OS** | 1+ | High | Critical/High 漏洞 |
| **Splunk** | 1+ | High | CERT-FR 公告 |
| **Veeam Backup** | 1+ | High | CERT-FR 公告 |
| **Palo Alto Networks** | 1+ | High | CERT-FR 公告 |
| **Mozilla Firefox** | 1+ | High | Critical/High 漏洞 |
| **Zoom** | 1+ | High | Critical/High 漏洞 |
| **Microsoft** | 8+ | High | Patch Tuesday + Edge + CERT-FR 公告 |
| **HPE** | 1+ (AV26-234) | High | HPE Aruba AOS-CX 認證繞過 |
| **Johnson Controls** | 1 | High | Frick Controls Quantum HD ICS |
| **Pelco** | 1 | High | Sarix Pro 3 IP 攝影機 |
| **Zyxel** | 1 | High | CVE-2025-13942（CERT-RO） |
| **Honeywell** | 1 | High | CVE-2026-3611 IQ4x BMS 控制器 |
| **EV 充電基礎設施** | 6+ | 中-高 | Chargemap、CloudCharge、EV Energy 等 |
| **SPIP / Juniper** | 多個 | 中-高 | CERT-FR 公告 |

### ICS/OT 漏洞

- **Johnson Controls Frick Controls Quantum HD**：工業冷凍控制系統漏洞
- **Pelco Sarix Pro 3 Series IP 攝影機**：監控系統漏洞（結合 IP 攝影機入侵戰爭化趨勢尤為重要）
- **Honeywell IQ4x BMS 控制器**（CVE-2026-3611）：建築管理系統漏洞
- **Lantronix EDS 序列設備伺服器**：認證繞過與 Root 權限 RCE，工業序列設備伺服器遭入侵可作為 OT 跳板
- **EV 充電基礎設施**：6+ 個平台漏洞（Chargemap、CloudCharge、EV Energy、EV2GO、Mobility46、Switch EV），凸顯新興能源基礎設施安全風險

**Qdrant 跨層關聯分析**：語意查詢「critical vulnerability actively exploited zero-day CVE 2026」回傳 5 筆結果（Chrome CVE-2026-2441、Cisco CVE-2026-20045、MS Office CVE-2026-21509），確認 BeyondTrust、SolarWinds、Fortinet、n8n 等關鍵基礎設施軟體的漏洞修補具有最高優先級。本週 CISA 新增 n8n 至 KEV 進一步擴大了需緊急修補的範圍。

---

## 2.3 活躍利用與 PoC 動態

### CISA KEV 本週更新

| 日期 | CVE | 產品 | 漏洞類型 | 嚴重程度 |
|------|-----|------|----------|----------|
| 2026-03-05 | CVE-2025-68461 | 待確認 | 待確認 | High+ |
| 2026-03-05 | CVE-2025-64328 | 待確認 | 待確認 | High+ |
| 2026-03-05 | CVE-2025-40536 | 待確認 | 待確認 | High+ |
| 2026-03-05 | CVE-2026-20127 | 待確認 | 待確認 | High+ |
| 2026-03-05 | CVE-2026-25108 | 待確認 | 待確認 | High+ |
| 2026-03-09 | CVE-2021-22054 | VMware Workspace ONE Access | SSRF | High |
| 2026-03-09 | CVE-2025-26399 | SolarWinds Web Help Desk | 反序列化 RCE | Critical |
| 2026-03-11 | CVE-2026-22719 | VMware Aria Operations | 命令注入 RCE | Critical |
| 2026-03-13 | n8n RCE | n8n 工作流程自動化 | RCE | Critical |

### 積極利用中的漏洞

| 漏洞 | 利用者 | 目標 | 狀態 |
|------|--------|------|------|
| CVE-2026-1731 (BeyondTrust RS/PRA) | 勒索軟體行為者 | 遠端存取基礎設施 | CISA KEV，**積極利用於勒索攻擊** |
| CVE-2025-26399 (SolarWinds WHD) | 不明 | IT 服務管理系統 | CISA KEV，修補截止 **2026-03-12** |
| CVE-2021-22054 (VMware WS ONE) | 不明 | 身分認證基礎設施 | 2021 年漏洞，時隔 5 年首次確認活躍利用 |
| CVE-2025-59718/59597 (FortiCloud SSO) | 國家級行為者（推測） | FortiGate 設備 | 持久後門，部分入侵追溯至 2024 年 |
| CVE-2026-22719 (VMware Aria) | 不明 | VMware Aria Operations | CISA KEV，Critical |
| n8n RCE | 不明 | 工作流程自動化平台 | **CISA KEV 2026-03-13**，可存取整合服務憑證 |
| Cisco SD-WAN 零日 | 國家級行為者（推測） | 企業 WAN 基礎設施 | CISA 聯合指導已發布 |

### 新公開 PoC / Exploit 動態

本週 exploit_intelligence Layer 新增 **14 個**檔案：

**活躍利用類別（2 個）**：
- **CVE-2021-22054**（VMware Workspace ONE Access SSRF）
- **CVE-2025-26399**（SolarWinds Web Help Desk 反序列化 RCE）

**新公開 PoC（12 個）**：

| CVE / 識別符 | 目標 | 類型 | 風險評估 |
|-------------|------|------|----------|
| CVE-2026-27944 | Nginx UI | RCE（CVSS 9.8） | 高 |
| CVE-2026-27971 | 待確認 | PoC 公開 | 高 |
| CVE-2026-10681 | 待確認 | PoC 公開 | 中-高 |
| CVE-2026-11001 | 待確認 | PoC 公開 | 中-高 |
| CVE-2026-21436 | 待確認 | PoC 公開 | 中-高 |
| CVE-2026-22785 | 待確認 | PoC 公開 | 中-高 |
| CVE-2026-23885 | 待確認 | PoC 公開 | 中-高 |
| CVE-2026-2750 / 2751 | 待確認 | 批次 PoC | 中 |
| CVE-2026-27637 | 待確認 | PoC 公開 | 中 |
| CVE-2026-2848 | 待確認 | PoC 公開 | 中 |
| CVE-2022-1453 | 歷史漏洞 | PoC 更新 | 低-中 |
| CVE-2025-48281 | 待確認 | PoC 公開 | 中 |

**Exploit-DB 新增重點**：

| Exploit | 目標 | 類型 |
|---------|------|------|
| aiohttp 3.9.1 | Web 框架 | Path Traversal |
| D-Link DIR-825 2.10 | 路由器 | Stack Buffer Overflow DoS |
| Docker Desktop 4.44.3 | 容器平台 | API Exposure |
| ingress-nginx v1.11.1 | Kubernetes | FD Injection RCE |
| WP Backup Migration 1.3.7 | WordPress | RCE |
| phpIPAM 1.5.1 / 1.6 | IP 管理 | SQLi / XSS |
| phpMyFAQ 2.9.8 / 3.1.7 | FAQ 系統 | CSRF / XSS |
| Piwigo 13.6.0 | 相簿管理 | SQLi |
| PluckCMS 4.7.7-dev2 / 4.7.10 | CMS | PHP Code Exec / File Upload |
| Windows Server 2025 Hyper-V | 虛擬化 | EoP |
| FreeBSD rtsold 15 | 作業系統 | RCE |

**風險提示**：PoC 公開後 24-72 小時內為攻擊者大規模掃描的高峰窗口。建議優先修補已有 PoC 的漏洞，特別是 CVE-2026-27944（Nginx UI RCE, CVSS 9.8）和 ingress-nginx FD Injection RCE。

### PoC 與活躍利用交叉分析

| CVE | PoC 狀態 | 活躍利用 | 風險評估 |
|-----|----------|----------|----------|
| CVE-2026-1731 | Exploit available | **勒索軟體** | **極高** — 立即修補 |
| CVE-2025-26399 | PoC available | **已確認** | **極高** — 修補截止今日 |
| CVE-2021-22054 | Public exploit | **已確認** | **高** — 歷史漏洞持續利用 |
| CVE-2026-27944 | PoC just published | 監控中 | **高** — CVSS 9.8 |
| n8n RCE | Exploit available | **已確認** | **極高** — CISA KEV 2026-03-13 |
| CVE-2026-27971 | PoC just published | 監控中 | **高** — PoC 公開後利用機率上升 |

---

## 2.4 攻擊手法歸納

### ATT&CK 技術分布

基於本週 176 筆 security_news_facts（W11）、14 筆 exploit_intelligence 和 threat_feeds 資料，歸納攻擊手法如下：

#### 初始存取 (Initial Access)

| TTP | 技術名稱 | 本週事件數 | 代表性案例 |
|-----|----------|-----------|-----------|
| <a href="https://attack.mitre.org/techniques/T1566/" class="ttp-badge" target="_blank">T1566</a> | Phishing | 12+ | Tycoon 2FA PhaaS、Teams 釣魚 A0Backdoor、LastPass 釣魚、芬蘭稅務釣魚 |
| <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a> | Spearphishing Attachment | 5+ | 偽造求職信 → EDR 殺手、簽署惡意軟體偽裝工作場所 App、APT28 BEARDSHELL |
| <a href="https://attack.mitre.org/techniques/T1566/002/" class="ttp-badge" target="_blank">T1566.002</a> | Spearphishing Link | 4+ | 偽造 GitHub 存儲庫、InstallFix 惡意廣告、Camaro Dragon PlugX 誘餌 |
| <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> | Exploit Public-Facing Application | 8+ | CVE-2026-1731 BeyondTrust、CVE-2025-26399 SolarWinds、FortiCloud SSO、Cisco SD-WAN、Cisco FMC |
| <a href="https://attack.mitre.org/techniques/T1195/" class="ttp-badge" target="_blank">T1195</a> | Supply Chain Compromise | 4+ | NPM 大規模感染（26 億/週下載）、偽造 GitHub 安裝器（GhostSocks）、BoryptGrab 100+ repos、Ericsson 供應商入侵 |
| [T1556](https://attack.mitre.org/techniques/T1556/){: .ttp-ref } | Modify Authentication Process | 3+ | Tycoon 2FA MFA 繞過、FortiCloud SSO 繞過、pac4j JWT 繞過 |
| [T1078](https://attack.mitre.org/techniques/T1078/){: .ttp-ref } | Valid Accounts | 4+ | Signal/WhatsApp 帳號劫持、Salesforce Guest Account 濫用 |

#### 執行 (Execution)

| TTP | 技術名稱 | 本週事件數 | 代表性案例 |
|-----|----------|-----------|-----------|
| <a href="https://attack.mitre.org/techniques/T1059/" class="ttp-badge" target="_blank">T1059</a> | Command and Scripting Interpreter | 6+ | BEARDSHELL (PowerShell)、Dindoor (Deno JS)、COVENANT C2、Havoc C2、BeyondTrust OS 命令注入、Wikipedia JS 蠕蟲 |
| [T1204.002](https://attack.mitre.org/techniques/T1204/002/){: .ttp-ref } | User Execution: Malicious File | 5+ | 偽造求職文件、簽署惡意軟體、偽造 GitHub 安裝器、衝突主題 PDF 誘餌、BadPaw ZIP |

#### 持久性 (Persistence)

| TTP | 技術名稱 | 本週事件數 | 代表性案例 |
|-----|----------|-----------|-----------|
| <a href="https://attack.mitre.org/techniques/T1219/" class="ttp-badge" target="_blank">T1219</a> | Remote Access Software | 4+ | 簽署 RMM 後門、BeyondTrust PRA 利用、Quick Assist 遠端存取、Havoc C2 |
| <a href="https://attack.mitre.org/techniques/T1176/" class="ttp-badge" target="_blank">T1176</a> | Browser Extensions | 2+ | 惡意 AI 助手擴充（90 萬安裝、2 萬+企業租戶） |
| [T1102](https://attack.mitre.org/techniques/T1102/){: .ttp-ref } | Web Service | 3+ | BEARDSHELL/COVENANT 雲端 C2、APT36 Slack/Discord/Supabase C2 |

#### 防禦規避 (Defense Evasion)

| TTP | 技術名稱 | 本週事件數 | 代表性案例 |
|-----|----------|-----------|-----------|
| [T1562.001](https://attack.mitre.org/techniques/T1562/001/){: .ttp-ref } | Disable or Modify Tools | 2+ | 偽造求職信 → EDR 殺手 |
| [T1553.002](https://attack.mitre.org/techniques/T1553/002/){: .ttp-ref } | Code Signing | 2+ | EV 憑證簽署惡意軟體（TrustConnect）、Seedworm Dindoor 數位簽署（Amy Cherne） |
| [T1027](https://attack.mitre.org/techniques/T1027/){: .ttp-ref } | Obfuscated Files or Information | 2+ | Stealth Packer、APT36 Nim/Zig/Crystal 冷門語言 |

#### 命令與控制 (C2)

| TTP | 技術名稱 | 本週事件數 | 代表性案例 |
|-----|----------|-----------|-----------|
| <a href="https://attack.mitre.org/techniques/T1071/" class="ttp-badge" target="_blank">T1071</a> | Application Layer Protocol | 5+ | COVENANT C2、Empire Downloader、AsyncRAT、APT36 多平台 C2 |
| [T1583.001](https://attack.mitre.org/techniques/T1583/001/){: .ttp-ref } | Acquire Infrastructure: Domains | 大量 | **2,159 個新惡意 URL**、8,000+ 中東衝突相關新網域 |
| [T1090.003](https://attack.mitre.org/techniques/T1090/003/){: .ttp-ref } | Multi-hop Proxy | 2+ | Kadnap Kademlia DHT P2P 殭屍網路、BruteEntry ORB 節點、GhostSocks 流量代理 |
| [T1095](https://attack.mitre.org/techniques/T1095/){: .ttp-ref } | Non-Standard Protocol | 1+ | PeerTime（BitTorrent C2 協定） |

#### 影響 (Impact)

| TTP | 技術名稱 | 本週事件數 | 代表性案例 |
|-----|----------|-----------|-----------|
| <a href="https://attack.mitre.org/techniques/T1498/" class="ttp-badge" target="_blank">T1498</a> | Network Denial of Service | 149+ | 駭客主義 DDoS（16 國、110 組織、60 團體） |
| <a href="https://attack.mitre.org/techniques/T1486/" class="ttp-badge" target="_blank">T1486</a> | Data Encrypted for Impact | 多起 | 勒索軟體利用 CVE-2026-1731、LockBit 5.0 跨平台 |
| [T1485](https://attack.mitre.org/techniques/T1485/){: .ttp-ref } | Data Destruction | 2+ | Handala/Void Manticore Wiper 攻擊、Stryker Wiper |
| [T1021](https://attack.mitre.org/techniques/T1021/){: .ttp-ref } | Remote Services | 3+ | BeyondTrust PRA 利用、Quick Assist 遠端存取濫用 |

### 攻擊類型統計

| 攻擊類型 | 事件數 | 較上週 (W10) 變化 | 趨勢 |
|----------|--------|-------------------|------|
| 釣魚 / 社交工程 | 15+ | ↑ 顯著增加 | Teams/Signal/WhatsApp 新通道 |
| APT 間諜行動 | 8+ | → 持平高位 | 三個中國 APT 同步揭露 |
| 資料竊取與勒索 | 8+ | ↑ 增加 | Salesforce 大規模攻擊 |
| DDoS / 駭客主義 | 149+ | → 持續 | 中東衝突驅動 |
| 勒索軟體 | 多起 | ↑ | BeyondTrust 漏洞武器化 |
| 供應鏈攻擊 | 4+ | → 持平 | NPM + GitHub 多向量 |
| 殭屍網路 / IoT | 3+ | → 持平 | Kadnap 14K 路由器 |

### IoC 趨勢（abuse.ch 資料）

本週 threat_feeds Layer 新增 **852 個**檔案：

| 類別 | 本週新增 | 關鍵指標 | 趨勢 |
|------|----------|----------|------|
| 惡意 URL | **2,159** | URLhaus 新增惡意 URL | **↑ 顯著增長**（與中東衝突相關） |
| C2 基礎設施 | 持續增長 | Feodo Tracker、AsyncRAT、Empire Downloader | → 穩定活躍 |
| 惡意軟體樣本 | 持續增長 | Mozi 殭屍網路、Phantom Stealer | ↑ 增長 |
| IoC 指標 | 持續增長 | ThreatFox 多家族 C2 指標 | → 穩定 |

**Qdrant 跨層關聯分析**：語意查詢「IoC malicious URL C2 infrastructure botnet」回傳 Mozi 殭屍網路 URL、ThreatFox C2 指標、Phantom Stealer 等結果，確認 Mozi 殭屍網路下載 URL 仍活躍，竊密軟體家族 C2 基礎設施持續擴展。2,159 個新增惡意 URL 的顯著增長與中東衝突升級帶來的惡意網域註冊潮直接相關。

### 惡意軟體家族觀察（本週重點）

| 家族 | 類型 | 狀態 | 備註 |
|------|------|------|------|
| **A0Backdoor** | 後門 | **新發現** | Teams 釣魚投遞，針對金融/醫療 |
| **BEARDSHELL** | PowerShell 後門 | **新發現** | APT28 針對烏克蘭政府 |
| **COVENANT** | C2 框架 | 新用途 | APT28 雙植入架構 C2 通訊 |
| **Dindoor** | 後門 (Deno) | **新發現** | Seedworm 使用 Deno runtime |
| **TernDoor** | Windows 後門 | **新發現** | UAT-9244 針對南美電信 |
| **PeerTime** | Linux 後門 | **新發現** | 利用 BitTorrent C2 |
| **BruteEntry** | 掃描器/ORB | **新發現** | 邊緣裝置轉 ORB 節點 |
| **BeatBanker** | Android 銀行木馬 | **新發現** | 巴西目標，兼具挖礦功能 |
| **BoryptGrab** | 竊密軟體 | 活躍 | 100+ GitHub 存儲庫分發 |
| **Kadnap** | IoT 殭屍網路 | 活躍 | 14,000 ASUS 路由器，DHT P2P |
| **PlugX** | RAT | 持續 | Camaro Dragon 針對卡達 |
| **GhostSocks** | 代理/反偵測 | 活躍 | OpenClaw 偽造安裝器分發 |
| **Mozi** | IoT 殭屍網路 | 持續 | 下載 URL 仍活躍（threat_feeds） |
| **Phantom Stealer** | 竊密軟體 | 活躍 | C2 指標持續增長（ThreatFox） |
| **KongTuke/ClickFix** | 社交工程惡意軟體投遞 | 活躍 | 受感染 WordPress 站點散布，2025-2026 快速增長 |
| **Handala/Void Manticore Wiper** | 破壞性 Wiper | 活躍 | 伊朗 MOIS 關聯，hack-and-leak + 資料銷毀 |
| **React-based Credential Stealer** | 釣魚/竊密 | 新觀察 | SANS ISC 報告，利用 React 應用程式竊取憑證 |

**Qdrant 跨層關聯分析**：語意查詢「ransomware malware trojan new variant 2026」回傳 5 筆結果（SalatStealer、加拿大勒索軟體展望 2025-2027），確認勒索軟體和竊密軟體家族持續演進。社交工程攻擊（特別是針對企業通訊平台 Teams、Signal、WhatsApp 的攻擊以及 React-based 釣魚）和殭屍網路驅動的 DDoS 活動為本週並行的兩大威脅主軸。

---

## 2.5 新興威脅識別

### 1. 企業通訊平台成為釣魚新前線——Teams、Signal、WhatsApp 同步遭攻擊

**信心水準：高 | 首次大規模觀察：本週**

本週三起獨立但趨勢一致的事件，共同揭示企業通訊平台正全面成為初始存取的替代通道：

1. **Microsoft Teams 釣魚 → A0Backdoor**：攻擊者利用 Teams 外部訊息功能繞過傳統郵件安全閘道，部署全新後門（2026-03-11）
2. **俄羅斯 Signal/WhatsApp 帳號劫持**：荷蘭情報單位警告大規模攻擊全球政府官員（2026-03-10）
3. **芬蘭 Telegram 帳號劫持**：透過未設密碼語音信箱取得驗證碼接管帳號（2026-03-10）

**分析判斷**：多數組織的安全監控集中於電子郵件，而 Teams/Slack/Signal/WhatsApp 訊息缺乏同等級別的內容掃描和釣魚偵測。隨著混合工作模式普及和端對端加密通訊的廣泛採用，這些平台正成為「安全盲區」。CERT-SE 已發布通訊 App 安全建議（2026-03-09），反映此威脅的緊迫性。

**建議**：將企業通訊平台納入與電子郵件同等的安全監控範圍；為通訊 App 啟用強密碼和兩步驟驗證。

### 2. AI 在網路威脅生態系統中角色的質變

**信心水準：高**

本週多起事件和報告共同指向 AI 在網路威脅生態系統中的三重角色轉變：

- **AI 作為攻擊工具**：APT36 的「Vibeware」模式——以 AI 驅動快速量產惡意軟體，使用冷門語言規避偵測（Bitdefender, 2026-03-06）
- **AI 作為攻擊目標**：惡意 AI 助手擴充功能竊取 ChatGPT/DeepSeek 對話記錄（90 萬安裝、2 萬+企業租戶）；Chrome Gemini 漏洞（Microsoft / Unit 42, 2026-03-06/03）
- **AI 安全控制可被繞過**：LLM 安全閘道「AI 法官」可被模糊測試繞過（2026-03-11）

**跨事件關聯**：Microsoft「AI as Tradecraft」報告（2026-03-07）、Google「AI assistants moving security goalposts」（2026-03-10）、六國「AI/ML 供應鏈安全聯合指導」（2026-03-05）、「Top 10 AI Security Actions」（2026-03-05）——國際社群對 AI 安全風險的認知正從「理論探討」轉向「實戰防禦」。

### 3. SaaS 平台共享基礎設施的系統性風險

**信心水準：高（攻擊模式確認）/ 中（受害範圍待驗證）**

本週 ShinyHunters Salesforce 攻擊（宣稱 ~100 企業）和 Salesforce Guest Account 勒索攻擊同時出現，暴露 SaaS 多租戶架構中**預設開放配置**的系統性風險：

- Salesforce 社群入口的 Guest User 權限在許多部署中被忽略或錯誤配置
- 公開可存取的端點可直接查詢內部資料物件
- Salesforce 確認非平台漏洞而是客戶配置問題——但大量企業的配置錯誤本身構成系統性風險

**推測**（標註為推測性評估）：此類攻擊手法可能被複製到其他主要 SaaS 平台（ServiceNow、Dynamics 365 等），其中共享基礎設施和預設配置可能存在類似弱點。

### 4. P2P DHT 架構殭屍網路的成熟化

**信心水準：高**

Kadnap 殭屍網路使用 Kademlia DHT 協定建立 P2P C2 架構，代表殭屍網路技術的重大演進：

- **去中心化韌性**：無單一 C2 伺服器可供拆除，傳統 C2 打擊策略失效
- **IP 遮蔽**：攻擊者基礎設施 IP 完全隱藏在 DHT 網路中
- **規模驗證**：14,000+ ASUS 路由器感染，證明此架構可大規模運作

**Qdrant 歷史比對**：語意搜尋確認 Mozi 殭屍網路此前已使用類似 DHT 架構，Kadnap 的出現確認此技術路線正被更多攻擊者採用，將增加未來殭屍網路拆除行動的難度。

### 5. 國家—犯罪邊界的持續模糊化

**信心水準：高**

本週多個事件反映國家級行為者與犯罪生態系統的融合加速：

- **伊朗 MOIS**：使用犯罪工具和基礎設施追求國家目標，提供可否認性（Check Point, 2026-03-11）
- **Seedworm**：使用商業化簽署憑證與 Deno runtime（非傳統 APT 工具鏈）
- **俄羅斯「Morningstar」**：以駭客主義為名進行混合影響力行動（芬蘭攝影機監視宣稱）
- **Scattered Spider / LAPSUS$ 獵人聯盟**：安全研究報告揭露駭客聯盟的組織化趨勢（2026-09-30）

**分析**：基於工具特徵的歸因分析日益困難。防禦方需從「誰在攻擊」轉向「攻擊行為模式」的偵測思維。

### 6. 反 EDR 能力的商品化

**信心水準：中**

本週偽造求職信惡意軟體展示在資料竊取前先停用 EDR 的能力，結合近期多個攻擊案例（Terminator 驅動程式攻擊、BYOVD 技術），反 EDR 能力正從 APT 專屬工具普及到一般網路犯罪。EDR 殺手模組包裝在日常社交工程場景（求職信）中，降低了攻擊門檻。

### 7. 全球網路攻擊量維持歷史新高

**信心水準：高**

多方數據共同確認此趨勢：

- NCSC-FI：2026 年 2 月全球網路攻擊量創歷史新高（2026-03-11）
- Check Point：拉丁美洲每週 ~3,100 次攻擊，為美國（~1,500 次/週）的兩倍多；2025 年拉美年增 53%
- Google 零日回顧：企業技術零日利用（43 個，48%）創歷史新高
- Kaspersky：Q4 2025 為歷史上最密集的高嚴重漏洞揭露季度之一

**趨勢判斷**：2026 年上半年的威脅態勢為**有記錄以來最嚴峻的時期之一**，地緣衝突、AI 武器化和攻擊工具商品化為主要驅動力。

---

## 產業動態與政策法規補充

### Google 2025 年零日回顧（Patch, Track, Repeat）

Google 發布 2025 年零日利用年度回顧（2026-03-07），關鍵數據：

- 企業技術零日利用數量（43 個）和佔比（48%）均創歷史新高
- 瀏覽器漏洞利用降至歷史低點，作業系統漏洞利用增加
- 國家支持間諜組織優先攻擊**邊緣裝置和安全設備**，超過一半的歸因利用集中於此類技術
- 商業監控廠商 (CSV) 持續關注行動和瀏覽器漏洞利用

### Q4 2025 漏洞與利用回顧

Kaspersky Securelist（2026-03-07）報告 2025 年 Q4 為歷史上最密集的高影響漏洞揭露期之一，多個熱門程式庫的嚴重漏洞在揭露後幾乎立即被攻擊者利用。

### Encrypted Client Hello (ECH) 評估

安全研究報告（2026-03-09）評估加密客戶端問候（ECH）的企業就緒度。ECH 加密 TLS 握手中的 SNI 欄位增強隱私，但對企業基於 SNI 的流量檢測和 URL 過濾構成挑戰。

### AI 安全指導

- **六國聯合指導**（2026-03-05）：加拿大、澳洲、日本、紐西蘭、韓國、新加坡發布「AI/ML 供應鏈風險與緩解措施」
- **Top 10 AI Security Actions**（2026-03-05）：實用 AI 安全入門指南
- **AI as Tradecraft**（2026-03-07）：威脅行為者如何將 AI 作為加速器和武器
- **AI 安全閘道模糊測試**（2026-03-11）：LLM 安全限制可被繞過
- **AI 助手安全議題**（2026-03-10）：AI 工具普及正重新定義安全邊界

### 政策法規動態

| 事件 | 來源 | 日期 | 要點 |
|------|------|------|------|
| EU 法院顧問意見：銀行須即時退款釣魚受害者 | CJEU / BleepingComputer | 03-09 | 除非銀行有「合理理由懷疑詐欺」，否則須立即退款 |
| 澳洲 18+ 網站年齡驗證法 | NCSC-FI | 03-10 | 強制年齡驗證，涉及身分驗證技術和隱私 |
| AI/ML 供應鏈安全聯合指導 | 加拿大 Cyber Centre + 多國 | 03-05 | 模型訓練資料、第三方元件、部署環境安全 |
| 葡萄牙網路安全法規公眾諮詢 | CNCS PT | 03-10 | 國家網路安全法規徵求公眾意見 |
| NIS2/CRA 實施進展 | 斯洛伐克 Kyber2026 | 03-07 | NIS2 與 CRA 在歐盟的實施討論 |

### 數位主權與雲端信任

芬蘭 NCSC-FI 將美國雲端服務信任問題納入每日資安新聞（2026-03-12），探討歐洲組織依賴美國雲端服務的風險。結合歐盟數位主權政策持續推進，雲端服務提供商的地緣政治風險正成為企業資安策略的新考量維度。

### JPCERT/CC Rust 逆向工程研究

JPCERT/CC（2026-03-12）發布 Rust 編譯二進位檔的逆向工程技術研究，反映越來越多惡意軟體（包括勒索軟體）採用 Rust 語言開發，傳統逆向工程工具和方法面臨新挑戰。此研究與 APT36 使用 Nim、Zig、Crystal 等冷門語言的趨勢一致，攻擊者正系統性地利用非主流語言規避安全分析。

### Meta 大規模詐騙廣告清理

Meta（2026-03-12）宣布清除數百萬筆詐騙廣告，反映社群平台上的詐騙廣告規模已達前所未有的程度。此行動與 NCSC-FI 同日報告的芬蘭大規模詐騙浪潮相互印證。

### NCSC-FI 網路安全戰略管理指引

NCSC-FI（2026-03-12）發布網路安全戰略管理指引，為組織提供將網路安全融入企業治理架構的實務建議。

### CERT-FR 2025 年網路威脅全景報告

CERT-FR（2026-03-11）發布 2025 年度報告（CERTFR-2026-CTI-002），核心發現為國家行為者與網路犯罪集團的界限持續模糊化，使歸因更加複雜。此報告與 Check Point 同週發布的伊朗 MOIS-犯罪關聯分析相互印證。

### 工具與資源

- **YARA-X 1.14.0**（2026-03-07）：新版本發布，改進惡意軟體規則引擎
- **Differentiating Targeted Intrusion vs Opportunistic**（2026-03-05）：區分針對性入侵與機會主義攻擊的實用指南
- **Proactive Preparation Against Destructive Attacks**（2026-03-07）：Google Cloud Threat Intelligence 破壞性攻擊防禦指南
- **CERT-AT lock-the-ghost PyPI 套件移除**（2026-03-10）：惡意 PyPI 套件針對 AI/ML 開發者

---

## 2.6 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資。主要依賴歐洲（NCSC-FI、CERT-FR、SK-CERT、CERT-UA、CERT.hr、CERT-SE、CERT-RO、CERT-LV）和北美（CISA、CCCS）CERT 的 RSS 饋送，對亞太、非洲、拉丁美洲地區的第一手覆蓋程度較低。

2. **時效性**：資料可能存在數小時至數天的延遲。本報告反映截至 2026-03-13 的已公開資訊。

3. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務等來源。

4. **分析局限**：趨勢分析基於公開資料樣本，統計推論應謹慎解讀。

5. **翻譯風險**：部分非英文來源（芬蘭語、瑞典語、克羅埃西亞語、捷克語、斯洛伐克語、羅馬尼亞語、愛沙尼亞語、葡萄牙語）經 AI 翻譯，可能存在語義偏差。

6. **未驗證聲明**：ShinyHunters 受害者名單為攻擊者自稱，已標註為中等信心水準。Verifone 資料外洩宣稱（伊朗駭客主義者）尚有爭議，已標註為低信心水準。

7. **威脅情報歸因**：APT 歸因基於各安全廠商的評估（ESET、Cisco Talos、Check Point、Palo Alto Unit 42、Bitdefender 等），歸因結論可能隨後續調查而調整。CL-UNK-1068 的中國歸因為「高信心」；APT28/Sednit 歸因來自 CERT-UA 與 ESET 的聯合研究。

8. **threat_feeds 統計**：2026 年度累積約 46,000 筆。部分 IoC 和惡意軟體樣本為歷史資料的持續追蹤。

9. **Qdrant 語意查詢**：向量搜尋結果基於語意相似度，可能包含語意相近但時間範圍不同的結果。本報告共執行 9 次語意查詢（原有 6 次 + 更新 3 次），所有結果已標註查詢內容和摘要。

10. **新興威脅**：信心水準評估基於多來源交叉驗證。標註「推測」的內容為分析師基於已知趨勢的推理，非經驗證的事實。

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源。

---

## 附錄：本週 ATT&CK TTP 對照總表

| TTP ID | 技術名稱 | 本週觀察頻率 |
|--------|----------|-------------|
| <a href="https://attack.mitre.org/techniques/T1566/" class="ttp-badge" target="_blank">T1566</a> | Phishing | 高 |
| <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a> | Spearphishing Attachment | 高 |
| <a href="https://attack.mitre.org/techniques/T1566/002/" class="ttp-badge" target="_blank">T1566.002</a> | Spearphishing Link | 高 |
| <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> | Exploit Public-Facing Application | 高 |
| [T1195](https://attack.mitre.org/techniques/T1195/){: .ttp-ref } | Supply Chain Compromise | 中 |
| [T1556](https://attack.mitre.org/techniques/T1556/){: .ttp-ref } | Modify Authentication Process | 中 |
| [T1078](https://attack.mitre.org/techniques/T1078/){: .ttp-ref } | Valid Accounts | 中 |
| <a href="https://attack.mitre.org/techniques/T1059/" class="ttp-badge" target="_blank">T1059</a> | Command and Scripting Interpreter | 中 |
| <a href="https://attack.mitre.org/techniques/T1219/" class="ttp-badge" target="_blank">T1219</a> | Remote Access Software | 中 |
| [T1102](https://attack.mitre.org/techniques/T1102/){: .ttp-ref } | Web Service | 中 |
| <a href="https://attack.mitre.org/techniques/T1498/" class="ttp-badge" target="_blank">T1498</a> | Network Denial of Service | 高（149+ 事件） |
| <a href="https://attack.mitre.org/techniques/T1486/" class="ttp-badge" target="_blank">T1486</a> | Data Encrypted for Impact | 中 |
| [T1485](https://attack.mitre.org/techniques/T1485/){: .ttp-ref } | Data Destruction | 低-中（Handala/Void Manticore Wiper） |
| [T1562.001](https://attack.mitre.org/techniques/T1562/001/){: .ttp-ref } | Disable or Modify Tools | 低 |
| [T1553.002](https://attack.mitre.org/techniques/T1553/002/){: .ttp-ref } | Code Signing | 低 |
| [T1027](https://attack.mitre.org/techniques/T1027/){: .ttp-ref } | Obfuscated Files or Information | 低 |
| <a href="https://attack.mitre.org/techniques/T1071/" class="ttp-badge" target="_blank">T1071</a> | Application Layer Protocol | 中 |
| [T1583.001](https://attack.mitre.org/techniques/T1583/001/){: .ttp-ref } | Acquire Infrastructure: Domains | 高（2,159 新惡意 URL） |
| [T1090.003](https://attack.mitre.org/techniques/T1090/003/){: .ttp-ref } | Multi-hop Proxy | 低 |
| [T1021](https://attack.mitre.org/techniques/T1021/){: .ttp-ref } | Remote Services | 低 |
| <a href="https://attack.mitre.org/techniques/T1176/" class="ttp-badge" target="_blank">T1176</a> | Browser Extensions | 低 |

---

> 本報告由資訊安全產業智慧分析系統自動產出，資料來源涵蓋 NCSC-FI、CERT-UA、CERT-FR、SK-CERT、CERT.hr、CERT-SE、CERT-RO、CERT-LV、CISA、CCCS、JPCERT/CC、SANS ISC、abuse.ch (MalwareBazaar/ThreatFox/URLhaus/Feodo Tracker) 等國際安全機構與開源情報饋送。Qdrant 語意查詢用於跨 Layer 關聯分析，共執行 9 次查詢。2026 年度資料累積涵蓋 security_news_facts 493+ 筆、vulnerability_tracking 21,772 筆、exploit_intelligence 2,406 筆、threat_feeds 約 46,000 筆。涵蓋期間更新至 2026-03-13，包含 Handala（Void Manticore）威脅分析、Operation Lightning 執法行動、CISA n8n KEV 更新、Viking Line 資料外洩、28 筆新增 Critical/High 漏洞等最新事件。
