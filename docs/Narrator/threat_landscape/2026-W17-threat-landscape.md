---
layout: seo-report
last_modified_at: 2026-04-26T10:00:00+08:00
title: 2026 第 17 週威脅態勢分析
description: "2026-04-20 至 2026-04-26 資安威脅週報：CISA KEV 新增 14 筆活躍利用漏洞含 D-Link/Samsung/SimpleHelp Critical 等級、FIRESTARTER APT 後門鎖定 Cisco Firepower 設備、Axios npm 供應鏈攻擊、CEO Fraud/BEC 攻擊行動、ClearFake 大規模 payload delivery 活動（385 筆 IoC）、StrelaStealer/Vidar 資訊竊取程式持續活躍、本週 1,523 筆新增漏洞與 708 筆威脅情報饋送。"
parent: 威脅態勢分析
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-threat-landscape.png
author: 資安情報分析團隊
date: 2026-04-26
---

# 威脅態勢分析 — 2026 第 17 週

> 涵蓋期間：2026-04-20 至 2026-04-26
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-04-26
> 分析模型：Claude Opus

---

## 執行摘要

本週威脅態勢以**網路設備 APT 後門攻擊、npm 供應鏈攻擊、以及 ClearFake 大規模 payload delivery 活動**為三大主軸。CISA KEV 單週新增 14 筆活躍利用漏洞為近期最高量，凸顯攻擊者持續瞄準老舊漏洞與新興平台的雙軌利用策略。惡意程式活動方面，ClearFake 以 385 筆 IoC 主導本週威脅情報饋送，資訊竊取程式（StrelaStealer、Vidar）維持穩定活躍。

**進階持續威脅（APT）與網路設備攻擊**：
- **FIRESTARTER APT 後門鎖定 Cisco Firepower 設備**（2026-04-22）：高度精密的後門程式專門針對 Cisco Firepower 防火牆設備，利用設備韌體層級存取實現長期潛伏，延續近期 Cisco 設備成為 APT 首要目標的趨勢
- **Cisco Catalyst SD-WAN 三筆漏洞同時進入 KEV**（CVE-2026-20122/20133/20128）：Cisco 軟體定義廣域網路管理平台同時曝出特權 API 利用、敏感資訊洩露、密碼可復原格式儲存三項高嚴重度漏洞，攻擊面涵蓋管理平面全層級

**供應鏈攻擊持續升級**：
- **Axios npm 套件供應鏈攻擊**（2026-04-23）：廣泛使用的 HTTP 客戶端函式庫 Axios 遭供應鏈攻擊，影響範圍涵蓋前後端生態系統，npm 週下載量超過 4,500 萬次
- **CEO Fraud/BEC 攻擊行動**（2026-04-21）：多起商務電子郵件詐騙事件鎖定企業高階主管，結合社交工程與內部流程漏洞

**關鍵漏洞態勢**：
- 本週新增 1,523 筆漏洞追蹤，其中 Critical/High 達 452 筆（29.7%），Medium 569 筆，Low/Info 502 筆
- CISA KEV 新增 14 筆活躍利用漏洞：含 3 筆 Critical（D-Link CVE-2025-29635、Samsung CVE-2024-7399、Marimo CVE-2026-39987）與 11 筆 High
- 老舊漏洞回溯利用趨勢明顯：CVE-2023-27351（PaperCut）、CVE-2024-27199（JetBrains TeamCity）、CVE-2024-57728/57726（SimpleHelp）均為 2023-2024 年揭露的漏洞本週才被確認遭活躍利用

**威脅情報饋送**：
- 本週新增 708 筆威脅情報，含 IoC 指標 544 筆、惡意 URL 117 筆、C2 基礎設施 47 筆
- ClearFake 以 385 筆 IoC 佔總量 54.4%，為本週最活躍惡意程式活動
- 資訊竊取程式（StrelaStealer 89 筆、Vidar 38 筆）持續對企業憑證安全構成威脅

**資料規模**：本週攻擊事件 6 件、漏洞揭露 51 份、政策法規 2 項、產業趨勢 4 項，合計安全新聞事實 69 筆。

---

## 資料來源統計

| Layer | 本週新增/更新 | 說明 |
|-------|-------------|------|
| security_news_facts | 69 筆 | attack_incident 6 件（FIRESTARTER APT、Axios 供應鏈、BEC）、vulnerability_disclosure 51 份、policy_regulation 2、industry_trend 4、other 6 |
| vulnerability_tracking | 1,523 筆 | critical_high 452、medium 569、low_info 502 |
| exploit_intelligence | 40 筆 | CISA KEV 14 筆活躍利用 + Exploit-DB 26 個 PoC |
| threat_feeds | 708 筆 | ioc_indicator 544、malicious_url 117、c2_infrastructure 47 |

> 統計時間：2026-04-26 UTC

---

## 2.1 近期重大資安事件

本週資安事件聚焦於 APT 組織鎖定網路安全設備、npm 生態系統供應鏈攻擊、以及商務電子郵件詐騙。以下按嚴重程度排序。

### 1. FIRESTARTER APT 後門鎖定 Cisco Firepower 設備

**嚴重程度：極高 | 來源：多家威脅情報機構、資安媒體 | 日期：2026-04-22**

一個被命名為 FIRESTARTER 的高度精密後門程式被揭露專門針對 Cisco Firepower 防火牆/入侵防禦系統（IPS）設備：

- **攻擊手法**：攻擊者利用 Cisco Firepower 設備的管理介面漏洞取得初始存取 [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref }，隨後在設備韌體層級植入持久性後門 [T1542.001](https://attack.mitre.org/techniques/T1542/001/){: .ttp-ref }，實現重啟與韌體更新後的存活能力
- **C2 通訊**：後門採用加密 DNS 通道進行命令控制通訊 [T1071.004](https://attack.mitre.org/techniques/T1071/004/){: .ttp-ref }，流量偽裝為合法 DNS 查詢，難以被傳統網路監控偵測 [T1573.002](https://attack.mitre.org/techniques/T1573/002/){: .ttp-ref }
- **戰略意義**：Cisco Firepower 為全球企業與政府機構廣泛部署的邊界安全設備，入侵防火牆等同於直接控制組織的安全邊界，可對所有進出流量進行監控、修改或放行
- **趨勢升級**：延續 2026-W13 Cisco FMC CVE-2026-20131 勒索軟體利用事件，Cisco 安全設備已連續數週成為高價值攻擊目標

**Qdrant 跨層關聯**：語意查詢「active exploitation critical vulnerability 2026」發現 Cisco 設備在 2026 年已累積多起被活躍利用的紀錄——Ivanti EPMM CVE-2026-1281/1340（被 APT 利用）、BeyondTrust CVE-2026-1731、Cisco CVE-2026-20045。安全設備本身成為攻擊者的首要目標，形成「守門人淪陷」的系統性風險。

**防禦建議**：立即檢查 Cisco Firepower 設備管理介面是否暴露於網際網路、啟用設備完整性驗證機制、審計管理存取日誌異常、考慮實施頻外（out-of-band）管理網路。

### 2. Axios npm 套件供應鏈攻擊

**嚴重程度：極高 | 來源：npm 安全公告、資安媒體 | 日期：2026-04-23**

廣泛使用的 JavaScript HTTP 客戶端函式庫 Axios 遭供應鏈攻擊，攻擊者在套件中植入惡意程式碼：

- **影響範圍**：Axios 為最受歡迎的 npm HTTP 客戶端之一，npm 週下載量超過 4,500 萬次，廣泛用於前端（React/Vue/Angular）與後端（Node.js）專案 [T1195.002](https://attack.mitre.org/techniques/T1195/002/){: .ttp-ref }
- **攻擊手法**：植入的惡意程式碼在 HTTP 請求過程中攔截與外傳敏感資料（API 金鑰、認證令牌、Cookie） [T1557](https://attack.mitre.org/techniques/T1557/){: .ttp-ref } → [T1041](https://attack.mitre.org/techniques/T1041/){: .ttp-ref }
- **偵測困難**：惡意程式碼被精心混淆並嵌入合法功能中，靜態分析難以發現 [T1027](https://attack.mitre.org/techniques/T1027/){: .ttp-ref }
- **供應鏈效應**：依賴 Axios 的數千個套件形成傳遞性供應鏈風險，實際影響範圍遠超直接使用者

**Qdrant 跨層關聯**：語意查詢「supply chain APT advanced persistent threat 2026」發現供應鏈攻擊手法的持續演化——APT-C-60 利用合法服務、CrowdStrike 2025 策略分析報告指出供應鏈攻擊已成為 APT 組織的標準作業程序。Axios 事件進一步確認高影響力 npm 套件是攻擊者的優先目標。

**防禦建議**：立即檢查專案中 Axios 版本、啟用 npm audit 與 lockfile 完整性檢查、實施套件簽章驗證、考慮採用 Socket.dev 等供應鏈安全工具進行即時監控。

### 3. CEO Fraud / BEC 攻擊行動

**嚴重程度：高 | 來源：多家 CERT 與資安媒體 | 日期：2026-04-21**

本週觀測到多起商務電子郵件詐騙（Business Email Compromise, BEC）事件，攻擊者冒充企業高階主管發出緊急匯款指令：

- **手法**：結合公開資訊蒐集 [T1598](https://attack.mitre.org/techniques/T1598/){: .ttp-ref } 與社交工程 [T1566.001](https://attack.mitre.org/techniques/T1566/001/){: .ttp-ref }，精準模擬 CEO 的通訊風格與決策模式
- **技術進化**：部分案例利用深偽語音合成模擬高階主管的聲音進行電話確認，增加詐騙可信度
- **財務損失**：BEC 持續為全球財務損失最高的網路犯罪類型，FBI IC3 報告 2025 年 BEC 損失超過 28 億美元
- **趨勢**：AI 輔助的 BEC 攻擊正在降低攻擊門檻，使語言與文化障礙不再是跨國 BEC 的阻礙

**防禦建議**：實施匯款雙重授權機制、建立帶外（out-of-band）驗證流程、對財務人員進行 BEC 防範訓練。

### 4. Microsoft Defender 存取控制漏洞遭利用

**嚴重程度：高 | 來源：CISA KEV、Microsoft | 日期：2026-04-24**

CVE-2026-33825 影響 Microsoft Defender，已被 CISA 確認遭活躍利用並加入 KEV 目錄：

- **漏洞類型**：存取控制繞過，允許攻擊者規避 Defender 的安全防護機制 [T1562.001](https://attack.mitre.org/techniques/T1562/001/){: .ttp-ref }
- **攻擊意義**：停用或繞過端點安全防護是攻擊鏈中的關鍵步驟，使後續惡意程式載荷得以在不被偵測的情況下執行
- **影響範圍**：Microsoft Defender 為 Windows 預設安全解決方案，全球部署量極大

### 5. Marimo Remote Code Execution 遭活躍利用

**嚴重程度：Critical | 來源：CISA KEV | 日期：2026-04-25**

CVE-2026-39987 影響 Marimo（Python 互動式筆記本平台），被確認遭遠端程式碼執行攻擊：

- **漏洞類型**：未授權遠端程式碼執行（RCE），攻擊者可在未認證情況下執行任意 Python 程式碼 [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref }
- **目標群體**：Marimo 使用者多為資料科學家與 AI/ML 研究人員，開發環境通常存放高價值資料集與模型憑證
- **趨勢**：繼 W13 Langflow AI 平台遭 20 小時武器化後，AI/ML 開發工具持續成為攻擊者的新興目標

### 6. Samsung MagicINFO 9 Server 路徑遍歷遭利用

**嚴重程度：Critical | 來源：CISA KEV | 日期：2026-04-22**

CVE-2024-7399 影響 Samsung MagicINFO 9 Server（企業數位看板管理平台），遭活躍利用：

- **漏洞類型**：路徑遍歷（Path Traversal），可導致任意檔案讀取與潛在的 RCE [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref }
- **部署場景**：Samsung MagicINFO 廣泛部署於零售、醫療、教育、交通等場所的數位看板系統
- **老舊漏洞利用**：此為 2024 年 7 月揭露的漏洞，時隔近兩年才被確認遭活躍利用，反映攻擊者系統性回溯利用未修補漏洞

---

## 2.2 漏洞趨勢分析

### 本週漏洞總覽

| 指標 | 數值 | 與上週比較 |
|------|------|-----------|
| 漏洞追蹤總數 | 1,523 | 大幅增加 |
| Critical/High CVE | 452 | 29.7% |
| Medium CVE | 569 | 37.4% |
| Low/Info CVE | 502 | 33.0% |
| CISA KEV 新增 | 14 | ↑↑（W13: 7+） |
| 漏洞揭露公告 | 51 | 穩定 |

> 本週漏洞追蹤總數達 1,523 筆，Critical/High 佔比接近三成，顯示高嚴重度漏洞佔比維持在偏高水位。

### CISA KEV 新增活躍利用漏洞

本週 CISA 新增 14 筆活躍利用漏洞，為近期單週最高量。值得注意的是，其中多筆為 2023-2025 年揭露的老舊漏洞。

| CVE | 產品 | 嚴重程度 | 類型 | 特殊標記 |
|-----|------|----------|------|----------|
| CVE-2025-29635 | D-Link DIR-823X | Critical | Command Injection | 消費者路由器 |
| CVE-2024-7399 | Samsung MagicINFO 9 Server | Critical | Path Traversal | 2024 年漏洞回溯利用 |
| CVE-2026-39987 | Marimo | Critical | RCE | AI/ML 工具平台 |
| CVE-2026-33825 | Microsoft Defender | High | Access Control Bypass | 安全防護繞過 |
| CVE-2026-20122 | Cisco Catalyst SD-WAN Manager | High | Privileged API Exploitation | 管理平面攻擊 |
| CVE-2026-20133 | Cisco Catalyst SD-WAN | High | Information Exposure | 敏感資訊洩露 |
| CVE-2026-20128 | Cisco Catalyst SD-WAN | High | Password in Recoverable Format | 憑證安全缺陷 |
| CVE-2024-57728 | SimpleHelp | Critical | Path Traversal | 2024 年漏洞回溯利用 |
| CVE-2024-57726 | SimpleHelp | Critical | Missing Authorization | 2024 年漏洞回溯利用 |
| CVE-2024-27199 | JetBrains TeamCity | High | Path Traversal | 2024 年漏洞回溯利用 |
| CVE-2025-2749 | Kentico Xperience | High | Path Traversal | CMS 平台 |
| CVE-2023-27351 | PaperCut NG/MF | High | Authentication Bypass | **2023 年漏洞回溯利用** |
| CVE-2025-48700 | Zimbra | High | XSS | 企業郵件系統 |
| CVE-2025-32975 | Quest KACE SMA | High | Authentication Bypass | IT 資產管理 |

### 老舊漏洞回溯利用分析

本週 KEV 新增中，**5 筆（35.7%）為 2023-2024 年揭露的漏洞**，反映以下趨勢：

| CVE 年份 | 漏洞 | 揭露距今 | 可能延遲原因 |
|----------|------|----------|-------------|
| 2023 | CVE-2023-27351 (PaperCut) | ~3 年 | 列印管理系統修補緩慢，暴露面持續存在 |
| 2024 | CVE-2024-27199 (TeamCity) | ~2 年 | CI/CD 伺服器更新需協調開發流程 |
| 2024 | CVE-2024-57728 (SimpleHelp) | ~1.5 年 | 遠端支援工具常被忽視 |
| 2024 | CVE-2024-57726 (SimpleHelp) | ~1.5 年 | 同上 |
| 2024 | CVE-2024-7399 (Samsung MagicINFO) | ~2 年 | 數位看板系統修補優先度低 |

**趨勢判斷**：攻擊者正系統性掃描已知漏洞的未修補實例。組織即使無法追蹤最新零日漏洞，也必須確保已揭露漏洞的修補到位。

### 按嚴重程度分布

| 嚴重程度 | 數量 | 佔比 |
|----------|------|------|
| Critical | ~90 | 5.9% |
| High | ~362 | 23.8% |
| Medium | 569 | 37.4% |
| Low / Info | 502 | 33.0% |

### 按產品類型分布（KEV 分析）

| 產品類型 | KEV 數量 | 說明 |
|----------|---------|------|
| 網路設備/安全設備 | 4 | Cisco SD-WAN (3) + D-Link (1) |
| 企業應用/伺服器 | 5 | SimpleHelp (2) + TeamCity + PaperCut + Samsung MagicINFO |
| 開發/AI 工具 | 2 | Marimo + Kentico Xperience |
| 端點安全 | 1 | Microsoft Defender |
| 企業通訊/協作 | 2 | Zimbra + Quest KACE SMA |

---

## 2.3 活躍利用與 PoC 動態

### CISA KEV 活躍利用漏洞分析

本週 CISA 新增 14 筆 KEV 為近期單週最高量，其中 Cisco 產品佔 3 筆（21.4%），延續 Cisco 設備持續遭攻擊的趨勢。SimpleHelp 同時有兩筆漏洞被確認利用（路徑遍歷 + 缺少授權），暗示攻擊者可能已建立攻擊鏈。

| CVE | 利用現狀 | 風險評估 |
|-----|----------|----------|
| CVE-2025-29635 (D-Link) | 大規模掃描利用 | 極高——消費者路由器修補率低 |
| CVE-2024-7399 (Samsung MagicINFO) | 針對性利用 | 高——數位看板系統修補緩慢 |
| CVE-2026-39987 (Marimo) | 快速武器化 | 高——AI/ML 開發環境高價值 |
| CVE-2026-20122/20133/20128 (Cisco SD-WAN) | 已確認利用 | 極高——管理平面三合一攻擊面 |
| CVE-2024-57728/57726 (SimpleHelp) | 攻擊鏈利用 | 極高——遠端支援工具=完全存取 |
| CVE-2024-27199 (JetBrains TeamCity) | 持續利用 | 高——CI/CD 伺服器含建置祕密 |
| CVE-2023-27351 (PaperCut) | 回溯利用 | 中高——列印管理系統 |

### 新公開 PoC / Exploit 彙整（Exploit-DB 26 筆）

本週 Exploit-DB 新增 26 個 PoC，涵蓋多個產品類型：

| 目標產品/技術 | PoC 類型 | 風險評估 |
|--------------|----------|----------|
| Throttlestop Kernel Driver | 本地提權 (LPE) | 高——核心驅動程式漏洞可提升至 SYSTEM |
| WordPress 多個外掛 | RCE / SQLi / Auth Bypass | 高——WordPress 生態系統廣泛部署 |
| React Server | RCE | 高——前端框架伺服器端渲染漏洞 |
| 7-Zip | 任意程式碼執行 | 中——需使用者互動（開啟惡意檔案） |
| SQLite | 記憶體損壞 | 中高——嵌入式資料庫廣泛使用 |

### WordPress 外掛安全專題

本週 PoC 中 WordPress 外掛佔多筆，反映 WordPress 生態系統持續面臨的安全挑戰：

- **攻擊面**：WordPress 佔全球網站 43%+，第三方外掛品質參差不齊
- **利用趨勢**：攻擊者持續自動化掃描已知 WordPress 外掛漏洞
- **防禦建議**：實施 WordPress 外掛白名單策略、啟用自動更新、部署 Web Application Firewall（WAF）規則

### 與漏洞追蹤層交叉關聯

| CVE | vulnerability_tracking | exploit_intelligence | 雙層交叉確認 |
|-----|----------------------|---------------------|-------------|
| CVE-2025-29635 (D-Link) | Critical | KEV | 確認 |
| CVE-2024-7399 (Samsung) | Critical | KEV | 確認 |
| CVE-2026-39987 (Marimo) | Critical | KEV | 確認 |
| CVE-2026-20122 (Cisco SD-WAN) | High | KEV | 確認 |
| CVE-2024-57728 (SimpleHelp) | Critical | KEV | 確認 |
| CVE-2024-27199 (TeamCity) | High | KEV + 歷史 PoC | 確認 |

---

## 2.4 攻擊手法歸納

### MITRE ATT&CK TTP 本週觀測統計

本週觀測到的攻擊技術涵蓋 ATT&CK 框架多個戰術階段，公開應用漏洞利用（T1190）與供應鏈攻擊（T1195）為最頻繁出現的初始存取向量：

| 戰術階段 | TTP ID 與技術名稱 | 關聯事件 |
|----------|-------------------|----------|
| **偵察** | [T1598](https://attack.mitre.org/techniques/T1598/){: .ttp-ref } Phishing for Information | CEO Fraud/BEC 前期偵察 |
| **初始存取** | [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } Exploit Public-Facing Application | FIRESTARTER 鎖定 Cisco Firepower、D-Link、Samsung MagicINFO、Marimo、SimpleHelp、TeamCity、Cisco SD-WAN |
| | [T1195.002](https://attack.mitre.org/techniques/T1195/002/){: .ttp-ref } Supply Chain Compromise: Software | Axios npm 供應鏈攻擊 |
| | [T1566.001](https://attack.mitre.org/techniques/T1566/001/){: .ttp-ref } Spearphishing Attachment | CEO Fraud/BEC 攻擊 |
| | [T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref } Spearphishing Link | ClearFake payload delivery |
| **執行** | [T1059.007](https://attack.mitre.org/techniques/T1059/007/){: .ttp-ref } JavaScript | Axios 惡意 JavaScript 載荷、ClearFake 注入腳本 |
| | [T1204.001](https://attack.mitre.org/techniques/T1204/001/){: .ttp-ref } User Execution: Malicious Link | ClearFake 引誘使用者點擊偽造更新 |
| **持久性** | [T1542.001](https://attack.mitre.org/techniques/T1542/001/){: .ttp-ref } Pre-OS Boot: System Firmware | FIRESTARTER 韌體層級後門 |
| **防禦規避** | [T1562.001](https://attack.mitre.org/techniques/T1562/001/){: .ttp-ref } Impair Defenses: Disable or Modify Tools | CVE-2026-33825 Microsoft Defender 存取控制繞過 |
| | [T1027](https://attack.mitre.org/techniques/T1027/){: .ttp-ref } Obfuscated Files or Information | Axios 惡意程式碼混淆 |
| **憑證存取** | [T1003](https://attack.mitre.org/techniques/T1003/){: .ttp-ref } OS Credential Dumping | StrelaStealer、Vidar 資訊竊取 |
| | [T1555](https://attack.mitre.org/techniques/T1555/){: .ttp-ref } Credentials from Password Stores | Vidar 瀏覽器憑證竊取 |
| **命令與控制** | [T1071.004](https://attack.mitre.org/techniques/T1071/004/){: .ttp-ref } Application Layer Protocol: DNS | FIRESTARTER DNS 隧道 C2 |
| | [T1573.002](https://attack.mitre.org/techniques/T1573/002/){: .ttp-ref } Encrypted Channel: Asymmetric Cryptography | FIRESTARTER 加密通訊 |
| | [T1071.001](https://attack.mitre.org/techniques/T1071/001/){: .ttp-ref } Application Layer Protocol: Web Protocols | ClearFake C2、Nanocore RAT |
| **滲漏** | [T1041](https://attack.mitre.org/techniques/T1041/){: .ttp-ref } Exfiltration Over C2 Channel | Axios 資料外傳、StrelaStealer |
| | [T1557](https://attack.mitre.org/techniques/T1557/){: .ttp-ref } Adversary-in-the-Middle | Axios HTTP 請求攔截 |

### 攻擊手法分類與趨勢比較

| 攻擊類型 | W17 事件數 | W13 事件數 | 趨勢 | 分析 |
|----------|-----------|-----------|------|------|
| 公開應用漏洞利用 | 14+ | 5+ | ↑↑↑ | KEV 單週 14 筆為歷史高點 |
| 供應鏈攻擊 | 1 | 3 | ↓ | 量減但 Axios 影響範圍極大 |
| APT/後門 | 1 | 2 | ↓ | FIRESTARTER 精密度高 |
| BEC/CEO Fraud | 1 | 0 | ↑ | AI 輔助提升攻擊可信度 |
| 資訊竊取程式 | 3+ | 1 | ↑↑ | ClearFake + StrelaStealer + Vidar |
| 安全防護繞過 | 1 | 0 | ↑ | Microsoft Defender 遭繞過 |

### IoC 趨勢（L4 威脅情報饋送）

本週 708 筆新增威脅情報饋送的分布分析：

| IoC 類型 | 數量 | 佔比 | 主要關聯惡意程式家族 |
|----------|------|------|---------------------|
| IoC 指標 | 544 | 76.8% | ClearFake (385)、StrelaStealer (89)、Vidar (38) |
| 惡意 URL | 117 | 16.5% | ClearFake payload delivery、釣魚登入頁面 |
| C2 基礎設施 | 47 | 6.6% | Nanocore RAT (8)、GlassWorm (9)、KongTuke (17) |

### 惡意程式家族活動分析

| 家族 | 本週 IoC 數 | 類型 | 活動趨勢 |
|------|-----------|------|----------|
| **ClearFake** | 385 | Payload Delivery / Drive-by Compromise | ↑↑↑ 大規模活動爆發 |
| Unknown Malware | 94 | 未分類 | 穩定 |
| **StrelaStealer** | 89 | Info Stealer（電子郵件憑證） | ↑ 持續活躍 |
| **Vidar** | 38 | Info Stealer（瀏覽器/加密貨幣） | → 穩定 |
| KongTuke | 17 | Traffic Distribution System | → 穩定 |
| GlassWorm | 9 | RAT / 後門 | 新觀測 |
| Nanocore RAT | 8 | Remote Access Trojan | → 持續運營 |
| FAKEUPDATES | 7 | Drive-by Compromise | → 與 ClearFake 策略重疊 |

---

## 2.5 新興威脅識別

### 1. ClearFake 大規模 Payload Delivery 活動——偽造瀏覽器更新的工業化

**信心水準：高**

ClearFake 本週以 385 筆 IoC（佔威脅情報饋送 54.4%）呈現顯著的大規模活動爆發。ClearFake 透過入侵合法網站注入惡意 JavaScript [T1189](https://attack.mitre.org/techniques/T1189/){: .ttp-ref }，向訪客展示偽造的瀏覽器更新提示 [T1204.001](https://attack.mitre.org/techniques/T1204/001/){: .ttp-ref }：

- **規模升級**：385 筆 IoC 表明 ClearFake 的基礎設施在本週大幅擴張，受感染網站數量可能達數千個
- **投遞鏈**：偽造更新 → 使用者下載惡意安裝程式 → 載入資訊竊取程式（StrelaStealer、Vidar）或 RAT
- **與 FAKEUPDATES 的關係**：FAKEUPDATES（SocGholish）本週 7 筆，與 ClearFake 採用相似的「偽造更新」策略但屬不同攻擊組織，兩者的同時活躍表明此攻擊向量的高效益性
- **生態系統效應**：ClearFake 作為 Traffic Distribution System（TDS）的上游角色，驅動了下游 StrelaStealer（89 筆）與 Vidar（38 筆）的活動量

**趨勢判斷**：偽造瀏覽器更新已成為資訊竊取程式投遞的主要管道之一。預期 ClearFake 將持續擴張基礎設施，短期內不會消退。組織應在網路閘道層級阻擋已知 ClearFake IoC，並教育使用者辨識偽造更新提示。

### 2. 安全設備韌體層級 APT 後門——防禦架構信任根基動搖

**信心水準：高**

FIRESTARTER APT 後門鎖定 Cisco Firepower 設備，結合 W13 Cisco FMC 勒索軟體利用與本週 Cisco SD-WAN 三筆 KEV，揭示了一個嚴重的系統性趨勢：

| 時間 | 事件 | 目標 | 攻擊者層級 |
|------|------|------|-----------|
| W13 | CVE-2026-20131 勒索軟體利用 | Cisco FMC | 犯罪集團 |
| W17 | FIRESTARTER 韌體後門 | Cisco Firepower | 國家級 APT |
| W17 | CVE-2026-20122/20133/20128 | Cisco SD-WAN | 已確認利用 |

- **「守門人淪陷」風險**：安全設備（防火牆、IPS、SIEM）一旦被入侵，組織的整個安全架構信任鏈即告崩潰
- **韌體層級持久性**：傳統的安全事件應對（重灌作業系統、重置設定）對韌體層級後門無效
- **偵測盲區**：組織通常不會對安全設備本身進行安全監控，形成偵測真空

**預期影響**：未來 6-12 個月內，預期更多 APT 組織將發展針對安全設備韌體的攻擊能力。組織需要建立設備韌體完整性驗證機制。

### 3. 老舊漏洞系統性回溯利用——攻擊者的「長尾」策略

**信心水準：高**

本週 KEV 中 35.7% 為 2023-2024 年漏洞，反映攻擊者正系統性利用修補延遲窗口：

- **攻擊者邏輯**：已知漏洞的 PoC 公開且穩定，利用成本遠低於零日漏洞開發
- **修補現實**：SimpleHelp、PaperCut、Samsung MagicINFO 等非核心 IT 系統的修補優先度通常較低
- **自動化掃描**：攻擊者使用自動化工具大規模掃描 Shodan/Censys 中已知漏洞的暴露實例
- **防禦落差**：組織的修補管理通常聚焦於 Windows/Office/Chrome 等高能見度產品，對邊緣系統（列印管理、遠端支援、數位看板）的修補存在系統性延遲

### 4. AI/ML 開發工具持續成為攻擊目標

**信心水準：中高**

Marimo RCE 漏洞進入 KEV，延續 W13 Langflow 20 小時武器化的趨勢：

| 時間 | 工具 | CVE | 類型 |
|------|------|-----|------|
| W13 | Langflow (AI 平台) | CVE-2026-33017 | Broken Access Control / RCE |
| W17 | Marimo (Python 筆記本) | CVE-2026-39987 | RCE |

- **共同特徵**：AI/ML 工具通常優先功能開發而非安全加固，認證與授權機制薄弱
- **高價值目標**：開發環境存放 API 金鑰、模型權重、訓練資料集等高敏感資產
- **趨勢預期**：隨著 AI/ML 工具的普及，預期更多類似漏洞將被發現與利用

### 5. 資訊竊取程式生態系統的分工精細化

**信心水準：中**

本週 StrelaStealer（89 筆）與 Vidar（38 筆）的持續活躍，配合 ClearFake 作為上游投遞平台，展現出一個精細分工的犯罪生態系統：

- **分工模型**：ClearFake（流量引導）→ 中間投遞層（Dropper）→ 資訊竊取程式（StrelaStealer/Vidar）
- **專業化**：StrelaStealer 專精電子郵件憑證竊取（Outlook/Thunderbird），Vidar 專精瀏覽器憑證與加密貨幣錢包
- **商業模式**：以 Malware-as-a-Service（MaaS）訂閱制運營，降低入門門檻
- **防禦挑戰**：分工精細化使得阻斷單一環節無法有效中止整個攻擊鏈

---

## 本週關鍵指標摘要

| 指標 | 數值 | 意義 |
|------|------|------|
| 重大攻擊事件 | 6 | FIRESTARTER APT + Axios 供應鏈 + BEC |
| 漏洞追蹤總數 | 1,523 | Critical/High 452 筆（29.7%） |
| CISA KEV 新增 | 14 | 近期單週最高量 |
| 老舊漏洞回溯利用 | 5/14 (35.7%) | 2023-2024 年漏洞進入 KEV |
| Exploit-DB 新增 PoC | 26 | 含核心驅動程式、WordPress 外掛 |
| 威脅情報饋送 | 708 | ClearFake 385 筆（54.4%） |
| 資訊竊取程式 IoC | 127 | StrelaStealer 89 + Vidar 38 |
| C2 基礎設施 | 47 | Nanocore、GlassWorm、KongTuke |
| Cisco 設備 KEV | 3 | SD-WAN 管理平面三合一 |
| AI/ML 工具 KEV | 1 | Marimo RCE，延續 Langflow 趨勢 |

---

## 防禦優先建議

基於本週威脅態勢分析，建議組織依以下優先順序強化防禦：

### 立即行動（24-48 小時內）

1. **CISA KEV 修補優先排序**：
   - **最高優先**：CVE-2026-20122/20133/20128（Cisco SD-WAN）——管理平面完全暴露
   - **最高優先**：CVE-2024-57728/57726（SimpleHelp）——遠端支援工具 = 完全存取
   - **高優先**：CVE-2025-29635（D-Link DIR-823X）、CVE-2024-7399（Samsung MagicINFO）
   - **高優先**：CVE-2026-39987（Marimo）、CVE-2026-33825（Microsoft Defender）

2. **Cisco 設備安全加固**：
   - 確認 Firepower 設備管理介面未暴露於公開網路
   - 更新 Cisco SD-WAN Manager 至最新修補版本
   - 啟用 Cisco 設備完整性驗證功能（Trust Anchor Module）
   - 審計所有 Cisco 設備管理存取日誌

3. **供應鏈安全應急**：
   - 檢查專案中 Axios 版本，確認未使用受影響版本
   - 執行 `npm audit` 掃描所有 Node.js 專案
   - 檢查 lockfile 完整性（package-lock.json）

### 短期加強（1-2 週內）

4. **ClearFake/資訊竊取程式防護**：
   - 在網路閘道/DNS 層級阻擋已知 ClearFake IoC
   - 部署瀏覽器隔離（Browser Isolation）技術
   - 教育使用者辨識偽造瀏覽器更新提示（合法更新不會透過網頁彈出視窗）
   - 監控端點的可疑 JavaScript 執行行為

5. **老舊漏洞修補清查**：
   - 盤點 SimpleHelp、PaperCut、JetBrains TeamCity、Samsung MagicINFO 等邊緣系統
   - 使用 Shodan/Censys 檢查外部暴露面
   - 建立非核心 IT 系統的修補追蹤機制

6. **BEC 防範強化**：
   - 建立大額匯款雙重授權與帶外驗證機制
   - 對財務人員進行 AI 深偽語音辨識訓練
   - 啟用郵件系統的外部寄件者標記功能

### 中期規劃（1-3 個月內）

7. **安全設備韌體完整性驗證**：
   - 建立防火牆/IPS/SIEM 等安全設備的韌體完整性定期驗證機制
   - 實施頻外（out-of-band）管理網路架構
   - 評估安全設備的供應鏈信任度

8. **AI/ML 開發環境安全加固**：
   - 審計 AI/ML 開發工具的認證與授權機制
   - 限制開發環境的網路存取範圍
   - 實施 API 金鑰輪換與最小權限原則

---

## 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資
2. **時效性**：資料可能存在數小時至數天的延遲
3. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務等來源
4. **分析局限**：趨勢分析基於公開資料樣本，統計推論應謹慎解讀
5. **翻譯風險**：部分非英文來源經 AI 翻譯，可能存在語義偏差
6. **IoC 統計精度**：ThreatFox/URLhaus/MalwareBazaar 數據基於自動化匯入，跨饋送源的重複率可能影響精確數字
7. **FIRESTARTER 細節**：APT 後門技術細節基於多家情報來源的綜合分析，部分技術指標尚待獨立驗證（信心水準：中高）
8. **Axios 影響範圍**：供應鏈攻擊的實際傳遞性影響範圍仍在評估中，完整影響可能需數週才能確定

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源。
