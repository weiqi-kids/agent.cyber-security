---
layout: seo-report
title: 2026 第 10 週威脅態勢分析
description: "2026-02-26 至 2026-03-05 資安威脅週報：伊朗 Operation Epic Fury 後多 APT 同步動員、APT28 利用 CVE-2026-21513 MSHTML 零日漏洞、Dust Specter 伊拉克政府攻擊、SloppyLemming 南亞間諜活動、UAC-0252 SHADOWSNIFF 竊取程式、Cisco SD-WAN ED 26-03 持續、CISA 新增 Qualcomm/VMware KEV、Chrome Gemini CVE-2026-0628、EV 充電站系統性漏洞、CrushFTP 暴力破解掃描、Vidar 與 AsyncRAT 主導威脅饋送。"
parent: 威脅態勢分析
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-threat-landscape.png
author: 資安情報分析團隊
date: 2026-03-05
---

# 威脅態勢分析 — 2026 第 10 週

> 涵蓋期間：2026-02-26 至 2026-03-05
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-03-05（資料截至 2026-03-05 UTC）

---

## 執行摘要

本週威脅態勢呈現**地緣政治驅動的國家級網路戰全面升級**，結合**多國 APT 組織同時活躍**、**ICS/OT 漏洞系統性曝光**與**活躍利用漏洞持續擴張**四大主軸。美以聯合 Operation Epic Fury（2026-02-28）引發伊朗網路報復威脅成為本週主導議題，多個新的國家級 APT 行動被揭露，同時關鍵基礎設施——尤其是 EV 充電站與工業控制系統——面臨前所未有的漏洞曝光壓力。

**本週重大事件**：
- **伊朗 Operation Epic Fury 後網路戰升級**：伊朗全國網路降至 4%（NetBlocks），五大 APT 組織（MuddyWater、APT33、APT34、Charming Kitten、Moses Staff）同步動員，加拿大、芬蘭等多國 CERT 發布伊朗網路威脅公告
- **APT28 利用 CVE-2026-21513 MSHTML 零日漏洞**：Akamai 確認俄羅斯 APT28 積極利用 Windows MSHTML 安全功能繞過漏洞（CVSS 8.8）
- **Dust Specter APT 攻擊伊拉克政府**：Zscaler 揭露疑似伊朗關聯 APT 使用四種新型惡意軟體（SPLITDROP、TWINTASK、TWINTALK、GHOSTFORM）
- **SloppyLemming 南亞間諜活動**：Arctic Wolf 揭露印度關聯威脅行為者對巴基斯坦、孟加拉、斯里蘭卡的一年期間諜活動
- **Cisco SD-WAN 零日利用持續（CISA ED 26-03）**：CVE-2026-20127 全球範圍內持續被積極利用，SK-CERT 發布正式警告
- **CISA 新增 KEV**：CVE-2026-21385（Qualcomm 記憶體損壞）與 CVE-2026-22719（VMware Aria Operations 命令注入）
- **EV 充電站漏洞系統性曝光**：CloudCharge、EV Energy、EV2Go、Mobility46、Switch EV、ePower、Everon OCPP、Mobiliti-E 等 8+ 平台

**本週新增/持續 CISA KEV 重點**：
- **CVE-2026-21385** — Qualcomm 多晶片記憶體損壞（2026-03-03 新增 KEV）
- **CVE-2026-22719** — Broadcom VMware Aria Operations 命令注入（2026-03-03 新增 KEV）
- **CVE-2026-21513** — Microsoft MSHTML 安全功能繞過（CVSS 8.8，APT28 利用）
- **CVE-2026-20127** — Cisco SD-WAN 身份驗證繞過（CISA ED 26-03 持續）
- **CVE-2026-1731** — BeyondTrust RS/PRA OS 命令注入（已用於勒索軟體，修補期限已過期）

**新揭露 ICS/OT 漏洞**（CISA 2026-03-03 發布）：
- Hitachi Energy Relion REB500（繼電器保護）、RTU500（遠端終端單元）
- Mitsubishi Electric MELSEC iQ-F Series EtherNet/IP
- Labkotec Lid-3300IP（液位偵測）、Portwell Engineering 工具套件
- Johnson Controls Frick Quantum HD、Schneider Electric EcoStruxure Building Operation
- EV 充電站後端（ePower、Everon OCPP、Mobiliti-E/MobiHu）

**Chrome 與 AI 安全新威脅**：
- **CVE-2026-0628**：Palo Alto Unit 42 揭露 Chrome Gemini 面板漏洞，惡意擴充功能可劫持 Gemini AI 並存取本機檔案系統
- **CrushFTP 暴力破解掃描**：SANS ISC 偵測到活躍掃描，關聯三個已知高風險 CVE

**威脅情報饋送統計**（2026-03-01 至 2026-03-04）：
- URLhaus 惡意 URL：992 筆（3 月至今）
- MalwareBazaar 惡意軟體樣本：508 筆（3 月至今）
- ThreatFox IoC 指標：1,398 筆（3 月至今）
- C2 基礎設施：2 筆（AsyncRAT）
- Top 惡意程式家族：Vidar (109)、AsyncRAT (72)、IClickFix (69)、ClearFake (56)、Cobalt Strike (44)、StrelaStealer (39)、NetSupportManager RAT (27)

---

## 資料來源統計

| Layer | 2026 年累計 | 本週新增（估計） | 說明 |
|-------|-------------|------------------|------|
| security_news_facts | attack_incident: **338+**, vulnerability_disclosure: **80+** (本週) | 18 事件 + 80 漏洞揭露 | 國際資安新聞與事件 |
| vulnerability_tracking | critical_high: **2,605**, medium: **8,884+** | 持續更新 | 漏洞追蹤（NVD、EPSS、國際 CERT） |
| exploit_intelligence | active_exploitation: **53+**, poc_available: **2,263+** | 2 新增 KEV + 20 PoC | 活躍利用與 PoC 情報 |
| threat_feeds | malicious_url: **26,222**, malware_sample: **6,004**, ioc_indicator: **8,385**, c2: **223** | 1,867 IoC（3/3 單日） | 威脅饋送（abuse.ch） |

> 統計時間：2026-03-05 UTC

---

## 2.1 近期重大資安事件

### 1. 伊朗 Operation Epic Fury — 網路報復威脅全面升級

**嚴重程度：Critical | 來源：Canadian Cyber Centre、NCSC-FI、Check Point Research、NetBlocks、CERT-AT | 日期：2026-02-28 至 2026-03-03**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1498/" class="ttp-badge" target="_blank">T1498</a> Network Denial of Service
- <a href="https://attack.mitre.org/techniques/T1583/006/" class="ttp-badge" target="_blank">T1583.006</a> Acquire Infrastructure: Mobile Application Compromise
- <a href="https://attack.mitre.org/techniques/T1588/001/" class="ttp-badge" target="_blank">T1588.001</a> Obtain Capabilities: Malware
- <a href="https://attack.mitre.org/techniques/T1486/" class="ttp-badge" target="_blank">T1486</a> Data Encrypted for Impact

本週最具地緣政治影響力的系列事件。美以聯合 Operation Epic Fury（2026-02-28）觸發伊朗全面網路報復威脅，多起高度關聯事件凸顯國家級網路戰達到前所未有的規模。

**事件 A：伊朗全國網路封鎖（2026-02-28 至 2026-03-01）**
- 全國網路連線降至正常水準的 4%（NetBlocks Internet Observatory 監測）
- 政府主導的網路封鎖與美以軍事行動同步
- 實施雙層網路架構：軍事/政府網路保持運作，民用網路近乎中斷

**事件 B：BadeSaba 祈禱 App 遭駭進行心戰宣傳（2026-03-01）**
- 受影響 App：BadeSaba Calendar（Google Play 500 萬下載）
- 攻擊者劫持推播通知基礎設施，德黑蘭時間 09:52 起 30 分鐘內連續發送
- 內容敦促伊朗軍方人員投降，展示行動應用程式的心理戰潛力

**事件 C：五大伊朗 APT 組織同步動員（2026-02-27 偵測）**
- MuddyWater、APT33（Refined Kitten）、APT34（OilRig）、Charming Kitten、Moses Staff
- MuddyWater 自衝突升級以來部署 5 個全新惡意程式家族（含 Rust 基礎工具）
- 評估：以色列面臨「史上最危險的網路威脅環境」

**事件 D：伊朗國家行為者採用犯罪戰術**
- 伊朗越來越多地將勒索軟體納入國家級破壞行動 [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref }
- 混合模式讓伊朗在達成地緣政治目標的同時維持可否認性
- Operation Epic Fury 消除伊朗常規軍事選項後，網路行動成為唯一剩餘的非對稱報復工具

**事件 E：多國 CERT 發布伊朗威脅公告**
- **加拿大 Cyber Centre**（2026-03-02）：評估伊朗「幾乎確定」將使用網路能力報復美以盟國
- **Check Point Research**（2026-03-03）：發布伊朗網路能力全面概述，涵蓋 IRGC/MOIS 組織架構與 TTPs
- **CERT-AT 奧地利**：針對關鍵基礎設施發布伊朗威脅預警
- 預期威脅類型：關鍵基礎設施攻擊、網路資訊戰、軍事人員線上騷擾、僑民壓制

**影響評估**：此事件標誌著國家級網路戰的重要里程碑——軍事行動、網路封鎖、行動 App 心理戰、多 APT 組織協調動員同步發生。Qdrant 跨 Layer 查詢（查詢 4）顯示，伊朗 APT 利用的漏洞類型與 Ivanti Connect Secure 攻擊呈現相似的邊界設備攻擊模式（相似度 0.55），暗示伊朗 APT 可能將邊界設備漏洞作為首選入侵向量。

### 2. APT28 利用 CVE-2026-21513 MSHTML 零日漏洞

**嚴重程度：High | 來源：Akamai、NCSC-FI | 日期：2026-03-03**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1203/" class="ttp-badge" target="_blank">T1203</a> Exploitation for Client Execution
- <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a> Phishing: Spearphishing Attachment
- <a href="https://attack.mitre.org/techniques/T1221/" class="ttp-badge" target="_blank">T1221</a> Template Injection

Akamai 研究員使用 PatchDiff-AI 分析 **CVE-2026-21513**（Windows MSHTML 安全功能繞過，CVSS 8.8），確認俄羅斯國家支持的 **APT28（Fancy Bear / Sofacy）**正積極利用此漏洞於野外攻擊。

**漏洞細節**：
- **影響範圍**：所有 Windows 版本的 MSHTML 框架
- **修補**：2026 年 2 月 Patch Tuesday 已修補
- **攻擊向量**：透過文件誘餌（Office 文件、HTML 檔案）觸發模板注入
- **利用效果**：安全功能繞過，可能導致任意程式碼執行

**防禦建議**：
- 立即套用 2026 年 2 月 Patch Tuesday 更新
- 檢閱 Akamai 發布的 IoC 進行偵測與獵捕
- 加強對 MSHTML 相關文件渲染的監控
- 阻擋來自不信任來源的 Office 文件巨集與模板載入

### 3. Dust Specter APT 攻擊伊拉克政府官員

**嚴重程度：High | 來源：Zscaler ThreatLabz | 日期：2026-03-03（攻擊發生於 2026 年 1 月）**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1059/" class="ttp-badge" target="_blank">T1059</a> Command and Scripting Interpreter
- <a href="https://attack.mitre.org/techniques/T1105/" class="ttp-badge" target="_blank">T1105</a> Ingress Tool Transfer
- <a href="https://attack.mitre.org/techniques/T1041/" class="ttp-badge" target="_blank">T1041</a> Exfiltration Over C2 Channel
- <a href="https://attack.mitre.org/techniques/T1547/" class="ttp-badge" target="_blank">T1547</a> Boot or Logon Autostart Execution

Zscaler ThreatLabz 揭露疑似伊朗關聯 APT 組織 **Dust Specter** 針對伊拉克政府官員的攻擊行動，部署四種全新惡意軟體家族：

**新型惡意軟體家族**：
1. **SPLITDROP** — Dropper（首次記錄），負責投遞後續 payload
2. **TWINTASK** — 後門程式，具備遠端指令執行能力
3. **TWINTALK** — 後門程式（與 TWINTASK 並用），提供備援 C2 通道
4. **GHOSTFORM** — 遠端存取木馬（RAT），具備完整監控與資料外洩功能

**兩種攻擊鏈**：
- **攻擊鏈 1**：SPLITDROP dropper → TWINTASK + TWINTALK 後門 → 持久化存取、遠端指令執行
- **攻擊鏈 2**：GHOSTFORM RAT → 遠端存取、監控、資料外洩

**歸因**：伊朗關聯（中至高信心），基於與已知伊朗 APT 組織在 TTPs、工具與受害者選擇上的顯著重疊。在 Operation Epic Fury 的背景下，Dust Specter 的出現意味著伊朗網路能力持續擴張，新 APT 組織不斷被識別。

### 4. SloppyLemming 南亞間諜活動

**嚴重程度：High | 來源：Arctic Wolf | 日期：2026-03-03（活動自 2025 年 1 月起）**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a> Phishing: Spearphishing Attachment
- <a href="https://attack.mitre.org/techniques/T1113/" class="ttp-badge" target="_blank">T1113</a> Screen Capture
- <a href="https://attack.mitre.org/techniques/T1056/001/" class="ttp-badge" target="_blank">T1056.001</a> Input Capture: Keylogging
- <a href="https://attack.mitre.org/techniques/T1005/" class="ttp-badge" target="_blank">T1005</a> Data from Local System

Arctic Wolf 揭露印度關聯威脅行為者 **SloppyLemming** 對南亞三國的長期間諜活動：

**攻擊規模**：
- **目標國家**：巴基斯坦、孟加拉、斯里蘭卡
- **目標類型**：政府機構、關鍵基礎設施營運者
- **活動期間**：2025 年 1 月至 2026 年初（約一年）

**兩種攻擊手法**：
1. **BurrowShell 後門**：透過惡意 PDF 文件投遞，具備截圖與檔案系統操作功能
2. **Excel 惡意軟體**：透過惡意 Excel 文件投遞，具備鍵盤記錄與偵察功能

**關鍵觀察**：此次揭露確認印度不僅是網路間諜的受害者，也是活躍的參與者。長達一年的持續活動顯示具有成熟的 C2 基礎設施與操作安全意識。

### 5. UAC-0252 冒充烏克蘭政府部署 SHADOWSNIFF 與 SALATSTEALER

**嚴重程度：High | 來源：CERT-UA | 日期：2026-03-02（活動自 2026 年 1 月起）**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a> Phishing: Spearphishing Attachment
- <a href="https://attack.mitre.org/techniques/T1036/" class="ttp-badge" target="_blank">T1036</a> Masquerading
- <a href="https://attack.mitre.org/techniques/T1555/" class="ttp-badge" target="_blank">T1555</a> Credentials from Password Stores

CERT-UA 發布 CERT-UA#20032 公告，揭露威脅行為者 UAC-0252 自 2026 年 1 月起的持續性釣魚攻擊：

- **社交工程**：冒充烏克蘭中央政府機構與地方行政機關
- **誘餌內容**：敦促收件人更新軍民系統使用的行動應用程式
- **惡意程式**：SHADOWSNIFF（網路通訊憑證竊取）、SALATSTEALER（密碼與認證資料竊取）
- **目標**：烏克蘭政府人員與軍事人員

### 6. Cisco SD-WAN 全球性利用活動持續（CISA ED 26-03）

**嚴重程度：Critical | 來源：CISA、NSA、ACSC、NCSC-UK、CERT-FR、SK-CERT | 日期：持續中**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> Exploit Public-Facing Application
- <a href="https://attack.mitre.org/techniques/T1068/" class="ttp-badge" target="_blank">T1068</a> Exploitation for Privilege Escalation
- <a href="https://attack.mitre.org/techniques/T1556/" class="ttp-badge" target="_blank">T1556</a> Modify Authentication Process

CISA 緊急指令 ED 26-03 持續生效。SK-CERT（斯洛伐克）於 2026-03-04 依法律第 69/2018 號發布正式警告，確認 Cisco Catalyst SD-WAN 零日漏洞在全球範圍內持續被積極利用。

**攻擊鏈**：
1. **初始入侵**：CVE-2026-20127（CWE-287 不當身份驗證，CVSS 10.0）— 未認證攻擊者可直接繞過認證
2. **NETCONF 存取**：攻擊者以高權限帳戶操縱 SD-WAN 網路結構
3. **權限提升**：CVE-2022-20775（路徑遍歷 + 不當權限管理）
4. **持久化**：添加惡意 rogue peers 至 SD-WAN 配置，建立持久後門

**聯合發布夥伴**：NSA（美國）、ASD ACSC（澳洲）、Canadian Cyber Centre（加拿大）、NCSC-NZ（紐西蘭）、NCSC-UK（英國）、CERT-FR（法國）、CERT.RO（羅馬尼亞）、SK-CERT（斯洛伐克）

**防禦建議**：立即斷開受影響 SD-WAN 控制器的管理介面外部存取，套用 Cisco 緊急修補，進行 NETCONF 日誌審計與異常 peer 配置檢查。

### 7. CISA 新增 Qualcomm 與 VMware KEV

**嚴重程度：High | 來源：CISA | 日期：2026-03-03**

CISA 於 2026-03-03 新增兩個漏洞至 KEV 目錄，確認正被活躍利用：

| CVE | 產品 | 漏洞類型 | 嚴重程度 | 影響 |
|-----|------|----------|----------|------|
| **CVE-2026-21385** | Qualcomm 多晶片 | 記憶體損壞 | High | Android 設備遭遠端攻擊 |
| **CVE-2026-22719** | Broadcom VMware Aria Operations | 命令注入（未認證 RCE） | Critical | 虛擬化管理平台完全控制 |

CVE-2026-22719 尤為嚴重——作為未認證 RCE，攻擊者可在無需任何憑證的情況下完全控制 VMware Aria Operations 管理平台，進而影響整個虛擬化環境。

### 8. Chrome Gemini AI 面板漏洞（CVE-2026-0628）

**嚴重程度：High | 來源：Palo Alto Unit 42 | 日期：2026-03-03**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1176/" class="ttp-badge" target="_blank">T1176</a> Browser Extensions
- <a href="https://attack.mitre.org/techniques/T1005/" class="ttp-badge" target="_blank">T1005</a> Data from Local System

Palo Alto Unit 42 揭露 **CVE-2026-0628**，Chrome 瀏覽器 Gemini AI 功能中的高嚴重性漏洞：
- 惡意擴充功能可劫持 Gemini Live 面板
- 可存取使用者本機檔案系統
- 突顯瀏覽器整合 AI 功能帶來的新型攻擊面

**更廣泛意義**：隨著瀏覽器整合 AI 助手（Agentic AI），被入侵的 AI 面板可成為存取敏感本地資料的跳板，代表全新漏洞類別的出現。AI 功能通常被授予比傳統網頁功能更高的系統權限（檔案系統存取、程式碼執行），攻擊者將優先鎖定此類功能。

### 9. SIM 卡交換攻擊與地緣政治危機利用

**嚴重程度：Medium | 來源：NCSC-FI | 日期：2026-03-03**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1598/" class="ttp-badge" target="_blank">T1598</a> Phishing for Information
- <a href="https://attack.mitre.org/techniques/T1078/" class="ttp-badge" target="_blank">T1078</a> Valid Accounts

本週揭露兩起 SIM 卡交換相關事件：

**事件 A：杜拜危機 SIM-swap 詐騙**
- 伊朗飛彈攻擊杜拜數小時後，詐騙者冒充「杜拜危機管理」部門發動 SIM 卡交換攻擊
- 試圖存取銀行帳戶，展示地緣政治危機如何被犯罪分子迅速利用為社交工程機會

**事件 B：芬蘭犯罪集團 SIM-swap 逮捕**
- 芬蘭國家調查局逮捕犯罪集團成員，涉及系統性 SIM 卡交換詐騙
- 反映 SIM-swap 攻擊在歐洲的持續威脅

### 10. CrushFTP 暴力破解掃描與多 CVE 利用

**嚴重程度：High | 來源：SANS ISC | 日期：2026-03-03**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> Exploit Public-Facing Application
- <a href="https://attack.mitre.org/techniques/T1110/" class="ttp-badge" target="_blank">T1110</a> Brute Force

SANS ISC 偵測到針對 CrushFTP 檔案傳輸系統的活躍暴力破解掃描，關聯三個高風險漏洞：
- **CVE-2024-4040**：Template injection → VFS 沙箱逃逸 → RCE
- **CVE-2025-31161**：認證繞過（取得 crushadmin 帳戶）
- **CVE-2025-54309**：零日漏洞（2025 年 7 月揭露時已在野外利用）

延續近年來檔案傳輸系統持續被攻擊的趨勢（MOVEit、GoAnywhere、Accellion、FileZen）。Qdrant 查詢（查詢 1）中 Soliton FileZen 的活躍利用記錄（相似度 0.55+）進一步佐證此系統性攻擊趨勢。

### 11. 其他重要事件

**韓國國稅局冷錢包種子詞外洩（480 萬美元失竊）** — 2026-03-01
- 韓國國稅局查獲逃稅者後公開照片意外暴露 Ledger 冷錢包助記詞
- 攻擊者轉走約 480 萬美元加密貨幣
- [T1552.004](https://attack.mitre.org/techniques/T1552.004/){: .ttp-ref } Unsecured Credentials: Private Keys

**QuickLens Chrome 擴充套件 ClickFix 攻擊** — 2026-03-01
- Chrome 擴充套件 QuickLens（約 7,000 使用者，Google 精選徽章）遭供應鏈攻擊
- v5.8 植入 ClickFix 攻擊腳本與加密貨幣竊取功能
- [T1176](https://attack.mitre.org/techniques/T1176/){: .ttp-ref } Browser Extensions

**芬蘭 Deepfake 假藥詐騙** — 2026-03-02
- AI 生成 Deepfake 影片冒充芬蘭醫師與名人推廣假藥
- 北歐國家 Deepfake 詐騙趨勢的一部分

**羅馬尼亞關鍵漏洞主動利用警報** — 2026-02-26
- CERT.RO 發布主動利用警報，要求機構檢查暴露面

**FortiGate 裝置持續遭入侵** — 持續中
- 多台 FortiGate 裝置被植入持久性唯讀後門
- FortiCloud SSO 繞過漏洞（CVE-2025-59718、CVE-2025-59719）持續被利用收集 LDAP 連線資料

---

## 2.2 漏洞趨勢分析

### 本週漏洞統計

| 嚴重程度 | 2026 年累計 | 本週趨勢 | 說明 |
|----------|-------------|----------|------|
| Critical/High | 2,605 | 穩定增長 | vulnerability_tracking/critical_high |
| Medium | 8,884+ | 穩定增長 | vulnerability_tracking/medium |
| 活躍利用 (KEV) | 53+ | +2（本週新增） | exploit_intelligence/active_exploitation |
| PoC 可用 | 2,263+ | +20（本週估計） | exploit_intelligence/poc_available |

### 本週新增 CISA KEV

| CVE | 產品 | 漏洞類型 | 嚴重程度 | 新增日期 |
|-----|------|----------|----------|----------|
| **CVE-2026-21385** | Qualcomm 多晶片 | 記憶體損壞 | High | 2026-03-03 |
| **CVE-2026-22719** | VMware Aria Operations | 未認證命令注入 → RCE | Critical | 2026-03-03 |

### 持續活躍利用漏洞（延續前週）

| CVE | 產品 | 利用難度 | 修補期限 | 勒索軟體 | 狀態 |
|-----|------|----------|----------|----------|------|
| **CVE-2026-20127** | Cisco SD-WAN | 低 | **ED 26-03** | Unknown | **持續活躍** |
| **CVE-2026-1731** | BeyondTrust RS/PRA | 低 | **2026-02-16（已過期）** | **Known** | **逾期** |
| **CVE-2026-20045** | Cisco UCM | 低 | **2026-02-11（已過期）** | Unknown | **逾期** |
| **CVE-2026-25108** | Soliton FileZen | 低 | ED 相關 | Unknown | **持續** |
| **CVE-2026-22769** | Dell RP4VMs | 低 | **2026-02-21（已過期）** | Unknown | **逾期** |
| **CVE-2026-2441** | Chromium CSS | 中 | **2026-03-10** | Unknown | **接近期限** |
| **CVE-2025-49113** | RoundCube Webmail | 中 | TBD | N/A | **持續** |
| **CVE-2025-68461** | RoundCube Webmail | 低 | TBD | N/A | **持續** |
| **CVE-2026-24423** | SmarterMail | 低 | **已過期** | **Known** | **逾期** |

### APT 活躍利用漏洞

| CVE | 產品 | 嚴重程度 | 威脅行為者 | 利用方式 |
|-----|------|----------|------------|----------|
| **CVE-2026-21513** | Microsoft MSHTML | High (8.8) | APT28（Russia） | 文件誘餌 → 模板注入 → 安全繞過 |

### ICS/OT 漏洞揭露（本週 CISA 新發布）

本週 CISA 發布大量 ICS 安全公告，涵蓋能源基礎設施、工業控制系統與 EV 充電站：

| 產品 | 廠商 | 領域 | 說明 |
|------|------|------|------|
| Relion REB500 | Hitachi Energy | 電力保護 | 繼電器保護系統漏洞 |
| RTU500 | Hitachi Energy | 電力/能源 | 遠端終端單元漏洞 |
| MELSEC iQ-F EtherNet/IP | Mitsubishi Electric | 製造業 | PLC 通訊漏洞 |
| Lid-3300IP | Labkotec | 環境監控 | 液位偵測系統 |
| Engineering 工具套件 | Portwell | 工業製造 | 工程工具漏洞 |
| Frick Quantum HD | Johnson Controls | HVAC/工業 | 冷凍空調控制漏洞 |
| EcoStruxure Building Operation | Schneider Electric | 建築自動化 | 建築管理系統漏洞 |
| MasterSCADA BUK-TS | InSAT | 工業控制 | OS 命令注入（Critical） |

**EV 充電站平台系統性漏洞曝光**：

| 平台 | 漏洞類型 | 說明 |
|------|----------|------|
| CloudCharge | WebSocket 缺乏認證 | 充電站後端平台 |
| EV Energy | Session 管理不當 | 充電站管理 |
| EV2Go | 暴力破解 | 充電站服務 |
| Mobility46 | WebSocket 缺乏認證（CVSS 9.4） | 充電站後端 |
| Switch EV | Session 管理不當 | 充電站服務 |
| ePower | 安全缺陷 | 充電站後端（新增） |
| Everon OCPP Backends | OCPP 協議漏洞 | 充電站通訊後端（新增） |
| Mobiliti-E/MobiHu | 安全缺陷 | 充電站平台（新增） |
| Chargemap | 安全缺陷 | 充電站地圖/服務 |

**關鍵觀察**：
- **EV 充電站安全為系統性問題**：8+ 不同平台在短時間內被揭露漏洞，漏洞模式一致（WebSocket 缺乏認證、暴力破解、session 管理不當），指向整個產業的安全成熟度不足
- **電力系統設備**：Hitachi Energy Relion 繼電器與 RTU500 直接影響電力保護與控制系統
- **工業 PLC**：Mitsubishi MELSEC iQ-F EtherNet/IP 模組影響製造業自動化環境
- **InSAT MasterSCADA**：CVE-2026-22553 為 Critical 級 OS 命令注入，影響工業 SCADA 系統（Qdrant 查詢 3 確認）

### 廠商漏洞分布

| 廠商 | 漏洞公告數 | 重點 |
|------|-----------|------|
| **Cisco** | 3+（持續） | SD-WAN 零日 CISA ED 26-03、UCM |
| **Microsoft** | 2+ | MSHTML CVE-2026-21513（APT28 利用）、Feb Patch Tuesday（6 個活躍利用 CVE） |
| **Qualcomm** | 1 | 多晶片記憶體損壞（KEV） |
| **Broadcom/VMware** | 2+ | Aria Operations 命令注入（KEV） |
| **Hitachi Energy** | 2 | Relion REB500、RTU500 |
| **Mitsubishi Electric** | 1 | MELSEC iQ-F EtherNet/IP |
| **Google** | 2 | Chrome Gemini CVE-2026-0628、Android March 2026 安全公告 |
| **Docker** | 1 | Desktop 安全更新（CERT-FR） |
| **Schneider Electric** | 1 | EcoStruxure Building Operation |
| **Johnson Controls** | 1 | Frick Quantum HD |
| **InSAT** | 1 | MasterSCADA BUK-TS（Critical OS 命令注入） |
| **EV 充電站平台** | 8+ | 系統性安全問題 |

---

## 2.3 活躍利用與 PoC 動態

### 已確認活躍利用漏洞匯總

| CVE ID | 產品 | 類型 | 修補期限 | 勒索軟體 | 本週狀態 |
|--------|------|------|----------|----------|----------|
| **CVE-2026-21385** | Qualcomm | 記憶體損壞 | TBD | N/A | **新增 KEV** |
| **CVE-2026-22719** | VMware Aria | 未認證 RCE | TBD | N/A | **新增 KEV** |
| **CVE-2026-21513** | Microsoft MSHTML | 安全繞過 | 已修補 | N/A | **APT28 利用** |
| **CVE-2026-20127** | Cisco SD-WAN | 認證繞過 (CVSS 10.0) | **ED 26-03** | Unknown | **持續** |
| **CVE-2026-1731** | BeyondTrust | OS 命令注入 | **已過期** | **Known** | **逾期** |
| **CVE-2026-20045** | Cisco UCM | 程式碼注入 | **已過期** | Unknown | **逾期** |
| **CVE-2026-25108** | Soliton FileZen | OS 命令注入 | ED 相關 | Unknown | **持續** |
| **CVE-2026-22769** | Dell RP4VMs | 硬編碼憑證 | **已過期** | Unknown | **逾期** |
| **CVE-2026-2441** | Chromium CSS | UAF RCE | 2026-03-10 | Unknown | **接近期限** |
| **CVE-2026-24423** | SmarterMail | 認證缺失→RCE | **已過期** | **Known** | **逾期** |
| **CVE-2025-49113** | RoundCube | 反序列化 RCE | TBD | N/A | **持續** |
| **CVE-2025-68461** | RoundCube | XSS | TBD | N/A | **持續** |

**重要觀察**：
- 本週新增 2 個 KEV（Qualcomm、VMware），加上 APT28 確認利用 MSHTML 漏洞，共 3 個新的活躍利用確認
- 多個修補期限已過期的 KEV 仍在活躍利用中（BeyondTrust、Cisco UCM、Dell RP4VMs、SmarterMail）——修補合規嚴重落後
- **勒索軟體關聯**：CVE-2026-1731（BeyondTrust）與 CVE-2026-24423（SmarterMail）均已確認用於勒索軟體攻擊鏈

### 新公開 PoC 動態

2026 年累計 2,263+ 個 PoC（exploit_intelligence/poc_available），本週新增的 PoC 涵蓋：

| CVE | 產品/框架 | PoC 類型 | 風險評估 |
|-----|-----------|----------|----------|
| CVE-2026-21902 | 未公開 | GitHub PoC | 待評估 |
| CVE-2026-2628 | 未公開 | GitHub PoC | 待評估 |
| CVE-2026-26416 | 未公開 | GitHub PoC | 待評估 |
| CVE-2026-26417 | 未公開 | GitHub PoC | 待評估 |
| CVE-2026-26418 | 未公開 | GitHub PoC | 待評估 |
| CVE-2025-25198 | 未公開 | GitHub PoC | 待評估 |
| CVE-2025-62360 | 未公開 | GitHub PoC | 待評估 |
| CVE-2023-3643 | 歷史漏洞 | Exploit-DB | 已知風險 |
| CVE-2025-31700 | 未公開 | GitHub PoC | 待評估 |
| CVE-2025-66680 | 未公開 | GitHub PoC | 待評估 |
| CVE-2024-9765 | 未公開 | GitHub PoC | 待評估 |
| — | phpMyFAQ 2.9.8 CSRF | Exploit-DB #52459 | 已知框架 |
| — | Easy File Sharing Web Server 7.2 | Exploit-DB Buffer Overflow | 已知框架 |

**PoC 武器化趨勢**：Qdrant 查詢（查詢 1）返回多個 RCE PoC（FreeBSD rtsold 0.71、motionEye 0.70、Redis 0.69），確認 PoC 的快速公開化與武器化仍是 2026 年的主要攻擊加速因素。

### KEV 與 PoC 交叉關聯

| 活躍利用 CVE | 公開 PoC | 風險評估 |
|-------------|----------|----------|
| CVE-2026-20127 (Cisco SD-WAN) | 未公開（但攻擊鏈完整） | **極高** — CISA ED 26-03 |
| CVE-2026-21513 (MSHTML) | 未公開（APT28 獨佔） | **高** — 國家級 APT 獨佔利用 |
| CVE-2026-22719 (VMware Aria) | 待確認 | **高** — 未認證 RCE |
| CVE-2026-1731 (BeyondTrust) | 可能存在（勒索軟體利用中） | **極高** — 已確認勒索軟體 |

---

## 2.4 攻擊手法歸納與 ATT&CK TTP 映射

### TTP 趨勢統計

基於本週 18 起攻擊事件與 80+ 漏洞揭露分析，主要攻擊手法分布：

| 攻擊類型 | 佔比 | 與前週比較 | 主要 ATT&CK TTP |
|----------|------|------------|-----------------|
| 國家級 APT/網路戰 | 30% | **急劇上升**（+15%） | <a href="https://attack.mitre.org/techniques/T1588/" class="ttp-badge" target="_blank">T1588</a> Obtain Capabilities |
| 零日/已知漏洞利用 | 22% | 穩定（高位） | <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> Exploit Public-Facing Application |
| 社交工程/釣魚/ClickFix | 18% | **上升**（+5%） | <a href="https://attack.mitre.org/techniques/T1566/" class="ttp-badge" target="_blank">T1566</a> Phishing |
| ICS/OT 攻擊面 | 12% | **持續上升** | <a href="https://attack.mitre.org/techniques/T1133/" class="ttp-badge" target="_blank">T1133</a> External Remote Services |
| 認證繞過/竊取 | 10% | 穩定 | <a href="https://attack.mitre.org/techniques/T1078/" class="ttp-badge" target="_blank">T1078</a> Valid Accounts |
| 供應鏈攻擊 | 8% | 穩定（持續） | <a href="https://attack.mitre.org/techniques/T1195/" class="ttp-badge" target="_blank">T1195</a> Supply Chain Compromise |

### 本週 ATT&CK TTP 熱力圖

**初始存取（Initial Access）**：

| TTP | 出現次數 | 關聯事件 |
|-----|----------|----------|
| [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } Exploit Public-Facing App | 6 | Cisco SD-WAN、VMware Aria、CrushFTP、FortiGate、BeyondTrust、SmarterMail |
| [T1566.001](https://attack.mitre.org/techniques/T1566.001/){: .ttp-ref } Spearphishing Attachment | 4 | APT28 MSHTML、SloppyLemming、UAC-0252、Dust Specter |
| [T1195.002](https://attack.mitre.org/techniques/T1195.002/){: .ttp-ref } Supply Chain Compromise | 1 | QuickLens Chrome 擴充套件 |
| [T1176](https://attack.mitre.org/techniques/T1176/){: .ttp-ref } Browser Extensions | 2 | QuickLens、Chrome Gemini CVE-2026-0628 |

**執行（Execution）**：

| TTP | 出現次數 | 關聯事件 |
|-----|----------|----------|
| [T1203](https://attack.mitre.org/techniques/T1203/){: .ttp-ref } Exploitation for Client Execution | 2 | APT28 MSHTML、Chromium UAF |
| [T1059](https://attack.mitre.org/techniques/T1059/){: .ttp-ref } Command and Scripting Interpreter | 3 | Dust Specter、VMware Aria、InSAT MasterSCADA |

**持久化（Persistence）**：

| TTP | 出現次數 | 關聯事件 |
|-----|----------|----------|
| [T1547](https://attack.mitre.org/techniques/T1547/){: .ttp-ref } Boot or Logon Autostart | 2 | Dust Specter、FortiGate 後門 |
| [T1556](https://attack.mitre.org/techniques/T1556/){: .ttp-ref } Modify Authentication Process | 1 | Cisco SD-WAN rogue peers |

**資料竊取（Exfiltration）**：

| TTP | 出現次數 | 關聯事件 |
|-----|----------|----------|
| [T1041](https://attack.mitre.org/techniques/T1041/){: .ttp-ref } Exfiltration Over C2 | 3 | Dust Specter、SloppyLemming、UAC-0252 |
| [T1552.004](https://attack.mitre.org/techniques/T1552.004/){: .ttp-ref } Private Keys | 1 | 韓國國稅局冷錢包 |

**影響（Impact）**：

| TTP | 出現次數 | 關聯事件 |
|-----|----------|----------|
| [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref } Data Encrypted for Impact | 2 | 伊朗國家勒索軟體、BeyondTrust 利用鏈 |
| [T1498](https://attack.mitre.org/techniques/T1498/){: .ttp-ref } Network DoS | 1 | 伊朗全國網路封鎖 |

### 攻擊手法深度分析

#### 國家級 APT 行動密度達歷史新高

本週至少五個國家關聯的 APT 行動被揭露或持續追蹤，橫跨四個國家——這是本分析系統開始追蹤以來，單週揭露的國家級行動最密集的一次：

**伊朗關聯行動（5+ 組織同時活躍）**：
- [T1498](https://attack.mitre.org/techniques/T1498/){: .ttp-ref } Network DoS — 全國網路封鎖
- [T1583.006](https://attack.mitre.org/techniques/T1583.006/){: .ttp-ref } Mobile Application Compromise — BadeSaba 心戰
- [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref } Data Encrypted for Impact — 勒索軟體作為國家工具
- MuddyWater、APT33、APT34、Charming Kitten、Moses Staff 同步動員
- **Dust Specter**（新揭露）使用 4 種全新惡意軟體攻擊伊拉克

**俄羅斯關聯行動**：
- **APT28** 利用 CVE-2026-21513 MSHTML 零日攻擊 Windows 系統
- [T1203](https://attack.mitre.org/techniques/T1203/){: .ttp-ref } Exploitation for Client Execution + [T1221](https://attack.mitre.org/techniques/T1221/){: .ttp-ref } Template Injection

**印度關聯行動**：
- **SloppyLemming** 對南亞三國政府的長期間諜活動（BurrowShell 後門）
- [T1566.001](https://attack.mitre.org/techniques/T1566.001/){: .ttp-ref } Spearphishing Attachment + [T1113](https://attack.mitre.org/techniques/T1113/){: .ttp-ref } Screen Capture

**烏克蘭相關行動**：
- **UAC-0252** 冒充烏克蘭政府部署 SHADOWSNIFF/SALATSTEALER 竊取程式
- [T1036](https://attack.mitre.org/techniques/T1036/){: .ttp-ref } Masquerading + [T1555](https://attack.mitre.org/techniques/T1555/){: .ttp-ref } Credentials from Password Stores

#### 社交工程手法演進：危機利用與 ClickFix 擴散

本週社交工程手法呈現兩個值得關注的演進方向：

**危機利用型社交工程**：杜拜 SIM-swap 詐騙展示攻擊者如何在地緣政治危機發生數小時內，將危機情境轉化為社交工程誘餌。這種「即時事件利用」的速度對防禦者提出新的挑戰。

**ClickFix 手法持續擴散**：QuickLens Chrome 擴充套件事件與 ThreatFox 中 IClickFix（69 筆 IoC）的高活躍度顯示，ClickFix 社交工程手法已從初期實驗進入規模化部署階段。此手法結合假錯誤訊息與 PowerShell 命令執行，繞過傳統安全軟體的偵測。

#### IoC 趨勢：C2 基礎設施集中化

威脅饋送資料顯示 C2 基礎設施出現集中化趨勢：
- **Cobalt Strike** 持續主導 C2 框架（44 筆 3 月 IoC），多個 IP 使用統一連接埠 3093
- **XWorm** 成為 2 月最活躍 C2 家族（35 筆）
- 攻擊者傾向使用少數「防彈主機」託管多個 C2 伺服器，降低營運成本

---

## 威脅情報饋送摘要

**來源：abuse.ch (URLhaus、MalwareBazaar、ThreatFox、Feodo Tracker) | 日期：2026-03-01 至 2026-03-04**

### 本週威脅饋送統計

| 類別 | 3 月至今數量 | 2026 年累計 | 說明 |
|------|------------|-------------|------|
| 惡意 URL | 992 | 26,222 | URLhaus 惡意 URL |
| 惡意軟體樣本 | 508 | 6,004 | MalwareBazaar |
| IoC 指標 | 1,398 | 8,385 | ThreatFox IoC（1,867 筆含 3/3 單日） |
| C2 基礎設施 | 2 | 223 | C2 伺服器（Feodo Tracker） |

### 惡意軟體家族分布（3 月至今 IoC Top 家族）

| 家族 | IoC 數量 | 類型 | 威脅描述 |
|------|----------|------|----------|
| **Vidar** | 109（URL+domain+IP） | 資訊竊取 | 竊取瀏覽器密碼、加密貨幣錢包、2FA 資料，3 月最活躍家族 |
| **AsyncRAT** | 72 | 遠端存取木馬 | C2 使用多個網域，.NET 架構，企業環境持續威脅 |
| **IClickFix** | 69 | 社交工程/下載器 | ClickFix 手法自動化分發工具，快速增長中 |
| **ClearFake** | 56 | 注入攻擊 | 假瀏覽器更新頁面散布惡意程式 |
| **Cobalt Strike** | 44 | 攻擊框架 | 持續被 APT 與犯罪組織濫用 |
| **StrelaStealer** | 39 | 資訊竊取 | 專門竊取 Outlook/Thunderbird 郵件帳號 |
| **NetSupportManager RAT** | 27 | RAT | 合法遠端管理工具被濫用 |
| **Quasar RAT** | 18 | RAT | 開源 .NET RAT 持續被使用 |
| **Meterpreter** | 13 | 攻擊框架 | Metasploit 後門 payload |
| **Remcos** | 12 | RAT | 企業環境威脅 |

### C2 基礎設施觀察

2 月累計 214 筆 C2 資料分布：

| 家族 | 2 月 C2 數量 | 趨勢 |
|------|-------------|------|
| **XWorm** | 35 | 最活躍 C2 家族 |
| **Remcos** | 19 | 穩定 |
| **AsyncRAT** | 19 | 穩定 |
| **Unknown Malware** | 18 | 未歸因樣本增加 |
| **Aisuru** | 12 | IoT 殭屍網路 |
| **Havoc** | 11 | C2 框架，持續增長 |
| **Vidar** | 9 | 資訊竊取 C2 |
| **Sliver** | 8 | 開源 C2 框架替代品 |

### Cobalt Strike C2 活動觀察

Qdrant 查詢（查詢 5）返回大量近期 Cobalt Strike C2 伺服器指標：
- 多個 IP 段（103.39.16.x、103.41.7.x、156.234.21.x）在連接埠 3093 活躍
- 日期均為 2026-03-03，顯示攻擊者在本週活躍建立新 C2 基礎設施
- 統一連接埠使用暗示可能為同一攻擊者或攻擊者即服務（C2aaS）的基礎設施
- Cobalt Strike 持續作為 APT 與犯罪組織共用的首選攻擊框架

---

## 2.5 新興威脅識別

### 1. 伊朗多維度網路戰升級至前所未有規模 [信心水準：高]

**威脅描述**：Operation Epic Fury 消除伊朗常規軍事選項後，網路作戰成為唯一剩餘的非對稱報復工具。五大 APT 組織同步動員為歷來首見，Dust Specter 進一步展示伊朗持續擴展新 APT 組織與新惡意軟體家族。

**證據支持**：
- 2026-02-27 五大 APT 組織同步活動（多來源確認）
- Dust Specter 部署 4 種全新惡意軟體家族攻擊伊拉克（Zscaler ThreatLabz）
- MuddyWater 部署 5 個全新惡意程式家族含 Rust 基礎工具
- 加拿大 Cyber Centre（2026-03-02）評估伊朗「幾乎確定」將報復
- Check Point Research（2026-03-03）發布伊朗網路能力全面概述
- Qdrant 查詢（查詢 4）：歷史攻擊模式（Ivanti VPN 漏洞利用 0.55）呈現類似邊界設備入侵手法

**影響評估**：
- 全球關鍵基礎設施面臨升高的伊朗網路威脅，尤其是美國與以色列盟國
- 新 APT 組織（Dust Specter）的出現意味著伊朗網路能力仍在持續擴張
- 中東地區國家政府面臨高度針對性攻擊
- 「勒索軟體作為國家工具」的趨勢模糊了犯罪與國家行為的界線

### 2. 多國 APT 同時活躍 — 網路空間軍事化加速 [信心水準：高]

**威脅描述**：本週至少五個國家關聯的 APT 行動同時活躍（伊朗 5+ 組織、俄羅斯 APT28、印度 SloppyLemming、中國關聯 APT、烏克蘭相關 UAC-0252），顯示網路空間正經歷前所未有的軍事化程度。

**證據支持**：
- 伊朗：5 大 APT + Dust Specter（新揭露）— 跨 4 個來源確認
- 俄羅斯：APT28 利用 MSHTML 零日（Akamai 分析確認）
- 印度：SloppyLemming 一年期南亞間諜活動（Arctic Wolf 揭露）
- 烏克蘭相關：UAC-0252 持續冒充政府的釣魚活動（CERT-UA 確認）
- Qdrant 查詢（查詢 4）：PRC 國家行為者全球性網路入侵（0.52）提供長期脈絡

**影響評估**：
- 防禦者需同時應對來自多個國家的不同 APT 手法與目標
- 傳統的「單一威脅行為者」防禦模型需升級為「多威脅同時應對」架構
- 地緣政治緊張直接轉化為網路攻擊強度，安全團隊需將地緣政治分析納入威脅評估

### 3. AI 功能整合創造瀏覽器新攻擊面 [信心水準：中-高]

**威脅描述**：CVE-2026-0628 揭示瀏覽器整合 AI 功能帶來全新攻擊面類別——惡意擴充功能可透過劫持 AI 面板存取使用者本機檔案系統，將 AI 助手從生產力工具轉變為攻擊跳板。

**證據支持**：
- Palo Alto Unit 42 確認 CVE-2026-0628（Chrome Gemini 面板漏洞）
- QuickLens ClickFix 事件展示擴充套件生態系統的脆弱性
- AI 功能通常具有比傳統網頁功能更高的系統權限（存取檔案系統、執行程式碼）
- 主流瀏覽器（Chrome、Edge、Firefox）均在積極整合 AI 功能

**影響評估**：
- 隨著更多瀏覽器整合 Agentic AI 助手，類似漏洞將持續出現
- AI 面板的權限範圍可能成為攻擊者的首要目標
- 組織安全策略需涵蓋瀏覽器 AI 功能的權限管理與監控
- 預期更多研究者將揭露 Agentic AI 相關漏洞

### 4. EV 充電基礎設施安全問題為系統性產業缺陷 [信心水準：高]

**威脅描述**：兩週內 8+ 個不同 EV 充電站平台被揭露安全漏洞，漏洞模式高度一致（WebSocket 缺乏認證、暴力破解、session 管理不當），確認此為產業級系統性安全問題而非個別事件。

**證據支持**：
- 上週：EV Energy（CVSS 9.4）、Mobility46（CVSS 9.4）、Chargemap、CloudCharge、Switch、EV2go
- 本週新增：ePower、Everon OCPP Backends、Mobiliti-E/MobiHu
- 漏洞模式一致指向產業共同的安全開發實踐不足
- OCPP（Open Charge Point Protocol）後端漏洞影響充電站通訊核心
- Qdrant 查詢（查詢 3）：ICS/SCADA 漏洞歷史（InSAT MasterSCADA 0.55+）確認關鍵基礎設施安全問題持續擴大

**影響評估**：
- EV 充電站漏洞可能被用於大規模供電中斷攻擊
- 隨著 EV 普及，充電基礎設施成為新型關鍵基礎設施攻擊面
- 需要產業級安全標準與認證機制
- OCPP 協議安全需要根本性檢視

### 5. ClickFix 社交工程手法進入規模化階段 [信心水準：中-高]

**威脅描述**：ThreatFox 中 IClickFix 高達 69 筆 IoC（3 月至今），結合 QuickLens Chrome 擴充套件供應鏈攻擊，顯示 ClickFix 手法已從概念驗證進入大規模部署階段。

**證據支持**：
- ThreatFox 3 月至今 IClickFix 69 筆 IoC（佔 Top 3）
- ClearFake 56 筆 IoC 使用類似假更新手法
- QuickLens 擴充套件植入 ClickFix 攻擊腳本
- 結合加密貨幣竊取功能展示經濟動機

**影響評估**：
- ClickFix 繞過傳統安全軟體的偵測率高
- 使用者教育需涵蓋「假錯誤訊息 + PowerShell 執行」的辨識
- 端點偵測需加強 PowerShell 執行監控

### 6. 檔案傳輸系統持續為高價值攻擊目標 [信心水準：高]

**威脅描述**：CrushFTP 暴力破解掃描活動延續近年來 MOVEit、GoAnywhere、Accellion、Soliton FileZen 的趨勢，檔案傳輸系統因其在企業資料流中的核心位置，持續吸引攻擊者。

**證據支持**：
- SANS ISC 偵測 CrushFTP 活躍掃描，關聯三個高風險 CVE
- CVE-2026-25108（Soliton FileZen）已在 CISA KEV
- 歷史案例：MOVEit（2023）、GoAnywhere（2023）、Accellion（2021）
- Qdrant 查詢（查詢 1）：RCE 漏洞在 exploit_intelligence Layer 呈現高密度

---

## 跨 Layer 關聯分析

### Qdrant 語意查詢結果

本週執行 5 次 Qdrant 語意查詢，用於跨 Layer 關聯分析：

#### 查詢 1：「active exploitation critical vulnerability March 2026」— 10 筆結果

主要發現：
- Zerologon 仍在活躍利用清單中被引用，顯示歷史漏洞的長尾利用效應
- Microsoft Feb 2026 patches 中有 6 個活躍利用 CVE 被返回，與 APT28 MSHTML 利用形成關聯
- BeyondTrust CVE-2026-1731 活躍利用確認，跨 exploit_intelligence 與 security_news_facts 兩個 Layer

#### 查詢 2：「ransomware APT attack incident 2026」— 10 筆結果

主要發現：
- 加拿大 Cyber Centre 的 Ransomware Threat Outlook 2025-2027 提供宏觀背景
- DslogdRAT in Ivanti Connect Secure 與本週伊朗 APT 利用邊界設備的模式一致
- 芬蘭組織被 Akira 勒索軟體攻擊的事件與芬蘭本週多起事件（SIM-swap、Deepfake）形成北歐威脅態勢
- 勒索軟體與國家行為者的融合趨勢在歷史資料中有持續記錄

#### 查詢 3：「ICS SCADA critical infrastructure vulnerability」— 10 筆結果

主要發現：
- CVE-2026-22553 InSAT MasterSCADA BUK-TS OS 命令注入（Critical）與本週 ICS 公告直接關聯
- Siemens SINEC Security Monitor、Schneider Electric 漏洞歷史顯示 ICS 廠商的持續安全挑戰
- Delta Electronics DIAView 任意程式碼執行提供 ICS 漏洞類型的歷史比較基準
- 本週新增的 Hitachi Energy、Mitsubishi Electric 漏洞延續了此趨勢

#### 查詢 4：「Iran cyber threat espionage geopolitical」— 10 筆結果

主要發現：
- 加拿大 Cyber Centre 的伊朗威脅公告是本週最直接的關聯
- 親俄駭客主義攻擊全球關鍵基礎設施的記錄提供「國家關聯駭客主義」的比較框架
- PRC 國家行為者全球網路入侵提供另一國家級 APT 的對照

#### 查詢 5：「supply chain compromise SIM swap cryptocurrency theft」— 10 筆結果

主要發現：
- 芬蘭 NCSC 的電子 SIM 攻擊記錄與本週杜拜/芬蘭 SIM-swap 事件直接關聯
- 半導體產業網路間諜攻擊提供供應鏈攻擊的產業維度分析

### 跨 Layer 關聯總結

**伊朗網路戰跨 Layer 關聯**：
- **security_news_facts/attack_incident**：7+ 起直接相關事件
- **security_news_facts/industry_trend**：Check Point 伊朗能力分析
- **Qdrant 歷史資料**：邊界設備攻擊模式一致性（Ivanti、FortiGate）
- **跨地理關聯**：伊拉克（Dust Specter）、杜拜（SIM-swap）、全球（CERT 公告）

**國家級 APT 跨 Layer 關聯**：
- APT28 MSHTML → vulnerability_tracking（2 月 Patch Tuesday）→ exploit_intelligence（活躍利用確認）→ security_news_facts
- Dust Specter → 4 種新惡意程式跨 attack_incident 與 malware_sample 分類
- SloppyLemming → BurrowShell 後門跨 attack_incident 與潛在 IoC 關聯

**CISA KEV 跨 Layer 關聯**：
- CVE-2026-21385（Qualcomm）與 CVE-2026-22719（VMware）同時加入 KEV → 行動晶片與虛擬化平台雙線威脅
- Cisco SD-WAN（CVE-2026-20127）在 vulnerability_tracking、exploit_intelligence、security_news_facts 三個 Layer 持續高密度出現
- BeyondTrust CVE-2026-1731 勒索軟體關聯跨 exploit_intelligence 與 security_news_facts

**EV 充電站跨 Layer 關聯**：
- vulnerability_disclosure 中 8+ 平台漏洞 → ICS/SCADA 漏洞歷史趨勢（Qdrant 查詢 3）→ 關鍵基礎設施安全系統性問題

---

## 修補期限一覽表

| CVE | 產品 | CISA 修補期限 | 嚴重程度 | 勒索軟體 | 狀態 |
|-----|------|---------------|----------|----------|------|
| **CVE-2026-20127** | Cisco SD-WAN | **緊急指令 ED 26-03** | Critical (10.0) | Unknown | **立即處理** |
| **CVE-2022-20775** | Cisco SD-WAN | **緊急指令 ED 26-03** | High | Unknown | **立即處理** |
| **CVE-2026-1731** | BeyondTrust RS/PRA | **2026-02-16（已過期）** | Critical | **Known** | **逾期** |
| **CVE-2026-20045** | Cisco UCM | **2026-02-11（已過期）** | Critical | Unknown | **逾期** |
| **CVE-2026-22769** | Dell RP4VMs | **2026-02-21（已過期）** | Critical | Unknown | **逾期** |
| **CVE-2026-24423** | SmarterMail | **已過期** | Critical | **Known** | **逾期** |
| **CVE-2026-2441** | Chromium CSS | **2026-03-10** | High | Unknown | **接近期限** |
| **CVE-2026-21385** | Qualcomm 多晶片 | TBD | High | N/A | **新增 KEV** |
| **CVE-2026-22719** | VMware Aria Ops | TBD | Critical | N/A | **新增 KEV** |
| **CVE-2026-21513** | Microsoft MSHTML | 已修補（2 月 PT） | High (8.8) | N/A | **APT28 利用** |
| **CVE-2025-49113** | RoundCube | TBD | Critical | N/A | **持續** |
| **CVE-2025-68461** | RoundCube | TBD | Critical | N/A | **持續** |
| **CVE-2026-25108** | Soliton FileZen | ED 相關 | High | Unknown | **持續** |

**優先修補建議**：
1. **立即（CISA 緊急指令）**：CVE-2026-20127、CVE-2022-20775（Cisco SD-WAN，ED 26-03）
2. **立即（勒索軟體關聯）**：CVE-2026-1731（BeyondTrust，已確認勒索軟體利用，修補期限已過期）
3. **立即（APT 活躍利用）**：CVE-2026-21513（MSHTML，APT28 利用，2 月 Patch Tuesday 已修補）
4. **緊急（新增 KEV）**：CVE-2026-21385（Qualcomm）、CVE-2026-22719（VMware Aria Operations）
5. **緊急（期限將至）**：CVE-2026-2441（Chromium CSS UAF，2026-03-10 期限）
6. **逾期（立即處理）**：CVE-2026-20045（Cisco UCM）、CVE-2026-22769（Dell RP4VMs）、CVE-2026-24423（SmarterMail）
7. **持續追蹤**：CVE-2025-49113、CVE-2025-68461（RoundCube）、CVE-2026-25108（FileZen）

---

## 產業動態

### Check Point 伊朗網路能力全面概述

**來源**：Check Point Research | **日期**：2026-03-03

Check Point Research 發布伊朗網路威脅生態系統全面概述，結構性分析 IRGC 與 MOIS 關聯組織的 TTPs。報告涵蓋：
- IRGC 關聯組織（MuddyWater、APT33、Charming Kitten）
- MOIS 關聯組織（APT34/OilRig）
- 可否認性操作者（Moses Staff 等）
- 駭客主義偽裝團體
- 主要目標：間諜、破壞/摧毀（DDoS、偽勒索軟體、資料清除器）、資訊操作
- 評估：活動將在中東、美國及盟友國家「加劇與擴大」

### 加拿大 Cyber Centre 伊朗威脅公告

**來源**：Canadian Centre for Cyber Security | **日期**：2026-03-02

正式評估伊朗「幾乎確定」將使用網路能力報復美以盟國，涵蓋關鍵基礎設施攻擊、僑民壓制、軍事人員線上騷擾等威脅類型。為加拿大及盟國組織提供具體防禦指導。

### Android 安全公告 March 2026

**來源**：CERT.RO、CERT-FR | **日期**：2026-03-03

Google 發布 2026 年 3 月 Android 安全公告，修補多個漏洞，包括 CVE-2026-21385（Qualcomm 記憶體損壞，已在 KEV）。CERT.RO 與 CERT-FR 均發布國家級警告。

### Docker Desktop 安全更新

**來源**：CERT-FR（CERTFR-2026-AVI-0230） | **日期**：2026-03-03

Docker Desktop 安全更新，修補影響容器化環境的安全漏洞。

### NIS2 會議與歐盟政策動態

**來源**：Kyber2026 NIS2 Conference Slovakia | **日期**：2026-03-04

斯洛伐克 Kyber2026 會議討論 NIS2 指令實施進展，涵蓋：
- NIS2 跨歐盟實施進度差異
- 關鍵基礎設施網路安全標準
- 事件報告機制統一化

### 德國投資詐騙定罪

**來源**：BKA/Europol | **日期**：2026-03-03

德國法院判處投資詐騙集團定罪，涉及利用網路進行系統性金融詐騙。

### ISC StormCast 每日安全摘要

**來源**：SANS ISC | **日期**：2026-03-03

SANS ISC 每日 StormCast 涵蓋 CrushFTP 暴力破解活動、新 CVE 揭露與威脅情報更新。

---

## 2.6 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資。主要來源包括 CISA (US)、NSA (US)、CERT-UA (Ukraine)、CERT-FR (France)、CERT.RO (Romania)、SK-CERT (Slovakia)、CERT-AT (Austria)、NCSC-FI (Finland)、Canadian Cyber Centre (Canada)、NCSC-UK (UK)、SANS ISC、KrebsOnSecurity、BleepingComputer、Check Point Research、Arctic Wolf、Zscaler ThreatLabz、Akamai、Palo Alto Unit 42、NetBlocks。

2. **時效性**：資料收集截至 2026-03-05（週末），但部分事件可能在報告發布後快速演變。特別是伊朗網路戰態勢與 Cisco SD-WAN 利用活動可能持續升級。本報告將依需要更新。

3. **地理偏差**：本週資料以中東（伊朗-以色列衝突）、歐美、南亞及東歐地區為主。中東事件依賴西方媒體與安全研究機構報導，可能存在視角偏差。CERT-UA（烏克蘭文）、SK-CERT（斯洛伐克文）等非英文來源經翻譯處理。

4. **信心水準說明**：
   - **高**：基於官方公告、確認的 KEV 列表、多來源交叉驗證（如 CISA ED 26-03、Akamai APT28 分析、CERT-UA 官方公告、多國 CERT 伊朗威脅公告、Qdrant 跨 Layer 驗證）
   - **中-高**：基於可信來源報導、模式分析（如 AI 功能攻擊面趨勢、ClickFix 擴散、EV 充電站系統性問題）
   - **中**：基於單一來源報導或有限樣本推斷
   - **低**：推測性關聯（本週未使用此等級）

5. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務等來源。Qdrant 語意查詢結果受限於已收錄資料範圍（收錄開始至 2026-03-05）。威脅饋送統計（abuse.ch）僅反映該平台收錄的公開情報。

6. **翻譯風險**：部分非英文來源（烏克蘭文、斯洛伐克文、法文、羅馬尼亞文、芬蘭文、奧地利德文）經 AI 翻譯，可能存在語義偏差。

7. **分析局限**：攻擊手法佔比為估計值（基於本週事件加權），統計推論應謹慎解讀。國家級 APT 行動密度的「歷史新高」判斷基於公開揭露的活動——未公開的活動可能更多或分布不同。EV 充電站「系統性問題」的判斷基於兩週 8+ 平台樣本，需更長期資料驗證。

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源。
