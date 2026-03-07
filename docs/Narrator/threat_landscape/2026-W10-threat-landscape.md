# 威脅態勢分析 — 2026 第 10 週

> 涵蓋期間：2026-03-02 至 2026-03-08
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-03-07
> 分析模型：Claude Opus

---

## 近期重大資安事件

本週資安事件以**中東地緣政治衝突驅動的網路攻擊**為主軸，涵蓋國家級 APT 行動、大規模駭客主義 DDoS 攻擊、多起供應鏈攻擊，以及重要的跨國執法打擊行動。以下按嚴重程度排序。

### 1. 伊朗—以色列—美國網路衝突全面升級（嚴重程度：極高）

本週最突出的威脅態勢為中東軍事衝突引發的網路空間全面升級。以下為事件時間線：

- **2026-02-28**：美國與以色列發動「史詩怒火」(Operation Epic Fury) 軍事行動打擊伊朗，伊朗同步實施近乎全面的網路封鎖，國內連線能力降至正常水準的 4%（NetBlocks 數據）。（來源：Forbes, 2026-03-01）

- **2026-03-01**：Check Point Research 偵測到自 2 月 28 日起針對以色列、卡達、巴林、科威特、阿聯酋及賽普勒斯 IP 攝影機的攻擊活動加劇，攻擊基礎設施歸因於伊朗威脅行為者。研究評估伊朗利用攝影機入侵進行飛彈行動的戰損評估 (BDA)，攝影機攻擊活動可作為動能行動的早期預警指標。（來源：Check Point Research, 2026-03-05）

- **2026-02-28 至 03-02**：Radware 報告 149 次駭客主義 DDoS 攻擊針對 16 個國家 110 個組織。Keymous+ 和 DieNet 驅動近 70% 攻擊活動，53% 攻擊導向政府機構，76% 以上集中於科威特、以色列和約旦。3 月 2 日親俄團體 NoName057(16) 加入親伊朗陣營，標誌威脅擴大化。（來源：Radware / Orange Cyberdefense, 2026-03-05）

- **2026-03-02**：加拿大網路安全中心 (CCCS) 發布伊朗網路威脅專題公報，警告伊朗將以網路攻擊作為對美以軍事行動的報復手段。（來源：CCCS, 2026-03-02）

- **2026-03-03**：Check Point Research 發布伊朗網路能力全面概述，涵蓋 IRGC、MOIS 關聯組織的 TTPs，預警活動將在中東、美國及盟友國家加劇。伊朗網路行動三大目標：間諜活動、破壞/毀滅性攻擊（包括偽勒索軟體和資料抹除器）、資訊作戰。（來源：Check Point, 2026-03-03）

- **2026-03-05**：Unit 42 識別惡意 RedAlert 應用程式副本（以色列後方司令部警報 App），用於投遞行動監控惡意軟體。估計 60 個駭客主義團體活躍，伊朗成立「電子作戰室」協調網路行動。（來源：Palo Alto Unit 42, 2026-03-05）

- **2026-03-06**：以色列國防軍 (IDF) 宣布空襲伊朗 IRGC 網路戰與電子作戰總部，實體打擊伊朗網路作戰能力。此舉標誌以動能手段反制國家級網路威脅的史無前例升級。（來源：Politico, 2026-03-06）

- **2026-03-06**：Seedworm (MuddyWater) 持續活躍於美國銀行、機場及軟體公司網路，部署新後門「Dindoor」（利用 Deno 執行環境），受害組織包括為國防/航太產業供貨的以色列分支軟體公司。Dindoor 使用「Amy Cherne」簽發的數位憑證。（來源：NCSC-FI, 2026-03-06）

- **2026-03-07**：Acronis TRU 報告行動間諜軟體偽裝以色列 Red Alert 火箭警報系統，透過 SMS 仿冒後方司令部通訊散播木馬化 Android APK。（來源：Acronis, 2026-03-07）

- **2026-03-07**：Zscaler ThreatLabz 追蹤到超過 8,000 個新註冊網域使用中東衝突相關關鍵字，多數尚無內容但可能被武器化。已發現的活躍威脅包括衝突主題 PDF 誘餌投遞 LOTUSLITE 後門、假新聞網站重導向 StealC 惡意軟體、假政府釣魚網站、詐騙捐款網站。（來源：Zscaler, 2026-03-07）

- **2026-03-07**：WIRED 深度報導攝影機入侵已成為以色列、俄羅斯、烏克蘭及伊朗的戰爭「標準作戰手冊」，數百起伊朗國家駭客劫持消費級攝影機的企圖與飛彈和無人機攻擊時間高度吻合。（來源：WIRED, 2026-03-07）

**Qdrant 跨層關聯分析**：語意查詢「Iran cyber attack geopolitical Middle East hacktivist」回傳 10 筆高度相關結果（相似度 0.54-0.62），確認自 2026 年 2 月底以來伊朗相關網路威脅活動為近年最密集的爆發期。歷史比對顯示，2025 年 7 月 CCCS 已發布伊朗網路威脅公報，以及 2025 年 12 月的親俄駭客主義全球關鍵基礎設施攻擊聯合警報，目前態勢為歷史升級的顯著延續。

### 2. 俄羅斯—烏克蘭持續網路攻擊（嚴重程度：高）

- **UAC-0252 攻擊行動**（CERT-UA#20032）：自 2026 年 1 月起，以釣魚郵件偽裝烏克蘭中央政府機關和地方行政機構，誘騙收件人更新軍民系統行動應用程式，部署 SHADOWSNIFF 和 SALATSTEALER 竊密軟體。（來源：CERT-UA, 2026-03-02）

- **BadPaw/MeowMeow 新惡意軟體**：ClearSky 記錄疑似俄羅斯間諜攻擊活動，以偽造烏克蘭邊境通行許可文件的 ZIP 壓縮檔進行釣魚，投遞新型載入器「BadPaw」及精密後門「MeowMeow」，允許攻擊者存取受感染系統及操控本機檔案。（來源：The Record / ClearSky, 2026-03-05）

- **CVE-2026-21513（MSHTML 零日）**：Akamai 確認 APT28 (Fancy Bear) 積極利用 Windows MSHTML 安全功能繞過漏洞（CVSS 8.8），已於 2026 年 2 月 Patch Tuesday 修補。（來源：Akamai, 2026-03-03）

### 3. 亞太地區國家級 APT 行動（嚴重程度：高）

- **UAT-9244 / Famous Sparrow（中國）**：Cisco Talos 揭露中國關聯 APT 自 2024 年起針對南美洲電信基礎設施，使用三種新惡意軟體：TernDoor（Windows 後門）、PeerTime（利用 BitTorrent 協定的 ELF 後門）、BruteEntry（將邊緣裝置轉為大規模掃描代理節點 ORBs，暴力破解 SSH、Postgres 和 Tomcat 伺服器）。（來源：Cisco Talos, 2026-03-06）

- **CL-UNK-1068（中國）**：Unit 42 揭露自 2020 年起持續未被偵測的攻擊叢集，以高信心評估為中國威脅行為者。目標涵蓋南亞、東南亞、東亞的航空、能源、政府、執法、製藥、科技及電信關鍵產業，主要目的評估為網路間諜活動。（來源：Palo Alto Unit 42, 2026-03-07）

- **APT36 / Transparent Tribe（巴基斯坦）**：Bitdefender 揭露 APT36 轉向 AI 驅動的「Vibeware」惡意軟體開發模式，使用 Nim、Zig、Crystal 等冷門語言規避偵測，利用 Slack、Discord、Supabase、Google Sheets 作為 C2 通道。AI 驅動模式以量取勝，大量產生中等品質惡意軟體植體。（來源：Bitdefender, 2026-03-06）

- **Dust Specter（疑似伊朗）**：Zscaler 揭露疑似伊朗關聯 APT 於 2026 年 1 月針對伊拉克政府官員，使用四種全新惡意軟體家族：SPLITDROP（投放器）、TWINTASK（後門）、TWINTALK（後門）、GHOSTFORM（RAT），具備雙重攻擊鏈架構。（來源：Zscaler, 2026-03-03）

- **SloppyLemming（印度）**：Arctic Wolf 揭露印度關聯威脅行為者對巴基斯坦、孟加拉和斯里蘭卡政府及關鍵基礎設施的一年期間諜活動，使用 BurrowShell 後門和鍵盤記錄惡意軟體。（來源：Arctic Wolf / The Record, 2026-03-03）

### 4. 供應鏈攻擊與軟體生態系統安全（嚴重程度：高）

- **NPM 大規模感染**：SK-CERT 警告 18 個 NPM 套件遭入侵，涉及每週超過 26 億次下載量的套件，植入惡意程式碼，影響龐大的下游相依生態系統。（來源：SK-CERT / Aikido, 2026-03-07）

- **Wikipedia 自傳播 JavaScript 蠕蟲**：Wikimedia Foundation 遭遇安全事件，自傳播 JavaScript 蠕蟲修改使用者腳本並破壞 Meta-Wiki 頁面，工程團隊暫時限制跨專案編輯權限。（來源：BleepingComputer, 2026-03-07）

- **惡意 OpenClaw GitHub 安裝器**：Huntress 調查發現偽造 OpenClaw GitHub 存儲庫（活躍於 2 月 2-10 日），使用新型「Stealth Packer」分發資訊竊取器和 GhostSocks 惡意軟體，後者可路由受害系統流量繞過反詐騙偵測。（來源：Huntress, 2026-03-06）

- **InstallFix 惡意廣告攻擊**：攻擊者複製流行開發者工具（包括 Claude Code）的安裝指南網站，透過搜尋引擎惡意廣告引導受害者安裝竊密軟體。（來源：Push Security, 2026-03-07）

### 5. 跨國執法打擊行動（嚴重程度：高/正面）

- **Tycoon 2FA 釣魚平台關閉**：Europol EC3 協調，Microsoft 主導技術打擊，六國執法機構扣押 330 個核心網域。Tycoon 2FA 為訂閱制 PhaaS 平台，可攔截即時認證會話繞過 MFA。（來源：Europol / Microsoft, 2026-03-05）

- **LeakBase 駭客論壇拆除**：美國 DOJ 主導，Europol 協調，14 國同步行動於 2026 年 3 月 3-4 日關閉全球最大駭客論壇之一，該論壇擁有 14.2 萬會員、21.5 萬訊息，儲存數億組帳號憑證。（來源：U.S. DOJ, 2026-03-05）

### 6. 其他重大事件

| 日期 | 事件 | 來源 | 嚴重程度 |
|------|------|------|----------|
| 2026-03-02 | 芬蘭出現 Deepfake 醫療廣告詐騙 | NCSC-FI | 中 |
| 2026-03-03 | Dubai SIM Swap 攻擊與伊朗飛彈行動相關 | NCSC-FI | 高 |
| 2026-03-04 | XWorm 惡意軟體新一波多技術投遞攻擊 | SANS ISC | 中 |
| 2026-03-05 | 偽造技術支援詐騙升級，部署客製化 Havoc C2 框架，利用間接系統呼叫規避 EDR | Huntress | 高 |
| 2026-03-05 | 簽署惡意軟體偽裝工作場所 App，使用 EV 憑證（TrustConnect Software PTY LTD），部署 RMM 後門 | Microsoft | 高 |
| 2026-03-06 | 惡意 AI 助手瀏覽器擴充功能從 ChatGPT/DeepSeek 竊取 LLM 對話記錄，影響 90 萬安裝、2 萬+企業租戶 | Microsoft Defender | 高 |
| 2026-03-06 | 偽造 LastPass 支援郵件試圖竊取保險庫密碼 | BleepingComputer | 中 |
| 2026-03-06 | 芬蘭稅務局釣魚攻擊使用收件人真名，與真實稅務通知同日發送 | NCSC-FI | 中 |
| 2026-03-06 | 威脅行為者濫用 .arpa TLD 建立 A 記錄，利用 Hurricane Electric/Cloudflare DNS 信譽 | Infoblox | 中 |
| 2026-03-06 | CERT.hr 警告克羅埃西亞公司遭偽造網站攻擊 | CERT.hr | 中 |
| 2026-03-07 | 斯洛伐克行動應用惡意程式針對當地消費者 | SK-CERT | 中 |

---

## 漏洞趨勢分析

### 本週新增漏洞概況

本週漏洞追蹤系統收錄資料概覽：

- **vulnerability_tracking 總收錄**：Critical/High 5,758 筆、Medium 9,212 筆、Low/Info 3,629 筆
- **本週 W10 新增**：vulnerability_tracking 收錄 863 個新檔案
- **security_news_facts/vulnerability_disclosure**：本週 54 個新揭露漏洞報告

**CISA KEV 新增**：
- **2026-03-03**：新增 2 個已知遭利用漏洞
  - **CVE-2026-21385**：Qualcomm 多晶片組記憶體損毀漏洞（CWE-190 整數溢位），影響 Android 裝置
  - **CVE-2026-22719**：Broadcom VMware Aria Operations 命令注入漏洞（CWE-77），未經認證遠端 RCE，嚴重程度 Critical
- **2026-03-05**：新增 5 個已知遭利用漏洞
  - **CVE-2017-7921**：Hikvision 多產品不當認證漏洞
  - **CVE-2021-22681**：Rockwell 多產品憑證保護不足漏洞（ICS 環境，Critical）
  - **CVE-2021-30952**：Apple 多產品整數溢位漏洞（tvOS, macOS, Safari, iPadOS, watchOS）
  - **CVE-2023-41974**：Apple iOS/iPadOS Use-After-Free 漏洞（核心權限任意程式碼執行）
  - **CVE-2023-43000**：Apple 多產品 Use-After-Free 漏洞（macOS, iOS, iPadOS, Safari）

**零日漏洞**：
- **CVE-2026-21513**（CVSS 8.8）：Windows MSHTML 安全功能繞過，由 APT28 (Fancy Bear) 積極利用。Akamai 使用 PatchDiff-AI 完成根因分析並提供 IOC。（來源：Akamai, 2026-03-03）
- **Cisco Catalyst SD-WAN 零日**：SK-CERT 發布兩次緊急警告（2026-03-04、2026-03-07），確認關鍵零日漏洞正被全球積極利用，尚無 CVE 編號公開。（來源：SK-CERT, 2026-03-04/07）
- **CVE-2026-0628**：Chrome Gemini 功能高嚴重性漏洞，惡意擴充功能可劫持 Gemini 面板存取本機檔案系統。（來源：Unit 42, 2026-03-03）
- **CVE-2026-29000**（CVSS 10.0）：Java pac4j-jwt JwtAuthenticator 完全認證繞過漏洞，攻擊者可透過惡意 JWT 冒充任何使用者包括管理員。（來源：CERT.hr, 2026-03-06）

### 按廠商/產品分布

| 廠商/產品 | 公告數量 | 嚴重程度 | 備註 |
|-----------|----------|----------|------|
| **Microsoft** | 多個 | Critical-High | MSHTML 零日 (CVE-2026-21513)、CERT-FR 多漏洞公告 |
| **Cisco** | 3+ | Critical | Catalyst SD-WAN 零日（兩次警告）、Secure Firewall Management Center (CVE-2026-20079/20131)、多漏洞公告 |
| **Apple** | 3 (KEV) | High | CVE-2021-30952、CVE-2023-41974、CVE-2023-43000（均已被積極利用） |
| **Google** | 3+ | High | Chrome 漏洞、Android 3 月安全公告、Pixel 漏洞、API 金鑰/Gemini 安全問題 |
| **Qualcomm** | 1 (KEV) | High | CVE-2026-21385 多晶片組記憶體損毀 |
| **Broadcom/VMware** | 1 (KEV) | Critical | CVE-2026-22719 Aria Operations 命令注入 |
| **Rockwell** | 1 (KEV) | Critical | CVE-2021-22681 ICS 憑證保護不足 |
| **Hitachi Energy** | 2 | High | Relion/REB500 產品、RTU500 產品（ICS） |
| **Delta Electronics** | 1 | High (7.8) | CNCSoft-G2 DOPSoft 元件 RCE |
| **pac4j** | 1 | Critical (10.0) | CVE-2026-29000 JWT 認證繞過 |
| **IBM** | 多個 | 中-高 | CERT-FR 公告 |
| **Linux Kernel** | 多個 | 中-高 | Red Hat、SUSE、Ubuntu 公告 |
| **CrushFTP** | 持續 | Critical | 暴力破解掃描活動加劇 |
| **HPE Aruba** | 1 | 高 | AOS 多漏洞 |

### ICS/OT 漏洞

本週 CISA 及各 CERT 發布多項工業控制系統安全公告：

- **Rockwell Automation 多產品** (CVE-2021-22681)：ICS 環境憑證保護不足，已加入 KEV，Critical 等級
- **Delta Electronics CNCSoft-G2** (ICSA-26-064-01)：DOPSoft 元件越界寫入，CVSS 7.8，可實現 RCE
- **Hitachi Energy Relion/REB500** 與 **RTU500**：多個漏洞影響關鍵能源基礎設施
- **Mitsubishi Electric MELSEC iQ-F Series EtherNet/IP**：ICS 通訊漏洞
- **Labkotec LID-3300IP**、**Portwell Engineering Toolkits**：嵌入式裝置漏洞
- **ePower / ePowerIE**、**Mobiliti / MobiHU**、**Everon OCPP Backends**：電動車充電基礎設施漏洞

### 零日趨勢（Google 年度回顧）

Google 發布 2025 年零日利用年度回顧（2026-03-06），揭示關鍵趨勢：

- 企業技術零日利用數量（43 個）和佔比（48%）均創歷史新高，近乎佔所有零日的一半
- 瀏覽器漏洞利用降至歷史低點，作業系統漏洞利用增加
- 國家支持間諜組織優先攻擊**邊緣裝置和安全設備**，超過一半的歸因利用集中於此類技術
- 商業監控廠商 (CSV) 持續關注行動和瀏覽器漏洞利用，調整攻擊鏈以繞過最新安全邊界
- BRICKSTORM 惡意軟體多次入侵科技公司，疑為竊取 IP 以支持零日漏洞開發

**Qdrant 跨層關聯分析**：語意查詢「遠端程式碼執行 critical vulnerability 2026」回傳 10 筆結果（相似度 0.65-0.69），確認 2026 年 RCE 類漏洞持續為高優先威脅，涵蓋 Android 平台（CVE-2026-0006、CVE-2026-0038）、Microsoft Excel (CVE-2026-20946) 等，且歷史 PoC（CVE-2019-9978）仍在 GitHub 持續更新追蹤。

---

## 活躍利用與 PoC 動態

### CISA KEV 更新

本週 CISA 新增 **7 個** 已知遭積極利用漏洞至 KEV 目錄：

| 日期 | CVE | 產品 | 類型 | 嚴重程度 |
|------|-----|------|------|----------|
| 2026-03-03 | CVE-2026-21385 | Qualcomm 多晶片組 | 記憶體損毀（整數溢位） | High |
| 2026-03-03 | CVE-2026-22719 | VMware Aria Operations | 命令注入 / RCE | Critical |
| 2026-03-05 | CVE-2017-7921 | Hikvision 多產品 | 不當認證 | High |
| 2026-03-05 | CVE-2021-22681 | Rockwell 多產品 | 憑證保護不足 | Critical |
| 2026-03-05 | CVE-2021-30952 | Apple 多產品 | 整數溢位 | High |
| 2026-03-05 | CVE-2023-41974 | Apple iOS/iPadOS | Use-After-Free | High |
| 2026-03-05 | CVE-2023-43000 | Apple 多產品 | Use-After-Free | High |

### 積極利用中的漏洞

| 漏洞 | 利用者 | 目標 | 狀態 |
|------|--------|------|------|
| CVE-2026-21513 (MSHTML) | APT28 / Fancy Bear（俄羅斯） | 所有 Windows 版本 | 已修補（2026-02 Patch Tuesday）|
| Cisco Catalyst SD-WAN 零日 | 不明 | 全球 SD-WAN 部署 | 緊急警告發布（SK-CERT 兩次） |
| CVE-2026-29000 (pac4j JWT) | 不明 | Java 應用程式 | CVSS 10.0，修補可用 |
| CrushFTP 多 CVE | 多方 | 企業檔案傳輸系統 | 暴力破解掃描活動持續增加 |
| CVE-2026-22719 (VMware Aria) | 不明 | VMware Aria Operations 部署 | CISA KEV，修補截止 2026-03-24 |
| CVE-2026-21385 (Qualcomm) | 不明 | Android 裝置 | 2026 年 3 月 Android 安全更新 |

### 新公開 PoC / Exploit 動態

- **PatchDiff-AI 分析 CVE-2026-21513**：Akamai 使用自動化工具分析 MSHTML 漏洞修補差異，提供 IOC 供防禦使用
- **CrushFTP 暴力破解掃描**：SANS ISC 報告針對 CrushFTP 的主動掃描活動持續加劇，關聯三個歷史嚴重 CVE
- **exploit_intelligence Layer 統計**：PoC 可用 2,316 筆（累積），活躍利用 57 筆（累積），本週新增 38 個檔案

---

## 攻擊手法歸納

### 分類統計

依 MITRE ATT&CK 框架歸納本週觀察到的主要攻擊技術：

#### 初始存取 (Initial Access)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 釣魚：惡意附件 | <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a> | 7+ | UAC-0252 (SHADOWSNIFF/SALATSTEALER)、BadPaw/MeowMeow、SloppyLemming、Finland Tax Phishing、LastPass Phishing、Signed Malware、Middle East conflict PDF lures |
| 釣魚：惡意連結 | <a href="https://attack.mitre.org/techniques/T1566/002/" class="ttp-badge" target="_blank">T1566.002</a> | 4+ | RedAlert App 副本、InstallFix 惡意廣告、LastPass 支援詐騙、LOTUSLITE 投遞 |
| 供應鏈攻擊 | <a href="https://attack.mitre.org/techniques/T1195/002/" class="ttp-badge" target="_blank">T1195.002</a> | 4 | NPM 大規模感染（26 億/週下載）、OpenClaw GitHub、惡意 AI 助手擴充功能、Wikipedia JavaScript 蠕蟲 |
| 合法帳號利用 | [T1078](https://attack.mitre.org/techniques/T1078/){: .ttp-ref } | 2+ | MFA 覆蓋缺口利用、CrushFTP 暴力破解 |
| 利用公開應用程式 | <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> | 3+ | Cisco SD-WAN 零日、CrushFTP、MSHTML CVE-2026-21513 |
| 搜尋引擎惡意廣告 | [T1583.008](https://attack.mitre.org/techniques/T1583/008/){: .ttp-ref } | 1+ | InstallFix 開發者工具安裝指南複製 |

#### 執行 (Execution)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 使用者執行：惡意檔案 | [T1204.002](https://attack.mitre.org/techniques/T1204/002/){: .ttp-ref } | 5+ | ClickFix、BadPaw ZIP、SloppyLemming、XWorm、LOTUSLITE PDF lure |
| 命令與腳本直譯器 | <a href="https://attack.mitre.org/techniques/T1059/" class="ttp-badge" target="_blank">T1059</a> | 4+ | Dindoor (Deno/JavaScript)、Havoc C2、XWorm、Wikipedia JS 蠕蟲 |

#### 持久性 (Persistence)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 瀏覽器擴充功能 | <a href="https://attack.mitre.org/techniques/T1176/" class="ttp-badge" target="_blank">T1176</a> | 3 | 惡意 AI 助手（90 萬安裝）、CVE-2026-0628 Gemini 利用、QuickLens |
| 遠端存取工具 | [T1219](https://attack.mitre.org/techniques/T1219/){: .ttp-ref } | 2+ | Signed RMM 後門、Havoc C2 |

#### 資料蒐集 (Collection)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 瀏覽器資料蒐集 | [T1217](https://attack.mitre.org/techniques/T1217/){: .ttp-ref } | 2+ | 惡意 AI 助手竊取 LLM 對話、GhostSocks 反詐騙繞過 |
| 鍵盤記錄 | [T1056.001](https://attack.mitre.org/techniques/T1056/001/){: .ttp-ref } | 2+ | SloppyLemming BurrowShell、SnakeKeylogger |

#### 命令與控制 (C2)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 應用層協定：Web 服務 | <a href="https://attack.mitre.org/techniques/T1071/001/" class="ttp-badge" target="_blank">T1071.001</a> | 3+ | APT36 (Slack/Discord/Supabase/Google Sheets)、GhostSocks、Empire Downloader |
| 非標準協定 | [T1095](https://attack.mitre.org/techniques/T1095/){: .ttp-ref } | 1 | PeerTime (BitTorrent C2) |
| 代理：Multi-hop Proxy | [T1090.003](https://attack.mitre.org/techniques/T1090/003/){: .ttp-ref } | 1 | BruteEntry ORBs（邊緣裝置代理節點） |

#### 影響 (Impact)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 網路拒絕服務 | <a href="https://attack.mitre.org/techniques/T1498/" class="ttp-badge" target="_blank">T1498</a> | 149+ | Operation Epic Fury 駭客主義 DDoS（12 團體、16 國） |
| 竄改 | [T1491](https://attack.mitre.org/techniques/T1491/){: .ttp-ref } | 1+ | Wikipedia JavaScript 蠕蟲頁面破壞 |

### IoC 趨勢（abuse.ch 資料）

本週 threat_feeds Layer 觀察到的指標量（672 個新檔案，累積總量）：

| 類別 | 累積數量 | 本週新增 | 趨勢 |
|------|----------|----------|------|
| C2 基礎設施 | 243 筆 | 7+ | Empire Downloader、AsyncRAT、Cobalt Strike、DCRat 持續活躍 |
| IoC 指標 | 8,771 筆 | 持續增長 | 竊密軟體相關 IoC 為主（StrelaStealer、SalatStealer、Stealc） |
| 惡意 URL | 26,400 筆 | 持續增長 | 大量釣魚和惡意軟體分發 URL |
| 惡意軟體樣本 | 6,154 筆 | 持續增長 | **Mirai 家族佔絕對多數**，其次為 GCleaner、Gafgyt |

### 惡意軟體家族分布（threat_feeds 樣本分析）

| 家族 | 類型 | 備註 |
|------|------|------|
| **Mirai** / **Gafgyt** / **Hajime** | IoT 殭屍網路 | 佔惡意軟體樣本最大比例，持續感染 IoT 裝置 |
| **AsyncRAT** / **QuasarRAT** / **DCRat** | 遠端存取木馬 | Windows 目標，C2 持續活躍 |
| **LummaStealer** / **Stealc** / **SalatStealer** / **StrelaStealer** | 竊密軟體 | 憑證和加密貨幣竊取，本週 ThreatFox 持續收錄新樣本 |
| **Empire Downloader** | 後滲透框架 | 使用 Starkiller C2 框架，Contabo 主機 |
| **GhostSocks** | 代理/反偵測 | 利用受害系統路由流量繞過反詐騙 |
| **XWorm** | RAT/資訊竊取 | 多技術投遞方式持續演進 |
| **SnakeKeylogger** | 鍵盤記錄器 | 憑證竊取 |
| **CoinMiner** | 加密貨幣挖礦 | 持續活躍 |

**Qdrant 跨層關聯分析**：語意查詢「phishing information stealer credential theft malware 2026」回傳 10 筆結果（相似度 0.54-0.58），確認竊密軟體（SalatStealer、Stealc、StrelaStealer）持續為主要威脅，且與 CERT-UA 報告的 UAC-0252 攻擊行動直接關聯。abuse.ch ThreatFox 在 2026-03-03 至 03-06 持續收錄竊密軟體相關 IoC，顯示這些惡意軟體家族仍在積極分發中。

---

## 新興威脅識別

### 1. AI 驅動的「Vibeware」惡意軟體開發模型（信心水準：高）

**首次出現**：APT36 (Transparent Tribe) 從現成惡意軟體轉向 AI 驅動的「Vibeware」開發模式，使用 AI 大量產生中等品質的惡意軟體植體。搭配 Nim、Zig、Crystal 等冷門程式語言規避標準偵測引擎。此模式預示國家級 APT 可能從「少量高品質」轉向「大量中品質」的惡意軟體策略。

**跨事件關聯**：OpenAI 同週發布威脅報告（2026-03-02），記錄威脅行為者如何在影響力操作、情感詐騙和網路攻擊中結合 AI 工具。Microsoft 發布「AI as Tradecraft」報告（2026-03-07），分析威脅行為者如何將 AI 作為加速器和武器使用。三份報告共同指向 **AI 在網路威脅生態系統中角色的顯著提升**。

### 2. 惡意 AI 助手瀏覽器擴充功能竊取 LLM 對話（信心水準：高）

**首次出現**：Microsoft Defender 發現偽裝為 AI 助手的 Chromium 擴充功能，針對性竊取 ChatGPT 和 DeepSeek 對話記錄。90 萬安裝量、2 萬+企業租戶受影響。暴露的資料類型包括專有程式碼、內部工作流程、策略討論和機密資料。

**新興攻擊面**：結合 CVE-2026-0628（Chrome Gemini 面板劫持漏洞），瀏覽器 AI 整合正快速成為新的攻擊面。**企業大規模採用 AI 工具但缺乏對應的安全控制**，創造了竊取高價值智慧財產的新路徑。

### 3. NPM 供應鏈大規模感染——軟體生態系統系統性風險（信心水準：高）

**首次出現**：18 個 NPM 套件遭入侵，涉及每週超過 26 億次下載量。此事件規模遠超過去的個別套件感染，凸顯 JavaScript 生態系統的系統性脆弱點。與先前的 event-stream（2018）和 ua-parser-js（2021）事件相比，本次感染涉及的下載量級數更大。

**跨事件關聯**：結合本週 OpenClaw GitHub 偽造安裝器和 InstallFix 惡意廣告攻擊，軟體供應鏈正從多個向量同時被攻擊：套件管理器感染、偽造開源專案、搜尋引擎惡意廣告引導的假安裝指南。

### 4. 合法數位簽署濫用的加速趨勢（信心水準：高）

**升級跡象**：本週觀察到多起使用合法數位簽署的攻擊：
- Seedworm 的 Dindoor 後門使用「Amy Cherne」簽發的憑證
- 偽裝工作場所 App 的惡意軟體使用「TrustConnect Software PTY LTD」EV 憑證

**影響**：EV 憑證的濫用削弱了程式碼簽署作為信任機制的有效性，組織不應將數位簽署視為安全性的充分證據。

### 5. 攝影機入侵成為戰爭「標準作戰手冊」——網路物理融合（信心水準：高）

**跨域威脅**：Check Point 研究及 WIRED 深度報導確認，IP 攝影機入侵已成為以色列、俄羅斯、烏克蘭及伊朗的戰爭標準手段。伊朗攻擊者在飛彈攻擊前後針對六國 IP 攝影機的活動模式，與動能行動高度時間相關，用途為戰損評估 (BDA)。此發現將**攝影機攻擊活動定義為動能軍事行動的先兆指標**，代表網路威脅情報與實體安全情報的融合達到新水準。

### 6. 中國 APT 長期潛伏行動的偵測（信心水準：高）

**新揭露**：Unit 42 公開 CL-UNK-1068 攻擊叢集，該組織自 2020 年起持續未被偵測地運作，針對亞洲七大關鍵產業（航空、能源、政府、執法、製藥、科技、電信）。結合 UAT-9244 對南美電信的攻擊，本週揭露的兩個中國 APT 行動表明中國網路間諜活動在地理範圍和產業涵蓋面上持續擴展。

### 7. .arpa TLD 濫用（信心水準：高）

**首次出現**：Infoblox 揭露威脅行為者透過取得 IPv6 位址空間、在反向 DNS 名稱下建立 A 記錄來濫用 .arpa TLD，利用 Hurricane Electric 和 Cloudflare 的良好信譽。此攻擊手法利用了 DNS 基礎設施的結構性假設（.arpa 不應承載內容），屬於新型的信譽劫持技術。

### 8. Google API 金鑰安全模型崩壞（信心水準：高）

**架構性安全失效**：Google 花十年告訴開發者 API 金鑰「不是密碼，可以公開」，但 Gemini 現在接受相同金鑰存取私人資料。約 3,000 個公開曝露的金鑰可認證至 Gemini。此類「安全保證被新產品靜默失效」的問題可能在其他快速整合 AI 功能的平台中重現。

---

## 產業動態補充

### 拉丁美洲網路攻擊倍增

Check Point 報告（2026-03-06）拉丁美洲已成為全球最重攻擊目標地區：
- 組織每週面臨約 3,100 次網路威脅，為美國（約 1,500 次/週）的兩倍多
- 2025 年拉丁美洲每週網路攻擊年增 53%
- 數位化快速成長但資安投資停滯是主因

### Q4 2025 漏洞與利用回顧

Kaspersky Securelist（2026-03-07）報告 2025 年 Q4 為歷史上最密集的高影響漏洞揭露期之一，多個熱門程式庫和主流應用程式的嚴重漏洞在揭露後幾乎立即被攻擊者利用。

### MFA 覆蓋缺口

分析揭示（2026-03-06）組織部署 MFA（透過 Entra ID、Okta、Google Workspace）有效保護雲端應用和聯合登入，但許多 Windows 登入仍依賴 Active Directory 認證路徑，從未觸發 MFA 提示，攻擊者持續利用這些缺口。

### AI/ML 供應鏈安全國際聯合指導

六國網路安全機構（加拿大、澳洲、日本、紐西蘭、韓國、新加坡）聯合發布 AI/ML 供應鏈風險與緩解措施指導文件（2026-03-05），涵蓋模型訓練資料、第三方元件、部署環境等面向的安全考量。

### 破壞性攻擊防禦指南更新

Google Cloud Threat Intelligence（2026-03-07）發布「2026 版破壞性攻擊主動準備與強化」指南，指出衝突爆發時網路攻擊是廉價且易部署的武器，提供實用且可擴展的防護建議。

---

## 資料限制與免責聲明

1. **來源偏差**：本報告主要依賴歐洲（NCSC-FI、CERT-FR、SK-CERT、CERT-UA、CERT.hr）和北美（CISA、CCCS）CERT/安全機構的 RSS 饋送，對亞太、非洲地區的覆蓋程度較低。部分非英語來源（斯洛伐克語、芬蘭語、法語、克羅埃西亞語）的細節可能因翻譯或摘要截斷而有所缺失。

2. **時效性**：本報告反映截至 2026-03-07 的已公開資訊。部分事件（如 Cisco SD-WAN 零日的具體 CVE 編號）可能在報告產出後才獲得完整技術細節。

3. **威脅情報歸因**：APT 歸因基於各安全廠商的評估（如 Cisco Talos、Check Point、Zscaler、ClearSky、Palo Alto Unit 42、Bitdefender 等），歸因結論可能隨後續調查而調整。CL-UNK-1068 的中國歸因為「高信心」；Dust Specter 的伊朗歸因為「中至高信心」。

4. **threat_feeds 統計**：IoC、惡意 URL 和惡意軟體樣本的數量為 abuse.ch 等開源情報饋送的累積統計，包含歷史資料，非全部為本週新增。本週新增 672 個 threat_feeds 檔案。

5. **Qdrant 語意查詢**：語意查詢結果基於向量相似度，可能包含語意相近但時間範圍不同的結果。所有跨層關聯分析已標註相似度分數供參考。

6. **漏洞數量**：本報告記錄的漏洞為本週由各 CERT 機構和安全廠商公開揭露或新增至 KEV 的漏洞。vulnerability_tracking Layer 本週新增 863 個檔案，security_news_facts/vulnerability_disclosure 新增 54 個檔案。

7. **免責聲明**：本報告僅供資安態勢感知和研究參考用途，不構成任何特定組織的風險評估或安全建議。各組織應根據自身情境和暴露面進行獨立評估。重大安全決策請結合多方情資來源。

---

> 本報告由資訊安全產業智慧分析系統自動產出，資料來源涵蓋 NCSC-FI、CERT-UA、CERT-FR、SK-CERT、CERT.hr、CISA、SANS ISC、CCCS、abuse.ch (MalwareBazaar/ThreatFox/URLhaus) 等國際安全機構與開源情報饋送。Qdrant 語意查詢用於跨 Layer 關聯分析，共執行 5 次查詢，回傳 50 筆相關結果。
