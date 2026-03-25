---
layout: seo-report
last_modified_at: 2026-03-25T22:00:00+08:00
title: 2026 第 13 週威脅態勢分析
description: "2026-03-19 至 2026-03-25 資安威脅週報：TeamPCP 供應鏈攻擊入侵 Trivy/LiteLLM CI/CD 管線、FBI/CISA 警告俄羅斯情報機構鎖定 Signal/WhatsApp 帳號、Tycoon2FA PhaaS 平台 Europol 打擊後數日內恢復運作、LeakNet 勒索軟體浮現、CISA 新增 6 筆 KEV（SharePoint CVE-2026-20963/Cisco FMC CVE-2026-20131/Apple 3 筆/Craft CMS）、Langflow CVE-2026-33017 揭露 20 小時內遭武器化、PolyShell Magento RCE、AI 深偽詐騙工業化、ClearFake 仍為最活躍惡意載荷傳遞家族。"
parent: 威脅態勢分析
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-threat-landscape.png
author: 資安情報分析團隊
date: 2026-03-25
---

# 威脅態勢分析 — 2026 第 13 週

> 涵蓋期間：2026-03-19 至 2026-03-25
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-03-25
> 分析模型：Claude Opus

---

## 執行摘要

本週威脅態勢以**供應鏈攻擊瞄準 AI/ML 開發工具鏈、國家級行為者鎖定即時通訊平台、以及網路犯罪即服務（CaaS）平台展現高韌性**為三大主軸。攻擊者持續利用 CI/CD 管線作為高價值切入點，同時多個執法打擊行動的成效面臨考驗。

**供應鏈攻擊與 CI/CD 管線威脅**：
- **TeamPCP 入侵 Trivy 安全掃描器並連鎖攻擊 LiteLLM**（2026-03-22/25）：威脅行為者 TeamPCP 透過入侵 Trivy（廣泛使用的開源安全掃描器）的 GitHub Actions 工作流程，進一步利用 LiteLLM（Python LLM 整合函式庫）的 CI/CD 依賴關係，在 litellm 套件中植入三階段惡意載荷——憑證竊取器、Kubernetes 橫向移動工具包、以及持久化 systemd 後門
- **GitHub「OpenClaw Deployer」散布木馬**（2026-03-25）：Netskope 揭露「TroyDen's Lure Factory」活動，超過 300 個 GitHub 套件遭木馬化，鎖定開發者與遊戲玩家
- **SmartApeSG 多載荷投放活動**（2026-03-25）：同時散布 Remcos RAT、NetSupport RAT、StealC 資訊竊取器、Sectop RAT，展現多載荷策略以最大化入侵成功率

**國家級威脅與間諜行動**：
- **FBI/CISA 聯合警告俄羅斯情報機構鎖定 Signal/WhatsApp**（2026-03-25）：歐美情報機構聯合發布公告，俄羅斯關聯威脅行為者針對政府官員、軍方人員、記者發動大規模釣魚活動，目標為竊取即時通訊帳號存取權——非破解端對端加密，而是繞過它
- **芬蘭數千台物聯網攝影機可能遭國家級行為者利用**（2026-03-25）：廉價中國製消費級攝影機長期未更新，可能被用於偵察行動

**網路犯罪韌性與 AI 武器化**：
- **Tycoon2FA PhaaS 平台打擊後迅速恢復**（2026-03-25）：Europol 3 月 4 日查扣 330 個網域後，CrowdStrike 觀察到該平台數日內即恢復正常運作量能，展現現代 CaaS 平台的高基礎設施韌性
- **LeakNet 勒索軟體浮現**（2026-03-22）：新型雙重勒索組織以緊密運作模式（非傳統 RaaS 加盟制度）進行目標式攻擊
- **AI 深偽視訊詐騙工業化**（2026-03-25）：東南亞詐騙工廠招募「AI 模型」操作者，每人每日處理約 100 通深偽視訊通話，將 AI 武器化提升至工業規模
- **Halcyon 報告：78% 組織認為 AI 使勒索軟體更有效**（2026-03-25）：僅 6% 組織認為 AI 改善了自身防禦能力，AI 軍備競賽嚴重向攻擊方傾斜

**關鍵漏洞動態**：
- **CISA 新增 6 筆 KEV**：CVE-2026-20131（Cisco FMC 反序列化）、CVE-2026-20963（SharePoint 反序列化 RCE）、CVE-2025-31277（Apple 緩衝區溢位）、CVE-2025-43510（Apple 不當鎖定）、CVE-2025-43520（Apple 緩衝區溢位）、CVE-2025-32432（Craft CMS 代碼注入）
- **Langflow CVE-2026-33017 揭露 20 小時內遭武器化**（2026-03-21）：AI 工作流程平台漏洞的武器化速度持續突破紀錄
- **PolyShell Magento 未認證 RCE**（2026-03-21）：電商平台面臨未認證遠端程式碼執行威脅

**威脅情報饋送**：
- ThreatFox 本週新增 298 筆 IoC 指標、30 筆惡意程式樣本
- ClearFake 為最活躍惡意載荷傳遞家族（120+ 筆 IoC）
- Aisuru 殭屍網路 IoC 仍持續活躍（28 筆），顯示上週執法打擊後部分基礎設施存續

**資料規模**：本週各 Layer 總計新增逾 5,800 筆追蹤資料，安全公告與漏洞揭露量維持高位。

---

## 資料來源統計

| Layer | 本週新增/更新 | 說明 |
|-------|-------------|------|
| security_news_facts | 163 筆 | attack_incident 29 筆、vulnerability_disclosure 111 筆、industry_trend 17 筆、other 6 筆 |
| vulnerability_tracking | 36 筆 | critical_high 18 筆、medium 14 筆、low_info 4 筆 |
| exploit_intelligence | 8+ 筆 | CISA KEV 新增（CVE-2026-20963、CVE-2025-31277 等）、新 PoC 持續出現 |
| threat_feeds | 5,389 筆 | IoC 指標 298 筆、惡意程式樣本 30 筆、其餘為 URLhaus 惡意 URL |

> 統計時間：2026-03-25 UTC

---

## 2.1 近期重大資安事件

本週資安事件聚焦於供應鏈攻擊入侵 AI/ML 開發工具鏈、國家級行為者鎖定即時通訊平台、以及 CaaS 平台展現超乎預期的恢復能力。以下按嚴重程度排序。

### 1. TeamPCP 供應鏈攻擊：Trivy → LiteLLM CI/CD 管線連鎖入侵

**嚴重程度：極高 | 來源：NCSC-FI / BleepingComputer / The Hacker News | 日期：2026-03-22 / 2026-03-25**

本週最具影響力的事件為 TeamPCP 威脅行為者發動的連鎖式供應鏈攻擊。攻擊分為兩個階段：

**第一階段 — Trivy 安全掃描器遭入侵**（2026-03-22 揭露）：
- 攻擊者入侵 Trivy（Aqua Security 開源漏洞掃描器）的 GitHub 倉庫
- 在官方發布版本與 GitHub Actions 工作流程中植入資訊竊取惡意程式
- Trivy 廣泛用於容器、Kubernetes、IaC 安全掃描，嵌入數以萬計的 CI/CD 管線

**第二階段 — LiteLLM Python 套件遭連鎖污染**（2026-03-25 揭露）：
- Endor Labs 與 JFrog 研究人員揭露 litellm（熱門 Python LLM 整合函式庫）1.82.7 與 1.82.8 版本遭植入後門
- 攻擊向量：litellm CI/CD 管線中使用 Trivy 掃描，遭已被入侵的 Trivy 元件感染
- 三階段惡意載荷：
  1. **憑證竊取器**：掃描 SSH 金鑰、雲端憑證、Kubernetes 密鑰、加密貨幣錢包、.env 檔案
  2. **Kubernetes 橫向移動工具包**：在叢集每個節點部署特權 Pod
  3. **持久化 systemd 後門**：偽裝為「sysmon.service」，定期向 `checkmarx[.]zone/raw` 拉取額外二進位檔
- 兩個惡意版本已從 PyPI 移除

**影響評估**：此攻擊展現「入侵安全工具以入侵下游消費者」的高階供應鏈攻擊模式。Trivy 作為安全掃描器本身就具有 CI/CD 管線中的特權存取權限，入侵它等同取得建置環境中最敏感的憑證與機密。

**ATT&CK 映射**：
- 初始存取：[T1195.002](https://attack.mitre.org/techniques/T1195/002/){: .ttp-ref } Supply Chain Compromise: Compromise Software Supply Chain
- 執行：[T1059.004](https://attack.mitre.org/techniques/T1059/004/){: .ttp-ref } Command and Scripting Interpreter: Unix Shell
- 持久化：[T1543.002](https://attack.mitre.org/techniques/T1543/002/){: .ttp-ref } Create or Modify System Process: Systemd Service
- 憑證存取：[T1552.001](https://attack.mitre.org/techniques/T1552/001/){: .ttp-ref } Unsecured Credentials: Credentials in Files
- 橫向移動：[T1610](https://attack.mitre.org/techniques/T1610/){: .ttp-ref } Deploy Container

### 2. FBI/CISA 聯合警告：俄羅斯情報機構鎖定 Signal/WhatsApp 帳號

**嚴重程度：高 | 來源：FBI / CISA / NCSC-FI / Malwarebytes | 日期：2026-03-20 / 2026-03-22 / 2026-03-25**

FBI 與 CISA 發布公共服務公告（PSA），警告俄羅斯關聯威脅行為者針對即時通訊平台發動持續性釣魚活動：

- **目標對象**：政府高級官員、軍方人員、公務員、記者
- **攻擊平台**：Signal 與 WhatsApp
- **攻擊手法**：大規模釣魚活動竊取帳號存取憑證/QR 碼
- **戰略目標**：非破解端對端加密，而是透過竊取帳號存取權「繞過」加密
- **國際響應**：歐洲情報機構已加入 FBI/CISA 聯合警告
- **CERT-FR 同步發布**：CERTFR-2026-ALE-003 即時通訊定向攻擊警報

此活動代表針對高價值人士的戰略情報收集行動，攻擊手法與先前大規模活動一致但已擴大目標範圍。

**ATT&CK 映射**：
- 初始存取：[T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref } Phishing: Spearphishing Link
- 憑證存取：[T1556](https://attack.mitre.org/techniques/T1556/){: .ttp-ref } Modify Authentication Process
- 收集：[T1530](https://attack.mitre.org/techniques/T1530/){: .ttp-ref } Data from Cloud Storage

### 3. Tycoon2FA PhaaS 平台：執法打擊後數日內恢復運作

**嚴重程度：高 | 來源：BleepingComputer / CrowdStrike / NCSC-FI | 日期：2026-03-25**

Tycoon2FA 釣魚即服務（Phishing-as-a-Service）平台在 Europol 與 Microsoft 聯合打擊行動後展現驚人的恢復能力：

- **打擊行動**：2026 年 3 月 4 日，Microsoft 主導技術打擊，查扣 330 個網域（含控制面板與釣魚頁面）
- **恢復速度**：CrowdStrike 觀察到該平台在數日內即恢復至先前的正常運作量能
- **截至 3 月 25 日**：Tycoon2FA 已恢復至被打擊前的活動水準
- **主要目標**：Microsoft 365 及其他企業服務

此案例深刻展示現代 PhaaS/CaaS 平台的基礎設施韌性。攻擊者預先建置冗餘基礎設施與快速重建能力，使傳統的「拆除（takedown）」執法策略效果大幅削弱。與上週 Europol 關閉 37 萬暗網頁面的大規模行動形成對比，顯示執法打擊與犯罪基礎設施重建之間的持續拉鋸。

**ATT&CK 映射**：
- [T1566](https://attack.mitre.org/techniques/T1566/){: .ttp-ref } Phishing
- [T1539](https://attack.mitre.org/techniques/T1539/){: .ttp-ref } Steal Web Session Cookie（MFA 繞過）

### 4. LeakNet 勒索軟體與 Interlock 持續鎖定企業設備

**嚴重程度：高 | 來源：Fortra / NCSC-FI | 日期：2026-03-21 / 2026-03-22**

本週揭露兩個值得關注的勒索軟體動態：

**LeakNet 勒索軟體**（2026-03-22）：
- 自 2024 年底活躍的新型勒索軟體組織
- 採雙重勒索策略（加密 + 竊取 + 發布）
- **特點**：非傳統 RaaS 加盟模式，而是緊密運作的小型組織
- 更具選擇性的目標定向，攻擊多個產業部門

**Interlock 勒索軟體鎖定 Cisco 企業防火牆**（延續上週事件，2026-03-21）：
- 攻擊者利用 Cisco ASA/Firepower 防火牆漏洞作為初始入侵點
- 成功入侵後橫向移動並部署勒索軟體
- 採雙重勒索策略
- 凸顯網路邊界設備正成為勒索軟體攻擊的首要切入點

**Halcyon 2026 勒索軟體調查報告**（2026-03-25 報導）同步揭示：
- 98% 組織部署 EDR 防禦勒索軟體，但僅 25% 信任其有效性
- 78% 受訪者認為 AI 使勒索軟體更有效
- 僅 6% 認為 AI 改善了自身防禦
- 攻擊者使用合法憑證（而非漏洞利用）取得初始存取的趨勢持續增強

**ATT&CK 映射**：
- [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } Exploit Public-Facing Application
- [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref } Data Encrypted for Impact
- [T1567](https://attack.mitre.org/techniques/T1567/){: .ttp-ref } Exfiltration Over Web Service
- [T1078](https://attack.mitre.org/techniques/T1078/){: .ttp-ref } Valid Accounts

### 5. OVHcloud 疑似重大資料外洩（未確認）

**嚴重程度：高（待確認）| 來源：CyberSecGuru / NCSC-FI | 日期：2026-03-25**

威脅行為者聲稱出售從 OVHcloud（歐洲最大雲端/託管服務商之一）竊取的大規模資料：

- **聲稱規模**：590 TB、160 萬筆「最新」客戶記錄、590 萬個網站的活躍資料
- **聲稱方式**：透過入侵具有頂層管理權限的「母帳號」
- **驗證狀態**：**未確認**
- **OVHcloud 回應**：創辦人兼執行長 Octave Klaba 在 X 平台表示樣本資料集未在其資料庫中找到

**信心水準：中**。暗網論壇已出現「工作證明」樣本，但 OVHcloud 已提出爭議。建議相關組織執行預防性憑證輪換。

### 6. 其他重要事件

**GitHub 套件供應鏈攻擊 — TroyDen's Lure Factory**（2026-03-25）：
- Netskope 揭露超過 300 個木馬化 GitHub 套件
- 偽裝為 OpenClaw Docker 部署工具、AI 開發工具、遊戲作弊器等
- 目標：開發者與遊戲玩家
- **ATT&CK**：[T1195.001](https://attack.mitre.org/techniques/T1195/001/){: .ttp-ref } Supply Chain Compromise: Compromise Software Dependencies and Development Tools

**GSocket 後門透過 Bash 腳本傳播**（2026-03-20）：
- SANS ISC 分析發現惡意 Bash 腳本安裝 GSocket 後門
- GSocket（Global Socket）為合法的 NAT/防火牆穿透工具，遭濫用為隱蔽後門
- 檢測難度高：使用合法基礎設施且設計為繞過防火牆
- **ATT&CK**：[T1059.004](https://attack.mitre.org/techniques/T1059/004/){: .ttp-ref } Unix Shell、[T1572](https://attack.mitre.org/techniques/T1572/){: .ttp-ref } Protocol Tunneling

**Microsoft Azure Monitor 警報遭濫用進行回撥釣魚**（2026-03-22）：
- 攻擊者利用 Azure Monitor 合法警報基礎設施發送釣魚郵件
- 偽裝為 Microsoft 安全團隊警告未授權收費
- 利用合法雲端服務繞過電子郵件安全控制
- **ATT&CK**：[T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref } Spearphishing Link、[T1583.006](https://attack.mitre.org/techniques/T1583/006/){: .ttp-ref } Web Services

**Bubble 無程式碼網站建構器遭用於釣魚**（2026-03-25）：
- Kaspersky 發現釣魚攻擊者利用 Bubble AI 網頁建構器快速產生釣魚網站
- 極可能透過 PhaaS 平台大規模分發
- 降低釣魚網站製作門檻，預期將快速擴散

**AI 深偽視訊詐騙工業化**（2026-03-25）：
- 東南亞詐騙工廠（柬埔寨、緬甸、寮國）招募「AI 模型」操作者
- 每人每日處理約 100 通深偽視訊通話
- 主要用於愛情詐騙（pig butchering）與加密貨幣詐騙
- 現有受害者文字對話操作員已升級為深偽視訊專員

---

## 2.2 漏洞趨勢分析

### 本週漏洞概覽

| 指標 | 數量 | 說明 |
|------|------|------|
| vulnerability_tracking 新增 | 36 筆 | critical_high 18 筆（50%）、medium 14 筆（39%）、low_info 4 筆（11%） |
| vulnerability_disclosure（新聞層） | 111 筆 | CERT-FR 大量公告、CISA ICS 公告、CERT-SE/CERT-RO 警報 |
| CISA KEV 新增 | 6 筆 | 2 筆 CVE-2026-xxxxx（Cisco FMC、SharePoint）+ 4 筆 CVE-2025-xxxxx（Apple 3 筆、Craft CMS） |

### Critical/High 嚴重程度漏洞分析

#### 按廠商分布

| 廠商 | 筆數 | 代表性 CVE/公告 |
|------|------|----------------|
| Microsoft | 4 | CVE-2026-20963（SharePoint RCE）、Edge、Office 更新 |
| Apple | 4 | CVE-2025-31277（緩衝區溢位）、CVE-2025-43510、CVE-2025-43520 |
| Cisco | 2 | CVE-2026-20131（FMC 反序列化）、Secure Firewall 更新 |
| Oracle | 2 | CVE-2026-21992（Identity Manager RCE）、Web Services Manager |
| VMware | 2 | 多份安全公告（AV26-272 等） |
| Citrix | 1 | NetScaler ADC/Gateway |
| Kubernetes | 1 | AV26-260 安全公告 |
| Spring | 1 | AV26-259 安全公告 |
| 其他 | 1 | Craft CMS、TP-Link 路由器等 |

#### CISA KEV 本週新增清單

| CVE | 廠商/產品 | 類型 | 嚴重度 | 修補期限 |
|-----|----------|------|--------|---------|
| CVE-2026-20131 | Cisco FMC / SCC | 反序列化 RCE | High | — |
| CVE-2026-20963 | Microsoft SharePoint | 反序列化 RCE | Critical | 2026-03-21 |
| CVE-2025-31277 | Apple 多產品 | 緩衝區溢位 | High | 2026-04-03 |
| CVE-2025-43510 | Apple 多產品 | 不當鎖定 | Medium | 2026-04-03 |
| CVE-2025-43520 | Apple 多產品 | 緩衝區溢位 RCE | High | 2026-04-03 |
| CVE-2025-32432 | Craft CMS | 代碼注入 | High | — |

**分析**：Apple 產品佔 KEV 新增數量的一半（3/6），涵蓋 iOS、macOS、watchOS、visionOS、tvOS 等多平台，顯示 Apple 生態系在本週面臨密集的活躍利用壓力。Microsoft SharePoint 反序列化 RCE（CVE-2026-20963）繼上週首度被揭露後，本週已被 CISA 列入 KEV，修補期限僅為 1 天（至 3 月 21 日），顯示威脅急迫性極高。

#### ICS/OT 安全公告

本週 CISA 發布多份工業控制系統安全公告，涵蓋：

| 廠商 | 產品 | 日期 |
|------|------|------|
| Schneider Electric | EcoStruxure Automation Expert | 2026-03-19 |
| Schneider Electric | EcoStruxure PME / EPO | 2026-03-19 |
| Schneider Electric | Modicon M241/M251/M258/M262/LMC058 | 2026-03-19 |
| Schneider Electric | EcoStruxure Foxboro DCS | 2026-03-24 |
| Schneider Electric | Plant iT / Brewmaxx | 2026-03-24 |
| Mitsubishi Electric | CNC Series | 2026-03-19 |
| Automated Logic | WebCTRL Premium Server | 2026-03-19 |
| CTEK | ChargePortal | 2026-03-19 |
| IGL Technologies | eParking | 2026-03-19 |
| Pharos Controls | Mosaic Show Controller | 2026-03-24 |
| Grassroots DICOM | GDCM | 2026-03-24 |

Schneider Electric 佔 ICS 公告總量的過半（5/11），其 Modicon PLC 系列與 EcoStruxure 平台持續面臨漏洞揭露壓力。

### 值得關注的漏洞

**Langflow CVE-2026-33017 — 20 小時武器化**（2026-03-21）：
- Langflow 開源 AI 工作流程建構平台的嚴重漏洞
- 漏洞公開揭露後僅 20 小時即遭積極利用
- 成功利用可導致遠端程式碼執行
- 持續印證攻擊者對新漏洞的武器化速度紀錄

**PolyShell Magento 未認證 RCE**（2026-03-21）：
- Adobe Commerce/Magento 電商平台遭遇未認證 RCE 漏洞
- 攻擊者無需任何憑證即可執行任意程式碼
- 影響全球大量使用 Magento 的電商網站

**Oracle Identity Manager RCE — CVE-2026-21992**（2026-03-20）：
- Oracle 罕見的計畫外緊急修補（延續上週報告）
- 影響 Oracle Identity Manager 與 Web Services Manager
- 允許未認證遠端攻擊者執行任意程式碼

---

## 2.3 活躍利用與 PoC 動態

### CISA KEV 活躍利用清單（本週新增/更新）

本週 CISA Known Exploited Vulnerabilities Catalog 新增 6 筆確認遭活躍利用的漏洞（詳見 2.2 節表格）。重點摘要：

1. **CVE-2026-20963**（Microsoft SharePoint 反序列化 RCE）— 已觀察到不明身份威脅行為者積極利用，Canadian Centre for Cyber Security 同步發布 AL26-005 警報
2. **CVE-2026-20131**（Cisco FMC/SCC 反序列化）— Cisco 防火牆管理平台反序列化漏洞，與 Interlock 勒索軟體鎖定 Cisco 設備的趨勢形成呼應
3. **Apple 三筆 KEV**（CVE-2025-31277、CVE-2025-43510、CVE-2025-43520）— 同時涵蓋緩衝區溢位與不當鎖定漏洞，影響幾乎全部 Apple 平台

### 延續監控的活躍利用漏洞

| CVE | 產品 | 類型 | 加入 KEV 日期 | 修補期限 |
|-----|------|------|-------------|---------|
| CVE-2025-26399 | SolarWinds Web Help Desk | 反序列化 RCE | 2026-03-09 | 2026-03-12 |
| CVE-2021-22054 | Omnissa Workspace ONE UEM | SSRF | 2026-03-09 | 2026-03-23 |
| CVE-2025-66376 | Zimbra ZCS | XSS | 2026-03-18 | 2026-04-01 |
| CVE-2025-47813 | Wing FTP Server | 資訊洩漏 | 2026-03-16 | 2026-03-30 |

**跨 Layer 交叉分析**（Qdrant 語意查詢）：Qdrant 搜尋「遠端程式碼執行 RCE critical vulnerability」回傳 10 筆結果，其中 CVE-2025-24035 的 PoC 於 2026-03-24 出現在 GitHub（相似度 0.7210），顯示新公開 PoC 持續推動攻擊面擴大。Redis 8.0.2 RCE（Exploit-DB 52477）也在近期 PoC 列表中多次出現。

### 新公開 PoC/Exploit 動態

本週 exploit_intelligence 層追蹤到的新 PoC 包括：

| PoC | CVE/名稱 | 平台 | 日期 |
|-----|----------|------|------|
| Siklu EtherHaul EH-8010 RCE | — | Exploit-DB | 2026-03-25 |
| Siklu EtherHaul EH-8010 File Upload | — | Exploit-DB | 2026-03-25 |
| D-Link DIR-825 Rev B | — | Exploit-DB | 2026-03-25 |
| CVE-2025-24035 PoC | Windows RDP | GitHub PoC-in-GitHub | 2026-03-24 |
| CVE-2026-33656 | — | PoC Available | 2026-03-25 |
| CVE-2026-33150 | — | PoC Available | 2026-03-25 |

---

## 2.4 攻擊手法歸納

### 攻擊手法統計與 ATT&CK TTP 映射

基於本週 security_news_facts（29 筆 attack_incident）與 threat_feeds（298 筆 IoC + 30 筆惡意程式樣本）的綜合分析：

| 攻擊手法 | 事件數 | ATT&CK TTP | 變化趨勢 |
|----------|--------|------------|---------|
| **供應鏈攻擊** | 3 | <a href="https://attack.mitre.org/techniques/T1195/" class="ttp-badge" target="_blank">T1195</a> | **大幅上升** — TeamPCP Trivy/LiteLLM、TroyDen GitHub 套件、Bubble PhaaS |
| **釣魚/社交工程** | 5 | <a href="https://attack.mitre.org/techniques/T1566/" class="ttp-badge" target="_blank">T1566</a> | 穩定高位 — Signal/WhatsApp 帳號劫持、Azure Monitor 回撥釣魚、Tycoon2FA 恢復 |
| **漏洞利用** | 4 | <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> | 穩定 — SharePoint RCE、Cisco FMC、Langflow、PolyShell |
| **勒索軟體** | 2 | <a href="https://attack.mitre.org/techniques/T1486/" class="ttp-badge" target="_blank">T1486</a> | 穩定 — LeakNet 新組織浮現、Interlock 延續 |
| **RAT/後門** | 3 | <a href="https://attack.mitre.org/techniques/T1219/" class="ttp-badge" target="_blank">T1219</a> | 穩定 — SmartApeSG 多 RAT、GSocket 後門、Predator 間諜軟體 |
| **深偽/AI 詐騙** | 1 | <a href="https://attack.mitre.org/techniques/T1598/" class="ttp-badge" target="_blank">T1598</a> | **上升** — 東南亞工業化深偽視訊詐騙 |
| **IoT 裝置濫用** | 1 | <a href="https://attack.mitre.org/techniques/T1584.005/" class="ttp-badge" target="_blank">T1584.005</a> | 觀察中 — 芬蘭消費級攝影機偵察 |

### 威脅情報饋送趨勢（abuse.ch ThreatFox）

本週 ThreatFox 新增 298 筆 IoC 指標，主要惡意程式家族分布：

| 惡意程式家族 | IoC 數量 | 類型 | 說明 |
|-------------|---------|------|------|
| **ClearFake** | 120+ | Payload Delivery | 本週最活躍家族，透過偽造瀏覽器更新散布 |
| **Unknown Malware** | 36 | 混合 | 新發現的未歸類惡意程式 |
| **Aisuru** | 28 | Botnet C2 | 殭屍網路 — **值得注意：上週遭執法打擊後仍有大量 IoC** |
| **Vidar** | 15 | Botnet C2 / Infostealer | 持續活躍的資訊竊取器 |
| **Remcos RAT** | 12 | RAT C2 | 與 SmartApeSG 活動關聯 |
| **Quasar RAT** | 8 | RAT C2 | 開源 RAT 持續被濫用 |
| **XWorm** | 7 | RAT | 多功能遠端存取木馬 |
| **ValleyRAT/Winos** | 7 | RAT | 已知中國關聯 RAT |
| **Cobalt Strike** | 7 | C2 Framework | 持續被攻擊團體使用 |
| **GlassWorm** | 5 | C2 | 新興惡意程式家族 |
| **Sliver** | 3 | C2 Framework | Cobalt Strike 替代品，採用漸增 |

**趨勢觀察**：
- ClearFake 持續主導惡意載荷傳遞，本週產生的 IoC 數量佔比超過 40%
- Aisuru 殭屍網路 IoC 在上週執法打擊後仍維持 28 筆活躍 IoC，與 Tycoon2FA 快速恢復的模式一致，顯示 CaaS 平台的韌性是系統性問題
- 後紅隊工具（Cobalt Strike、Sliver、Havoc）的 C2 基礎設施持續被偵測，總計 13 筆 IoC

### 與上週比較

| 指標 | W12 | W13 | 變化 |
|------|-----|-----|------|
| attack_incident | ~10 | 29 | **大幅增加** |
| vulnerability_disclosure | — | 111 | 維持高位 |
| CISA KEV 新增 | 7 | 6 | 略減 |
| ThreatFox IoC | 3 | 298 | **大幅增加**（資料擷取改善） |
| 勒索軟體事件 | 1（Interlock） | 2（LeakNet + Interlock 延續） | 微增 |
| 供應鏈攻擊 | 0 | 3 | **顯著增加** |

---

## 2.5 新興威脅識別

### 1. AI/ML 開發工具鏈成為高價值供應鏈攻擊目標（信心水準：高）

TeamPCP 對 Trivy → LiteLLM 的連鎖攻擊揭示一個新興威脅趨勢：**AI/ML 開發工具鏈正成為供應鏈攻擊的首選目標**。理由如下：

- LLM 整合函式庫（如 litellm）嵌入企業 AI 開發管線，存取 API 金鑰與模型端點
- 安全掃描工具（如 Trivy）在 CI/CD 中享有特權存取，入侵一個即可擴散至所有下游消費者
- AI/ML 專案通常依賴大量第三方套件，攻擊面廣大
- 開發者對「安全工具本身遭入侵」的警覺性較低

**Qdrant 交叉分析**：搜尋「APT 進階持續威脅 supply chain attack」回傳歷史案例中 CrowdStrike 對「長線佈局」攻擊的分析（相似度 0.5869），以及半導體產業遭針對性攻擊的報告（相似度 0.5989），顯示供應鏈攻擊已成為國家級與犯罪組織共同偏好的高 ROI 攻擊向量。

### 2. PhaaS/CaaS 平台的基礎設施韌性挑戰執法策略（信心水準：高）

本週 Tycoon2FA 在 Europol 打擊後數日內恢復運作，結合 Aisuru 殭屍網路 IoC 在被瓦解後仍持續出現，強烈暗示：

- 現代 CaaS 平台預先建置冗餘基礎設施與快速重建能力
- 傳統的「查扣網域/伺服器」策略僅能造成短暫中斷
- 執法機構需要發展新策略——瞄準營運者、金流、以及開發者生態系
- 此模式可能促使更多犯罪組織投資基礎設施韌性

### 3. AI 深偽技術在社交工程中的工業化應用（信心水準：中高）

東南亞詐騙工廠招募「AI 模型」操作者進行深偽視訊通話的報導，標誌著 AI 在社交工程攻擊中從「實驗性使用」邁入「工業規模部署」：

- 每人每日 100 通深偽視訊通話的產能，顯示技術已足夠成熟且低成本
- 與 Halcyon 報告「78% 組織認為 AI 使攻擊更有效」的調查結果相互印證
- 深偽技術降低了高說服力社交工程攻擊的門檻
- 預期將從愛情詐騙/加密貨幣詐騙擴展至企業 BEC（商務電子郵件詐騙）

### 4. 後量子密碼學遷移加速（信心水準：中）

本週報導後量子密碼學（PQC）不僅提升安全性，部分演算法在特定條件下可能改善傳輸效率（2026-03-21）。此趨勢與「先收集後解密（Harvest Now, Decrypt Later）」威脅的急迫性結合，預期將加速 PQC 的產業部署。NIST 已標準化 CRYSTALS-Kyber 與 CRYSTALS-Dilithium，主要瀏覽器與 CDN 廠商正積極測試整合。

---

## 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資
2. **時效性**：資料可能存在數小時至數天的延遲
3. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務等來源
4. **分析局限**：趨勢分析基於公開資料樣本，統計推論應謹慎解讀
5. **翻譯風險**：部分非英文來源經 AI 翻譯，可能存在語義偏差
6. **OVHcloud 事件**：該事件為未確認狀態，相關數據來自威脅行為者聲稱，OVHcloud 已提出爭議
7. **threat_feeds IoC 統計**：本週 IoC 數量較上週大幅增加，部分原因為資料擷取覆蓋率改善，不應完全歸因於威脅活動增加

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源。

---

> 本報告由 Claude Opus 模型基於多層資料來源自動化分析產出。
> Qdrant 語意查詢次數：3 次（勒索軟體/RCE/APT 供應鏈）
> 下次更新：2026-W14
