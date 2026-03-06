---
layout: seo-report
last_modified_at: 2026-03-06T20:00:00+08:00
title: 2026 第 10 週威脅態勢分析
description: "2026-02-27 至 2026-03-06 資安威脅週報：伊朗 Operation Epic Fury 引爆中東網路衝突、149 次駭客主義 DDoS 攻擊、APT28 利用 CVE-2026-21513 MSHTML 零日漏洞、Dust Specter 伊拉克政府攻擊、Cisco SD-WAN 零日主動利用、Tycoon 2FA 釣魚平台被查封、LeakBase 論壇拆除、勒索軟體付款趨勢停滯。"
date: 2026-03-06
period_start: 2026-02-27
period_end: 2026-03-06
tags:
  - weekly-report
  - threat-landscape
  - 2026-W10
  - Iran
  - APT28
  - hacktivist
  - DDoS
  - ransomware
  - zero-day
  - Cisco-SD-WAN
  - ICS
  - phishing
  - law-enforcement
---

# 威脅態勢分析 — 2026 第 10 週

> **涵蓋期間**：2026-02-27 至 2026-03-06
> **資料來源**：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch、ThreatFox、MalwareBazaar、URLhaus
> **分析日期**：2026-03-06

---

## 本週威脅態勢總覽

2026 第 10 週是地緣政治驅動的網路衝突急劇升溫的一週。2 月 28 日美國與以色列聯合發動「Operation Epic Fury」（史詩怒火行動）後，伊朗實施近乎全面的網路封鎖，同時伊朗國家支持的網路行為者與駭客主義團體發動大規模報復性網路攻勢，影響範圍遍及 16 國 110 個組織。與此同時，APT28 持續利用 MSHTML 零日漏洞、Cisco Catalyst SD-WAN 遭零日攻擊主動利用、Europol 協調查封 Tycoon 2FA 釣魚平台與 LeakBase 駭客論壇，勒索軟體生態系統也展現結構性轉變。本週共記錄 26 起攻擊事件、24 則漏洞揭露、11 條產業動態、11 項新增漏洞利用情報，以及約 1,956 筆威脅指標 (IoC)。

**本週關鍵數據**：

| 指標 | 數量 |
|------|------|
| 攻擊事件 (attack_incident) | 26 |
| 漏洞揭露 (vulnerability_disclosure) | 24 |
| 產業動態 (industry_trend) | 11 |
| 漏洞利用情報 (exploit_intelligence) | 11 |
| 威脅指標 (threat_feeds) | ~1,956 |
| 漏洞追蹤 (vulnerability_tracking) | 144 |
| CISA KEV 新增 | 7 (2+5) |
| ICS 安全公告 | 8+ |

---

## 2.1 近期重大資安事件

### 2.1.1 中東網路衝突全面升級：Operation Epic Fury 與伊朗網路報復

本週最具影響力的事件是圍繞 Operation Epic Fury 的中東網路衝突全面升級。這場衝突將動能軍事行動與網路作戰緊密結合，展現了現代混合戰爭的完整面貌。

**時間線**：

| 日期 | 事件 |
|------|------|
| 2026-02-28 07:00 UTC | 美國與以色列發動 Operation Epic Fury；伊朗網路連線降至正常水準的 4%（NetBlocks 數據） |
| 2026-02-28 | 伊朗成立「電子作戰室」(Electronic Operations Room)，協調國家支持的網路反擊 |
| 2026-02-28 ~ 03-02 | Keymous+ 與 DieNet 主導約 70% 的駭客主義 DDoS 活動 |
| 2026-03-01 | 伊朗IP攝影機目標擴展至黎巴嫩；Check Point 偵測到攻擊活動覆蓋以色列、卡達、巴林、科威特、阿聯酋、賽普勒斯 |
| 2026-03-02 | 親俄團體 NoName057(16) 加入親伊朗/親巴勒斯坦陣營 |
| 2026-03-05 | Orange Cyberdefense 統計 149 次 DDoS 攻擊命中 16 國 110 個組織 |

**關鍵觀察**：

1. **伊朗網路封鎖**（2026-03-01，NCSC-FI/Forbes/NetBlocks）：伊朗實施近乎全面的網路封鎖，連線降至 4%。這是伊朗政府慣用的戰時措施，與去年以伊戰爭期間使用的手段一致。此舉旨在控制資訊流動並限制外部對國內態勢的感知。

2. **駭客主義 DDoS 浪潮**（2026-03-05，NCSC-FI/Orange Cyberdefense/Radware）：149 次 DDoS 攻擊由 12 個團體執行，其中 Keymous+、DieNet 和 NoName057(16) 佔 74.6%。107 次攻擊集中於中東，47.8% 針對政府部門，11.9% 針對金融，6.7% 針對電信。科威特、以色列和約旦合計佔攻擊聲明的 76% 以上。

3. **IP 攝影機作為動能行動前哨站**（2026-03-05，NCSC-FI/Check Point Research）：Check Point 識別出自 2 月 28 日起，針對特定製造商 IP 攝影機的攻擊活動從伊朗歸因基礎設施發出，覆蓋以色列等 6 國。研究結論指出攝影機入侵用於飛彈行動的戰損評估 (Battle Damage Assessment, BDA)，攝影機攻擊活動可作為動能行動的早期預警指標。

4. **惡意 RedAlert App**（2026-03-05，NCSC-FI/Unit 42）：Unit 42 發現使用以色列後方司令部 RedAlert 應用程式惡意複製品的釣魚活動，投遞行動監控與資料外洩惡意軟體。

5. **伊朗採用網路犯罪戰術**（2026-03-02，NCSC-FI/Halcyon）：伊朗越來越多地將勒索軟體和網路犯罪戰術納入國家支持的破壞性網路行動，模糊犯罪勒索與地緣政治破壞之間的界線，同時維持否認性。

**Qdrant 跨 Layer 關聯分析**：查詢「Iran cyber attack retaliation Middle East」返回 10 筆結果（最高相似度 0.5158），關聯到 2025 年 7 月加拿大 CERT 的「Iranian cyber threat to Canada from Israel-Iran conflict」公告，以及 2025 年 12 月 NUKIB 的「Pro-Russian Hacktivists Targeting Critical Infrastructure」警告。這表明伊朗的網路威脅已從中東區域擴展至全球影響，且親俄駭客主義者參與模式與歷史紀錄一致。

### 2.1.2 APT 活動：多國國家級行為者同步活躍

本週至少有 5 個國家級 APT 行為者同時活躍，涵蓋俄羅斯、伊朗、印度關聯組織：

**Dust Specter（伊朗關聯）**（2026-03-03，NCSC-FI/Zscaler ThreatLabz）：
- 目標：伊拉克政府官員
- 時間：2026 年 1 月開始
- 新型惡意軟體：SPLITDROP（dropper）、TWINTASK/TWINTALK（backdoor）、GHOSTFORM（RAT）
- 兩條獨立攻擊鏈，分別透過 SPLITDROP 投遞後門與直接部署 GHOSTFORM RAT
- 歸因基礎：與已知伊朗關聯 APT 組織的 TTPs、工具及受害者學重疊（中-高信心）

**APT28/Fancy Bear（俄羅斯國家支持）**（2026-03-03，NCSC-FI/Akamai）：
- 利用 CVE-2026-21513（Windows MSHTML 安全功能繞過，CVSS 8.8）
- 已被微軟在 2026 年 2 月修補
- Akamai 使用 PatchDiff-AI 自動化工具確認漏洞根因並關聯野外利用活動

**BadPaw/MeowMeow（俄羅斯疑似）**（2026-03-05，NCSC-FI/ClearSky）：
- 針對烏克蘭的釣魚活動，使用偽裝為邊境通行許可的烏克蘭語惡意文件
- 投遞兩個先前未記錄的惡意軟體：BadPaw（loader）和 MeowMeow（backdoor）

**UAC-0252（歸因待定，針對烏克蘭）**（2026-03-02，CERT-UA）：
- 自 2026 年 1 月起發送偽裝為烏克蘭政府機構的釣魚郵件
- 部署 SHADOWSNIFF 和 SALATSTEALER 竊取程式
- 誘餌：要求更新軍民系統使用的行動應用程式

**SloppyLemming（印度關聯）**（2026-03-03，NCSC-FI/Arctic Wolf）：
- 為期一年的間諜活動（2025 年 1 月至 2026 年初）
- 目標：巴基斯坦、孟加拉、斯里蘭卡的政府機構與關鍵基礎設施
- 使用 BurrowShell 後門與鍵盤記錄惡意軟體，透過惡意 PDF 和 Excel 文件投遞

### 2.1.3 執法行動：兩大犯罪基礎設施被查封

本週見證了兩起重大國際執法協調行動：

**Tycoon 2FA 釣魚平台查封**（2026-03-05，NCSC-FI/Europol）：
- Europol EC3 協調的公私聯合行動
- 微軟主導技術打擊，6 國執法機構執行基礎設施扣押
- 330 個核心網域被關閉
- 該平台提供訂閱式工具包，能攔截即時認證會話並繞過 MFA

**LeakBase 駭客論壇拆除**（2026-03-05，NCSC-FI/U.S. DOJ）：
- 美國主導，Europol 協調的多國行動
- 14 國同步執法行動（2026-03-03/04）
- 論壇擁有 142,000+ 成員、215,000+ 條訊息
- 提供數億組帳號憑證的被盜資料庫交易平台
- 在美、澳、比、波、葡、羅、西、英執行搜索令和逮捕

### 2.1.4 其他重要攻擊事件

**EV 證書簽署惡意軟體**（2026-03-05，NCSC-FI/Microsoft Security Blog）：
- Microsoft Defender Experts 識別出使用 EV 憑證簽署惡意軟體的釣魚活動
- 偽裝為工作場所會議應用程式，使用「TrustConnect Software PTY LTD」的 EV 憑證
- 安裝 RMM 工具建立持久存取

**偽技術支援投遞 Havoc C2**（2026-03-05，NCSC-FI/Huntress）：
- 技術支援詐騙已升級為部署經修改的 Havoc C2 框架
- 使用 indirect syscalls 規避 EDR，registry-based fallback C2 配置
- 代表技術支援詐騙精密度的顯著升級

**XWorm 新投遞技術**（2026-03-04，SANS ISC）：
- 新一波 XWorm 展示多技術惡意軟體投遞方法
- 雖非新型惡意軟體，但投遞技術持續演進

**QuickLens Chrome 擴充功能供應鏈攻擊**（2026-03-01，NCSC-FI/BleepingComputer）：
- 擁有 Google Featured Badge 的合法擴充功能被入侵
- 版本 5.8（2026-02-17）植入 ClickFix 攻擊和加密貨幣竊取功能
- 約 7,000 用戶受影響

**杜拜 SIM swap 攻擊**（2026-03-03，NCSC-FI）：
- 與伊朗飛彈活動同時發生的 SIM swap 攻擊
- 芬蘭犯罪團伙也涉及 SIM swap 活動

**韓國稅務機構加密錢包被竊**（2026-03-01，NCSC-FI）：
- 韓國稅務機構的加密貨幣錢包種子遭竊取

---

## 2.2 漏洞趨勢分析

### 2.2.1 CISA 已知被利用漏洞 (KEV) 更新

本週 CISA 新增 **7 個已知被利用漏洞**至 KEV 目錄，分兩批公告：

**第一批（2026-03-03）— 2 個 CVE**：
| CVE | 產品 | 類型 |
|-----|------|------|
| CVE-2026-21385 | Qualcomm 多款晶片組 | 記憶體損壞漏洞 |
| CVE-2026-22719 | Broadcom VMware Aria Operations | 命令注入漏洞 |

**第二批（2026-03-05）— 5 個 CVE**：
- CISA 新增 5 個漏洞（具體 CVE 詳見 CISA 公告）
- 聯邦機構需按 BOD 22-01 在期限內修復

### 2.2.2 零日漏洞與主動利用

**Cisco Catalyst SD-WAN 零日（2026-03-04，SK-CERT）**：
- SK-CERT 發布緊急警告，確認 Cisco Catalyst SD-WAN 產品存在嚴重零日漏洞
- 漏洞正被全球範圍內主動利用以入侵系統
- 尚未指定 CVE 編號
- 建議立即限制 SD-WAN 管理介面的暴露

**Qdrant 跨 Layer 關聯分析**：查詢「Cisco SD-WAN zero day exploitation」返回 10 筆結果（最高相似度 0.6711），發現加拿大 CERT 於 2026-02-25 即已發布 AL26-004 警告（CVE-2026-20127），荷蘭 NCSC 也發布 NCSC-2026-0071，另有多個 Cisco SD-WAN Manager CVE（CVE-2026-20126, CVE-2026-20128, CVE-2026-20133）。此外還關聯到歷史漏洞 CVE-2022-20775（SD-WAN 路徑穿越）。這表明 Cisco SD-WAN 生態系統正面臨系統性安全危機，多個元件同時存在嚴重漏洞。

**CVE-2026-21513 MSHTML 漏洞（2026-03-03，NCSC-FI/Akamai）**：
- CVSS 8.8（高）
- Windows MSHTML 安全功能繞過
- APT28 積極利用於野外攻擊
- 已在 2026 年 2 月 Patch Tuesday 修補

**CVE-2026-0628 Chrome Gemini 漏洞（2026-03-03，NCSC-FI/Unit 42）**：
- 高嚴重性
- 允許惡意擴充功能劫持 Gemini AI 面板並存取本機檔案系統
- 凸顯 AI 功能整合至瀏覽器帶來的新型攻擊面

### 2.2.3 ICS/OT 漏洞揭露

本週 ICS/OT 領域漏洞揭露數量顯著，反映工業控制系統面臨持續且多元的威脅：

| 產品 | 公告編號 | CVE 數 | 最高 CVSS | 部署範圍 |
|------|----------|--------|-----------|----------|
| Delta Electronics CNCSoft-G2 | ICSA-26-064-01 | 1 (CVE-2026-3094) | 7.8 | 全球關鍵製造 |
| Hitachi Energy RTU500 | ICSA-26-062-03 | 4 | 7.5 | 全球 |
| Hitachi Energy Relion/REB500 | — | — | — | 全球 |
| Mitsubishi MELSEC iQ-F EtherNet/IP | — | — | — | 全球 |
| Portwell Engineering Toolkits | — | — | — | — |
| Labkotec LID-3300IP | — | — | — | — |

**EV 充電站系統性漏洞**：
本週多個 EV 充電站 OCPP 後端與管理平台被揭露存在漏洞：
- ePower (epowerie)
- Everon OCPP Backends
- Mobiliti-e (mobihu)
- 這延續了前幾週 EV 充電基礎設施漏洞揭露的趨勢（CloudCharge、EV Energy、EV2Go、Mobility46、Switch EV）

### 2.2.4 其他重要漏洞動態

**CrushFTP 暴力掃描**（2026-03-03，SANS ISC）：
- 針對 CrushFTP 的主動暴力掃描活動被偵測
- 涉及三個已知嚴重漏洞：CVE-2024-4040（RCE）、CVE-2025-31161（認證繞過）、CVE-2025-54309（零日）
- 攻擊者正探測易受攻擊的部署

**軟體更新公告**：
- Docker Desktop — CERT-FR 2026-AVI-0230
- Google Android 2026 年 3 月安全更新 — CERT-FR/CERT-RO
- Microsoft 安全更新 — CERT-FR 2026-AVI-0232
- Wireshark 4.6.4

---

## 2.3 活躍利用與 PoC 動態

### 2.3.1 活躍利用中的漏洞

本週確認正被活躍利用的漏洞：

| CVE | 產品/元件 | 類型 | CVSS | 行為者 |
|-----|----------|------|------|--------|
| CVE-2026-21513 | Windows MSHTML | 安全功能繞過 | 8.8 | APT28 (俄羅斯) |
| CVE-2026-21385 | Qualcomm 晶片組 | 記憶體損壞 | — | 未公開 |
| CVE-2026-22719 | VMware Aria Operations | 命令注入 | — | 未公開 |
| — | Cisco Catalyst SD-WAN | 零日 | Critical | 未公開 |
| CVE-2021-22681 | Rockwell Automation | — | — | — |
| CVE-2021-30952 | Apple WebKit | — | — | — |
| CVE-2023-41974 | Apple | — | — | — |
| CVE-2023-43000 | — | — | — | — |

### 2.3.2 新增 PoC 公開

本週有 7 項新增 PoC 公開：

| CVE | 產品/描述 |
|-----|----------|
| CVE-2026-20079 | — |
| CVE-2026-27636 | — |
| CVE-2026-28289 | — |
| CVE-2026-29000 | — |
| CVE-2026-29781 | — |
| CVE-2026-29786 | — |
| CVE-2026-3224 | — |

PoC 的公開意味著這些漏洞可能在短期內被更廣泛地利用。防禦方應優先評估這些漏洞是否影響其環境。

### 2.3.3 Exploit-DB 新增利用程式

Exploit-DB 本週更新了多個利用程式，涵蓋：
- WordPress Backup Migration 1.3.7 RCE
- Pluck 4.7.7-dev2 PHP 程式碼執行
- Boss Mini 1.4.0 本地檔案包含 (LFI)
- D-Link DIR-825 堆疊緩衝區溢出
- MotionEye 0.43 RCE
- Siklu EtherHaul EH-8010 RCE
- WeGIA 3.5.0 SQL 注入
- Mailcow 2025-01a 主機標頭中毒
- Windows 10 欺騙

---

## 2.4 攻擊手法歸納（ATT&CK TTP 標註）

### 2.4.1 初始存取 (Initial Access)

| TTP | MITRE ID | 本週案例 |
|-----|----------|----------|
| **Phishing: Spearphishing Attachment** | T1566.001 | UAC-0252 投遞 SHADOWSNIFF/SALATSTEALER；SloppyLemming 惡意 PDF/Excel；BadPaw/MeowMeow 邊境通行許可誘餌 |
| **Phishing: Spearphishing Link** | T1566.002 | RedAlert 惡意 App 釣魚；EV 簽署惡意軟體工作場所會議誘餌 |
| **Supply Chain Compromise** | T1195.002 | QuickLens Chrome 擴充功能 v5.8 供應鏈攻擊 |
| **Exploit Public-Facing Application** | T1190 | Cisco SD-WAN 零日利用；CrushFTP 暴力掃描；CVE-2026-21513 MSHTML 利用 |
| **Drive-by Compromise** | T1189 | ClickFix 攻擊技術（QuickLens、其他活動） |

### 2.4.2 執行 (Execution)

| TTP | MITRE ID | 本週案例 |
|-----|----------|----------|
| **User Execution: Malicious File** | T1204.002 | SPLITDROP dropper、BadPaw loader、DPAX 檔案觸發 Delta Electronics 漏洞 |
| **Command and Scripting Interpreter** | T1059 | XWorm 多技術投遞；Havoc C2 框架部署 |
| **Exploitation for Client Execution** | T1203 | CVE-2026-21513 MSHTML 利用；CVE-2026-0628 Chrome Gemini 漏洞 |

### 2.4.3 持久性 (Persistence)

| TTP | MITRE ID | 本週案例 |
|-----|----------|----------|
| **Browser Extensions** | T1176 | QuickLens 惡意擴充；CVE-2026-0628 Gemini 面板劫持 |
| **Remote Access Software** | T1219 | EV 簽署惡意軟體安裝 RMM 工具 |
| **Registry Run Keys** | T1547.001 | Havoc C2 registry-based fallback C2 配置 |

### 2.4.4 防禦規避 (Defense Evasion)

| TTP | MITRE ID | 本週案例 |
|-----|----------|----------|
| **Code Signing** | T1553.002 | EV 憑證簽署惡意軟體（TrustConnect Software PTY LTD） |
| **Indirect System Calls** | T1106 | 修改版 Havoc C2 使用 indirect syscalls 規避 EDR |
| **Masquerading** | T1036 | RedAlert App 偽裝；工作場所會議 App 偽裝 |
| **Impair Defenses** | T1562 | CVE-2026-21513 MSHTML 安全功能繞過 |

### 2.4.5 影響 (Impact)

| TTP | MITRE ID | 本週案例 |
|-----|----------|----------|
| **Network Denial of Service** | T1498 | 149 次駭客主義 DDoS（Keymous+、DieNet、NoName057(16)） |
| **Network Service Shutdown** | T1489 | 伊朗國家級網路封鎖（4% 連線率） |
| **Data Destruction** | T1485 | 伊朗國家行為者使用 data wipers |

### 2.4.6 本週攻擊手法趨勢總結

1. **社交工程精密化**：從傳統釣魚郵件升級至武器化合法應用程式（RedAlert）、EV 憑證簽署惡意軟體、以及修改版 C2 框架（Havoc）。攻擊者越來越善於利用信任機制。

2. **國家級行為者戰術犯罪化**：伊朗國家行為者採用勒索軟體和網路犯罪 TTPs 作為破壞性攻擊的掩護，這一趨勢模糊了國家行為者與犯罪組織之間的界線。

3. **AI 整合帶來新攻擊面**：CVE-2026-0628 展示了瀏覽器 AI 功能（Chrome Gemini）如何成為攻擊者的新樞紐點，允許存取本機檔案系統。

4. **供應鏈攻擊持續**：QuickLens 擴充功能供應鏈入侵影響 7,000 用戶，展現瀏覽器擴充功能生態系統的脆弱性。

---

## 2.5 新興威脅識別

### 2.5.1 IP 攝影機作為動能戰爭的網路前哨站

**信心水準：高**

Check Point Research 的發現開創了一個重要的威脅範式：IP 攝影機入侵不僅是傳統的網路間諜活動，更是與動能軍事行動直接整合的作戰支援工具。攝影機攻擊活動與飛彈攻擊之間的時間關聯性表明，攝影機入侵活動的激增可作為即將發生動能行動的早期預警指標。這對擁有公開暴露 IP 攝影機的國家和組織具有直接的防禦意涵：攝影機安全不再僅是隱私問題，而是國家安全問題。

### 2.5.2 AI 瀏覽器整合的安全風險

**信心水準：高**

CVE-2026-0628 揭示的 Chrome Gemini 漏洞標誌著一個新興威脅類別的出現。隨著主要瀏覽器快速整合 AI 助手功能（agentic AI），每個 AI 功能節點都可能成為新的攻擊面。被入侵的 AI 面板可作為存取敏感本機資料的樞紐點。此威脅將隨著 AI 瀏覽器功能的普及而擴大。

### 2.5.3 區塊鏈白名單作為攻擊向量

**信心水準：高**

Check Point Research 揭示的「白名單幻覺」(Whitelist Illusion) 展示了一個反直覺的安全問題：區塊鏈白名單（原本是安全措施）反而成為國家級駭客團體的攻擊路線圖。Bybit ($1.5B)、WazirX ($235M)、Radiant ($53M) 的案例表明，靜態存取控制在面對高階持久性威脅時是不足的。這對所有使用白名單機制的加密貨幣交易所和 DeFi 協議構成警告。

### 2.5.4 PhaaS/AiTM 平台的規模化與韌性

**信心水準：中**

儘管 Tycoon 2FA 被查封，但 Phishing-as-a-Service (PhaaS) 和 Adversary-in-the-Middle (AiTM) 攻擊平台的商業模式已被驗證成功。該平台能夠攔截即時認證會話並繞過 MFA，表明 MFA 不再是足夠的帳戶保護措施。預計替代平台將迅速填補市場空缺。

### 2.5.5 勒索軟體生態系統的結構性轉變

**信心水準：高**

**Qdrant 跨 Layer 關聯分析**：查詢「ransomware payment trend 2025 2026」返回 10 筆結果（最高相似度 0.6099），關聯到加拿大 CERT 的「Ransomware Threat Outlook 2025-2027」報告及其配套的「Ransomware Playbook」。結合本週 Chainalysis 報告的數據，勒索軟體生態系統正經歷雙重結構性轉變：

1. **付款意願下降**：Chainalysis 2026 報告顯示，儘管攻擊數量上升 50%，總付款金額卻下降 8% 至 $820M。中位數付款金額暴增 368% 至 ~$60,000，表明成功收款案例減少但單筆金額增加。

2. **犯罪信譽崩潰**：ShinyHunters 打破勒索軟體的「榮譽守則」——收取贖金後仍出售被盜資料。這根本性地改變了受害組織的風險計算：付款不再提供任何資料保護保證。

3. **基礎設施共享與聚合**：犯罪組織與國家行為者共享防彈主機和代理網路，執法機構轉向打擊基礎設施服務層（如主機商、惡意軟體載入工具）而非個別勒索團體。

4. **IAB 活動作為前兆指標**：鏈上分析顯示，Initial Access Broker (IAB) 資金流入激增通常比勒索軟體付款和受害者洩漏早約 30 天，可作為早期預警信號。

### 2.5.6 OpenAI 惡意 AI 使用報告

**信心水準：高**

OpenAI 發布的威脅報告（2026-03-02）記錄了威脅行為者如何將 AI 模型與傳統工具結合，用於影響力操作、浪漫詐騙和網路攻擊。值得注意的是，中國影響力操作者在不同作業階段使用多個 AI 模型，威脅活動很少局限於單一平台。這表明 AI 增強的威脅活動已從概念驗證階段進入實際作業階段。

---

## 2.6 威脅饋送摘要

### 2.6.1 ThreatFox IoC 指標

本週 ThreatFox 貢獻約 1,956 筆威脅指標，主要包括：

- **ClearFake 惡意程式網域**：大量與 ClearFake 活動相關的惡意網域和 IP 位址
- **IP 位址集群**：觀察到多個 /24 網段被系統性利用：
  - 103.39.16.0/24（port 3093）
  - 103.41.7.0/24（port 3093）
  - 156.234.21.0/24（port 3093）
  - 這些集群化的 IoC 模式表明威脅行為者使用專用基礎設施

### 2.6.2 MalwareBazaar 與 URLhaus

- MalwareBazaar 持續接收新的惡意樣本提交
- URLhaus 追蹤活躍的惡意 URL 分發

### 2.6.3 漏洞追蹤

本週新增 144 筆漏洞追蹤記錄，主要來源：
- GitHub Security Advisories（OpenClaw 多個漏洞）
- 加拿大 CERT
- 荷蘭 NCSC
- 香港 CERT (GovCERT.HK)

---

## 2.7 資料限制與免責聲明

### 資料來源限制

1. **語言偏差**：部分來源為非英語（斯洛伐克、芬蘭、烏克蘭、羅馬尼亞等），原始內容可能在翻譯過程中損失技術細節。SK-CERT 的 Cisco SD-WAN 零日警告即為一例——因原始語言為斯洛伐克語且 RSS 描述截斷，缺少 CVE 編號和完整技術細節。

2. **時效性差異**：部分公告的確切發布日期無法從 RSS 饋送中確認（特別是 SK-CERT、CERT-RO 等），日期以萃取日期代替，實際揭露日期可能更早。

3. **歸因信心**：APT 歸因依賴多家安全廠商的獨立分析。Dust Specter 對伊朗的歸因為「中-高信心」，BadPaw/MeowMeow 對俄羅斯的歸因為「疑似」。歸因評估可能隨新情報更新。

4. **漏洞完整性**：CISA 新增的 5 個 KEV（2026-03-05）的具體 CVE 資訊在本報告撰寫時尚未完全從 RSS 饋送中取得。Cisco SD-WAN 零日尚未分配公開 CVE 編號。

5. **威脅饋送覆蓋率**：ThreatFox/MalwareBazaar/URLhaus 的 IoC 代表已知提交，不代表完整的威脅面。實際惡意基礎設施規模可能遠大於觀測值。

6. **駭客主義活動統計**：DDoS 攻擊次數（149 次）基於攻擊團體的公開聲明，實際成功攻擊次數和影響可能不同。駭客主義者傾向於誇大其攻擊成效。

### 免責聲明

本報告基於公開來源情報 (OSINT) 編撰，旨在提供資安態勢感知，不構成具體的安全建議。各組織應結合自身風險概況和業務環境，評估報告中識別的威脅與漏洞的相關性。報告中的 APT 歸因反映情報社群的評估，可能隨時間更新。建議讀者參考原始來源以獲取最新資訊和技術細節。

---

## 附錄 A：Qdrant 語意查詢結果摘要

| # | 查詢 | 結果筆數 | 最高相似度 | 主要發現 |
|---|------|----------|-----------|----------|
| 1 | "Iran cyber attack retaliation Middle East" | 10 | 0.5158 | 關聯 2025-07 加拿大 CERT 伊朗威脅公告、2025-12 NUKIB 親俄駭客主義者警告 |
| 2 | "Cisco SD-WAN zero day exploitation" | 10 | 0.6711 | 發現 CVE-2026-20127 加拿大 CERT 警告、多個 SD-WAN Manager CVE、NCSC-NL 公告 |
| 3 | "ransomware payment trend 2025 2026" | 10 | 0.6099 | 關聯加拿大 CERT 勒索軟體展望 2025-2027、勒索軟體 Playbook、歷史勒索事件 |

## 附錄 B：本週資料來源統計

| Layer | 來源 | 本週新增 |
|-------|------|----------|
| security_news_facts | NCSC-FI, CERT-UA, CISA, SANS ISC, CERT-FR, SK-CERT, CERT-RO 等 | 61 |
| exploit_intelligence | NVD, Exploit-DB, PoC-in-GitHub | 11 |
| threat_feeds | ThreatFox, MalwareBazaar, URLhaus | ~1,956 |
| vulnerability_tracking | GHSA, 加拿大 CERT, NCSC-NL, GovCERT.HK | 144 |

---

*報告產出時間：2026-03-06 | 分析員：自動化威脅情報分析系統 | 下次更新：2026-W11*
