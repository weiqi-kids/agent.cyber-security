---
layout: seo-report
last_modified_at: 2026-03-23T10:00:00+08:00
title: 2026 第 13 週威脅態勢分析
description: "2026-03-16 至 2026-03-23 資安威脅週報：CISA/FBI 首度公開歸因俄羅斯情報機構針對 Signal/WhatsApp 帳號釣魚攻擊、Trivy 安全掃描工具遭供應鏈攻擊植入資訊竊取惡意軟體、Interlock 勒索軟體鎖定 Cisco 企業防火牆、LeakNet 新型勒索軟體組織浮現、Azure Monitor 合法基礎設施遭濫用於回撥式釣魚、Predator 間諜軟體零點擊攻擊 iPhone、SharePoint CVE-2026-20963 反序列化 RCE 遭利用、Langflow CVE-2026-33017 漏洞 20 小時內武器化、CISA 新增 9 筆 KEV、Europol 關閉 37 萬暗網頁面、Aisuru/KimWolf 殭屍網路遭國際執法瓦解。"
parent: 威脅態勢分析
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-threat-landscape.png
author: 資安情報分析團隊
date: 2026-03-23
---

# 威脅態勢分析 — 2026 第 13 週

> 涵蓋期間：2026-03-16 至 2026-03-23
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-03-23
> 分析模型：Claude Opus

---

## 執行摘要

本週威脅態勢以**俄羅斯情報機構大規模即時通訊帳號劫持行動、安全工具供應鏈攻擊、以及勒索軟體持續鎖定企業網路設備**為三大主軸。CISA 與 FBI 史上首度公開將 Signal/WhatsApp 釣魚攻擊直接歸因至俄羅斯情報機構，標誌著國家級威脅行為者對加密通訊平台的攻擊已上升至戰略層級。同時，開源安全掃描工具 Trivy 遭供應鏈攻擊植入資訊竊取惡意軟體，攻擊者透過汙染 CI/CD 管線中的安全工具獲取高特權存取——這是「攻擊防禦工具」策略的危險新演進。

**國家級威脅與社交工程**：
- **CISA/FBI 聯合聲明：俄羅斯情報機構攻擊加密通訊帳號**（2026-03-20/22）：首度公開歸因，確認數千個 Signal/WhatsApp 帳號已遭入侵，目標涵蓋政府官員、軍事人員、記者及人權倡議者
- **CERT-FR 發布通訊應用攻擊警報**（2026-03-20）：法國 CERT-FR 同步發布即時通訊平台攻擊警報（CERTFR-2026-ALE-003），與 CISA/FBI 聲明形成國際聯動
- **Azure Monitor 合法基礎設施遭濫用於回撥式釣魚**（2026-03-22）：攻擊者利用 Microsoft Azure Monitor 合法警報機制發送偽冒 Microsoft 安全團隊的釣魚郵件，繞過傳統郵件安全控制

**供應鏈攻擊與安全工具入侵**：
- **Trivy 安全掃描工具遭 TeamPCP 供應鏈攻擊**（2026-03-22）：攻擊者入侵 Trivy GitHub 儲存庫，透過官方發行版與 GitHub Actions 工作流程散布資訊竊取惡意軟體，影響所有在 CI/CD 管線中使用 Trivy 的組織

**勒索軟體與網路犯罪動態**：
- **Interlock 勒索軟體鎖定 Cisco 企業防火牆**（2026-03-21）：延續上週趨勢，攻擊者針對 Cisco ASA/Firepower 設備進行雙重勒索攻擊
- **LeakNet 勒索軟體組織浮現**（2026-03-22）：自 2024 年底活躍的新型勒索組織，採取更精準的目標選擇策略，不依賴傳統 RaaS 加盟模式
- **Cisco FMC CVE-2026-20131 確認勒索軟體利用**（2026-03-19）：CISA 標記為「Known ransomware campaign use」

**商業間諜軟體與漏洞武器化**：
- **Predator 間諜軟體零點擊攻擊 iPhone**（2026-03-21）：Intellexa 聯盟開發的 Predator 具備無互動入侵 iOS 裝置能力
- **Langflow CVE-2026-33017 漏洞 20 小時內遭武器化**（2026-03-21）：AI 工作流程平台漏洞公開後極短時間即遭利用
- **PolyShell 漏洞攻擊 Magento 電商平台**（2026-03-21）：未認證 RCE 威脅全球電商環境

**執法打擊行動**：
- **Europol 關閉 370,000 個暗網頁面**（2026-03-21）：近年最大規模暗網執法行動
- **Aisuru/KimWolf 殭屍網路遭國際執法瓦解**（2026-03-21）：連續第三週大型執法打擊行動

**關鍵漏洞動態**：
- CISA 新增 9 筆活躍利用漏洞至 KEV（含 Apple 3 筆、Cisco FMC、SharePoint、Zimbra、Wing FTP 等）
- CERT-FR 發布 37+ 份安全公告
- Oracle 緊急修補 Identity Manager RCE
- Roundcube、UniFi 關鍵漏洞警報

**資料規模**：exploit_intelligence 追蹤 2,542 筆 2026 年度 PoC，其中含 309 筆 GitHub PoC 驗證、1,988 筆 CVE 追蹤、64 筆 Exploit-DB 條目。

---

## 資料來源統計

| Layer | 本週新增/更新 | 說明 |
|-------|-------------|------|
| security_news_facts | 16 重大事件 | attack_incident（CISA/FBI 俄羅斯歸因、Trivy 供應鏈、Interlock、LeakNet、Azure Monitor 釣魚、Predator、SharePoint、Langflow 等）、vulnerability_disclosure 60+ 筆、industry_trend 15 筆 |
| vulnerability_tracking | 200+ | CERT-FR 37+ 份、MSRC、CISA ICS、GitHub Advisories |
| exploit_intelligence | 65 筆活躍利用 + 2,542 筆 PoC（2026 YTD） | CISA KEV 新增 9 筆、Nuclei Templates 新增 |
| threat_feeds | 3,800+ | URLhaus 惡意 URL、ThreatFox IoC、MalwareBazaar 樣本 |

> 統計時間：2026-03-23 UTC

---

## 2.1 近期重大資安事件

本週資安事件以**國家級情報機構對加密通訊平台的大規模攻擊首度獲公開歸因**為最重大發展，同時安全工具供應鏈攻擊與勒索軟體擴展攻擊面等趨勢持續升溫。以下按嚴重程度排序。

### 1. CISA/FBI 首度公開歸因：俄羅斯情報機構攻擊 Signal/WhatsApp 帳號

**嚴重程度：極高 | 來源：CISA、FBI（聯合 PSA IC3 PSA260320）| 日期：2026-03-20/22**

CISA 與 FBI 於 2026-03-20 聯合發布公共服務公告（PSA），首度將針對加密通訊應用帳號的大規模釣魚攻擊直接歸因至俄羅斯情報機構相關的網路威脅行為者：

- **歷史性歸因**：此前相關攻擊行動僅被概括性歸因至「國家級威脅」或特定 APT 編號，本次為首次明確公開指向「Russian Intelligence Services」 [T1566](https://attack.mitre.org/techniques/T1566/){: .ttp-ref }
- **受害規模**：數千個帳號已遭入侵（thousands of accounts compromised）
- **目標平台**：Signal、WhatsApp 及其他商業加密通訊應用
- **攻擊手法**：偽冒合法聯繫人或服務的釣魚訊息、透過假冒登入頁面竊取帳號憑證、利用已入侵帳號進行二次鎖定攻擊 [T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref }
- **高價值目標**：政府官員、軍事人員、記者、人權倡議者
- **國際聯動**：CERT-FR 同日發布通訊應用攻擊警報（CERTFR-2026-ALE-003），FBI 於 2026-03-22 再度發表確認聲明

**Qdrant 跨層關聯**：語意查詢「phishing social engineering instant messaging」返回 10 筆相關歷史記錄（相似度 0.47-0.57），其中 CERT-FR 本次警報（2026-03-20）直接匹配（相似度 0.5473），歷史案例包含 2022 年 Facebook Messenger 釣魚、2023 年芬蘭 NCSC 反釣魚指引、2025 年社交工程雲端服務濫用報告等，確認此類攻擊手法有持續演進的歷史軌跡。

**態勢評估**：加密通訊帳號的入侵直接破壞目標人員的作戰安全（OPSEC），俄羅斯情報機構可藉此存取敏感通訊內容、聯繫網絡、以及設備位置資訊。此公開歸因可能促使更多國家 CERT 發布類似警報。

**防禦建議**：啟用 Signal/WhatsApp 的「已連結裝置」審查功能、啟用 Registration Lock（Signal）、對高風險人員進行安全意識培訓。

### 2. Trivy 安全掃描工具遭供應鏈攻擊植入資訊竊取惡意軟體

**嚴重程度：極高 | 來源：多家資安媒體 | 日期：2026-03-22**

開源安全掃描工具 Trivy 遭名為 TeamPCP 的威脅行為者發動供應鏈攻擊，透過官方發行版散布資訊竊取惡意軟體：

- **攻擊目標**：Trivy — 廣泛使用的開源容器與基礎設施安全掃描工具
- **威脅行為者**：TeamPCP
- **攻擊手法**：入侵 Trivy GitHub 儲存庫，汙染官方發行版本與 GitHub Actions 工作流程 [T1195.002](https://attack.mitre.org/techniques/T1195/002/){: .ttp-ref }
- **惡意載荷**：資訊竊取惡意軟體（infostealer），目標為 CI/CD 環境中的憑證與密鑰
- **影響範圍**：所有在 CI/CD 管線中整合 Trivy 的組織，包括容器安全掃描、Kubernetes 安全檢查、IaC 錯誤配置偵測等場景
- **戰略意義**：攻擊安全工具本身是極其危險的供應鏈攻擊策略——安全掃描工具通常擁有存取程式碼倉庫、容器映像、雲端 API 金鑰的高特權

**Qdrant 跨層關聯**：語意查詢「supply chain attack software compromise」返回 10 筆相關歷史記錄（相似度 0.53-0.66），最高相似度為 dependency confusion 攻擊（0.66）、其次為 2025 年 NPM 大規模感染（0.57）和 2023 年 3CX 供應鏈攻擊（0.55）。歷史模式顯示供應鏈攻擊正從應用軟體（3CX）→ 套件管理器（NPM）→ 安全工具（Trivy）逐步升級攻擊目標的特權層級。

**防禦建議**：立即檢查 Trivy 版本完整性、檢查 CI/CD 管線中是否有異常的憑證存取記錄、暫時鎖定 Trivy GitHub Actions 至已知安全的 commit hash。

### 3. Interlock 勒索軟體鎖定 Cisco 企業防火牆

**嚴重程度：極高 | 來源：多家資安媒體 | 日期：2026-03-21**

Interlock 勒索軟體組織針對 Cisco 企業防火牆設備發動攻擊，利用設備漏洞作為初始入侵點：

- **目標設備**：Cisco ASA（Adaptive Security Appliance）、Firepower 系列防火牆
- **攻擊手法**：利用已知漏洞取得初始存取 [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref }，隨後橫向移動至企業內部網路部署勒索軟體 [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref }
- **勒索策略**：雙重勒索（double extortion）——先竊取資料，再加密系統
- **趨勢意義**：與 CVE-2026-20131（Cisco FMC，CISA 確認勒索軟體利用）形成完整攻擊鏈

**Qdrant 跨層關聯**：語意查詢「Cisco firewall vulnerability exploitation network edge device」返回 10 筆結果（相似度 0.58-0.64），歷史記錄包含 Zyxel 防火牆漏洞（2021）、Cisco 多產品漏洞（2026-01）、SonicWall 後門攻擊等，確認網路邊界設備持續為攻擊者高優先級目標。

**防禦建議**：立即盤點 Cisco 防火牆韌體版本、套用 CVE-2026-20131 修補、監控管理介面異常存取、啟用設備完整性驗證。

### 4. LeakNet 勒索軟體組織浮現

**嚴重程度：高 | 來源：Fortra 分析報告 | 日期：2026-03-22**

新型勒索軟體組織 LeakNet 被揭露自 2024 年底活躍至今：

- **營運模式**：不採用傳統 RaaS 廣泛加盟模式，而是以緊密運作的小型團隊進行更精準的攻擊 [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref }
- **勒索策略**：雙重勒索（加密 + 資料外洩 + 公開威脅）[T1567](https://attack.mitre.org/techniques/T1567/){: .ttp-ref }
- **目標選擇**：跨多產業但更具選擇性，非大規模隨機攻擊
- **趨勢意義**：反映勒索軟體生態系統的分化——大型 RaaS 與精準化小型組織並存

**Qdrant 跨層關聯**：語意查詢「ransomware new variant 2026」返回 10 筆結果（相似度 0.50-0.56），其中 WannaCry 樣本在 MalwareBazaar 持續活躍、RemcosRAT 透過 xlsx 檔案散布等模式，反映惡意軟體生態系統的持續演進。LeakNet 的精準化模式與過去 LockBit 5.0（2025-10-28）的跨平台策略形成對比。

### 5. Microsoft Azure Monitor 合法基礎設施遭濫用於回撥式釣魚

**嚴重程度：中高 | 來源：BleepingComputer | 日期：2026-03-22**

攻擊者濫用 Microsoft Azure Monitor 合法警報基礎設施發動回撥式釣魚攻擊：

- **攻擊手法**：利用 Azure Monitor 警報功能發送偽冒 Microsoft Security Team 的釣魚郵件 [T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref }
- **誘餌主題**：偽稱帳號存在未授權扣款
- **回撥機制**：引導受害者撥打提供的電話號碼 [T1204.001](https://attack.mitre.org/techniques/T1204/001/){: .ttp-ref }
- **規避能力**：利用 Azure 合法基礎設施發送郵件，繞過 SPF/DKIM/DMARC 與傳統郵件安全閘道
- **趨勢**：延續「濫用合法雲端服務」的攻擊趨勢（Living-off-the-Cloud），與 2025-10-29 揭露的「社交工程結合雲端服務與短期憑證」模式一致

### 6. Predator 間諜軟體零點擊攻擊 iPhone

**嚴重程度：極高 | 來源：多家資安研究機構 | 日期：2026-03-21**

商業間諜軟體 Predator（由 Intellexa 聯盟開發）被揭露具備零點擊 iPhone 入侵能力：

- **攻擊方式**：無需使用者互動，透過遠端傳送精心構造的載體即可完全接管 iPhone [T1203](https://attack.mitre.org/techniques/T1203/){: .ttp-ref }
- **能力範圍**：完全存取訊息、通話紀錄、位置、麥克風、攝影機 [T1547](https://attack.mitre.org/techniques/T1547/){: .ttp-ref }
- **受影響群體**：記者、人權倡議者、政治異見人士、政府官員
- **KEV 關聯**：本週 CISA 新增 3 筆 Apple 漏洞至 KEV（CVE-2025-43510、CVE-2025-43520、CVE-2025-31277），均標記活躍利用，可能與間諜軟體攻擊鏈相關

### 7. SharePoint 反序列化 RCE 遭利用（CVE-2026-20963）

**嚴重程度：高 | 來源：CISA KEV、CERT-SE、多家媒體 | 日期：2026-03-18 至 2026-03-21**

Microsoft SharePoint 反序列化漏洞 CVE-2026-20963 遭未知攻擊者積極利用：

- **漏洞類型**：CWE-502 不受信任資料反序列化導致 RCE [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref }
- **嚴重程度**：Critical，未認證即可遠端執行程式碼
- **KEV 動態**：2026-03-18 列入 CISA KEV，修補期限 2026-03-21
- **國際響應**：CERT-SE 於 2026-03-19 發布專項警報（allvarlig sarbarhet）
- **影響範圍**：SharePoint 廣泛部署於全球企業，成功利用可獲得內網初始存取點

### 8. Langflow CVE-2026-33017 漏洞 20 小時內遭武器化

**嚴重程度：極高 | 來源：多家資安媒體 | 日期：2026-03-21**

AI 工作流程平台 Langflow 的嚴重漏洞在公開後極短時間內遭積極利用：

- **武器化速度**：20 小時，為本年度最快案例之一 [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref }
- **漏洞性質**：Critical RCE，允許未認證遠端攻擊者執行任意程式碼
- **AI 平台風險**：Langflow 用於建構 LLM 應用，部署環境通常可存取敏感 AI 模型與訓練資料

### 9. Cisco FMC CVE-2026-20131 確認勒索軟體利用

**嚴重程度：高 | 來源：CISA KEV | 日期：2026-03-19**

Cisco Firepower Management Center 反序列化 RCE 被 CISA 確認用於勒索軟體攻擊鏈：

- **關鍵標記**：CISA 在 KEV 條目中標註「Known ransomware campaign use」[T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } → [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref }
- **與 Interlock 的潛在關聯**：Cisco FMC 作為防火牆管理平台，與 Interlock 攻擊 Cisco 防火牆可能存在攻擊鏈關聯（信心水準：中）

### 10. Aisuru/KimWolf 殭屍網路遭國際執法瓦解

**嚴重程度：高 | 來源：NCSC-FI | 日期：2026-03-21**

繼 W11 Operation Lightning（SocksEscort）和 W12 持續打擊後，本週再次成功瓦解大型殭屍網路：

- **殭屍網路規模**：Aisuru（又名 KimWolf）為大型 IoT 殭屍網路 [T1584.005](https://attack.mitre.org/techniques/T1584/005/){: .ttp-ref }
- **用途**：DDoS 攻擊、代理服務
- **執法連續性**：W11 SocksEscort → W12/W13 Aisuru/KimWolf + Europol 暗網，顯示全球執法機構正進行系統性打擊

### 11. Europol 關閉 370,000 個暗網頁面

**嚴重程度：高 | 來源：Europol | 日期：2026-03-21**

歐洲刑警組織宣布大規模暗網打擊行動成果：

- **規模**：關閉超過 370,000 個暗網頁面，為近年最大規模
- **影響**：重大打擊非法市場、犯罪服務供應商、洩露資料交易平台
- **趨勢**：2026 年國際執法對網路犯罪基礎設施的打擊力度顯著提升

### 12. CISA 呼籲強化端點管理系統（Stryker 事件後續）

**嚴重程度：高 | 來源：CISA | 日期：2026-03-18**

CISA 針對 2026-03-11 美國醫療科技公司 Stryker Corporation 遭受的網路攻擊發布端點管理系統強化指引：

- **受害組織**：Stryker Corporation（美國醫療科技公司）
- **攻擊向量**：透過端點管理系統弱點攻擊 Microsoft 環境
- **受影響系統**：Microsoft Intune、SCCM 等集中式端點管理工具
- **CISA 建議**：限制管理存取權限、實施 MFA、監控管理控制台異常活動、進行網路分段

### 其他值得關注事件

- **Oracle 緊急修補 Identity Manager RCE**（2026-03-21）：計畫外緊急發布，影響企業身份管理核心平台
- **GSocket 後門透過 Bash 腳本散播**（2026-03-20）：合法工具濫用建立隱蔽後門 [T1059.004](https://attack.mitre.org/techniques/T1059/004/){: .ttp-ref }
- **PolyShell 漏洞攻擊 Magento 電商平台**（2026-03-21）：未認證 RCE 威脅電商安全
- **Roundcube Webmail 嚴重漏洞**（2026-03-20）：CERT-SE 發布緊急警報
- **UniFi Network Application 嚴重漏洞**（2026-03-20）：CERT-RO 發布警報
- **SANS ISC 偵測到大量 Adminer/代理伺服器掃描**（2026-03-16/18）：自動化掃描活動持續

---

## 2.2 漏洞趨勢分析

### 本週新增漏洞統計

| 來源 | 新增數量 | 主要涵蓋產品 |
|------|---------|-------------|
| CERT-FR 公告 | 37+ | Microsoft、VMware（多份）、Spring/Spring AI、Chrome、Apple、Atlassian、GLPI、Kaspersky、Mattermost、Redmine、Suricata、Xen、Citrix、MongoDB、Node.js、Splunk、Mitel、Roundcube、Traefik、IBM、Oracle、Elastic、Debian/RHEL/SUSE/Ubuntu 核心 |
| CISA KEV 新增 | 9 | Apple（3 筆）、Cisco FMC、SharePoint、Zimbra、Wing FTP、Craft CMS、Laravel Livewire |
| CISA ICS 公告 | 10+ | CODESYS/Festo、Schneider Electric（EcoStruxure、SCADAPack、Modicon 多筆）、Siemens SICAM、Automated Logic、CTEK、IGL Technologies、Mitsubishi Electric CNC |
| CERT-SE 公告 | 3 | SharePoint、Roundcube、Email Security |
| CERT-RO 公告 | 2 | UniFi、Android Security Bulletin |

### 廠商分布

本週漏洞公告涵蓋範圍極廣：

| 廠商/產品 | 公告來源 | 重點漏洞 |
|----------|---------|---------|
| **Microsoft** | CERT-FR（多份）、CISA KEV、CERT-SE | SharePoint RCE CVE-2026-20963（KEV）、多產品更新 |
| **Apple** | CERT-FR、CISA KEV（3 筆） | CVE-2025-43510/43520/31277（活躍利用） |
| **Cisco** | CISA KEV | FMC RCE CVE-2026-20131（勒索軟體利用） |
| **VMware** | CERT-FR（3 份） | 虛擬化平台多筆漏洞 |
| **Schneider Electric** | CISA ICS（4 份） | EcoStruxure、Modicon PLC 多筆 ICS 漏洞 |
| **Oracle** | 緊急修補 | Identity Manager RCE（計畫外修補） |
| **Roundcube** | CERT-FR、CERT-SE | 郵件系統關鍵漏洞 |
| **Zimbra** | CISA KEV | ZCS XSS CVE-2025-66376 |
| **Spring/Spring AI** | CERT-FR（2 份） | Java 生態系安全更新 |
| **Langflow** | 多家媒體 | CVE-2026-33017 RCE（20 小時武器化） |
| **Magento/Adobe Commerce** | 多家媒體 | PolyShell 未認證 RCE |
| **Ubiquiti UniFi** | CERT-RO | Network Application 關鍵漏洞 |

### CISA KEV 本週新增明細（9 筆）

| CVE ID | 產品 | 漏洞類型 | KEV 新增日期 | 勒索軟體利用 |
|--------|------|---------|-------------|-------------|
| CVE-2025-47813 | Wing FTP Server | Information Disclosure | 2026-03-16 | 未確認 |
| CVE-2025-66376 | Zimbra ZCS | Cross-Site Scripting | 2026-03-18 | 未確認 |
| CVE-2026-20963 | Microsoft SharePoint | Deserialization RCE | 2026-03-18 | 未確認 |
| 未公開 CVE | 待確認 | 待確認 | 2026-03-18 | 未確認 |
| CVE-2026-20131 | Cisco FMC | Deserialization RCE | 2026-03-19 | **已確認** |
| CVE-2025-43510 | Apple Multiple Products | Improper Locking | 2026-03-20 | 未確認 |
| CVE-2025-43520 | Apple Multiple Products | Buffer Overflow | 2026-03-20 | 未確認 |
| CVE-2025-31277 | Apple Multiple Products | Buffer Overflow | 2026-03-20 | 未確認 |
| 2 筆待確認 | 待確認 | 待確認 | 2026-03-20 | 未確認 |

> 註：CISA 於 2026-03-20 單日新增 5 筆 KEV，為本週最大規模批次新增。

### ICS/OT 漏洞警報

本週 CISA 發布 10+ 筆 ICS 安全公告，涵蓋關鍵工控系統廠商：

| 廠商 | 產品 | 公告日期 |
|------|------|---------|
| CODESYS / Festo | Automation Suite | 2026-03-17 |
| Schneider Electric | EcoStruxure Data Center Expert | 2026-03-17 |
| Schneider Electric | SCADAPack RemoteConnect | 2026-03-17 |
| Siemens | SICAM SIAPP SDK | 2026-03-17 |
| Automated Logic | WebCTRL Premium Server | 2026-03-19 |
| CTEK | ChargePortal | 2026-03-19 |
| IGL Technologies | eParking | 2026-03-19 |
| Mitsubishi Electric | CNC Series | 2026-03-19 |
| Schneider Electric | EcoStruxure Automation Expert | 2026-03-19 |
| Schneider Electric | EcoStruxure PME / EPO | 2026-03-19 |
| Schneider Electric | Modicon M241/M251/M258/LMC058 | 2026-03-19 |
| Schneider Electric | Modicon M241/M251/M262 | 2026-03-19 |

**OT 趨勢**：Schneider Electric 相關公告占 ICS 公告的 60% 以上，反映該廠商產品線廣泛部署於關鍵基礎設施環境，且面臨持續的安全挑戰。

### 修補壓力指標

本週修補壓力持續高位：

- **CISA KEV 9 筆新增**：較上週（7 筆）增加 29%，其中 CVE-2026-20131 已確認勒索軟體利用，為最高優先級
- **Apple 三筆 KEV 同日新增**（2026-03-20）：表示 Apple 設備的企業修補緊迫性提升
- **反序列化 RCE 集中出現**：Cisco FMC 和 SharePoint 均為反序列化 RCE，此類漏洞持續為最危險的攻擊向量
- **ICS 環境修補挑戰**：Schneider Electric 多產品受影響，OT 環境修補週期通常較 IT 環境長

---

## 2.3 活躍利用與 PoC 動態

### CISA KEV 活躍利用漏洞分析

本週 CISA KEV 新增 9 筆活躍利用漏洞，形成以下攻擊模式：

**反序列化 RCE 攻擊面**：
- CVE-2026-20131（Cisco FMC）和 CVE-2026-20963（SharePoint）均為反序列化導致的 RCE
- 兩者皆允許未認證攻擊者遠端執行程式碼，威脅等級為 Critical
- CVE-2026-20131 已確認被勒索軟體攻擊鏈採用

**Apple 攻擊鏈**：
- 三筆 Apple 漏洞（Improper Locking + 2x Buffer Overflow）於 2026-03-20 同日確認活躍利用
- 結合 Predator 間諜軟體零點擊攻擊 iPhone 的揭露，Apple 裝置攻擊面持續擴大
- 高度可能構成同一攻擊鏈的不同環節

### 新增 Nuclei Templates

本週新增的 Nuclei 自動化偵測模板：

| CVE ID | 產品 | 偵測類型 |
|--------|------|---------|
| CVE-2026-30928 | Glances | Information Disclosure |

> Nuclei Templates 的新增可作為防禦方主動掃描的依據。

### PoC 追蹤統計（2026 年度）

| 類型 | 2026 年累計 | 說明 |
|------|------------|------|
| GitHub PoC 驗證 | 309 筆 | 由安全研究人員發布的概念驗證代碼 |
| CVE 利用追蹤 | 1,988 筆 | 含活躍利用和已知 PoC 的 CVE |
| Exploit-DB 條目 | 64 筆 | 完整利用程式碼與攻擊腳本 |
| 活躍利用確認 | 65 筆 | CISA KEV 等權威來源確認 |

### 活躍利用與 PoC 交叉關聯

```
活躍利用（KEV）              供應鏈攻擊               社交工程
┌─────────────┐           ┌───────────────┐        ┌───────────────┐
│ CVE-2026-20131│           │ Trivy           │        │ Signal/WhatsApp│
│ (Cisco FMC)   │           │ (TeamPCP)       │        │ (Russian Intel) │
│ + 勒索軟體利用 │           │ + Infostealer   │        │ + 數千帳號入侵  │
└─────────────┘           └───────────────┘        └───────────────┘
│                                │                         │
▼                                ▼                         ▼
CVE-2026-20963              CI/CD 管線               CERT-FR 警報
(SharePoint RCE)            特權存取洩露              CERTFR-2026-ALE-003
```

---

## 2.4 攻擊手法歸納

### 攻擊類型分類統計

| 攻擊類型 | 本週事件數 | 主要 ATT&CK TTP | 趨勢 |
|----------|-----------|-----------------|------|
| **社交工程/釣魚** | 3 | <a href="https://attack.mitre.org/techniques/T1566/" class="ttp-badge" target="_blank">T1566</a> | ↑↑ 國家級情報機構規模化攻擊 |
| **漏洞利用（公開應用）** | 5 | <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> | ↑ 持續攀升，武器化速度加快 |
| **供應鏈攻擊** | 1 | <a href="https://attack.mitre.org/techniques/T1195/002/" class="ttp-badge" target="_blank">T1195.002</a> | ↑↑ 從應用軟體升級至安全工具 |
| **勒索軟體** | 3 | <a href="https://attack.mitre.org/techniques/T1486/" class="ttp-badge" target="_blank">T1486</a> | → 穩定，新組織浮現 + 目標擴展 |
| **商業間諜軟體** | 1 | <a href="https://attack.mitre.org/techniques/T1203/" class="ttp-badge" target="_blank">T1203</a> | → 零點擊能力持續進化 |
| **Living-off-the-Land/Cloud** | 2 | <a href="https://attack.mitre.org/techniques/T1059/004/" class="ttp-badge" target="_blank">T1059.004</a> | ↑ 合法基礎設施濫用擴展至雲端 |
| **DDoS/殭屍網路** | 1 | <a href="https://attack.mitre.org/techniques/T1584/005/" class="ttp-badge" target="_blank">T1584.005</a> | ↓ 執法持續打擊 |

### 本週 ATT&CK TTP 熱力圖

| 戰術階段 | 觀測到的技術 | 事件關聯 |
|----------|------------|---------|
| **Reconnaissance** | — | SANS ISC 偵測到 /proxy/ 和 Adminer 掃描 |
| **Resource Development** | [T1584.005](https://attack.mitre.org/techniques/T1584/005/){: .ttp-ref } Botnet | Aisuru/KimWolf 殭屍網路（遭瓦解） |
| **Initial Access** | [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } Exploit Public-Facing Application | SharePoint、Cisco FMC、Langflow、Magento、Oracle Identity Manager |
| **Initial Access** | [T1195.002](https://attack.mitre.org/techniques/T1195/002/){: .ttp-ref } Compromise Software Supply Chain | Trivy 供應鏈攻擊 |
| **Initial Access** | [T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref } Spearphishing Link | 俄羅斯情報機構 Signal/WhatsApp 釣魚、Azure Monitor 回撥釣魚 |
| **Execution** | [T1059.004](https://attack.mitre.org/techniques/T1059/004/){: .ttp-ref } Unix Shell | GSocket 後門 Bash 腳本 |
| **Execution** | [T1203](https://attack.mitre.org/techniques/T1203/){: .ttp-ref } Exploitation for Client Execution | Predator 零點擊 iPhone 攻擊 |
| **Execution** | [T1204.001](https://attack.mitre.org/techniques/T1204/001/){: .ttp-ref } Malicious Link | Azure Monitor 回撥釣魚（誘導撥打電話） |
| **Persistence** | [T1547](https://attack.mitre.org/techniques/T1547/){: .ttp-ref } Boot or Logon Autostart Execution | Predator 持久性植入 |
| **Credential Access** | [T1555](https://attack.mitre.org/techniques/T1555/){: .ttp-ref } Credentials from Password Stores | Trivy infostealer 竊取 CI/CD 憑證 |
| **Defense Evasion** | [T1218](https://attack.mitre.org/techniques/T1218/){: .ttp-ref } System Binary Proxy Execution | GSocket 合法工具濫用 |
| **Exfiltration** | [T1567](https://attack.mitre.org/techniques/T1567/){: .ttp-ref } Exfiltration Over Web Service | LeakNet 資料外洩勒索 |
| **Impact** | [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref } Data Encrypted for Impact | Interlock、LeakNet 勒索軟體 |

### 本週 TTP 演進重點

**1. 社交工程目標升級至國家安全層級**

俄羅斯情報機構攻擊 Signal/WhatsApp 代表社交工程已從傳統的企業憑證竊取提升至國家安全通訊的滲透。攻擊者利用加密通訊平台的信任機制——受害者信任端對端加密保護，但帳號本身遭到入侵。

**2. 供應鏈攻擊「攻擊防禦者」**

Trivy 攻擊代表一種危險的新模式：攻擊安全防禦工具本身。安全掃描工具在 CI/CD 管線中通常擁有讀取原始碼、存取容器映像、接觸雲端 API 金鑰的高特權——這使其成為極具價值的供應鏈攻擊目標。

**3. 雲端基礎設施信任濫用**

Azure Monitor 回撥釣魚展示攻擊者如何利用受信任的雲端服務基礎設施繞過傳統安全控制。當釣魚郵件透過 Azure 合法基礎設施發送時，SPF/DKIM/DMARC 驗證全部通過，傳統的郵件安全閘道無法偵測。

### IoC 趨勢（威脅情報饋送 Layer）

| 指標類型 | 本週新增 | 趨勢 |
|----------|---------|------|
| 惡意 URL（URLhaus） | ~3,800 | 維持高位 |
| IoC 指標（ThreatFox） | 3+ | 低量新增 |
| 惡意軟體樣本（MalwareBazaar） | WannaCry/RemcosRAT 活躍 | 持續追蹤中 |

### 與上週（W12）比較

| 指標 | W12 | W13 | 變化 |
|------|-----|-----|------|
| CISA KEV 新增 | 7 | 9 | ↑ 增加 29% |
| 重大攻擊事件 | 10+ | 16 | ↑ 顯著增加 |
| 國家級威脅歸因 | 1（Predator 間接相關） | 2（俄羅斯情報機構 + Predator） | ↑ 首度公開歸因 |
| 供應鏈攻擊 | 0 | 1（Trivy） | ↑ 新出現 |
| 勒索軟體組織 | 1（Interlock） | 2（Interlock + LeakNet） | ↑ 新組織浮現 |
| 執法行動 | 2 | 2（Aisuru/KimWolf + Europol） | → 持續打擊 |
| ICS 公告 | — | 10+（Schneider 占 60%） | ICS 修補壓力上升 |

---

## 2.5 新興威脅識別

### 1. 安全工具供應鏈攻擊：攻擊防禦者的新策略

**信心水準：高**

Trivy 遭 TeamPCP 供應鏈攻擊代表一種極具戰略意義的新攻擊向量：攻擊者不再只針對應用軟體或套件管理器，而是直接攻擊安全工具本身。

**攻擊目標特權升級路徑**：
- 2023：3CX 視訊會議軟體（應用層級）
- 2025：NPM 套件大規模感染（套件管理器層級）
- 2026：Trivy 安全掃描工具（安全工具層級）

**風險評估**：安全掃描工具在 CI/CD 管線中通常擁有以下特權：
- 讀取所有原始碼與設定檔（含 .env、credentials）
- 存取容器映像與 Kubernetes API
- 接觸雲端 API 金鑰與部署憑證
- 在建構環境中執行任意程式碼

一旦安全工具被入侵，攻擊者即可繞過所有安全控制，因為組織信任安全工具的行為。

### 2. 加密通訊帳號劫持成為國家級情報收集手段

**信心水準：高**

CISA/FBI 對俄羅斯情報機構的公開歸因標誌著國家級威脅行為者將加密通訊平台視為高優先級情報收集目標。

**趨勢軌跡**：
- 2025 年 W11：荷蘭 AIVD/MIVD 揭露俄羅斯 Signal/WhatsApp 帳號劫持行動
- 2026 年 W12/W13：CERT-FR 通訊應用攻擊警報
- 2026 年 W13：CISA/FBI 首度公開歸因至俄羅斯情報機構

**影響評估**：加密通訊帳號的入侵比傳統的電子郵件竊取更具戰略價值——受害者在加密通訊中的安全感可能導致更敏感的資訊分享，且端對端加密使得事後的流量攔截分析極為困難。

### 3. 雲端服務信任機制的系統性濫用

**信心水準：中高**

Azure Monitor 回撥釣魚延續了攻擊者系統性濫用合法雲端基礎設施的趨勢：

**已觀測到的雲端服務濫用模式**：
- 2025-10-29：社交工程結合雲端服務與短期憑證
- 2026-W13：Azure Monitor 合法警報機制用於釣魚

**防禦挑戰**：傳統的發信人驗證機制（SPF/DKIM/DMARC）在此類攻擊中完全失效，因為郵件確實來自合法的 Azure 基礎設施。需要基於內容分析和行為偵測的進階防禦。

### 4. 勒索軟體生態系統分化：精準化與規模化並存

**信心水準：中**

LeakNet 的浮現反映勒索軟體生態系統正經歷分化：

- **規模化路線**：LockBit 5.0（跨平台）、Interlock（網路設備）等大型 RaaS 組織持續擴展攻擊面
- **精準化路線**：LeakNet 不依賴加盟模式，以小型團隊進行更精準的目標選擇和攻擊

這種分化使得防禦方更難以單一策略應對所有勒索軟體威脅。

### 5. 漏洞武器化速度突破 24 小時門檻（持續趨勢）

**信心水準：高**

Langflow CVE-2026-33017 在公開後 20 小時即遭利用，再次確認漏洞武器化速度已突破傳統的「首日修補」安全假設。

**防禦意涵**：
- 傳統月度修補週期已無法應對
- 需要建立即時修補或即時緩解能力
- WAF/IPS 虛擬修補（virtual patching）為關鍵過渡措施
- 漏洞揭露後的「黃金修補時間」已從天級縮短至小時級

### 6. ICS/OT 環境面臨密集漏洞揭露

**信心水準：中**

本週 CISA 發布 10+ 筆 ICS 安全公告，其中 Schneider Electric 佔 60% 以上：

- **影響產品**：EcoStruxure（多條產品線）、Modicon PLC（多型號）、SCADAPack
- **OT 修補困境**：工業控制系統的修補週期通常遠長於 IT 環境，且需要停機窗口
- **風險累積**：漏洞揭露速度遠超 OT 環境的修補能力，導致已知漏洞在工控環境中持續累積

---

## 2.6 跨層關聯分析摘要

本週透過 Qdrant 語意搜尋進行的跨 Layer 關聯分析揭示以下重要模式：

### 關聯 1：俄羅斯情報機構通訊平台攻擊鏈

```
security_news_facts  →  CISA/FBI 俄羅斯歸因（2026-03-20/22）
security_news_facts  →  CERT-FR 通訊應用警報 CERTFR-2026-ALE-003（2026-03-20）
Qdrant 歷史         →  荷蘭 AIVD/MIVD 揭露（W11）、Facebook Messenger 釣魚（2022）
Qdrant 歷史         →  社交工程雲端服務濫用（2025-10）
```

**結論**：針對加密通訊平台的國家級攻擊已從單一國家 CERT 的觀察升級為多國聯合公開歸因，形成完整的情報圖像。

### 關聯 2：供應鏈攻擊升級路徑

```
security_news_facts  →  Trivy 供應鏈攻擊（2026-03-22）
Qdrant 歷史         →  Dependency confusion 攻擊（相似度 0.66）
Qdrant 歷史         →  NPM 大規模感染（2025-10，相似度 0.57）
Qdrant 歷史         →  3CX 供應鏈攻擊（2023-04，相似度 0.55）
```

**結論**：供應鏈攻擊正沿著「應用軟體 → 套件管理器 → 安全工具」的路徑升級攻擊目標的特權層級。

### 關聯 3：Cisco 防火牆完整攻擊鏈

```
exploit_intelligence     →  CVE-2026-20131 (active_exploitation, ransomware confirmed)
vulnerability_tracking   →  Cisco FMC 多筆 CVE (critical_high)
security_news_facts      →  Interlock 勒索軟體攻擊 Cisco 防火牆
Qdrant 歷史             →  Cisco 多產品漏洞、SonicWall 後門等網路設備攻擊
```

**結論**：Cisco 防火牆/FMC 在本週形成「漏洞揭露 → KEV 確認 → 勒索軟體利用 → 攻擊事件報告」的完整攻擊鏈。

### 關聯 4：SharePoint 跨層驗證

```
exploit_intelligence     →  CVE-2026-20963 (active_exploitation)
vulnerability_tracking   →  CVE-2026-20963 (critical_high)
security_news_facts      →  未知攻擊者利用 SharePoint 漏洞 + CERT-SE 警報
```

**結論**：CVE-2026-20963 在三個 Layer 中同時出現，跨層驗證確認為當前最需優先處理的漏洞之一。

---

## 本週防禦優先建議

基於以上分析，建議防禦方優先執行以下行動：

| 優先級 | 行動 | 對應威脅 |
|--------|------|---------|
| **P0 — 立即** | 檢查 Trivy 版本完整性，暫停 CI/CD 管線中的 Trivy 執行直至確認安全 | Trivy 供應鏈攻擊（TeamPCP） |
| **P0 — 立即** | 修補 Cisco FMC CVE-2026-20131 | 已確認勒索軟體利用 |
| **P0 — 立即** | 修補 Microsoft SharePoint CVE-2026-20963 | 已確認活躍利用，修補期限已過（2026-03-21） |
| **P0 — 立即** | 更新所有 Apple 設備 | 3 筆 KEV 活躍利用 + Predator 威脅 |
| **P1 — 24 小時內** | 審查 Signal/WhatsApp 已連結裝置，啟用 Registration Lock | 俄羅斯情報機構帳號劫持 |
| **P1 — 24 小時內** | 修補 Langflow CVE-2026-33017 | 20 小時武器化 |
| **P1 — 24 小時內** | 修補 Zimbra ZCS CVE-2025-66376 | KEV 活躍利用 |
| **P1 — 24 小時內** | 套用 Oracle Identity Manager 緊急修補 | Oracle 計畫外緊急發布 |
| **P1 — 24 小時內** | 更新 Roundcube Webmail | CERT-SE/CERT-FR 緊急警報 |
| **P2 — 72 小時內** | 盤點 Cisco 防火牆設備完整性 | Interlock 勒索軟體 |
| **P2 — 72 小時內** | 對高風險人員進行通訊安全培訓 | CISA/FBI + CERT-FR 通訊攻擊警報 |
| **P2 — 72 小時內** | 檢查 Azure Monitor 相關釣魚郵件 | Azure Monitor 回撥釣魚 |
| **P2 — 72 小時內** | 檢查 Magento/Adobe Commerce 修補狀態 | PolyShell RCE |
| **P3 — 一週內** | 處理 CERT-FR 37+ 份公告 | 常規修補週期 |
| **P3 — 一週內** | 評估 ICS/OT 環境 Schneider Electric 修補計劃 | CISA ICS 公告密集發布 |

---

## 資料限制與免責聲明

本報告基於以下資料來源與方法論，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構（CISA、CERT-FR、CERT-SE、CERT-RO、NCSC-FI、SK-CERT、TWCERT 等）公開 RSS 資料、NVD、EPSS、Exploit-DB、Nuclei Templates、abuse.ch（URLhaus、ThreatFox、MalwareBazaar）威脅情報饋送，以及 Qdrant 向量資料庫中的歷史關聯資料。不涵蓋所有威脅情資來源。

2. **時效性**：資料擷取與分析可能存在數小時至數天的延遲。部分 CISA KEV 條目的具體 CVE 詳情仍待確認。

3. **完整性**：未包含非公開威脅情報、暗網情資、付費商業情報服務（如 Recorded Future、Mandiant）、政府機密等級情報等來源。

4. **分析局限**：趨勢分析基於公開資料樣本，統計推論應謹慎解讀。Qdrant 語意搜尋結果依賴嵌入模型的語意理解能力，相似度分數反映語意接近程度而非因果關係。

5. **翻譯風險**：部分非英文來源（芬蘭語、法語、瑞典語、羅馬尼亞語、斯洛伐克語、捷克語、愛沙尼亞語）經 AI 翻譯處理，可能存在語義偏差。

6. **攻擊歸因不確定性**：
   - SharePoint CVE-2026-20963 的攻擊者身份尚未確認
   - Cisco FMC CVE-2026-20131 與 Interlock 勒索軟體的關聯性為分析推論（信心水準：中）
   - CISA/FBI 的俄羅斯歸因為高信心水準，但具體受影響帳號範圍未公開
   - LeakNet 勒索軟體的技術細節仍有限

7. **PoC 統計局限**：2,542 筆 2026 年度 PoC 統計為累計數字，並非全部在本週新增。部分 PoC 可能為重複追蹤或低品質提交。

8. **ICS/OT 資訊有限**：CISA ICS 公告的具體 CVE 和 CVSS 評分需查閱原始公告，本報告僅提供公告層級的摘要。

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源，並諮詢專業資安顧問。

---

> 下期預告：2026 第 14 週（2026-03-23 至 2026-03-30）威脅態勢分析將持續追蹤 Trivy 供應鏈攻擊的影響範圍與修復進展、俄羅斯情報機構通訊平台攻擊的國際響應、Interlock/LeakNet 勒索軟體攻擊動態、以及 Cisco 防火牆攻擊鏈的後續發展。
