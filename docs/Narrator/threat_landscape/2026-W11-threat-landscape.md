# 威脅態勢分析 — 2026 第 11 週

> 涵蓋期間：2026-03-04 至 2026-03-10
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-03-10
> 分析模型：Claude Opus

---

## 近期重大資安事件

本週資安事件延續上週**中東地緣政治衝突**餘波，同時出現多起國家級 APT 長期潛伏行動的揭露、大規模供應鏈攻擊，以及跨國執法成功打擊網路犯罪平台的正面發展。以下按嚴重程度排序。

### 1. 伊朗網路威脅持續升級：Seedworm 入侵美國關鍵基礎設施（嚴重程度：極高）

延續上週中東衝突引發的網路空間全面升級態勢，本週最嚴重的發展為伊朗 APT 組織深入美國關鍵基礎設施：

- **2026-03-05**：多份報告確認伊朗網路威脅持續回應美以軍事行動。加拿大 CCCS 發布威脅公報更新，Unit 42 與 Check Point 各自發布伊朗威脅態勢簡報，警告伊朗將以網路攻擊作為報復手段。（來源：CCCS / Unit 42 / Check Point, 2026-03-05）

- **2026-03-06**：**Seedworm / MuddyWater**（伊朗 MOIS 關聯）確認活躍於美國銀行、機場及軟體公司網路。受害組織包括為國防/航太產業供貨的以色列分支軟體公司。此為伊朗 APT 針對美國金融與交通基礎設施的最新確認案例。（來源：NCSC-FI, 2026-03-06）

- **2026-03-05**：Orange Cyberdefense / Radware 報告繼續追蹤 149 次駭客主義 DDoS 攻擊，針對 16 個國家 110 個組織（Operation Epic Fury / Roaring Lion），53% 攻擊導向政府機構。（來源：Orange Cyberdefense / Radware, 2026-03-05）

**Qdrant 跨層關聯分析**：語意查詢「Iranian cyber threat active exploitation March 2026」回傳 10 筆高度相關結果（相似度 0.58-0.68），確認自 2026 年 2 月底以來伊朗相關網路威脅活動為近年最密集的爆發期。歷史比對顯示，2025 年 7 月 CCCS 已發布伊朗網路威脅公報（相似度 0.60），2026 年 1 月 Anomali 與 Halcyon 追蹤伊朗使用網路犯罪戰術的破壞性攻擊模式（相似度 0.67），目前態勢為歷史升級的持續延伸，且影響範圍已擴展至美國本土關鍵基礎設施。

### 2. 中國 APT 長期潛伏行動大規模揭露（嚴重程度：高）

本週揭露兩個獨立的中國關聯 APT 行動，顯示中國網路間諜活動在地理範圍和產業涵蓋面上持續擴展：

- **CL-UNK-1068**（2026-03-07）：Unit 42 揭露自 2020 年起**持續數年未被偵測**的攻擊叢集，以高信心評估為中國威脅行為者。目標涵蓋南亞、東南亞、東亞的**航空、能源、政府、執法、製藥、科技及電信**共七大關鍵產業，主要目的評估為網路間諜活動。長達六年的未偵測潛伏期引發嚴重關切。（來源：Palo Alto Unit 42, 2026-03-07）

- **UAT-9244 / Famous Sparrow**（2026-03-06）：Cisco Talos 揭露中國關聯 APT 自 2024 年起針對**南美洲電信基礎設施**，使用三種全新惡意軟體：TernDoor（Windows 後門）、PeerTime（利用 BitTorrent 協定的 ELF 後門）、BruteEntry（將邊緣裝置轉為大規模掃描代理節點 ORBs，暴力破解 SSH、Postgres 和 Tomcat 伺服器）。（來源：Cisco Talos, 2026-03-06）

### 3. 俄羅斯—烏克蘭持續網路攻擊（嚴重程度：高）

- **BadPaw / MeowMeow 新惡意軟體**（2026-03-05）：ClearSky 記錄疑似俄羅斯間諜攻擊活動，以偽造烏克蘭邊境通行許可文件的 ZIP 壓縮檔進行魚叉式釣魚 <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a>，投遞新型載入器「BadPaw」及精密後門「MeowMeow」，允許攻擊者存取受感染系統及操控本機檔案。（來源：The Record / ClearSky, 2026-03-05）

- **UAC-0252 竊密行動**：延續上週報告，CERT-UA 追蹤的 UAC-0252 持續以釣魚郵件偽裝烏克蘭政府機關，部署 SHADOWSNIFF 和 SALATSTEALER 竊密軟體 [T1003](https://attack.mitre.org/techniques/T1003/){: .ttp-ref }，目標為軍民系統行動應用程式的憑證。（來源：CERT-UA, 2026-03-02，本週持續活躍）

- **芬蘭攝影機間諜事件**（2026-03-03 / 2026-03-09）：俄羅斯駭客主義團體聲稱入侵芬蘭家庭攝影機進行監視。NCSC-FI 發布兩次警告，與上週 WIRED 報導的「攝影機入侵成為戰爭標準作戰手冊」趨勢一致。（來源：NCSC-FI, 2026-03-03/09）

### 4. 亞太地區 APT 行動（嚴重程度：高）

- **APT36 / Transparent Tribe「Vibeware」**（2026-03-06）：Bitdefender 揭露巴基斯坦關聯 APT36 轉向 AI 驅動的「Vibeware」惡意軟體開發模式，使用 AI 大量產生中等品質的惡意軟體植體，搭配 Nim、Zig、Crystal 等冷門程式語言規避偵測。利用 Slack、Discord、Supabase、Google Sheets 作為 C2 通道 <a href="https://attack.mitre.org/techniques/T1071/001/" class="ttp-badge" target="_blank">T1071.001</a>。（來源：Bitdefender, 2026-03-06）

- **Dust Specter**（2026-03-03）：Zscaler 揭露疑似伊朗關聯 APT 針對伊拉克政府官員，使用四種全新惡意軟體家族：SPLITDROP（投放器）、TWINTASK（後門）、TWINTALK（後門）、GHOSTFORM（RAT），具備雙重攻擊鏈架構。（來源：Zscaler, 2026-03-03）

### 5. 供應鏈攻擊與軟體生態系統安全（嚴重程度：高）

本週供應鏈攻擊從多個向量同時爆發，標誌軟體供應鏈系統性風險的持續惡化：

- **BoryptGrab Stealer — GitHub 大規模惡意操作**（2026-03-09）：透過 100+ 個 GitHub 存儲庫分發竊密軟體。（來源：Multiple, 2026-03-09）

- **偽造 OpenClaw GitHub 安裝器**（2026-03-06）：Huntress 調查發現偽造 GitHub 存儲庫分發 GhostSocks 和資訊竊取器，GhostSocks 可路由受害系統流量繞過反詐騙偵測。（來源：Huntress, 2026-03-06）

- **Wikipedia 自傳播 JavaScript 蠕蟲**（2026-03-07）：自傳播 JS 蠕蟲 <a href="https://attack.mitre.org/techniques/T1059/" class="ttp-badge" target="_blank">T1059</a> 修改使用者腳本並破壞 Meta-Wiki 頁面，工程團隊暫時限制跨專案編輯權限。雖嚴重程度為中，但展示了平台自動化功能被武器化的風險。（來源：NCSC-FI / BleepingComputer, 2026-03-07）

- **NPM 大規模感染**：延續上週 SK-CERT 警告，18 個 NPM 套件遭入侵，涉及每週超過 26 億次下載量的套件。（來源：SK-CERT / Aikido, 2026-03-07）

- **簽署惡意軟體偽裝工作場所 App**（2026-03-05）：Microsoft 報告使用 EV 憑證（TrustConnect Software PTY LTD）簽署的惡意軟體偽裝工作場所應用程式，部署 RMM 後門 [T1021](https://attack.mitre.org/techniques/T1021/){: .ttp-ref }。EV 憑證的濫用持續削弱程式碼簽署作為信任機制的有效性。（來源：Microsoft, 2026-03-05）

### 6. 跨國執法打擊行動（嚴重程度：高/正面）

- **Tycoon 2FA 釣魚平台關閉**（2026-03-05）：Europol EC3 協調，Microsoft 主導技術打擊，扣押 330 個核心網域。Tycoon 2FA 為訂閱制 PhaaS 平台，可攔截即時認證會話繞過 MFA <a href="https://attack.mitre.org/techniques/T1566/" class="ttp-badge" target="_blank">T1566</a>。此為近年最大規模的釣魚即服務平台關閉行動。（來源：Europol / Microsoft, 2026-03-05）

- **LeakBase 駭客論壇拆除**（2026-03-05）：美國 DOJ 主導，Europol 協調，14 國同步行動關閉全球最大駭客論壇之一，該論壇擁有 14.2 萬會員、21.5 萬訊息，儲存數億組帳號憑證。（來源：U.S. DOJ, 2026-03-05）

### 7. 其他重大事件

| 日期 | 事件 | 來源 | 嚴重程度 |
|------|------|------|----------|
| 2026-03-04 | XWorm 惡意軟體多技術投遞攻擊新一波活動 | SANS ISC | 中 |
| 2026-03-06 | 惡意 AI 助手瀏覽器擴充功能從 ChatGPT/DeepSeek 竊取 LLM 對話記錄，影響 90 萬安裝、2 萬+企業租戶 | Microsoft Defender | 高 |
| 2026-03-06 | 偽造 LastPass 支援郵件試圖竊取保險庫密碼 | BleepingComputer | 中 |
| 2026-03-06 | 威脅行為者濫用 .arpa TLD 建立 A 記錄，利用 Hurricane Electric/Cloudflare DNS 信譽 | Infoblox | 中 |
| 2026-03-01 | QuickLens Chrome 擴充功能竊取加密貨幣，展示 ClickFix 攻擊模式 | Multiple | 中 |
| 2026-03-06 | CERT.hr 警告克羅埃西亞公司遭偽造網站攻擊 | CERT.hr | 中 |
| 2026-03-09 | ShinyHunters 勒索軟體組織違反「榮譽守則」——收取贖金後仍出售資料 | Multiple | 高 |

---

## 漏洞趨勢分析

### 本週新增漏洞概況

本週漏洞追蹤系統收錄資料概覽：

- **vulnerability_tracking 新增**：Critical/High 13 筆、Medium 2 筆、Low/Info 22 筆
- **security_news_facts/vulnerability_disclosure**：本週 30+ 個新揭露漏洞報告

**CISA KEV 新增**（本週共 8 個）：

- **2026-03-05**：新增 5 個已知遭利用漏洞
  - **CVE-2017-7921**：Hikvision 多產品不當認證漏洞（歷史漏洞首次加入 KEV，反映持續利用）
  - **CVE-2021-22681**：Rockwell 多產品憑證保護不足漏洞（ICS 環境，Critical）
  - **CVE-2021-30952**：Apple 多產品整數溢位漏洞（tvOS, macOS, Safari, iPadOS, watchOS）
  - **CVE-2023-41974**：Apple iOS/iPadOS Use-After-Free 漏洞（核心權限任意程式碼執行）
  - **CVE-2023-43000**：Apple 多產品 Use-After-Free 漏洞（macOS, iOS, iPadOS, Safari）

- **2026-03-09**：新增 3 個已知遭利用漏洞
  - **CVE-2021-22054**：Omnissa Workspace ONE Access SSRF 漏洞（High，歷史漏洞回歸利用）
  - **CVE-2025-26399**：SolarWinds Web Help Desk 反序列化 RCE 漏洞（**Critical，修補截止日 2026-03-12，極緊急**）
  - **CVE-2026-1603**：Ivanti Endpoint Manager 認證繞過漏洞

**零日漏洞與 Critical 漏洞**：

- **CVE-2026-29000**（CVSS 10.0）：Java pac4j-jwt JwtAuthenticator 完全認證繞過漏洞，攻擊者可透過惡意 JWT 冒充任何使用者包括管理員。此漏洞影響所有使用 pac4j JWT 認證的 Java 應用程式，CVSS 滿分反映其嚴重性。（來源：CERT.hr, 2026-03-06）

- **Cisco FMC 嚴重漏洞**（CVE-2026-20079、CVE-2026-20131）：Cisco Firewall Management Center 多個嚴重漏洞，影響企業防火牆管理平面。（來源：CERT-FR / CERT-RO, 2026-03-05）

### 按廠商/產品分布

| 廠商/產品 | 公告數量 | 嚴重程度 | 備註 |
|-----------|----------|----------|------|
| **Cisco** | 3+ | Critical | FMC (CVE-2026-20079/20131)、CERT-FR 多漏洞公告 |
| **Apple** | 3 (KEV) | High | CVE-2021-30952、CVE-2023-41974、CVE-2023-43000（均已被積極利用） |
| **SolarWinds** | 1 (KEV) | Critical | CVE-2025-26399 WHD 反序列化 RCE，**修補截止 2026-03-12** |
| **Ivanti** | 1 (KEV) | High | CVE-2026-1603 EPM 認證繞過 |
| **Omnissa/VMware** | 1 (KEV) | High | CVE-2021-22054 Workspace ONE SSRF |
| **Google** | 3+ | High | Android 3 月安全公告、Pixel 漏洞、Chrome 多漏洞 |
| **Docker** | 1+ | High | Desktop 多漏洞（CERT-FR） |
| **HPE Aruba** | 1 | High | AOS 多漏洞 |
| **Rockwell** | 1 (KEV) | Critical | CVE-2021-22681 ICS 憑證保護不足 |
| **pac4j** | 1 | Critical (10.0) | CVE-2026-29000 JWT 認證繞過 |
| **Delta Electronics** | 1 | High (7.8) | CNCSoft-G2 DOPSoft 元件 RCE |
| **Tenable** | 1 | High | Nessus Manager 漏洞 |
| **Linux Kernel** | 多個 | 中-高 | Red Hat、SUSE、Ubuntu 公告（CERT-FR） |
| **IBM** | 多個 | 中-高 | CERT-FR 公告 |
| **Nextcloud / SPIP / Zabbix** | 各 1 | 中-高 | CERT-FR 公告 |

### ICS/OT 漏洞

本週工業控制系統安全公告：

- **Rockwell Automation 多產品** (CVE-2021-22681)：ICS 環境憑證保護不足，已加入 KEV，Critical 等級
- **Delta Electronics CNCSoft-G2** (ICSA-26-064-01)：DOPSoft 元件 RCE，CVSS 7.8
- **Moxa 產品**：多個高嚴重程度漏洞影響工業網路設備

### 零日趨勢（Google 年度回顧延續分析）

延續上週 Google 發布的 2025 年零日利用年度回顧，本週值得強調的趨勢：

- **企業技術零日利用佔比（48%）創歷史新高**，近乎佔所有零日的一半
- **邊緣裝置和安全設備**仍為國家支持間諜組織的首選目標
- 本週 CISA KEV 新增的 CVE-2025-26399（SolarWinds WHD）和 CVE-2026-1603（Ivanti EPM）正好印證此趨勢——攻擊者持續瞄準企業管理和端點產品

**Qdrant 跨層關聯分析**：語意查詢「critical vulnerability remote code execution actively exploited」回傳 10 筆結果（相似度 0.67-0.75），顯示 2026 年 RCE 類漏洞持續為高優先威脅。最高相似度結果為 CVE-2026-28775（未認證 RCE，相似度 0.75），其次為「React2Shell」CVE-2025-55182 大規模積極利用（相似度 0.70）、SmarterMail RCE 活躍利用（相似度 0.70）。歷史比對確認，RCE 漏洞從揭露到被積極利用的時間窗口持續縮短，本週 CVE-2025-26399 的 3 天修補截止日（2026-03-12）即為極端案例。

---

## 活躍利用與 PoC 動態

### CISA KEV 更新

本週 CISA 新增 **8 個** 已知遭積極利用漏洞至 KEV 目錄：

| 日期 | CVE | 產品 | 類型 | 嚴重程度 | 修補截止 |
|------|-----|------|------|----------|----------|
| 2026-03-05 | CVE-2017-7921 | Hikvision 多產品 | 不當認證 | High | — |
| 2026-03-05 | CVE-2021-22681 | Rockwell 多產品 | 憑證保護不足 | Critical | — |
| 2026-03-05 | CVE-2021-30952 | Apple 多產品 | 整數溢位 | High | — |
| 2026-03-05 | CVE-2023-41974 | Apple iOS/iPadOS | Use-After-Free | High | — |
| 2026-03-05 | CVE-2023-43000 | Apple 多產品 | Use-After-Free | High | — |
| 2026-03-09 | CVE-2021-22054 | Omnissa Workspace ONE | SSRF | High | — |
| 2026-03-09 | CVE-2025-26399 | SolarWinds WHD | 反序列化 RCE | **Critical** | **2026-03-12** |
| 2026-03-09 | CVE-2026-1603 | Ivanti EPM | 認證繞過 | High | — |

**重要觀察**：本週 KEV 新增漏洞中有 3 個為歷史漏洞（2017、2021、2023 年），反映攻擊者持續利用未修補的舊系統。CVE-2025-26399 的修補截止日僅距新增日 3 天（2026-03-12），為本季最短修補期限之一。

### 積極利用中的漏洞

| 漏洞 | 利用者 | 目標 | 狀態 |
|------|--------|------|------|
| CVE-2025-26399 (SolarWinds WHD) | 不明 | IT 服務台部署 | **Critical，修補截止 2026-03-12** |
| CVE-2026-1603 (Ivanti EPM) | 不明 | 端點管理系統 | 已加入 KEV |
| CVE-2021-22054 (Omnissa) | 不明 | Workspace ONE 部署 | 歷史漏洞回歸利用 |
| CVE-2026-29000 (pac4j JWT) | 不明 | Java 應用程式 | CVSS 10.0，修補可用 |
| CVE-2026-20079/20131 (Cisco FMC) | 不明 | 企業防火牆管理 | 修補可用 |

### 新公開 PoC / Exploit 動態

- **exploit_intelligence Layer 統計**：本週新增 PoC 可用記錄，涵蓋多個 Exploit-DB 提交
- **ExploitDB 新增 PoC**：
  - PHPIPam 1.5.1 SQLi、PHPIPam 1.6 Reflected XSS
  - phpMyFAQ 2.9.8 CSRF、phpMyFAQ 3.1.7 Reflected XSS
  - Piwigo 13.6.0 SQLi
  - Pluck CMS 4.7.7/4.7.10 PHP 程式碼執行與檔案上傳
  - RosarioSIS 6.7.2 XSS
  - WordPress Quiz Maker 6.7.0.56 SQLi
  - OpenSIS CE 8.0 SQLi
  - OpenRepeater 2.1 OS 命令注入
  - Windows Server 2025 Hyper-V EoP
  - FreeBSD rtsold 1.5 RCE（DNSSL）
  - D-Link DIR-825 堆疊溢位 DoS

---

## 攻擊手法歸納

### 分類統計

依 MITRE ATT&CK 框架歸納本週觀察到的主要攻擊技術：

#### 初始存取 (Initial Access)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 釣魚攻擊 | <a href="https://attack.mitre.org/techniques/T1566/" class="ttp-badge" target="_blank">T1566</a> | 8+ | Tycoon 2FA PhaaS（已關閉）、LastPass 釣魚、芬蘭稅務釣魚 |
| 釣魚：惡意附件 | <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a> | 4+ | BadPaw/MeowMeow 烏克蘭邊境文件誘餌、UAC-0252 (SHADOWSNIFF/SALATSTEALER)、Dust Specter、中東衝突主題 PDF 誘餌 |
| 釣魚：惡意連結 | <a href="https://attack.mitre.org/techniques/T1566/002/" class="ttp-badge" target="_blank">T1566.002</a> | 4+ | QuickLens Chrome 擴充功能、惡意 AI 助手擴充功能、LastPass 支援詐騙、BoryptGrab GitHub 連結 |
| 供應鏈攻擊 | <a href="https://attack.mitre.org/techniques/T1195/" class="ttp-badge" target="_blank">T1195</a> | 5+ | NPM 大規模感染（26 億/週下載）、OpenClaw GitHub 偽造、BoryptGrab 100+ repos、惡意 AI 助手擴充功能、簽署惡意軟體 |
| 利用公開應用程式 | <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> | 3+ | SolarWinds WHD (CVE-2025-26399)、Omnissa Workspace ONE (CVE-2021-22054)、Ivanti EPM (CVE-2026-1603) |

#### 執行 (Execution)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 命令與腳本直譯器 | <a href="https://attack.mitre.org/techniques/T1059/" class="ttp-badge" target="_blank">T1059</a> | 4+ | Wikipedia JS 蠕蟲（JavaScript）、XWorm 多技術投遞、APT36 Vibeware（Nim/Zig/Crystal） |
| 使用者執行：惡意檔案 | [T1204.002](https://attack.mitre.org/techniques/T1204/002/){: .ttp-ref } | 5+ | BadPaw ZIP、ClickFix (QuickLens)、BoryptGrab、Dust Specter |

#### 持久性 (Persistence)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 瀏覽器擴充功能 | <a href="https://attack.mitre.org/techniques/T1176/" class="ttp-badge" target="_blank">T1176</a> | 3 | 惡意 AI 助手（90 萬安裝、2 萬+企業租戶）、QuickLens 加密貨幣竊取 |
| 遠端存取工具 | <a href="https://attack.mitre.org/techniques/T1021/" class="ttp-badge" target="_blank">T1021</a> | 2+ | 簽署 RMM 後門（EV 憑證濫用）、Seedworm Dindoor |

#### 憑證存取 (Credential Access)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 作業系統憑證傾印 | <a href="https://attack.mitre.org/techniques/T1003/" class="ttp-badge" target="_blank">T1003</a> | 3+ | SHADOWSNIFF、SALATSTEALER (UAC-0252)、BoryptGrab Stealer |
| 輸入攫取 | [T1056](https://attack.mitre.org/techniques/T1056/){: .ttp-ref } | 2+ | 惡意 AI 擴充功能竊取 LLM 對話、LastPass 釣魚竊取保險庫密碼 |

#### 命令與控制 (C2)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 應用層協定：Web 服務 | <a href="https://attack.mitre.org/techniques/T1071/001/" class="ttp-badge" target="_blank">T1071.001</a> | 3+ | APT36 (Slack/Discord/Supabase/Google Sheets)、GhostSocks、C2 基礎設施 |
| 非標準協定 | [T1095](https://attack.mitre.org/techniques/T1095/){: .ttp-ref } | 1 | PeerTime (BitTorrent C2)—UAT-9244 |
| 取得基礎設施 | <a href="https://attack.mitre.org/techniques/T1583/" class="ttp-badge" target="_blank">T1583</a> | 2+ | .arpa TLD DNS 濫用、BoryptGrab GitHub 基礎設施 |

#### 影響 (Impact)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 資料加密勒索 | <a href="https://attack.mitre.org/techniques/T1486/" class="ttp-badge" target="_blank">T1486</a> | 持續 | 勒索軟體支付停滯但攻擊數量升級；ShinyHunters 違反「榮譽守則」 |
| 網路拒絕服務 | <a href="https://attack.mitre.org/techniques/T1498/" class="ttp-badge" target="_blank">T1498</a> | 149+ | Operation Epic Fury / Roaring Lion 駭客主義 DDoS（16 國） |
| 竄改 | [T1491](https://attack.mitre.org/techniques/T1491/){: .ttp-ref } | 1+ | Wikipedia JavaScript 蠕蟲頁面破壞 |

### IoC 趨勢（abuse.ch 資料）

本週 threat_feeds Layer 觀察到的指標量：

| 類別 | 本週新增 | 趨勢 |
|------|----------|------|
| C2 基礎設施 | 9 筆 | AsyncRAT、Cobalt Strike、DCRat、Empire Downloader 持續活躍 |
| IoC 指標 | 1,841 筆 | 竊密軟體相關 IoC 為主（StrelaStealer、SalatStealer、Stealc、LummaStealer） |
| 惡意 URL | 1,229 筆 | 釣魚和惡意軟體分發 URL 持續大量新增 |
| 惡意軟體樣本 | 656 筆 | **Mirai 家族仍佔絕對多數**，其次為 GCleaner、Gafgyt |

### 惡意軟體家族分布（threat_feeds 樣本分析）

| 家族 | 類型 | 本週動態 |
|------|------|----------|
| **Mirai** / **Gafgyt** / **Hajime** | IoT 殭屍網路 | 持續佔惡意軟體樣本最大比例 |
| **AsyncRAT** / **DCRat** | 遠端存取木馬 | C2 持續活躍，多個新增 IoC |
| **LummaStealer** / **Stealc** / **SalatStealer** / **StrelaStealer** | 竊密軟體 | 憑證竊取主要威脅，ThreatFox 持續收錄新樣本 |
| **XWorm** | RAT/資訊竊取 | 本週 SANS ISC 報告多技術投遞方式 |
| **GhostSocks** | 代理/反偵測 | 透過偽造 GitHub 存儲庫分發 |
| **BadPaw / MeowMeow** | 載入器/後門 | 俄羅斯 APT 新型惡意軟體家族 |
| **BoryptGrab** | 竊密軟體 | 大規模 GitHub 操作（100+ repos） |

**Qdrant 跨層關聯分析**：語意查詢「ransomware supply chain attack trends 2026」回傳 10 筆結果（相似度 0.56-0.66），確認勒索軟體與供應鏈攻擊持續為 2026 年雙軌主要威脅。最高相關結果為加拿大 CCCS 的「Ransomware Threat Outlook 2025-2027」（相似度 0.66），其次為 Chainalysis 報告的「勒索軟體支付連續第二年停滯但攻擊數量升級」（相似度 0.64）。歷史比對顯示，2023-2024 年勒索軟體已出現新型態（新行為者和操作方式），2026 年趨勢為：支付意願下降但攻擊頻率不減，ShinyHunters 違反「榮譽守則」（收取贖金後仍出售資料）更進一步侵蝕受害者的支付動機。

---

## 新興威脅識別

### 1. AI 驅動的「Vibeware」惡意軟體開發模型——攻擊方的「以量取勝」轉型（信心水準：高）

**首次出現**：APT36 (Transparent Tribe) 從現成惡意軟體轉向 AI 驅動的「Vibeware」開發模式，使用 AI 大量產生中等品質的惡意軟體植體。搭配 Nim、Zig、Crystal 等冷門程式語言規避標準偵測引擎。此模式預示國家級 APT 可能從「少量高品質」轉向「大量中品質」的惡意軟體策略，對防禦端的簽名檢測造成規模性壓力。

**跨事件關聯**：Google 報告的「AI as Tradecraft」（2026-03-07）分析威脅行為者如何將 AI 作為加速器和武器使用；加拿大 CCCS 與五國聯合發布 AI/ML 供應鏈安全指導（2026-03-05）和 Top 10 AI 安全行動（2026-03-05），顯示攻防雙方在 AI 領域的軍備競賽正式展開。三份報告共同指向 **AI 在網路威脅生態系統中角色的顯著提升**。

**防禦啟示**：傳統基於簽名的偵測將面臨 AI 產生變體的數量壓力。組織需加速部署行為分析和異常偵測能力。

### 2. 惡意 AI 助手瀏覽器擴充功能——企業 AI 採用的盲點（信心水準：高）

**攻擊面擴展**：Microsoft Defender 發現偽裝為 AI 助手的 Chromium 擴充功能，針對性竊取 ChatGPT 和 DeepSeek 對話記錄。90 萬安裝量、2 萬+企業租戶受影響。暴露的資料類型包括專有程式碼、內部工作流程、策略討論和機密資料。

**新興風險面**：企業大規模採用 AI 工具但缺乏對應的安全控制，創造了竊取高價值智慧財產的新路徑。結合 APT36 的 AI 驅動惡意軟體開發、AI/ML 供應鏈安全聯合指導，本週的多個信號共同指向 **AI 工具生態系統正成為攻擊者的高優先目標**。

### 3. GitHub 平台成為大規模惡意軟體分發基礎設施（信心水準：高）

**升級跡象**：本週觀察到至少三起利用 GitHub 的攻擊：
- BoryptGrab Stealer 透過 100+ 個 GitHub 存儲庫分發竊密軟體
- 偽造 OpenClaw 安裝器分發 GhostSocks 和資訊竊取器
- NPM 套件感染影響生態系統

GitHub 作為軟體供應鏈的核心節點，其信譽正被攻擊者系統性地利用。從個別偽造存儲庫到百個存儲庫的規模化操作，標誌攻擊者將開源平台當作「惡意軟體分發即服務」基礎設施。

**跨層關聯**：結合上週 InstallFix 惡意廣告（複製開發者工具安裝指南網站），開發者工具的安裝/更新流程正從多個向量被攻擊：偽造 GitHub 存儲庫、搜尋引擎惡意廣告、套件管理器感染。

### 4. 勒索軟體「榮譽守則」崩壞——ShinyHunters 雙重違約（信心水準：高）

**新動態**：ShinyHunters 勒索軟體組織在收取贖金後仍出售受害者資料，打破勒索軟體生態系統中「付錢即刪除」的隱含契約。

**趨勢分析**：結合 Chainalysis 報告的「勒索軟體支付連續第二年停滯」趨勢，此事件可能加速支付意願的下降，但也意味著攻擊者將更傾向「不問支付意願，直接變賣資料」的模式。勒索軟體從「加密勒索」→「雙重勒索（加密+洩露）」→「三重勒索（加密+洩露+賣資料）」的演化正在發生。

### 5. .arpa TLD 濫用——DNS 基礎設施信任假設的崩壞（信心水準：高）

**首次出現**：Infoblox 揭露威脅行為者透過取得 IPv6 位址空間、在反向 DNS 名稱下建立 A 記錄來濫用 .arpa TLD <a href="https://attack.mitre.org/techniques/T1583/" class="ttp-badge" target="_blank">T1583</a>。利用 Hurricane Electric 和 Cloudflare 的良好信譽，以及安全產品對 .arpa 域名「不應承載內容」的假設來規避偵測。

**影響**：此攻擊手法利用了 DNS 基礎設施的結構性假設，屬於新型的信譽劫持技術。防禦端需要更新對「安全」TLD 的假設，將 .arpa 納入監控範圍。

### 6. 歷史漏洞的「長尾利用」——KEV 持續收錄舊 CVE（信心水準：高）

**模式觀察**：本週 CISA KEV 新增的 8 個漏洞中，有 4 個為 2017-2023 年的歷史漏洞（CVE-2017-7921、CVE-2021-22681、CVE-2021-22054、CVE-2021-30952、CVE-2023-41974、CVE-2023-43000）。攻擊者持續利用未修補的舊系統，尤其是 IoT（Hikvision）和 ICS（Rockwell）環境。

**啟示**：「修補最新漏洞」不等於「安全」。組織必須維護完整的資產清單並確保歷史漏洞也已修補，特別是在 IoT/ICS 環境中修補週期通常較長的場景。

### 7. 中國 APT 跨洲際電信基礎設施攻擊的地理擴展（信心水準：高）

**模式擴展**：本週揭露的 CL-UNK-1068（亞洲七大產業）和 UAT-9244（南美電信）共同顯示中國網路間諜活動在地理範圍上的顯著擴展。從傳統的東亞/東南亞目標擴展到南美洲電信基礎設施，且使用創新的 C2 技術（BitTorrent 協定、邊緣裝置 ORBs），反映操作安全意識的提升。

**預測**（推測）：基於此趨勢，非洲和中東的電信基礎設施可能成為下一階段目標，特別是在一帶一路相關國家。此預測信心水準為「中」，基於地緣政治模式推斷。

---

## 產業動態補充

### 勒索軟體支付停滯但攻擊升級

Chainalysis 報告（2026-03-01）顯示勒索軟體總支付金額連續第二年停滯，但攻擊數量持續上升。結合 ShinyHunters 違反「榮譽守則」的行為，勒索軟體經濟模型正在轉變：
- 受害者支付意願下降（因支付後資料仍被出售的案例增加）
- 攻擊者轉向更高頻率、更低單價的攻擊
- 資料本身的出售價值可能超過贖金收入

### AI 安全雙軌發展

本週 AI 安全議題從攻防兩面同時升溫：
- **攻擊端**：APT36 Vibeware、惡意 AI 擴充功能竊取 LLM 對話、AI as Tradecraft 報告
- **防禦端**：六國聯合 AI/ML 供應鏈安全指導（2026-03-05）、Top 10 AI 安全行動（2026-03-05）、Google 破壞性攻擊防禦指南 2026 版

### 拉丁美洲網路攻擊倍增

延續上週 Check Point 報告，拉丁美洲每週約 3,100 次網路威脰，為美國的兩倍多。本週 UAT-9244 對南美電信的攻擊進一步凸顯該地區的脆弱性。

### MFA 覆蓋缺口

分析揭示組織透過 Entra ID、Okta、Google Workspace 部署 MFA 有效保護雲端應用，但許多 Windows 登入仍依賴 Active Directory 認證路徑，從未觸發 MFA 提示。Tycoon 2FA PhaaS 的關閉是正面發展，但 MFA 的架構性缺口仍需關注。

### EU 法院顧問：銀行應退還釣魚受害者損失

2026-03-09，EU 法院顧問建議銀行必須退還網路釣魚受害者的損失。此法律觀點若被採納，將對歐洲金融機構的網路安全投資動機產生重大影響，可能加速反釣魚技術的採用。

### 技術工具更新

- **YARA-X 1.14.0 發布**：惡意軟體分析核心工具的重要更新
- **Wireshark 4.6.4 發布**（2026-03-02）：網路分析工具安全更新

---

## 資料限制與免責聲明

1. **來源偏差**：本報告主要依賴歐洲（NCSC-FI、CERT-FR、SK-CERT、CERT-UA、CERT.hr、CERT-RO）和北美（CISA、CCCS）CERT/安全機構的 RSS 饋送，以及 Palo Alto Unit 42、Cisco Talos、Check Point、Zscaler、Bitdefender 等安全廠商報告。對亞太、非洲地區的覆蓋程度較低。部分非英語來源（斯洛伐克語、芬蘭語、法語、克羅埃西亞語、愛沙尼亞語）的細節可能因翻譯或摘要截斷而有所缺失。

2. **時效性**：本報告反映截至 2026-03-10 的已公開資訊。部分事件的技術細節可能在報告產出後才獲得完整披露。

3. **威脅情報歸因**：APT 歸因基於各安全廠商的評估。CL-UNK-1068 的中國歸因為「高信心」（Unit 42）；Dust Specter 的伊朗歸因為「中至高信心」（Zscaler）；BadPaw/MeowMeow 的俄羅斯歸因為「中信心」（ClearSky）。歸因結論可能隨後續調查而調整。

4. **threat_feeds 統計**：本週新增——惡意 URL 1,229 筆、惡意軟體樣本 656 筆、IoC 指標 1,841 筆、C2 基礎設施 9 筆。數據來自 abuse.ch 等開源情報饋送。

5. **vulnerability_tracking 統計**：本週新增——Critical/High 13 筆、Medium 2 筆、Low/Info 22 筆。

6. **Qdrant 語意查詢**：語意查詢結果基於向量相似度，可能包含語意相近但時間範圍不同的結果。所有跨層關聯分析已標註相似度分數供參考。本報告共執行 3 次 Qdrant 語意查詢，回傳 30 筆相關結果。

7. **預測性聲明**：新興威脅識別中標註為「推測」的內容為基於現有資料的趨勢推斷，非確認的事實。信心水準分級（高/中/低）反映推斷的可靠程度。

8. **免責聲明**：本報告僅供資安態勢感知和研究參考用途，不構成任何特定組織的風險評估或安全建議。各組織應根據自身情境和暴露面進行獨立評估。重大安全決策請結合多方情資來源。

---

> 本報告由資訊安全產業智慧分析系統自動產出，資料來源涵蓋 NCSC-FI、CERT-UA、CERT-FR、SK-CERT、CERT.hr、CERT-RO、CISA、SANS ISC、CCCS、abuse.ch (MalwareBazaar/ThreatFox/URLhaus)、Unit 42、Cisco Talos、Check Point、Zscaler、Bitdefender、Microsoft Defender、Europol 等國際安全機構與開源情報饋送。Qdrant 語意查詢用於跨 Layer 關聯分析，共執行 3 次查詢，回傳 30 筆相關結果。
