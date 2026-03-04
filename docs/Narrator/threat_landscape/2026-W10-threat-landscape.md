---
layout: seo-report
title: 2026 第 10 週威脅態勢分析
description: "2026-03-02 至 2026-03-08 資安威脅週報：伊朗 Operation Epic Fury 後五大 APT 同步動員、APT28 利用 CVE-2026-21513 MSHTML 零日漏洞、Notepad++ Chrysalis 後門供應鏈攻擊、Dust Specter APT 伊拉克政府攻擊、SloppyLemming 南亞間諜活動、UAC-0252 SHADOWSNIFF 竊取程式、Cisco SD-WAN CISA ED 26-03 持續、CISA 新增 Qualcomm/VMware KEV、Chrome Gemini CVE-2026-0628、CrushFTP 暴力破解掃描、Vidar 與 AsyncRAT 主導威脅饋送。"
parent: 威脅態勢分析
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-threat-landscape.png
author: 資安情報分析團隊
date: 2026-03-04
---

# 威脅態勢分析 — 2026 第 10 週

> 涵蓋期間：2026-03-02 至 2026-03-08
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-03-04（週中更新，資料截至 2026-03-04 UTC）

---

## 執行摘要

本週威脅態勢呈現**地緣政治驅動的國家級網路戰全面升級**，結合**供應鏈攻擊持續精進**、**多國 APT 組織活躍**與**活躍利用漏洞持續擴張**四大主軸。Operation Epic Fury（2026-02-28）引發的伊朗網路報復威脅成為本週主導議題，同時多個新的國家級 APT 行動被揭露。重點摘要如下：

**本週重大事件**：
- **伊朗 Operation Epic Fury 網路戰全面升級**：五大伊朗 APT 組織（MuddyWater、APT33、APT34、Charming Kitten、Moses Staff）於 2026-02-27 同步動員，伊朗全國網路降至 4%（NetBlocks），加拿大、芬蘭等多國 CERT 發布伊朗網路威脅公告，Check Point Research 發布伊朗網路能力全面概述
- **APT28 利用 CVE-2026-21513 MSHTML 零日漏洞**：Akamai 分析確認俄羅斯 APT28 積極利用 Windows MSHTML 安全功能繞過漏洞（CVSS 8.8），影響所有 Windows 版本
- **Dust Specter APT 攻擊伊拉克政府**：Zscaler 揭露疑似伊朗關聯 APT 組織使用 SPLITDROP、TWINTASK、TWINTALK、GHOSTFORM 四種新型惡意軟體攻擊伊拉克政府官員
- **SloppyLemming 南亞間諜活動**：Arctic Wolf 揭露印度關聯威脅行為者對巴基斯坦、孟加拉、斯里蘭卡政府與關鍵基礎設施的一年期間諜活動
- **Notepad++ Chrysalis 後門供應鏈攻擊**：中國 APT 組織 Lotus Blossom 攻陷代管服務商，劫持自動更新機制散布 Chrysalis 後門，濫用 Microsoft Warbird 繞過 EDR
- **CISA 新增 KEV**：CVE-2026-21385（Qualcomm 記憶體損壞）與 CVE-2026-22719（VMware Aria Operations 命令注入）於 2026-03-03 加入 KEV

**本週新增/持續 CISA KEV 重點**：
- **CVE-2026-21385** — Qualcomm 多晶片記憶體損壞（2026-03-03 新增 KEV）
- **CVE-2026-22719** — Broadcom VMware Aria Operations 命令注入（2026-03-03 新增 KEV）
- **CVE-2026-21513** — Microsoft MSHTML 安全功能繞過（CVSS 8.8，APT28 利用）
- **CVE-2026-20127** — Cisco SD-WAN 身份驗證繞過（CISA ED 26-03 持續）
- **CVE-2026-1731** — BeyondTrust RS/PRA OS 命令注入（**已用於勒索軟體**，修補期限已過期）

**新揭露 ICS/OT 漏洞**（CISA 2026-03-03 發布）：
- Hitachi Energy Relion REB500（繼電器保護）
- Hitachi Energy RTU500（遠端終端單元）
- Mitsubishi Electric MELSEC iQ-F Series EtherNet/IP
- Labkotec Lid-3300IP（液位偵測）
- Portwell Engineering 工具套件
- EV 充電站後端（ePower、Everon OCPP、Mobiliti-E/MobiHu）

**Chrome 與 AI 安全新威脅**：
- **CVE-2026-0628**：Palo Alto Unit 42 揭露 Chrome Gemini 面板漏洞，惡意擴充功能可劫持 Gemini AI 並存取本機檔案系統
- **CrushFTP 暴力破解掃描**：SANS ISC 偵測到針對 CrushFTP 的活躍掃描，關聯三個已知高風險 CVE

**威脅情報饋送統計**（2026-03-02 至 2026-03-04）：
- URLhaus 惡意 URL：992 筆（3 月至今）
- MalwareBazaar 惡意軟體樣本：508 筆（3 月至今）
- ThreatFox IoC 指標：1,398 筆（3 月至今）
- C2 基礎設施：2 筆（AsyncRAT）
- Top 惡意程式家族：AsyncRAT (72)、IClickFix (69)、ClearFake (56)、Vidar (109, URL+domain)、Cobalt Strike (44)、StrelaStealer (39)、NetSupportManager RAT (27)

---

## 資料來源統計

| Layer | 2026 年累計 | 3 月至今 | 說明 |
|-------|-------------|----------|------|
| security_news_facts | attack_incident: **338**, vulnerability_disclosure: **21**(3月) | 16+21+8+3+3=51 | 國際資安新聞與事件 |
| vulnerability_tracking | critical_high: **2,605**, medium: **8,884+** | 持續更新 | 漏洞追蹤 |
| exploit_intelligence | active_exploitation: **53**, poc_available: **2,263+** | 持續更新 | 活躍利用與 PoC 情報 |
| threat_feeds | malicious_url: **26,222**, malware_sample: **6,004**, ioc_indicator: **8,385**, c2_infrastructure: **223** | Mar: 992+508+1,398+2 | 威脅饋送 |

> 統計時間：2026-03-04 UTC

---

## 近期重大資安事件

### 1. 伊朗 Operation Epic Fury — 網路戰全面升級

**嚴重程度：Critical | 來源：NCSC-FI、NetBlocks、WIRED、Anomali、Halcyon、Canadian Cyber Centre、Check Point Research | 日期：2026-02-28 至 2026-03-03**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1498/" class="ttp-badge" target="_blank">T1498</a> Network Denial of Service
- <a href="https://attack.mitre.org/techniques/T1583/006/" class="ttp-badge" target="_blank">T1583.006</a> Acquire Infrastructure: Mobile Application Compromise
- <a href="https://attack.mitre.org/techniques/T1588/001/" class="ttp-badge" target="_blank">T1588.001</a> Obtain Capabilities: Malware
- <a href="https://attack.mitre.org/techniques/T1486/" class="ttp-badge" target="_blank">T1486</a> Data Encrypted for Impact
- <a href="https://attack.mitre.org/techniques/T1059/" class="ttp-badge" target="_blank">T1059</a> Command and Scripting Interpreter

本週最具地緣政治影響力的事件——多起高度關聯事件凸顯國家級網路戰達到前所未有的規模：

**事件 A：伊朗全國網路封鎖**
- **時間**：2026-02-28 07:00 UTC 起
- **規模**：全國網路連線降至正常水準的 4%（NetBlocks Internet Observatory 監測）
- **背景**：與美國-以色列聯合軍事行動（Operation Epic Fury）同步
- **性質**：政府主導的網路封鎖（非外部攻擊）

**事件 B：BadeSaba 祈禱 App 遭駭進行心戰宣傳**
- **受影響 App**：BadeSaba Calendar（Google Play 500 萬下載）
- **攻擊手法**：攻擊者劫持推播通知基礎設施
- **時序**：德黑蘭時間 09:52 起，30 分鐘內連續發送
- **內容**：敦促伊朗軍方人員投降、承諾特赦、號召加入「解放力量」

**事件 C：五大伊朗 APT 組織同步動員**
- **時間**：2026-02-27 偵測到同步活動
- **動員組織**：MuddyWater、APT33（Refined Kitten）、APT34（OilRig）、Charming Kitten、Moses Staff
- **新惡意程式**：MuddyWater 自衝突升級以來部署 5 個全新惡意程式家族（含 Rust 基礎工具）
- **評估**：以色列面臨「史上最危險的網路威脅環境」

**事件 D：伊朗國家級行為者採用犯罪戰術**
- 伊朗越來越多地將勒索軟體納入國家級破壞行動 [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref }
- 混合模式讓伊朗在達成地緣政治目標的同時維持可否認性
- Operation Epic Fury 消除伊朗常規軍事選項後，網路行動成為唯一剩餘的非對稱報復工具
- 預期目標：美國與以色列盟友、全球關鍵基礎設施、政府實體

**事件 E：多國 CERT 發布伊朗威脅公告**
- **加拿大 Cyber Centre**（2026-03-02）：評估伊朗「幾乎確定」將使用網路能力報復美以盟國
- **Check Point Research**（2026-03-03）：發布伊朗網路能力全面概述，涵蓋 IRGC/MOIS 組織架構與 TTPs
- **SK-CERT 斯洛伐克**（2026-03-04）：針對 Cisco SD-WAN 零日漏洞發布緊急警告
- **預期威脅類型**：關鍵基礎設施攻擊、網路資訊戰、軍事人員線上騷擾、僑民壓制

**Check Point 伊朗網路能力分析摘要**：
- 伊朗網路生態系統分為 IRGC 關聯組織、MOIS 關聯組織、可否認性操作者、駭客主義團體
- 主要目標：間諜、破壞/摧毀（DDoS、偽勒索軟體、資料清除器）、資訊操作
- 評估：活動將在中東、美國及盟友國家「加劇與擴大」

**影響評估**：此週事件標誌著國家級網路戰的重要里程碑——軍事行動、網路封鎖、行動 App 心理戰、多 APT 組織協調動員同步發生，網路作戰與實體軍事行動的融合程度達到新高。

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
- **攻擊向量**：透過文件誘餌（Office 文件、HTML 檔案）
- **利用效果**：安全功能繞過，可能導致任意程式碼執行

**防禦建議**：
- 立即套用 2026 年 2 月 Patch Tuesday 更新
- 檢閱 Akamai 發布的 IoC 進行偵測與獵捕
- 加強對 MSHTML 相關文件渲染的監控

### 3. Dust Specter APT 攻擊伊拉克政府官員

**嚴重程度：High | 來源：Zscaler ThreatLabz、NCSC-FI | 日期：2026-03-03（攻擊發生於 2026 年 1 月）**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1059/" class="ttp-badge" target="_blank">T1059</a> Command and Scripting Interpreter
- <a href="https://attack.mitre.org/techniques/T1105/" class="ttp-badge" target="_blank">T1105</a> Ingress Tool Transfer
- <a href="https://attack.mitre.org/techniques/T1041/" class="ttp-badge" target="_blank">T1041</a> Exfiltration Over C2 Channel

Zscaler ThreatLabz 揭露疑似伊朗關聯 APT 組織 **Dust Specter** 針對伊拉克政府官員的攻擊行動：

**新型惡意軟體家族**：
1. **SPLITDROP** — Dropper（首次記錄）
2. **TWINTASK** — 後門程式
3. **TWINTALK** — 後門程式（與 TWINTASK 並用）
4. **GHOSTFORM** — 遠端存取木馬（RAT）

**兩種攻擊鏈**：
- **攻擊鏈 1**：SPLITDROP dropper → TWINTASK + TWINTALK 後門 → 持久化存取、遠端指令執行
- **攻擊鏈 2**：GHOSTFORM RAT → 遠端存取、監控、資料外洩

**歸因**：伊朗關聯（中至高信心），基於與已知伊朗 APT 組織在 TTPs、工具與受害者選擇上的顯著重疊。

### 4. SloppyLemming 南亞間諜活動

**嚴重程度：High | 來源：Arctic Wolf、NCSC-FI | 日期：2026-03-03（活動自 2025 年 1 月起）**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a> Phishing: Spearphishing Attachment
- <a href="https://attack.mitre.org/techniques/T1113/" class="ttp-badge" target="_blank">T1113</a> Screen Capture
- <a href="https://attack.mitre.org/techniques/T1056/001/" class="ttp-badge" target="_blank">T1056.001</a> Input Capture: Keylogging

Arctic Wolf 揭露印度關聯威脅行為者 **SloppyLemming** 對南亞三國的長期間諜活動：

**攻擊規模**：
- **目標國家**：巴基斯坦、孟加拉、斯里蘭卡
- **目標類型**：政府機構、關鍵基礎設施營運者
- **活動期間**：2025 年 1 月至 2026 年初（約一年）

**兩種攻擊手法**：
1. **BurrowShell 後門**：透過惡意 PDF 文件投遞，具備截圖與檔案系統操作功能
2. **Excel 惡意軟體**：透過惡意 Excel 文件投遞，具備鍵盤記錄與偵察功能

### 5. Notepad++ Chrysalis 後門供應鏈攻擊

**嚴重程度：Critical | 來源：TWCERT/CC、Rapid7、卡巴斯基 | 日期：2026-02-24 揭露**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1195/002/" class="ttp-badge" target="_blank">T1195.002</a> Supply Chain Compromise: Compromise Software Supply Chain
- <a href="https://attack.mitre.org/techniques/T1574/002/" class="ttp-badge" target="_blank">T1574.002</a> Hijack Execution Flow: DLL Side-Loading
- <a href="https://attack.mitre.org/techniques/T1027/" class="ttp-badge" target="_blank">T1027</a> Obfuscated Files or Information

中國 APT 組織 **Lotus Blossom**（亦稱 Violet Typhoon / Billbug）發動複雜供應鏈攻擊，攻陷 Notepad++ 使用的代管主機服務商基礎設施，劫持自動更新機制散布惡意後門。

**攻擊時間軸**：
- **2025 年 6 月**：攻擊者首次入侵代管服務商
- **2025 年 6-12 月**：持續劫持 WinGUp 自動更新機制，識別出 3 種攻擊鏈變體
- **2026 年 2 月**：Rapid7 Labs 與 Rapid7 MDR 公開揭露攻擊細節
- **緊急應變**：Notepad++ 官方釋出 v8.9.2

**Chrysalis 後門技術特徵**：
- **C2 偽裝**：刻意模仿 DeepSeek API 端點格式（`/a/chat/s/{GUID}`），混入正常 AI 應用流量
- **加密通訊**：RC4 內容加密 + HTTPS，使用合法 Chrome User Agent
- **API Hashing 雙層防禦**：載入器階段使用 FNV-1a + MurmurHash，主模組使用自定義多階段算術混合運算
- **Microsoft Warbird 濫用**：透過 `NtQuerySystemInformation` 的 `SystemCodeFlowTransition (0xB9)` 類別，在合法微軟簽章檔（clipc.dll）記憶體空間執行惡意 Shellcode，繞過 EDR 記憶體掃描
- **DLL Side-Loading**：利用合法 Bitdefender 執行檔（BluetoothService.exe）載入惡意 log.dll

**C2 伺服器**：`api[.]skycloudcenter[.]com`、`api[.]wiresguard[.]com`

**緊急措施**：
1. 立即停用 Notepad++ 自動更新功能（Settings > Preferences > Update）
2. 手動更新至 v8.9.2 並驗證 SHA-256 雜湊值
3. 執行 IoC 檢查（%appdata%\Bluetooth\、%appdata%\ProShow\、%appdata%\Adobe\Scripts\）

### 6. UAC-0252 冒充烏克蘭政府部署 SHADOWSNIFF 與 SALATSTEALER

**嚴重程度：High | 來源：CERT-UA | 日期：2026-03-02（活動自 2026 年 1 月起）**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a> Phishing: Spearphishing Attachment
- <a href="https://attack.mitre.org/techniques/T1036/" class="ttp-badge" target="_blank">T1036</a> Masquerading
- <a href="https://attack.mitre.org/techniques/T1555/" class="ttp-badge" target="_blank">T1555</a> Credentials from Password Stores

CERT-UA 發布 CERT-UA#20032 公告，揭露威脅行為者 UAC-0252 自 2026 年 1 月起發動的持續性釣魚攻擊活動：

**攻擊手法**：
- **社交工程**：冒充烏克蘭中央政府機構與地方行政機關，發送釣魚電子郵件
- **誘餌內容**：敦促收件人更新軍民系統使用的行動應用程式
- **惡意程式**：SHADOWSNIFF（網路通訊憑證竊取）、SALATSTEALER（密碼與認證資料竊取）
- **目標**：烏克蘭政府人員與軍事人員

### 7. Cisco SD-WAN 全球性利用活動持續（CISA ED 26-03）

**嚴重程度：Critical | 來源：CISA、NSA、ACSC、NCSC-UK、CERT-FR、SK-CERT | 日期：持續中**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> Exploit Public-Facing Application
- <a href="https://attack.mitre.org/techniques/T1068/" class="ttp-badge" target="_blank">T1068</a> Exploitation for Privilege Escalation
- <a href="https://attack.mitre.org/techniques/T1556/" class="ttp-badge" target="_blank">T1556</a> Modify Authentication Process

CISA 緊急指令 ED 26-03 持續生效。本週 SK-CERT（斯洛伐克）於 2026-03-04 發布依法律第 69/2018 號的正式警告，確認 Cisco Catalyst SD-WAN 零日漏洞在全球範圍內持續被積極利用。

**攻擊鏈**：
1. **初始入侵**：CVE-2026-20127（CWE-287 不當身份驗證，CVSS 10.0）
2. **NETCONF 存取**：攻擊者以高權限帳戶操縱 SD-WAN 網路結構
3. **權限提升**：CVE-2022-20775（路徑遍歷 + 不當權限管理）
4. **持久化**：添加惡意 rogue peers 至 SD-WAN 配置

**國際聯合夥伴**：NSA（美國）、ASD ACSC（澳洲）、Canadian Cyber Centre（加拿大）、NCSC-NZ（紐西蘭）、NCSC-UK（英國）、CERT-FR（法國）、CERT.RO（羅馬尼亞）、SK-CERT（斯洛伐克）

### 8. CISA 新增 Qualcomm 與 VMware KEV

**嚴重程度：High | 來源：CISA | 日期：2026-03-03**

CISA 於 2026-03-03 新增兩個漏洞至 KEV 目錄，確認正被活躍利用：

| CVE | 產品 | 漏洞類型 |
|-----|------|----------|
| **CVE-2026-21385** | Qualcomm 多晶片 | 記憶體損壞 |
| **CVE-2026-22719** | Broadcom VMware Aria Operations | 命令注入 |

這兩個 KEV 新增顯示行動晶片（Qualcomm）與虛擬化管理平台（VMware）均面臨活躍利用威脅。

### 9. Chrome Gemini AI 面板漏洞（CVE-2026-0628）

**嚴重程度：High | 來源：Palo Alto Unit 42 | 日期：2026-03-03**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1176/" class="ttp-badge" target="_blank">T1176</a> Browser Extensions
- <a href="https://attack.mitre.org/techniques/T1005/" class="ttp-badge" target="_blank">T1005</a> Data from Local System

Palo Alto Unit 42 揭露 **CVE-2026-0628**，Chrome 瀏覽器 Gemini AI 功能中的高嚴重性漏洞：
- 惡意擴充功能可劫持 Gemini Live 面板
- 可存取使用者本機檔案系統
- 突顯瀏覽器整合 AI 功能帶來的新攻擊面

**更廣泛意義**：隨著瀏覽器整合 AI 助手（Agentic AI），被入侵的 AI 面板可成為存取敏感本地資料的跳板，代表新型漏洞類別的出現。

### 10. QuickLens Chrome 擴充套件 ClickFix 攻擊

**嚴重程度：High | 來源：BleepingComputer | 日期：2026-03-01**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1176/" class="ttp-badge" target="_blank">T1176</a> Browser Extensions
- <a href="https://attack.mitre.org/techniques/T1204/002/" class="ttp-badge" target="_blank">T1204.002</a> User Execution: Malicious File

Chrome 擴充套件「QuickLens」（約 7,000 使用者，獲 Google 精選徽章）遭供應鏈攻擊，2026-02-17 釋出的 v5.8 植入 ClickFix 攻擊腳本與加密貨幣竊取功能。Google 已下架。

### 11. 韓國國稅局冷錢包種子詞外洩（480 萬美元失竊）

**嚴重程度：High | 來源：BleepingComputer | 日期：2026-03-01**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1552/004/" class="ttp-badge" target="_blank">T1552.004</a> Unsecured Credentials: Private Keys

韓國國稅局查獲逃稅者（124 名，沒收約 81 億韓元數位資產）後，公開照片意外暴露 Ledger 冷錢包助記詞，攻擊者轉走約 480 萬美元加密貨幣。

### 12. Kimwolf 殭屍網路主控者「Dort」身份調查

**嚴重程度：High | 來源：KrebsOnSecurity | 日期：2026-03-01**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1583/005/" class="ttp-badge" target="_blank">T1583.005</a> Acquire Infrastructure: Botnet
- <a href="https://attack.mitre.org/techniques/T1498/" class="ttp-badge" target="_blank">T1498</a> Network Denial of Service

KrebsOnSecurity 公布全球最大殭屍網路 Kimwolf 主控者「Dort」的調查。身份曝光後 Dort 發動 DDoS、人肉搜索、電郵轟炸與 SWAT 攻擊等報復行動。

### 13. CrushFTP 暴力破解掃描與多 CVE 利用

**嚴重程度：High | 來源：SANS ISC | 日期：2026-03-03**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> Exploit Public-Facing Application
- <a href="https://attack.mitre.org/techniques/T1110/" class="ttp-badge" target="_blank">T1110</a> Brute Force

SANS ISC 偵測到針對 CrushFTP 檔案傳輸系統的活躍暴力破解掃描，關聯三個高風險漏洞：
- **CVE-2024-4040**：Template injection → VFS 沙箱逃逸 → RCE
- **CVE-2025-31161**：認證繞過（取得 crushadmin 帳戶）
- **CVE-2025-54309**：零日漏洞（2025 年 7 月揭露時已在野外利用）

### 14. SIM 卡交換攻擊利用伊朗飛彈危機

**嚴重程度：Medium | 來源：NCSC-FI | 日期：2026-03-03**

伊朗飛彈攻擊杜拜數小時後，詐騙者冒充「杜拜危機管理」部門發動 SIM 卡交換攻擊，試圖存取銀行帳戶。此事件展示地緣政治危機如何被犯罪分子迅速利用為社交工程機會。

### 15. 芬蘭 Deepfake 假藥詐騙

**嚴重程度：Medium | 來源：NCSC-FI | 日期：2026-03-02**

**ATT&CK TTP**：
- <a href="https://attack.mitre.org/techniques/T1585/001/" class="ttp-badge" target="_blank">T1585.001</a> Establish Accounts: Social Media Accounts

AI 生成 Deepfake 影片冒充芬蘭醫師與名人推廣假藥，北歐國家 Deepfake 詐騙趨勢的一部分。

---

## 漏洞趨勢分析

### 本週漏洞統計

| 嚴重程度 | 2026 年累計 | 說明 |
|----------|-------------|------|
| Critical/High | 2,605 | vulnerability_tracking/critical_high |
| Medium | 8,884+ | vulnerability_tracking/medium |
| 活躍利用 (KEV) | 53 | exploit_intelligence/active_exploitation |
| PoC 可用 | 2,263+ | exploit_intelligence/poc_available |

### 本週新增/持續活躍利用漏洞

#### CISA 新增 KEV（2026-03-03）

| CVE | 產品 | 類型 | 嚴重程度 |
|-----|------|------|----------|
| **CVE-2026-21385** | Qualcomm 多晶片 | 記憶體損壞 | High |
| **CVE-2026-22719** | Broadcom VMware Aria Operations | 命令注入 | High |

#### APT28 活躍利用

| CVE | 產品 | 類型 | 嚴重程度 | 威脅行為者 |
|-----|------|------|----------|------------|
| **CVE-2026-21513** | Microsoft MSHTML | 安全功能繞過 | High (8.8) | APT28（Russia） |

#### 持續活躍利用（延續前週）

| CVE | 產品 | 利用難度 | 修補期限 | 勒索軟體 | 狀態 |
|-----|------|----------|----------|----------|------|
| **CVE-2026-20127** | Cisco SD-WAN | 低 | **ED 26-03** | Unknown | **持續活躍** |
| **CVE-2026-1731** | BeyondTrust RS/PRA | 低 | **2026-02-16（已過期）** | **Known** | **逾期** |
| **CVE-2026-20045** | Cisco UCM | 低 | **2026-02-11（已過期）** | Unknown | **逾期** |
| **CVE-2026-25108** | Soliton FileZen | 低 | ED 相關 | Unknown | **持續** |
| **CVE-2026-22769** | Dell RP4VMs | 低 | **2026-02-21（已過期）** | Unknown | **逾期** |
| **CVE-2026-2441** | Google Chromium CSS | 中 | **2026-03-10** | Unknown | **接近期限** |
| **CVE-2025-49113** | RoundCube Webmail | 中 | TBD | N/A | **持續** |
| **CVE-2025-68461** | RoundCube Webmail | 低 | TBD | N/A | **持續** |

### ICS/OT 漏洞揭露（CISA 2026-03-03 新發布）

本週 CISA 持續發布 ICS 安全公告，重點涵蓋能源基礎設施與工業控制系統：

| ICS Advisory | 產品 | 領域 | 說明 |
|-------------|------|------|------|
| 新增 | Hitachi Energy Relion REB500 | 電力保護 | 繼電器保護系統漏洞 |
| 新增 | Hitachi Energy RTU500 | 電力/能源 | 遠端終端單元漏洞 |
| 新增 | Mitsubishi MELSEC iQ-F EtherNet/IP | 製造業 | PLC 通訊漏洞 |
| 新增 | Labkotec Lid-3300IP | 環境監控 | 液位偵測系統 |
| 新增 | Portwell Engineering 工具套件 | 工業製造 | 工程工具漏洞 |
| 新增 | ePower/Everon OCPP/Mobiliti-E | EV 充電 | 充電站後端平台 |

**關鍵觀察**：
- **EV 充電站平台持續曝光**：繼上週 5+ 平台後，本週再新增 ePower、Everon OCPP、Mobiliti-E/MobiHu 三個平台，顯示 EV 充電基礎設施安全問題為系統性
- **電力系統設備**：Hitachi Energy 的 Relion 繼電器與 RTU500 影響關鍵電力保護與控制系統
- **工業 PLC**：Mitsubishi MELSEC iQ-F EtherNet/IP 模組漏洞影響製造業自動化環境

### 廠商漏洞分布

| 廠商 | 漏洞公告數 | 重點 |
|------|-----------|------|
| **Cisco** | 3+（持續） | SD-WAN 零日 CISA ED 26-03 |
| **Microsoft** | 2+ | MSHTML CVE-2026-21513（APT28 利用）、Patch Tuesday |
| **Qualcomm** | 1 | 多晶片記憶體損壞（KEV） |
| **Broadcom/VMware** | 2+ | Aria Operations 命令注入（KEV）、Cloud Foundation |
| **Hitachi Energy** | 2 | Relion REB500、RTU500 |
| **Mitsubishi Electric** | 1 | MELSEC iQ-F EtherNet/IP |
| **Google** | 2 | Chrome Gemini CVE-2026-0628、Android 安全公告 |
| **Docker** | 1 | Desktop 安全更新（CERT-FR） |
| **EV 充電站平台** | 3+ | ePower、Everon OCPP、Mobiliti-E |

---

## 活躍利用與 PoC 動態

### 已確認活躍利用漏洞匯總

| CVE ID | 產品 | 類型 | 修補期限 | 勒索軟體 | 本週狀態 |
|--------|------|------|----------|----------|----------|
| **CVE-2026-21385** | Qualcomm | 記憶體損壞 | TBD | N/A | **新增 KEV** |
| **CVE-2026-22719** | VMware Aria | 命令注入 | TBD | N/A | **新增 KEV** |
| **CVE-2026-21513** | Microsoft MSHTML | 安全繞過 | 已修補 | N/A | **APT28 利用** |
| **CVE-2026-20127** | Cisco SD-WAN | 認證繞過 | **ED 26-03** | Unknown | **持續** |
| **CVE-2026-1731** | BeyondTrust | OS 命令注入 | **已過期** | **Known** | **逾期** |
| **CVE-2026-20045** | Cisco UCM | 程式碼注入 | **已過期** | Unknown | **逾期** |
| **CVE-2026-25108** | Soliton FileZen | OS 命令注入 | ED 相關 | Unknown | **持續** |
| **CVE-2026-22769** | Dell RP4VMs | 硬編碼憑證 | **已過期** | Unknown | **逾期** |
| **CVE-2026-2441** | Chromium CSS | UAF RCE | 2026-03-10 | Unknown | **接近期限** |
| **CVE-2026-24423** | SmarterMail | 認證缺失→RCE | **已過期** | **Known** | **逾期** |

**重要觀察**：
- 本週新增 2 個 KEV（Qualcomm、VMware），加上 APT28 確認利用 MSHTML 漏洞
- 多個修補期限已過期的 KEV 仍在活躍利用中（BeyondTrust、Cisco UCM、Dell RP4VMs）
- **勒索軟體關聯**：CVE-2026-1731（BeyondTrust）與 CVE-2026-24423（SmarterMail）均已確認用於勒索軟體

### 新公開 PoC 追蹤

2026 年累計 2,263+ 個 PoC（exploit_intelligence/poc_available），本週新增 PoC 涵蓋 2026 年新 CVE：
- CVE-2026-4821、CVE-2026-3395、CVE-2026-3171、CVE-2026-3098 等
- Windows NTLM Hash Disclosure PoC
- RPi-Jukebox-RFID Stored XSS PoC

---

## 攻擊手法歸納

### TTP 趨勢統計

基於本週資料分析，主要攻擊手法分布：

| 攻擊類型 | 佔比 | 趨勢 | 對應 ATT&CK TTP |
|----------|------|------|-----------------|
| 國家級網路戰/APT | 30% | **急劇上升** | <a href="https://attack.mitre.org/techniques/T1588/" class="ttp-badge" target="_blank">T1588</a> |
| 零日漏洞利用 | 20% | 穩定（高位） | <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> |
| 供應鏈攻擊 | 15% | **持續上升** | <a href="https://attack.mitre.org/techniques/T1195/" class="ttp-badge" target="_blank">T1195</a> |
| 社交工程/釣魚/ClickFix | 15% | **上升** | <a href="https://attack.mitre.org/techniques/T1566/" class="ttp-badge" target="_blank">T1566</a> |
| 認證繞過/硬編碼憑證 | 10% | 穩定 | <a href="https://attack.mitre.org/techniques/T1078/" class="ttp-badge" target="_blank">T1078</a> |
| OT/ICS 攻擊 | 10% | **持續上升** | <a href="https://attack.mitre.org/techniques/T1133/" class="ttp-badge" target="_blank">T1133</a> |

### 本週攻擊手法深度分析

#### 國家級 APT 行動密度達歷史新高

本週至少有五個國家關聯的 APT 行動被揭露或持續追蹤，橫跨四個國家：

**伊朗關聯行動**：
- [T1498](https://attack.mitre.org/techniques/T1498/){: .ttp-ref } Network DoS — 全國網路封鎖
- [T1583.006](https://attack.mitre.org/techniques/T1583.006/){: .ttp-ref } Mobile Application Compromise — BadeSaba 心戰
- [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref } Data Encrypted for Impact — 勒索軟體作為國家工具
- 五大 APT 組織同步動員（MuddyWater、APT33、APT34、Charming Kitten、Moses Staff）
- **Dust Specter** 攻擊伊拉克政府（SPLITDROP/TWINTASK/TWINTALK/GHOSTFORM 四種新工具）

**俄羅斯關聯行動**：
- **APT28** 利用 CVE-2026-21513 MSHTML 零日漏洞攻擊 Windows 系統
- [T1203](https://attack.mitre.org/techniques/T1203/){: .ttp-ref } Exploitation for Client Execution

**印度關聯行動**：
- **SloppyLemming** 對南亞三國政府的長期間諜活動
- [T1566.001](https://attack.mitre.org/techniques/T1566.001/){: .ttp-ref } Spearphishing Attachment

**中國關聯行動**（持續追蹤）：
- **Lotus Blossom** Notepad++ 供應鏈攻擊
- [T1195.002](https://attack.mitre.org/techniques/T1195.002/){: .ttp-ref } Supply Chain Compromise

**烏克蘭相關行動**：
- **UAC-0252** 冒充烏克蘭政府部署竊取程式
- [T1036](https://attack.mitre.org/techniques/T1036/){: .ttp-ref } Masquerading

#### 供應鏈攻擊手法演進

本週供應鏈攻擊呈現四種不同型態：

**型態一：基礎設施供應鏈攻擊（Notepad++ / Lotus Blossom）**
- 攻擊者不篡改原始碼，改為攻陷代管服務商，控制更新機制
- Chrysalis 後門濫用 Microsoft Warbird 框架繞過 EDR

**型態二：瀏覽器擴充套件供應鏈（QuickLens）**
- 更新已獲 Google 精選徽章的合法擴充套件，植入 ClickFix + 加密貨幣竊取

**型態三：AI 功能新攻擊面（Chrome Gemini CVE-2026-0628）**
- 瀏覽器 AI 整合創造新攻擊向量，惡意擴充功能可劫持 AI 面板存取本機資料

**型態四：操作安全失誤（韓國國稅局種子詞外洩）**
- 機構操作安全流程失誤，公開照片暴露敏感密碼學材料

#### 勒索軟體生態系統變化

本週三個關鍵信號顯示勒索軟體生態系統正在變化：

1. **「榮譽準則」崩壞**（Mikko Hypponen 警告）：ShinyHunters 等組織收取贖金後仍出售資料，付款不再保證任何保護
2. **支付金額停滯**（Chainalysis 報告）：2025 年總支付金額降 8% 至 8.2 億美元，但攻擊次數增加 50%，中位數支付金額暴增 368%
3. **國家-犯罪融合**：伊朗國家級行為者採用勒索軟體戰術作為破壞性攻擊的掩護

---

## 威脅情報饋送摘要

**來源：abuse.ch | 日期：2026-03-01 至 2026-03-04**

### 本週威脅饋送統計

| 類別 | 3 月至今數量 | 2026 年累計 | 說明 |
|------|------------|-------------|------|
| 惡意 URL | 992 | 26,222 | URLhaus 惡意 URL |
| 惡意軟體樣本 | 508 | 6,004 | MalwareBazaar |
| IoC 指標 | 1,398 | 8,385 | ThreatFox IoC |
| C2 基礎設施 | 2 | 223 | C2 伺服器 |

### 惡意軟體家族分布（3 月至今 IoC Top 家族）

| 家族 | IoC 數量 | 類型 | 威脅描述 |
|------|----------|------|----------|
| **Vidar** | 109（URL+domain+IP） | 資訊竊取 | 竊取瀏覽器密碼、加密貨幣錢包、2FA 資料 |
| **AsyncRAT** | 72 | 遠端存取木馬 | C2 使用多個網域，企業環境持續威脅 |
| **IClickFix** | 69 | 社交工程/下載器 | ClickFix 手法自動化分發工具 |
| **ClearFake** | 56 | 注入攻擊 | 假瀏覽器更新頁面散布惡意程式 |
| **Cobalt Strike** | 44 | 攻擊框架 | 持續被 APT 與犯罪組織濫用 |
| **StrelaStealer** | 39 | 資訊竊取 | 專門竊取 Outlook/Thunderbird 郵件帳號 |
| **NetSupportManager RAT** | 27 | RAT | 合法遠端管理工具被濫用 |
| **Quasar RAT** | 18 | RAT | 開源 RAT 持續被使用 |
| **Meterpreter** | 13 | 攻擊框架 | Metasploit payload |
| **Remcos** | 12 | RAT | 企業環境威脅 |

### C2 基礎設施觀察

本週 C2 基礎設施新增 2 筆（AsyncRAT），但 2 月累計 214 筆 C2 資料顯示活躍 C2 家族分布：

| 家族 | 2 月 C2 數量 | 說明 |
|------|-------------|------|
| **XWorm** | 35 | 最活躍 C2 家族 |
| **Remcos** | 19 | 企業環境持續威脅 |
| **AsyncRAT** | 19 | .NET RAT |
| **Unknown Malware** | 18 | 未歸因樣本 |
| **Unknown Stealer** | 13 | 未歸因竊取程式 |
| **Aisuru** | 12 | IoT 殭屍網路 |
| **Havoc** | 11 | C2 框架 |
| **Vidar** | 9 | 資訊竊取 C2 |
| **Meterpreter** | 9 | Metasploit 後門 |
| **Sliver** | 8 | 開源 C2 框架 |

### Cobalt Strike C2 活動觀察

Qdrant 查詢（查詢 5）返回大量近期 Cobalt Strike C2 伺服器指標：
- 多個 IP（156.234.21.x、43.249.175.x、43.240.239.x）在連接埠 3093 活躍
- 日期均為 2026-03-03，顯示攻擊者在本週活躍建立新 C2 基礎設施
- Cobalt Strike 持續作為 APT 與犯罪組織共用的首選攻擊框架

---

## 新興威脅識別

### 1. 伊朗多維度網路戰升級至前所未有規模 [信心水準：高]

**威脅描述**：Operation Epic Fury 消除伊朗常規軍事選項後，網路作戰成為唯一剩餘的非對稱報復工具。五大 APT 組織同步動員為歷來首見，Dust Specter 進一步展示伊朗持續擴展新 APT 組織與新惡意軟體家族。

**證據支持**：
- 2026-02-27 五大 APT 組織同步活動
- Dust Specter 部署 4 種全新惡意軟體家族攻擊伊拉克
- MuddyWater 部署 5 個全新惡意程式家族（含 Rust 基礎工具）
- 加拿大 Cyber Centre（2026-03-02）與 Check Point Research（2026-03-03）均發布專題分析
- Qdrant 查詢（查詢 1）「勒索軟體 ransomware 攻擊事件」：歷史勒索軟體趨勢資料提供背景支持（相似度 0.57），顯示國家-犯罪融合趨勢有歷史脈絡

**影響評估**：
- 全球關鍵基礎設施面臨升高的伊朗網路威脅
- 新 APT 組織（Dust Specter）的出現意味著伊朗網路能力持續擴張
- 中東地區國家政府面臨高度針對性攻擊

### 2. 多國 APT 同時活躍 — 地緣政治驅動的網路空間軍事化 [信心水準：高]

**威脅描述**：本週至少五個國家關聯的 APT 組織同時活躍（伊朗 5+ 組織、俄羅斯 APT28、印度 SloppyLemming、中國 Lotus Blossom、烏克蘭相關 UAC-0252），顯示網路空間正經歷前所未有的軍事化程度。

**證據支持**：
- 伊朗：5 大 APT + Dust Specter（新揭露）
- 俄羅斯：APT28 利用 MSHTML 零日（Akamai 分析確認）
- 印度：SloppyLemming 一年期南亞間諜活動（Arctic Wolf 揭露）
- 中國：Lotus Blossom Notepad++ 供應鏈攻擊（持續追蹤）
- UAC-0252：持續冒充烏克蘭政府的釣魚活動
- Qdrant 查詢（查詢 3）「供應鏈攻擊 supply chain compromise APT」：歷史案例（依賴混淆 0.57、PRC 國家行為者 0.55）提供長期脈絡

### 3. AI 功能整合創造瀏覽器新攻擊面 [信心水準：中-高]

**威脅描述**：CVE-2026-0628 揭示瀏覽器整合 AI 功能帶來全新攻擊面類別——惡意擴充功能可透過劫持 AI 面板存取使用者本機檔案系統，將 AI 助手從生產力工具轉變為攻擊跳板。

**證據支持**：
- Palo Alto Unit 42 確認 CVE-2026-0628（Chrome Gemini 面板漏洞）
- QuickLens ClickFix 事件展示擴充套件生態系統的脆弱性
- AI 功能通常具有更高的系統權限（存取檔案系統、執行程式碼）

**影響評估**：
- 隨著更多瀏覽器整合 AI 助手，類似漏洞將持續出現
- AI 面板的權限範圍可能成為攻擊者的首要目標
- 預期更多研究者將揭露 Agentic AI 相關漏洞

### 4. 勒索軟體信用體系崩壞改變風險方程式 [信心水準：高]

**威脅描述**：ShinyHunters 等組織收取贖金後仍出售竊取資料，結合 Chainalysis 數據顯示支付金額停滯但攻擊次數增加 50%，勒索軟體生態系統正經歷結構性轉變。

**證據支持**：
- Mikko Hypponen（2026-03-02）公開警告「榮譽準則」崩壞
- Chainalysis 2026 報告：2025 年支付金額降 8% 至 8.2 億美元，攻擊次數增 50%
- 中位數支付金額暴增 368% 至約 6 萬美元
- 伊朗國家級行為者使用勒索軟體作為破壞工具的趨勢
- Qdrant 查詢（查詢 1）：歷史勒索軟體趨勢資料（Petrwrap 防禦 0.58、勒索軟體持續攻擊 0.57）支持此為長期演變

**影響評估**：
- 組織應將所有勒索軟體事件視為完整資料外洩，不論是否支付贖金
- 網路保險政策假設需重新評估
- 事件應變計劃需更新以反映新現實

### 5. EV 充電基礎設施安全問題持續系統性曝光 [信心水準：高]

**威脅描述**：繼上週 5+ 平台 ICS 漏洞後，本週再新增 ePower、Everon OCPP、Mobiliti-E/MobiHu 三個 EV 充電站平台的安全公告，確認此為系統性問題而非個別事件。

**證據支持**：
- 上週：EV Energy（CVSS 9.4）、Mobility46（CVSS 9.4）、Chargemap、CloudCharge、Switch、EV2go
- 本週新增：ePower、Everon OCPP Backends、Mobiliti-E/MobiHu
- 漏洞模式一致：WebSocket 缺乏認證、暴力破解、session 管理不當

### 6. CrushFTP 檔案傳輸系統成為攻擊焦點 [信心水準：高]

**威脅描述**：SANS ISC 偵測到針對 CrushFTP 的活躍暴力破解掃描，關聯三個高風險 CVE（含零日），延續近年來檔案傳輸系統持續被攻擊的趨勢（MOVEit、GoAnywhere、Accellion、FileZen）。

**證據支持**：
- CVE-2024-4040（RCE）、CVE-2025-31161（認證繞過）、CVE-2025-54309（零日）
- Qdrant 查詢（查詢 2）「RCE critical vulnerability」：多個檔案傳輸與企業應用 RCE 漏洞（SmarterMail 0.70、motionEye 0.70、Redis 0.69）顯示 RCE 攻擊面持續擴大

---

## 跨 Layer 關聯分析

### Qdrant 語意查詢結果

本週執行 5 次 Qdrant 語意查詢，用於跨 Layer 關聯分析：

#### 查詢 1：「勒索軟體 ransomware 攻擊事件 2026」— 10 筆結果

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| **0.5755** | Defences against "Petrwrap" Ransomware Attack | vulnerability_tracking | medium |
| **0.5739** | Active ransomware attacks continue (2020) | security_news_facts | attack_incident |
| **0.5698** | Ask us about ransomware! (2022) | security_news_facts | attack_incident |
| **0.5606** | New actors and methods in ransomware (2023) | security_news_facts | attack_incident |
| **0.5528** | Defences against "WannaCry" Ransomware Attack | vulnerability_tracking | medium |

**關聯發現**：勒索軟體威脅具有深厚歷史脈絡，從 WannaCry（2017）至今持續演進。本週伊朗國家級行為者採用勒索軟體戰術的趨勢，與歷史資料中「新行為者與新操作方法」（2023）的觀察一致，顯示勒索軟體生態系統持續吸引國家級參與者。

#### 查詢 2：「遠端程式碼執行 RCE critical vulnerability active exploitation」— 10 筆結果

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| **0.7176** | Critical RCE Vulnerability React2Shell Under Mass Exploitation | security_news_facts | vulnerability_disclosure |
| **0.7051** | FreeBSD rtsold RCE via DNSSL | exploit_intelligence | poc_available |
| **0.7018** | motionEye 0.43.1b4 RCE | exploit_intelligence | poc_available |
| **0.6943** | Redis 8.0.2 RCE | exploit_intelligence | poc_available |

**關聯發現**：RCE 漏洞在 exploit_intelligence Layer 中呈現高密度（相似度 0.70+），確認 RCE 利用工具（PoC）的快速武器化是當前主要威脅模式。React2Shell 大規模利用（0.72）驗證了供應鏈 RCE 漏洞的嚴重性。

#### 查詢 3：「供應鏈攻擊 supply chain compromise APT」— 10 筆結果

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| **0.5721** | 半導體戰略背後的網路戰–攻擊鎖定設計、生產與財經分析師 | security_news_facts | attack_incident |
| **0.5483** | PRC state-sponsored worldwide network compromises | security_news_facts | attack_incident |
| **0.5425** | Dependency confusion exposes to attacks | security_news_facts | attack_incident |

**關聯發現**：供應鏈攻擊手法持續演進——PRC 國家行為者全球性網路入侵（0.55）、依賴混淆攻擊（0.54）與本週 Notepad++（Lotus Blossom）和 QuickLens 事件形成連續脈絡。半導體產業供應鏈攻擊（0.57）揭示產業鏈的脆弱性。

#### 查詢 4：「Iran cyber retaliation APT MuddyWater destructive wiper」— 10 筆結果

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| **0.5450** | Malware in Attacks Exploiting Ivanti Connect Secure | security_news_facts | attack_incident |
| **0.5159** | PRC state-sponsored worldwide network compromises | security_news_facts | attack_incident |
| **0.5091** | HoneyMyte updates CoolClient, deploys stealers | security_news_facts | other |

**關聯發現**：伊朗 APT 利用的漏洞類型（VPN 設備、遠端存取系統）與 Ivanti Connect Secure 攻擊（0.55）呈現相似攻擊模式——均鎖定企業邊界設備作為初始入侵向量。

#### 查詢 5：「Chrome extension cryptocurrency malware botnet DDoS」— 10 筆結果

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| **0.5119** | MalwareBazaar: DiscordRAT | threat_feeds | malware_sample |
| **0.4945** | MalwareBazaar: AsyncRAT | threat_feeds | malware_sample |
| **0.4822** | ThreatFox: Cobalt Strike C2 — 156.234.21.203:3093 | threat_feeds | ioc_indicator |
| **0.4822** | ThreatFox: Cobalt Strike C2 — 156.234.21.204:3093 | threat_feeds | ioc_indicator |

**關聯發現**：威脅饋送中大量 Cobalt Strike C2 指標（日期 2026-03-03）與 AsyncRAT/DiscordRAT 樣本，為 QuickLens 供應鏈攻擊和殭屍網路基礎設施提供 IoC 交叉驗證。多個 Cobalt Strike C2 使用相同連接埠 3093，暗示統一的攻擊者基礎設施。

### 跨 Layer 關聯總結

**伊朗網路戰跨 Layer 關聯**：
- **security_news_facts/attack_incident**：7+ 起直接相關事件（網路封鎖、App 心戰、APT 動員、犯罪戰術、Dust Specter、加拿大威脅公告、SIM-swap 利用危機）
- **security_news_facts/industry_trend**：Check Point 伊朗能力分析（2026-03-03）
- **Qdrant**：歷史攻擊模式（Ivanti 漏洞利用、PRC 國家行為者）呈現類似邊界設備入侵手法

**國家級 APT 跨 Layer 關聯**：
- APT28 MSHTML 利用 → vulnerability_tracking（2 月 Patch Tuesday）→ exploit_intelligence（活躍利用確認）
- Dust Specter → 新增 4 種惡意程式至 security_news_facts/attack_incident
- SloppyLemming → 南亞政府/關鍵基礎設施受影響（跨 Layer 地理維度）

**CISA KEV 跨 Layer 關聯**：
- CVE-2026-21385（Qualcomm）與 CVE-2026-22719（VMware）同時加入 KEV → 行動晶片與虛擬化管理平台雙線威脅
- Cisco SD-WAN（CVE-2026-20127）持續在 vulnerability_tracking、exploit_intelligence、security_news_facts 三個 Layer 高密度出現

---

## 修補期限一覽表

| CVE | 產品 | CISA 修補期限 | 嚴重程度 | 勒索軟體 | 狀態 |
|-----|------|---------------|----------|----------|------|
| **CVE-2026-20127** | Cisco SD-WAN | **緊急指令 ED 26-03** | Critical | Unknown | **立即處理** |
| **CVE-2022-20775** | Cisco SD-WAN | **緊急指令 ED 26-03** | High | Unknown | **立即處理** |
| **CVE-2026-1731** | BeyondTrust RS/PRA | **2026-02-16（已過期）** | Critical | **Known** | **逾期** |
| **CVE-2026-20045** | Cisco UCM | **2026-02-11（已過期）** | Critical | N/A | **逾期** |
| **CVE-2026-22769** | Dell RP4VMs | **2026-02-21（已過期）** | Critical | N/A | **逾期** |
| **CVE-2025-68645** | Zimbra ZCS | **2026-02-12（已過期）** | Critical | N/A | **逾期** |
| **CVE-2026-2441** | Chromium CSS | **2026-03-10** | High | Unknown | **接近期限** |
| **CVE-2026-21385** | Qualcomm 多晶片 | TBD | High | N/A | **新增 KEV** |
| **CVE-2026-22719** | VMware Aria Ops | TBD | High | N/A | **新增 KEV** |
| **CVE-2026-21513** | Microsoft MSHTML | 已修補 | High (8.8) | N/A | **APT28 利用** |
| **CVE-2025-49113** | RoundCube | TBD | Critical | N/A | **持續** |
| **CVE-2025-68461** | RoundCube | TBD | Critical | N/A | **持續** |
| **CVE-2026-24423** | SmarterMail | **已過期** | Critical | **Known** | **逾期** |

**優先修補建議**：
1. **立即**：CVE-2026-20127、CVE-2022-20775（Cisco SD-WAN，CISA ED 26-03）
2. **立即**：CVE-2026-1731（BeyondTrust，已確認被勒索軟體利用）
3. **立即**：CVE-2026-21513（MSHTML，APT28 活躍利用，已有修補）
4. **緊急**：CVE-2026-21385、CVE-2026-22719（新增 KEV）
5. **緊急**：CVE-2026-2441（Chromium，2026-03-10 期限）
6. **逾期未修補**：所有已過期 CISA KEV 漏洞應立即處理

---

## 產業動態

### Check Point 伊朗網路能力全面概述

**來源**：Check Point Research | 日期：2026-03-03

Check Point Research 發布伊朗網路威脅生態系統全面概述，涵蓋 IRGC 與 MOIS 關聯組織的 TTPs。報告結構性地分析了伊朗間諜、破壞性攻擊與資訊操作三大目標，為防禦者提供針對伊朗相關威脅的優先防護依據。

### Chainalysis 2026 勒索軟體報告

**來源**：Chainalysis | 日期：2026-03-01

2025 年勒索軟體鏈上支付總額降 8% 至 8.2 億美元，攻擊次數卻增加 50%。IAB（初始存取代理商）活動為勒索軟體攻擊的領先指標（約 30 天提前量）。犯罪與國家行為者共享防彈主機與代理基礎設施。

### 勒索軟體「榮譽準則」崩壞

**來源**：NCSC-FI / Mikko Hypponen | 日期：2026-03-02

ShinyHunters 等組織收取贖金後仍出售竊取資料，勒索軟體犯罪集團的信用體系已崩壞。組織應將所有勒索軟體事件視為完整資料外洩。

### OpenAI 發布 AI 惡意使用威脅報告

**來源**：NCSC-FI | 日期：2026-03-02

OpenAI 文件記錄威脅行為者如何結合 AI 與傳統工具進行影響力操作與網路攻擊，包括 Operation Date Bait、Operation Trolling Stone 等被瓦解的活動。

### CISA ICS 公告持續擴大

**來源**：CISA | 日期：2026-03-03

本週 CISA 發布多項 ICS 公告涵蓋 Hitachi Energy、Mitsubishi Electric、EV 充電站等關鍵基礎設施產品，延續上週 10 項 ICS 公告的趨勢。

---

## 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資。主要來源包括 CISA (US)、NSA (US)、CERT-UA (Ukraine)、CERT-FR (France)、CERT.RO (Romania)、SK-CERT (Slovakia)、JPCERT/CC (Japan)、TWCERT/CC (Taiwan)、NCSC-FI (Finland)、Canadian Cyber Centre (Canada)、NCSC-UK (UK)、KrebsOnSecurity、BleepingComputer、Anomali、Halcyon、Check Point Research、Arctic Wolf、Zscaler ThreatLabz、Akamai、Palo Alto Unit 42、WIRED、Chainalysis。

2. **時效性**：資料收集截至 2026-03-04（週中），本週（至 2026-03-08）後半段的事件尚未涵蓋。特別是伊朗網路戰態勢可能在報告發布後快速演變。本報告將依需要更新。

3. **地理偏差**：本週資料以中東（伊朗-以色列衝突）、歐美及南亞地區為主。中東事件依賴西方媒體與安全研究機構報導，可能存在視角偏差。CERT-UA 資訊為烏克蘭文翻譯、SK-CERT 為斯洛伐克文翻譯，可能存在細節偏差。

4. **信心水準說明**：
   - **高**：基於官方公告、確認的 KEV 列表、多來源交叉驗證（如 CISA ED 26-03、Akamai APT28 分析、CERT-UA 官方公告、Qdrant 跨 Layer 驗證）
   - **中-高**：基於可信來源報導、模式分析（如 AI 功能攻擊面趨勢、ClickFix 擴散、EV 充電站系統性問題）
   - **中**：基於單一來源報導或有限樣本推斷（如 SK-CERT 斯洛伐克文來源）
   - **低**：推測性關聯（如俄羅斯駭客組織監控攝影機宣稱 — 可能為宣傳操作）

5. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務等來源。Qdrant 語意查詢結果受限於已收錄資料範圍。

6. **翻譯風險**：部分非英文來源（烏克蘭文、斯洛伐克文、法文、羅馬尼亞文、芬蘭文、日文）經 AI 翻譯，可能存在語義偏差。

7. **分析局限**：趨勢分析基於公開資料樣本，攻擊手法佔比為估計值（基於本週事件加權），統計推論應謹慎解讀。國家級 APT 行動密度的「歷史新高」判斷基於公開揭露的活動，實際活動可能更多或更少。

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源。
