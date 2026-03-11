---
layout: seo-report
last_modified_at: 2026-03-11T23:00:00+08:00
title: 2026 第 11 週威脅態勢分析
description: "2026-03-05 至 2026-03-11 資安威脅週報：Sednit/APT28 以 BeardShell+Covenant 雙植入攻擊烏克蘭、Camaro Dragon 以 PlugX 鎖定卡達、ShinyHunters 宣稱 Salesforce 資料大劫案、CISA KEV 新增 8 個活躍利用漏洞、Cisco FMC CVSS 10.0 雙重大漏洞。"
parent: 威脅態勢分析
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-threat-landscape.png
author: 資安情報分析團隊
date: 2026-03-11
---

# 威脅態勢分析 — 2026 第 11 週

> 涵蓋期間：2026-03-05 至 2026-03-11
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-03-11

---

## 執行摘要

本週威脅態勢呈現多國 APT 行動同步活躍、地緣衝突驅動駭客主義激增、以及雲端 SaaS 平台成為大規模資料竊取跳板的三重態勢。重點如下：

**國家級威脅行為者動態**：
- **Sednit/APT28（俄羅斯）**以 BeardShell + Covenant 雙植入架構對烏克蘭軍方進行長期監控，代碼譜系可追溯至 2010 年
- **Camaro Dragon（中國）**在 Operation Epic Fury 啟動後 24 小時內即以 PlugX 攻擊卡達目標，展現地緣事件快速武器化能力
- **UAT-9244（中國）**部署 TernDoor、PeerTime、BruteEntry 三款新惡意軟體攻擊南美電信基礎設施
- **Seedworm/MuddyWater（伊朗）**以全新 Dindoor 後門入侵美國銀行、機場及國防軟體公司
- 荷蘭 AIVD/MIVD 警告**俄羅斯大規模 Signal/WhatsApp 帳號劫持行動**，全球鎖定政府官員
- **APT36（巴基斯坦）**首創「Vibeware」模式——以 AI 驅動快速量產惡意軟體

**網路犯罪與資料洩露**：
- **ShinyHunters** 宣稱透過 Salesforce 平台竊取約 100 家知名企業資料（含 Snowflake、Okta、LastPass）
- **KadNap 殭屍網路**以 Kademlia DHT P2P 架構劫持逾 14,000 台 Asus 路由器
- **Microsoft Teams 釣魚**部署全新 A0Backdoor 攻擊金融與醫療機構

**關鍵漏洞與利用**：
- CISA 本週新增 8 個 KEV，包括 Ivanti EPM 認證繞過（CVE-2026-1603）
- Cisco FMC/SCC 雙 CVSS 10.0 重大漏洞（CVE-2026-20079、CVE-2026-20131）
- FortiClient EMS 預認證 SQL Injection（CVE-2026-21643）
- pac4j JWT 認證繞過 CVSS 10.0（CVE-2026-29000）

---

## 資料來源統計

| Layer | 本週新增 | 說明 |
|-------|----------|------|
| security_news_facts | 138 | 國際資安新聞與事件（48 攻擊事件 + 46 漏洞揭露 + 9 政策法規 + 27 產業趨勢 + 8 其他） |
| exploit_intelligence | 78 | 8 活躍利用 + 70 PoC 公開 |
| threat_feeds | 1,307 | 526 惡意 URL + 141 惡意軟體樣本 + 640 IoC 指標（3/10–3/11） |

> 統計時間：2026-03-11 UTC

---

## 2.1 近期重大資安事件

### 1. Sednit/APT28 以 BeardShell + Covenant 雙植入架構重返烏克蘭戰場

**嚴重程度：High | 來源：ESET Research / NCSC-FI | 日期：2026-03-11**

ESET Research 記錄 Sednit（APT28/Fancy Bear）自 2024 年 4 月起重新啟用高端客製化武器庫，部署全新雙植入架構：

**攻擊技術**：
- **雙植入設計**：BeardShell 與 Covenant 各使用不同雲端供應商進行 C2 通訊，確保冗餘持久性 [T1102](https://attack.mitre.org/techniques/T1102/){: .ttp-ref }
- **代碼譜系**：當前工具組與 2010 年代的植入程式存在直接代碼血統，展現 Sednit 長達十餘年的技術延續性
- **目標**：烏克蘭軍事人員，進行長期監控與情報蒐集 [T1588](https://attack.mitre.org/techniques/T1588/){: .ttp-ref }

**影響評估**：雙植入架構大幅提升攻擊韌性——即使一個 C2 管道被阻斷，攻擊者仍可透過另一管道維持存取。此設計模式值得防禦方高度警惕。

### 2. Camaro Dragon（中國）24 小時內將中東衝突武器化，以 PlugX 攻擊卡達

**嚴重程度：High | 來源：Check Point Research / NCSC-FI | 日期：2026-03-10**

Check Point Research 觀察到中國關聯 APT 行為者 Camaro Dragon 在 Operation Epic Fury 啟動後不到 24 小時內，即以 PlugX（Korplug）變種及 Cobalt Strike 攻擊卡達目標：

- **時效性**：攻擊者展現將突發地緣政治事件快速轉化為網路釣魚誘餌的能力 [T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref }
- **工具選擇**：優先使用 PlugX 和 Cobalt Strike 等成熟工具，追求快速部署而非隱蔽性
- **區域擴散**：除卡達外，中東全區域均觀察到活動增加

### 3. UAT-9244（中國）以三款新惡意軟體攻擊南美電信基礎設施

**嚴重程度：High | 來源：Cisco Talos / NCSC-FI | 日期：2026-03-06**

Cisco Talos 披露與 Famous Sparrow 有高度關聯的中國關聯 APT 行為者 UAT-9244，自 2024 年起持續攻擊南美電信基礎設施，使用三款專用惡意軟體：

| 惡意軟體 | 平台 | 功能 |
|----------|------|------|
| **TernDoor** | Windows | CrowDoor 的新變種，後門功能 |
| **PeerTime** | Linux (ELF) | 利用 BitTorrent 協定進行 C2 通訊 [T1071.001](https://attack.mitre.org/techniques/T1071/001/){: .ttp-ref } |
| **BruteEntry** | 邊緣裝置 | 暴力破解掃描器，將感染裝置轉為 ORB（操作中繼節點）[T1110](https://attack.mitre.org/techniques/T1110/){: .ttp-ref } |

BruteEntry 將網路邊緣裝置轉化為大規模掃描代理節點的做法，反映出中國關聯 APT 越來越多地利用 ORB（Operational Relay Boxes）架構來模糊攻擊來源。

### 4. Seedworm/MuddyWater（伊朗）以 Dindoor 後門入侵美國關鍵基礎設施

**嚴重程度：High | 來源：NCSC-FI | 日期：2026-03-06**

伊朗 APT 組織 Seedworm（MuddyWater）自 2026 年 2 月初以來，持續活躍於多個美國組織網路中，活動在美國與以色列對伊朗軍事打擊後仍未間斷：

- **受影響組織**：美國銀行、機場、國防/航太軟體公司（在以色列有據點）、加拿大 NGO
- **新後門 Dindoor**：使用 Deno JavaScript/TypeScript 執行環境運行，以「Amy Cherne」名義簽署的憑證進行數位簽章 [T1059](https://attack.mitre.org/techniques/T1059/){: .ttp-ref }
- **意涵**：即使面臨軍事打擊壓力，伊朗網路行動並未減速，反而擴大對美國關鍵基礎設施的滲透

### 5. 俄羅斯大規模 Signal/WhatsApp 帳號劫持行動

**嚴重程度：High | 來源：荷蘭 AIVD/MIVD / NCSC-FI | 日期：2026-03-10**

荷蘭情報單位 AIVD 與 MIVD 公開警告一場大規模俄羅斯關聯網路行動，全球鎖定政府官員、記者與軍事人員的加密通訊帳號：

- **攻擊方法**：社交工程騙取帳號存取憑證或裝置連結權限，而非破解端對端加密 [T1078](https://attack.mitre.org/techniques/T1078/){: .ttp-ref }
- **目標平台**：Signal 與 WhatsApp
- **戰術意涵**：繞過密碼學保護層，直接在應用層級取得帳號控制權——這提醒即使端對端加密也無法防護帳號層級的社交工程攻擊

### 6. 伊朗 MOIS 與網路犯罪的融合趨勢

**嚴重程度：High | 來源：Check Point Research / NCSC-FI | 日期：2026-03-11**

Check Point Research 分析記錄伊朗情報安全部（MOIS）如何越來越頻繁地透過犯罪工具、服務及營運模式追求國家目標：

- **國家-犯罪融合**：MOIS 關聯行為者使用網路犯罪中間人和工具，如同實體世界中情報機構透過可否認的犯罪代理人運作
- **操作混淆**：使用商業化犯罪工具和基礎設施執行國家間諜任務，提供可否認性
- **趨勢判斷**：此混合模式的頻率持續增加，模糊了國家級攻擊與網路犯罪的邊界

### 7. ShinyHunters 宣稱透過 Salesforce 竊取約 100 家企業資料

**嚴重程度：High | 來源：NCSC-FI / The Register | 日期：2026-03-10 | 信心水準：中（攻擊者自稱，尚待獨立驗證）**

知名網路犯罪組織 ShinyHunters 向 The Register 表示，已透過 Salesforce 客戶資料平台竊取約 400 個網站與 100 家知名企業的資料：

- **聲稱受害者**：Salesforce、Snowflake、Okta、LastPass、Sony、AMD 等
- **攻擊方式**：以 Salesforce 客戶資料平台為共同切入點/跳板，進行持續數月的偵察與利用 [T1199](https://attack.mitre.org/techniques/T1199/){: .ttp-ref }
- **相關行動**：同時有另一犯罪集團利用 Salesforce 錯誤配置的訪客帳號竊取資料並勒索（Salesforce 確認非平台漏洞）[T1078](https://attack.mitre.org/techniques/T1078/){: .ttp-ref }

> ⚠️ **注意**：受害者名單為 ShinyHunters 自稱，尚未經獨立驗證。但 ShinyHunters 過往有多次可信的大規模資料竊取記錄（含 2024 年 Snowflake 客戶資料庫入侵事件）。

### 8. KadNap 殭屍網路：Kademlia DHT 架構劫持逾 14,000 台 Asus 路由器

**嚴重程度：High | 來源：Lumen Black Lotus Labs / NCSC-FI | 日期：2026-03-11**

Lumen Black Lotus Labs 發現名為 KadNap 的精密殭屍網路，自 2025 年 8 月起持續活躍：

- **規模**：逾 14,000 台受感染 Asus 路由器
- **技術創新**：使用客製化 Kademlia DHT（分散式雜湊表）協定進行 P2P C2 通訊，隱藏攻擊者基礎設施 IP [T1090.003](https://attack.mitre.org/techniques/T1090/003/){: .ttp-ref }
- **功能**：將感染路由器轉化為惡意流量代理節點
- **韌性**：P2P 架構使傳統 C2 拆除行動難以奏效

### 9. Microsoft Teams 釣魚部署 A0Backdoor 攻擊金融與醫療機構

**嚴重程度：High | 來源：BleepingComputer / NCSC-FI | 日期：2026-03-11**

攻擊者以 Microsoft Teams 冒充 IT 支援人員，對金融與醫療機構員工部署全新 A0Backdoor 惡意軟體：

- **攻擊鏈**：垃圾郵件轟炸 → Teams 冒充 IT → Quick Assist 遠端存取 → 部署 A0Backdoor [T1566](https://attack.mitre.org/techniques/T1566/){: .ttp-ref } [T1219](https://attack.mitre.org/techniques/T1219/){: .ttp-ref }
- **手法演進**：此為 Storm-1811/BlackBasta 相關團體先前使用的「Teams Vishing」技術的變種
- **目標產業**：金融機構與醫療組織

### 10. 偽造求職信散布反 EDR 惡意軟體

**嚴重程度：High | 來源：Aryaka / The Register / NCSC-FI | 日期：2026-03-11**

俄語網路犯罪組織以假求職信（CV）攻擊企業人力資源部門：

- **攻擊向量**：將惡意檔案託管於知名雲端儲存服務，偽裝為合法求職申請 [T1566.001](https://attack.mitre.org/techniques/T1566/001/){: .ttp-ref }
- **關鍵能力**：惡意軟體可停用或終止 EDR 等端點安全軟體後再進行資料竊取 [T1562.001](https://attack.mitre.org/techniques/T1562/001/){: .ttp-ref }
- **社交工程巧思**：利用人資部門日常開啟不明附件的工作流程，降低安全警覺

### 其他重要事件

| 事件 | 來源 | 日期 | 要點 |
|------|------|------|------|
| **BadPaw + MeowMeow** 俄羅斯間諜攻擊烏克蘭 | ClearSky / NCSC-FI | 03-05 | 以偽造邊境通行許可為誘餌，部署兩款未記錄惡意軟體 |
| **APT36 (Transparent Tribe) VibeWare** | Bitdefender | 03-06 | 以 AI 驅動「Vibeware」模式用 Nim/Zig/Crystal 等冷門語言快速量產惡意軟體 |
| **BoryptGrab Stealer** 透過 100+ GitHub 倉庫散布 | Trend Micro | 03-09 | 竊取瀏覽器資料、加密貨幣錢包、系統資訊 |
| **Wikipedia JavaScript 蠕蟲** | BleepingComputer | 03-07 | 自我傳播 JS 蠕蟲篡改 Meta-Wiki 頁面 |
| **BeatBanker** 雙模式 Android 木馬攻擊巴西 | Kaspersky | 03-11 | 銀行木馬 + 加密貨幣挖礦雙重牟利 |
| **簽署惡意軟體** 偽裝工作場所應用程式 | Microsoft Defender Experts | 03-05 | 使用 EV 憑證簽署，部署 RMM 後門 |
| **OpenClaw 假安裝程式** 散布 GhostSocks | Huntress | 03-06 | 新型 Stealth Packer + GhostSocks 繞過反詐偵測 |
| **Ericsson US 資料洩露** | BleepingComputer | 03-10 | 第三方服務供應商遭入侵，影響員工及客戶資料 |
| 俄羅斯「**Morningstar**」宣稱監視芬蘭家庭攝影機 | 芬蘭 NCSC-FI | 03-09 | 混合影響力行動，旨在瓦解對數位社會的信任 |
| **Operation Epic Fury/Roaring Lion** 中東駭客主義 | Radware | 03-05 | 149+ DDoS 攻擊，53% 針對政府機構，pro-Russian NoName057(16) 加入 |
| 波蘭 **7 名青少年** 販售 DDoS 工具遭移送法辦 | NCSC-FI | 03-11 | 年齡 12-16 歲，凸顯攻擊工具取得門檻持續降低 |

---

## 2.2 漏洞趨勢分析

### 本週漏洞概覽

本週共記錄 **46 則漏洞揭露公告**，涵蓋 Cisco、Microsoft、HPE Aruba、Siemens、Schneider Electric、Honeywell、Delta Electronics、Fortinet 等主要廠商。重點趨勢：

#### 按嚴重程度分布

| 嚴重程度 | 數量 | 代表性 CVE |
|----------|------|-----------|
| **Critical（CVSS ≥ 9.0）** | 5 | CVE-2026-20079/20131（Cisco FMC 10.0）、CVE-2026-29000（pac4j 10.0）、CVE-2026-27944（Nginx UI 9.8） |
| **High（CVSS 7.0-8.9）** | 18 | CVE-2026-23813（HPE AOS-CX）、CVE-2026-21643（FortiClient EMS）、CVE-2026-3611（Honeywell BMS） |
| **Medium** | 15 | 多個 Linux Kernel、IBM、SPIP 漏洞 |
| **Low / Informational** | 8 | Microsoft 三月 Patch Tuesday 常規更新 |

#### 重點漏洞詳述

**Cisco FMC/SCC 雙 CVSS 10.0 漏洞（CVE-2026-20079、CVE-2026-20131）**
- 影響 Cisco Secure Firewall Management Center 與 Security Cloud Control
- 兩個漏洞均獲得最高 CVSS 10.0 評分
- CERT-SE、CERT-RO 均發布緊急通報
- 建議：**立即修補**，防火牆管理平台遭入侵將導致整體網路安全架構崩潰

**pac4j JWT 認證繞過（CVE-2026-29000，CVSS 10.0）**
- Java pac4j-jwt 框架的 JwtAuthenticator 存在加密 JWT 處理缺陷
- 攻擊者僅需持有 RSA 金鑰對即可偽造 JWT，冒充任意使用者（含管理員）
- 無需密碼或有效數位簽章即可完全繞過認證 [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref }

**HPE Aruba AOS-CX 認證繞過（CVE-2026-23813）**
- 未授權攻擊者可重設 CX 系列交換器的管理員密碼
- 影響校園與資料中心部署環境
- 無需任何認證即可利用

**FortiClient EMS 預認證 SQL Injection（CVE-2026-21643）**
- Bishop Fox 識別出透過 `/api/v1/init_consts` 公開 API 端點的實際利用路徑
- 無帳號鎖定或速率限制防護
- 端點回傳資料庫錯誤訊息，加速資料萃取

**Honeywell IQ4x BMS 控制器（CVE-2026-3611）**
- 影響建築管理系統控制器，可導致未授權存取管理設定、元件控制、資訊洩露或阻斷服務
- ICS/OT 環境漏洞持續為攻擊者關注焦點

**Lantronix EDS 序列設備伺服器（多個 CVE）**
- EDS3000PS 與 EDS5000 存在認證繞過與 Root 權限程式碼執行漏洞
- 工業序列設備伺服器遭入侵可作為 OT 網路的跳板

#### 廠商分布

| 廠商 | 漏洞公告數 | 說明 |
|------|-----------|------|
| Microsoft | 8 | Patch Tuesday 常規更新 + Edge |
| Cisco | 5 | FMC/SCC Critical + 其他 |
| Linux Kernel (各發行版) | 5 | Ubuntu、SUSE、Red Hat |
| Siemens | 3 | 工業產品 |
| Schneider Electric | 2 | 工業產品 |
| 其他（Fortinet、HPE、SAP、IBM、Honeywell 等） | 23 | 分散於多廠商 |

#### 2025 年 CVE 回顧數據（本週發布）

Cisco Talos 發布 2025 年 CVE 回顧報告，關鍵數據：

- **2025 年全年 CVE 數量**：48,196 個（平均每日 132 個漏洞）
- **KEV 數量**：241 個（較 2024 年 186 個增長 **30%**）
- **持續主導的漏洞類型**：XSS、SQL Injection、反序列化——合計約 10,000 個 CVE
- **Kaspersky Q4 2025 報告**：「Q4 2025 是有記錄以來最密集的高嚴重漏洞揭露季度之一」

---

## 2.3 活躍利用與 PoC 動態

### CISA KEV 本週新增

本週 CISA 共新增 **8 個**已知遭利用漏洞至 KEV 目錄：

**2026-03-05 批次（5 個）**：
- CISA 未在公開公告中列出具體 CVE 清單（僅發布通知確認 5 個新增項目）

**2026-03-09 批次（3 個）**：

| CVE | 產品 | 漏洞類型 | 備註 |
|-----|------|----------|------|
| CVE-2021-22054 | Omnissa Workspace ONE | SSRF（伺服器端請求偽造） | 2021 年舊漏洞首次確認遭活躍利用 |
| CVE-2025-26399 | SolarWinds Web Help Desk | 不受信任資料反序列化 | 潛在遠端程式碼執行 |
| CVE-2026-1603 | Ivanti Endpoint Manager (EPM) | 認證繞過 | 未授權存取 |

> **值得注意**：CVE-2021-22054 為 2021 年披露的漏洞，時隔 5 年才被確認遭到活躍利用，凸顯舊漏洞持續被武器化的風險。

### 活躍利用情報（Exploit Intelligence Layer）

本週新增 **8 個活躍利用**條目（與前週 CISA KEV 累積交叉比對），涵蓋：
- Ivanti EPMM 系列漏洞
- BeyondTrust PRA 漏洞
- Cisco 多個 CVE
- 歷史漏洞 Zerologon 的持續利用活動

### PoC 公開動態

本週新增 **70 個 PoC**，來源涵蓋 GitHub 和 Nuclei Templates，重點包括：

| 類別 | 數量 | 代表性項目 |
|------|------|-----------|
| Web 應用漏洞 PoC | 28 | SQL Injection（phpIPAM、openSIS、Piwigo）、XSS（phpMyFAQ、RosarioSIS） |
| 網路設備/服務 PoC | 15 | D-Link DIR-825 Stack BOF、aiohttp Path Traversal、Nginx UI RCE |
| 容器/雲端平台 PoC | 8 | Docker Desktop API Exposure、WordPress Backup Migration RCE |
| 其他 PoC | 19 | Ingress-Nginx RCE、FreeBSD rtsold RCE、Windows Server Hyper-V EoP |

**風險提示**：PoC 公開後 24-72 小時內為攻擊者大規模掃描的高峰窗口。建議優先修補已有 PoC 的漏洞。

---

## 2.4 攻擊手法歸納

### ATT&CK 技術分布

基於本週 48 件攻擊事件與 1,307 則威脅情報饋送，歸納攻擊手法如下：

#### 初始存取（Initial Access）

| TTP | 技術名稱 | 本週事件數 | 代表性案例 |
|-----|----------|-----------|-----------|
| [T1566](https://attack.mitre.org/techniques/T1566/){: .ttp-ref } | Phishing | 12 | Teams 釣魚 A0Backdoor、BadPaw+MeowMeow、RedAlert 假應用程式 |
| [T1566.001](https://attack.mitre.org/techniques/T1566/001/){: .ttp-ref } | Spearphishing Attachment | 5 | 偽造求職信、假 PDF 附件 |
| [T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref } | Spearphishing Link | 6 | Camaro Dragon PlugX、芬蘭稅務釣魚 |
| [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } | Exploit Public-Facing Application | 8 | Salesforce 錯誤配置、Cisco FMC 漏洞 |
| [T1195](https://attack.mitre.org/techniques/T1195/){: .ttp-ref } | Supply Chain Compromise | 3 | Ericsson 供應商入侵、npm 套件感染、GitHub 惡意倉庫 |
| [T1078](https://attack.mitre.org/techniques/T1078/){: .ttp-ref } | Valid Accounts | 4 | Signal/WhatsApp 帳號劫持、Salesforce 訪客帳號濫用 |

#### 執行與持久化

| TTP | 技術名稱 | 代表性案例 |
|-----|----------|-----------|
| [T1059](https://attack.mitre.org/techniques/T1059/){: .ttp-ref } | Command and Scripting Interpreter | Dindoor（Deno runtime）、Wikipedia JS 蠕蟲 |
| [T1219](https://attack.mitre.org/techniques/T1219/){: .ttp-ref } | Remote Access Software | Quick Assist 遠端存取、RMM 後門 |
| [T1102](https://attack.mitre.org/techniques/T1102/){: .ttp-ref } | Web Service | BeardShell/Covenant 雲端 C2、APT36 Slack/Discord C2 |
| [T1090.003](https://attack.mitre.org/techniques/T1090/003/){: .ttp-ref } | Multi-hop Proxy | KadNap DHT P2P、BruteEntry ORB |

#### 防禦規避

| TTP | 技術名稱 | 代表性案例 |
|-----|----------|-----------|
| [T1562.001](https://attack.mitre.org/techniques/T1562/001/){: .ttp-ref } | Disable or Modify Tools | 偽造求職信惡意軟體停用 EDR |
| [T1553.002](https://attack.mitre.org/techniques/T1553/002/){: .ttp-ref } | Code Signing | EV 憑證簽署惡意軟體 |
| [T1027](https://attack.mitre.org/techniques/T1027/){: .ttp-ref } | Obfuscated Files or Information | Stealth Packer、Nim/Zig/Crystal 冷門語言 |

#### 攻擊類型統計

| 攻擊類型 | 事件數 | 較上週變化 |
|----------|--------|-----------|
| 釣魚（Phishing / Vishing） | 15 | ↑ 顯著增加 |
| 資料竊取與勒索 | 8 | ↑ |
| DDoS / 駭客主義 | 6 | ↑（受中東衝突驅動） |
| APT 間諜行動 | 8 | → 持平高位 |
| 惡意軟體散布 | 7 | → |
| 供應鏈攻擊 | 3 | → |

#### 威脅情報饋送趨勢（2026-03-10 至 03-11）

| 類別 | 數量 | 說明 |
|------|------|------|
| 惡意 URL | 526 | URLhaus 來源，持續監測中 |
| 惡意軟體樣本 | 141 | MalwareBazaar 提交 |
| IoC 指標 | 640 | ThreatFox C2/botnet 指標 |

Qdrant 語意搜尋顯示，本週 Mozi 相關 URLhaus IoC 與 ClearFake ThreatFox IoC 持續活躍，與已知殭屍網路基礎設施存在關聯。

---

## 2.5 新興威脅識別

### 1. AI 驅動惡意軟體開發（「Vibeware」模式）的產業化

**信心水準：高 | 首次識別：本週**

APT36（Transparent Tribe）採用的「Vibeware」模式標誌著 AI 在惡意軟體開發中的角色從輔助工具轉向核心產能引擎：

- **模式定義**：利用 AI 快速量產中等品質的惡意軟體變種，以數量取代品質
- **技術特徵**：使用 Nim、Zig、Crystal 等冷門程式語言，規避標準偵測引擎
- **C2 演進**：濫用 Slack、Discord、Supabase、Google Sheets 等合法雲端服務

**分析判斷**：結合 Microsoft 本週發布的「AI as Tradecraft」報告，AI 正同時被用作攻擊加速器和武器。Palo Alto Unit 42 的研究進一步指出，用於安全控制的 LLM「AI 法官」本身也可被 prompt injection 繞過——形成一種攻防雙方都在 AI 化的軍備競賽。

### 2. P2P DHT 架構在殭屍網路中的成熟應用

**信心水準：高**

KadNap 殭屍網路使用 Kademlia DHT 協定進行 P2P C2 通訊，代表殭屍網路架構的重大演進：

- **去中心化韌性**：無單一 C2 伺服器可供拆除
- **IP 遮蔽**：攻擊者基礎設施 IP 完全隱藏在 DHT 網路中
- **規模化驗證**：14,000+ 感染裝置證明此架構可大規模運作

結合 Qdrant 歷史資料搜尋結果，Mozi 殭屍網路此前已使用類似 DHT 架構；KadNap 的出現確認此技術路線正在被更多攻擊者採用。

### 3. Salesforce 生態系統作為大規模攻擊面

**信心水準：中**

本週出現兩起獨立但相關的 Salesforce 相關攻擊：

1. ShinyHunters 宣稱透過 Salesforce 客戶資料竊取 ~100 家企業資料
2. 另一犯罪集團利用 Salesforce 訪客帳號錯誤配置進行資料勒索

**趨勢判斷**：SaaS 平台（尤其是 CRM 類平台）作為企業資料集中存放點，正成為攻擊者的高價值目標。Salesforce 確認非平台漏洞而是配置問題，但大量企業的配置錯誤本身構成了系統性風險。

### 4. 國家-犯罪邊界的持續模糊化

**信心水準：高**

本週多個事件反映此趨勢：

- 伊朗 MOIS 使用犯罪工具追求國家目標（Check Point 分析）
- Seedworm 使用商業化簽署憑證與 Deno runtime（非傳統 APT 工具）
- 俄羅斯「Morningstar」團體以駭客主義為名進行混合影響力行動（芬蘭攝影機事件）

**分析**：國家級行為者越來越頻繁地借用犯罪生態系統的工具和基礎設施，使得基於工具特徵的歸因分析日益困難。防禦方需從「誰在攻擊」轉向「攻擊行為模式」的偵測思維。

### 5. 反 EDR 能力成為標準配備

**信心水準：中**

本週偽造求職信惡意軟體展示在資料竊取前先停用 EDR 的能力。結合近期多個攻擊案例（如 Terminator 驅動程式攻擊、BYOVD 技術），反 EDR 能力正從 APT 專屬工具普及到一般網路犯罪：

- **前期案例**（Qdrant 歷史搜尋）：2025 年多起勒索軟體使用 BYOVD 繞過 EDR
- **本週進展**：將反 EDR 包裝在日常社交工程場景（求職信）中，降低了攻擊門檻

### 6. 地緣衝突驅動的即時網路行動

**信心水準：高**

本週中東衝突（Operation Epic Fury / Roaring Lion）同時觸發了三個維度的網路響應：

1. **駭客主義**：149+ DDoS 攻擊，60 個團體活躍，NoName057(16) 跨營加入
2. **國家級間諜**：Camaro Dragon 24 小時內利用事件作為釣魚誘餌
3. **混合行動**：伊朗「電子作戰室」成立，協調國家支持的網路行動

**全球趨勢數據**：NCSC-FI 報告 2026 年 2 月全球網路攻擊量維持歷史高位；芬蘭組織每週平均遭受 945 次攻擊。

---

## 2.6 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資
2. **時效性**：資料可能存在數小時至數天的延遲
3. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務等來源
4. **分析局限**：趨勢分析基於公開資料樣本，統計推論應謹慎解讀
5. **翻譯風險**：部分非英文來源（芬蘭語、瑞典語、克羅地亞語、捷克語、斯洛伐克語、羅馬尼亞語等）經 AI 翻譯，可能存在語義偏差
6. **未驗證聲明**：ShinyHunters 受害者名單為自稱，已標註為中等信心水準
7. **Qdrant 語意搜尋限制**：向量搜尋結果基於語意相似度，可能包含非直接相關的歷史資料

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源。

---

## 附錄：本週 ATT&CK TTP 對照總表

| TTP ID | 技術名稱 | 本週觀察頻率 |
|--------|----------|-------------|
| [T1566](https://attack.mitre.org/techniques/T1566/){: .ttp-ref } | Phishing | 高 |
| [T1566.001](https://attack.mitre.org/techniques/T1566/001/){: .ttp-ref } | Spearphishing Attachment | 高 |
| [T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref } | Spearphishing Link | 高 |
| [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } | Exploit Public-Facing Application | 高 |
| [T1078](https://attack.mitre.org/techniques/T1078/){: .ttp-ref } | Valid Accounts | 中 |
| [T1195](https://attack.mitre.org/techniques/T1195/){: .ttp-ref } | Supply Chain Compromise | 中 |
| [T1199](https://attack.mitre.org/techniques/T1199/){: .ttp-ref } | Trusted Relationship | 中 |
| [T1059](https://attack.mitre.org/techniques/T1059/){: .ttp-ref } | Command and Scripting Interpreter | 中 |
| [T1102](https://attack.mitre.org/techniques/T1102/){: .ttp-ref } | Web Service | 中 |
| [T1219](https://attack.mitre.org/techniques/T1219/){: .ttp-ref } | Remote Access Software | 中 |
| [T1090.003](https://attack.mitre.org/techniques/T1090/003/){: .ttp-ref } | Multi-hop Proxy | 低 |
| [T1110](https://attack.mitre.org/techniques/T1110/){: .ttp-ref } | Brute Force | 低 |
| [T1562.001](https://attack.mitre.org/techniques/T1562/001/){: .ttp-ref } | Disable or Modify Tools | 低 |
| [T1553.002](https://attack.mitre.org/techniques/T1553/002/){: .ttp-ref } | Code Signing | 低 |
| [T1027](https://attack.mitre.org/techniques/T1027/){: .ttp-ref } | Obfuscated Files or Information | 低 |
| [T1071.001](https://attack.mitre.org/techniques/T1071/001/){: .ttp-ref } | Application Layer Protocol: Web Protocols | 低 |

---

## 附錄：本週政策與法規動態

| 事件 | 來源 | 日期 | 要點 |
|------|------|------|------|
| EU 法院顧問意見：銀行須即時退款釣魚受害者 | CJEU / BleepingComputer | 03-09 | 除非銀行有「合理理由懷疑詐欺」，否則須立即退款未授權交易 |
| 澳洲 18+ 網站年齡驗證法 | NCSC-FI | 03-10 | 強制 18+ 網站實施年齡驗證 |
| AI/ML 供應鏈安全聯合指導 | 加拿大 Cyber Centre + 多國 | 03-05 | 涵蓋模型訓練資料、第三方元件、部署環境安全考量 |
| NIS2/CRA 網路安全韌性會議 | 斯洛伐克 Kyber2026 | 03-07 | 討論 NIS2 與 CRA 在歐盟的實施進展 |
| CNCS 葡萄牙網路安全法規公眾諮詢 | CNCS PT | 03-10 | 葡萄牙國家網路安全法規徵求公眾意見 |

---

> 萃取時間：2026-03-11 UTC
> 報告產出：資安情報分析團隊
