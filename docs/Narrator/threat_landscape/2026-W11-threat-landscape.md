# 威脅態勢分析 — 2026 第 11 週

> 涵蓋期間：2026-03-04 至 2026-03-11
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-03-11
> 分析模型：Claude Opus

---

## 近期重大資安事件

本週資安事件以**大規模 SaaS 平台資料竊取、國家級加密通訊釣魚攻擊、中國 APT 中東部署**為三大焦點，同時伊朗 APT 持續滲透美國關鍵基礎設施、多起供應鏈攻擊延續上週趨勢，以及國際執法行動的正面發展。以下按嚴重程度排序。

### 1. ShinyHunters 聲稱透過 Salesforce 竊取約百家企業資料（嚴重程度：極高）

**事件摘要**：知名資料竊取集團 ShinyHunters 於 2026-03-10 聲稱成功透過 Salesforce 平台漏洞或配置缺陷，竊取約 100 家企業的敏感資料。點名受害者包括 **Snowflake、Okta、LastPass、Sony、AMD** 等高知名度科技企業。

**影響範圍**：若聲明屬實，此事件將構成 2026 年迄今最大規模的 SaaS 供應鏈資料外洩事件。受害企業涵蓋雲端基礎設施（Snowflake）、身分認證（Okta、LastPass）、半導體（AMD）及消費電子（Sony）等多個關鍵產業。透過單一 SaaS 平台入口點同時影響約百家企業的模式，代表「平台級」攻擊的風險具現化。

**時間線**：
- 2026-03-10：ShinyHunters 在暗網論壇公開聲明並列出受害企業名單
- 截至報告產出時，各受害企業尚未全部確認或否認

> **信心水準：中** — ShinyHunters 聲明尚待各受害企業獨立確認。該集團過去有誇大攻擊規模的紀錄，但也有多次證實屬實的案例（包括 2024 年 Snowflake 事件）。此事件同時與本週另一則報導——ShinyHunters 違反「榮譽守則」（收取贖金後仍出售資料）——共同反映該組織操作模式的激進化。

**Qdrant 跨層關聯分析**：語意查詢「ShinyHunters data breach cloud platform SaaS supply chain」回傳 10 筆高度相關結果（相似度 0.54-0.68），確認 ShinyHunters 自 2020 年以來多次涉及大規模資料竊取行動。歷史比對顯示，2024 年 Snowflake 事件的攻擊模式（透過平台層級的憑證重用攻擊多租戶）與本次聲稱的 Salesforce 攻擊模式高度相似。Chainalysis 報告（相似度 0.64）指出勒索軟體支付連續第二年停滯，但攻擊數量持續上升，ShinyHunters 的雙重違約行為（收款後仍出售資料）可能加速此趨勢。

### 2. 荷蘭情報機構警告俄羅斯大規模 Signal/WhatsApp 釣魚攻擊（嚴重程度：極高）

**事件摘要**：荷蘭 AIVD（一般情報安全局）與 MIVD（軍事情報安全局）於 2026-03-10 聯合發布警告，揭露俄羅斯情報機構正在大規模針對**政府官員、記者及軍事人員**，透過 Signal 和 WhatsApp 進行精準釣魚攻擊 <a href="https://attack.mitre.org/techniques/T1566/002/" class="ttp-badge" target="_blank">T1566.002</a>。

**影響範圍**：攻擊目標涵蓋荷蘭及其他歐洲國家的政府、媒體與國防部門人員。攻擊利用加密通訊軟體的信任機制和裝置連結功能，是俄羅斯針對西方國家情報蒐集行動的顯著升級。荷蘭官方情報機構的公開警告層級極高，反映威脅的嚴重性和緊迫性。

**時間線**：
- 2026-03-10：荷蘭 AIVD/MIVD 聯合公開警告
- 攻擊活動估計自 2026 年初持續至今

**跨事件關聯**：本週同時出現芬蘭 Telegram 帳號劫持事件（利用語音信箱攔截技術），以及 W10 報告中 CERT-SE 對通訊應用程式安全建議的背景。加密通訊平台正從多個攻擊面遭受國家級系統性攻擊。

### 3. Camaro Dragon 部署 PlugX 瞄準卡達（嚴重程度：高）

**事件摘要**：中國關聯 APT 組織 Camaro Dragon（又稱 Mustang Panda / Earth Preta）於 2026-03-10 被報告正在針對卡達目標部署 PlugX 後門，活動與中東地緣政治局勢升級密切相關。

**影響範圍**：卡達作為中東關鍵外交節點和能源出口國，遭受中國 APT 針對性攻擊反映北京在中東衝突中的情報蒐集需求加劇。PlugX 為 Camaro Dragon 的標誌性工具，使用 DLL 側載技術 [T1574.002](https://attack.mitre.org/techniques/T1574/002/){: .ttp-ref } 實現持久化，搭配加密 C2 通訊 [T1573](https://attack.mitre.org/techniques/T1573/){: .ttp-ref }。

**跨層關聯**：W10 報告已記錄 UAT-9244 (Famous Sparrow) 對南美電信基礎設施的攻擊及 CL-UNK-1068 對亞洲七大關鍵產業的長期滲透。本週 Camaro Dragon 的活動進一步確認中國 APT 組織在全球範圍內——從亞洲到南美洲再到中東——的同步活躍態勢。

### 4. 伊朗網路威脅持續升級：Seedworm 入侵美國關鍵基礎設施（嚴重程度：高）

延續上週中東衝突引發的網路空間全面升級態勢，本週最嚴重的發展為伊朗 APT 組織深入美國關鍵基礎設施：

- **Seedworm / MuddyWater**（伊朗 MOIS 關聯）確認活躍於美國銀行、機場及軟體公司網路，部署新型後門「Dindoor」利用 Deno JavaScript 執行環境 [T1059.007](https://attack.mitre.org/techniques/T1059/007/){: .ttp-ref }。受害組織包括為國防/航太產業供貨的以色列分支軟體公司。Dindoor 使用「Amy Cherne」簽發的數位憑證進行偽裝 [T1553.002](https://attack.mitre.org/techniques/T1553/002/){: .ttp-ref }。（來源：NCSC-FI, 2026-03-06）

- 中東衝突驅動的駭客主義 DDoS 攻擊持續：149 次攻擊針對 16 個國家 110 個組織（Operation Epic Fury），53% 攻擊導向政府機構 <a href="https://attack.mitre.org/techniques/T1498/" class="ttp-badge" target="_blank">T1498</a>。（來源：Orange Cyberdefense / Radware, 2026-03-05）

- **CISA 與合作夥伴聯合指導**（2026-03-05）：發布 Cisco SD-WAN 利用指導，確認該漏洞正被積極利用。（來源：CISA, 2026-03-05）

### 5. Ericsson 美國資料外洩——第三方供應鏈延遲揭露（嚴重程度：高）

**事件摘要**：Ericsson 於 2026-03-10 揭露其美國業務遭受資料外洩。事件源於 **2025 年 4 月**的一次第三方服務提供商入侵 [T1199](https://attack.mitre.org/techniques/T1199/){: .ttp-ref }，經過近一年才正式公開披露。

**影響範圍**：作為全球主要電信基礎設施供應商，Ericsson 的資料外洩可能涉及 5G 網路部署細節和電信客戶敏感資訊。結合本週 UAT-9244 對南美電信基礎設施的攻擊，電信產業鏈正面臨來自多方的持續壓力。

> **注意**：從入侵發生（2025-04）到公開揭露（2026-03）長達 11 個月的延遲，引發對事件應變與通報時效的嚴重質疑。

### 6. 俄羅斯—烏克蘭持續網路攻擊（嚴重程度：高）

- **BadPaw / MeowMeow 新惡意軟體**（2026-03-05）：ClearSky 記錄疑似俄羅斯間諜攻擊活動，以偽造烏克蘭邊境通行許可文件的 ZIP 壓縮檔進行魚叉式釣魚 <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a>，投遞新型載入器「BadPaw」及精密後門「MeowMeow」。（來源：The Record / ClearSky, 2026-03-05）

- **俄羅斯團體聲稱監視芬蘭家庭攝影機**（2026-03-09）：延續 W10 報告中攝影機入侵成為戰爭「標準作戰手冊」的趨勢。（來源：NCSC-FI, 2026-03-09）

- **FortiCloud SSO Bypass 持續利用**（2026-01-22 至今）：威脅行為者利用 FortiCloud SSO 繞過漏洞（CVE-2025-59718/59597）收集 LDAP 連線字串，多個 FortiGate 裝置持續遭入侵。（來源：多來源, 2026-01/03）

### 7. 供應鏈攻擊與軟體生態系統安全（嚴重程度：高）

本週供應鏈攻擊從多個向量同時爆發：

- **BoryptGrab Stealer — GitHub 大規模惡意操作**（2026-03-09）：透過 100+ 個 GitHub 存儲庫分發竊密軟體 <a href="https://attack.mitre.org/techniques/T1195/002/" class="ttp-badge" target="_blank">T1195.002</a>。

- **偽造 OpenClaw GitHub 安裝器**（2026-03-06）：Huntress 調查發現偽造 GitHub 存儲庫分發 GhostSocks 和資訊竊取器，GhostSocks 可路由受害系統流量繞過反詐騙偵測。

- **Wikipedia 自傳播 JavaScript 蠕蟲**（2026-03-07）：自傳播 JS 蠕蟲修改使用者腳本並破壞 Meta-Wiki 頁面 <a href="https://attack.mitre.org/techniques/T1059/" class="ttp-badge" target="_blank">T1059</a>，工程團隊暫時限制跨專案編輯權限。

- **NPM 大規模感染**（延續 W10）：18 個 NPM 套件遭入侵，涉及每週超過 26 億次下載量。（來源：SK-CERT / Aikido, 2026-03-07）

- **InstallFix 惡意廣告攻擊**（2026-03-07）：攻擊者複製流行開發者工具（包括 Claude Code）的安裝指南網站 [T1583.008](https://attack.mitre.org/techniques/T1583/008/){: .ttp-ref }，透過搜尋引擎惡意廣告引導受害者安裝竊密軟體。

### 8. 跨國執法打擊行動（嚴重程度：高/正面）

- **Tycoon 2FA 釣魚平台關閉**（2026-03-05）：Europol EC3 協調，Microsoft 主導技術打擊，六國執法機構扣押 330 個核心網域。Tycoon 2FA 為訂閱制 PhaaS 平台，可攔截即時認證會話繞過 MFA。此為近年最大規模的釣魚即服務平台關閉行動。（來源：Europol / Microsoft, 2026-03-05）

- **Scattered Lapsus$ 獵人駭客聯盟**（2026-03-09）：追蹤 Lapsus$ 相關威脅行為者的持續調查行動。（來源：The Record, 2026-03-09）

### 9. 亞太地區 APT 行動（嚴重程度：高）

- **CL-UNK-1068（中國）**（2026-03-07）：Unit 42 揭露自 2020 年起**持續六年未被偵測**的攻擊叢集，目標涵蓋南亞、東南亞、東亞的航空、能源、政府、執法、製藥、科技及電信七大關鍵產業。（來源：Palo Alto Unit 42, 2026-03-07）

- **UAT-9244 / Famous Sparrow（中國）**（2026-03-06）：針對南美洲電信基礎設施，使用 TernDoor、PeerTime（BitTorrent C2 [T1095](https://attack.mitre.org/techniques/T1095/){: .ttp-ref }）、BruteEntry 三種新惡意軟體。（來源：Cisco Talos, 2026-03-06）

- **APT36 / Transparent Tribe「Vibeware」**（2026-03-06）：巴基斯坦關聯 APT 轉向 AI 驅動的大量惡意軟體開發，使用 Nim、Zig、Crystal 等冷門語言，利用 Slack、Discord、Supabase、Google Sheets 作為 C2 <a href="https://attack.mitre.org/techniques/T1071/001/" class="ttp-badge" target="_blank">T1071.001</a>。（來源：Bitdefender, 2026-03-06）

### 10. 芬蘭 Telegram 帳號劫持攻擊（嚴重程度：中高）

利用語音信箱攔截技術 [T1557](https://attack.mitre.org/techniques/T1557/){: .ttp-ref } 劫持 Telegram 帳號。攻擊者透過攔截語音驗證碼接管未啟用兩步驟驗證的帳號。在俄羅斯情報機構同時大規模攻擊 Signal/WhatsApp 的背景下，加密通訊平台的帳號安全面臨多重威脅向量。（來源：NCSC-FI, 2026-03-10）

### 11. 其他重大事件

| 日期 | 事件 | 來源 | 嚴重程度 |
|------|------|------|----------|
| 2026-03-07 | LockBit 5.0 勒索軟體跨平台能力分析 | NCSC-FI | 高 |
| 2026-03-07 | 社交工程利用雲端服務與短期憑證規避偵測 | NCSC-FI | 高 |
| 2026-03-06 | 惡意 AI 助手瀏覽器擴充功能從 ChatGPT/DeepSeek 竊取 LLM 對話，影響 90 萬安裝 | Microsoft Defender | 高 |
| 2026-03-04 | XWorm 惡意軟體多技術投遞攻擊新一波活動 | SANS ISC | 中 |
| 2026-03-06 | 偽造 LastPass 支援郵件試圖竊取保險庫密碼 | BleepingComputer | 中 |
| 2026-03-06 | 威脅行為者濫用 .arpa TLD 利用 DNS 信譽 | Infoblox | 中 |
| 2026-03-06 | CERT.hr 警告克羅埃西亞公司遭偽造網站攻擊 | CERT.hr | 中 |
| 2026-03-07 | 斯洛伐克惡意行動應用程式針對當地消費者 | SK-CERT | 中 |
| 2026-03-09 | NUKIB 2026 年 2 月捷克網路事件概覽 | NUKIB | 中 |
| 2026-03-09 | 社交工程冒充主管建立 LINE 群組進行詐騙 | TWCERT | 中 |

---

## 漏洞趨勢分析

### 本週新增漏洞概況

本週漏洞追蹤系統收錄概覽：

- **vulnerability_tracking 本週新增**：20 個漏洞追蹤條目
  - Critical/High：8 筆（Cisco FMC/ASA/FTD、Google Chrome、Drupal、IBM、Kibana）
  - Medium：2 筆（Cisco Security 其他、Dell）
  - Low/Info：10 筆（HPE、Tenable、Ubuntu/Red Hat/SUSE Kernel、Mozilla、Moxa、CISA ICS、Microsoft Edge）
- **security_news_facts/vulnerability_disclosure**：30+ 個新揭露漏洞報告

### CISA KEV 更新

本週 CISA 新增 **8 個** 已知遭積極利用漏洞至 KEV 目錄：

| 日期 | CVE | 產品 | 類型 | 嚴重程度 | 修補截止 |
|------|-----|------|------|----------|----------|
| 2026-03-05 | CVE-2017-7921 | Hikvision 多產品 | 不當認證 | High | — |
| 2026-03-05 | CVE-2021-22681 | Rockwell 多產品 | 憑證保護不足 | Critical | — |
| 2026-03-05 | CVE-2021-30952 | Apple 多產品 | 整數溢位 | High | — |
| 2026-03-05 | CVE-2023-41974 | Apple iOS/iPadOS | Use-After-Free | High | — |
| 2026-03-05 | CVE-2023-43000 | Apple 多產品 | Use-After-Free | High | — |
| 2026-03-09 | CVE-2021-22054 | Omnissa Workspace ONE Access | SSRF | High | — |
| 2026-03-09 | CVE-2025-26399 | SolarWinds Web Help Desk | 反序列化 RCE | **Critical** | **2026-03-12** |
| 2026-03-09 | CVE-2026-1603 | Ivanti Endpoint Manager | 認證繞過 | High | — |

**重要觀察**：
- 本週 KEV 新增漏洞中有 **4 個為 2017-2023 年的歷史漏洞**，反映攻擊者持續利用未修補的舊系統
- CVE-2025-26399 的修補截止日僅距新增日 **3 天**（2026-03-12），為本季最短修補期限之一，顯示 CISA 對此漏洞積極利用態勢的高度關切

### 零日漏洞與 Critical 漏洞

| CVE | CVSS | 產品 | 類型 | 來源 |
|-----|------|------|------|------|
| CVE-2026-29000 | **10.0** | pac4j-jwt JwtAuthenticator | 完全認證繞過 | CERT.hr, 2026-03-06 |
| CVE-2026-20079 | Critical | Cisco FMC | 遠端程式碼執行 | CERT-FR / CERT-RO, 2026-03-05 |
| CVE-2026-20131 | Critical | Cisco FMC/SCC | 命令注入 | CERT-FR / CERT-RO, 2026-03-05 |
| CVE-2025-26399 | Critical | SolarWinds WHD | 反序列化 RCE | CISA KEV, 2026-03-09 |

### 按廠商/產品分布

| 廠商/產品 | 公告數量 | 嚴重程度 | 備註 |
|-----------|----------|----------|------|
| **Cisco** | 5+ | Critical-High | FMC 雙重 Critical RCE、ASA/FTD、SD-WAN 持續利用 |
| **SolarWinds** | 1 (KEV) | Critical | CVE-2025-26399 WHD 反序列化 RCE，**修補截止 2026-03-12** |
| **Ivanti** | 1 (KEV) | High | CVE-2026-1603 EPM 認證繞過 |
| **Apple** | 3 (KEV) | High | 歷史漏洞回歸積極利用 |
| **Google** | 3+ | High | Chrome 漏洞、Android/Pixel 安全公告 |
| **Omnissa/VMware** | 1 (KEV) | High | CVE-2021-22054 Workspace ONE SSRF |
| **Rockwell** | 1 (KEV) | Critical | CVE-2021-22681 ICS 憑證保護不足 |
| **pac4j** | 1 | Critical (10.0) | CVE-2026-29000 JWT 認證繞過 |
| **IBM** | 多個 | High | CERT-FR 公告 |
| **Linux Kernel** | 多個 | Medium-High | Red Hat、SUSE、Ubuntu 公告 |
| **Drupal** | 1 | High | CMS 遠端程式碼執行 |
| **Elastic/Kibana** | 1 | High | 資料分析平台漏洞 |
| **Docker** | 1+ | High | Desktop 多漏洞（CERT-FR） |
| **HPE Aruba** | 1 | High | AOS 多漏洞 |
| **Delta Electronics** | 1 | High (7.8) | CNCSoft-G2 DOPSoft 元件 RCE |

### ICS/OT 漏洞

本週工控系統安全公告：

- **Rockwell Automation 多產品** (CVE-2021-22681)：ICS 環境憑證保護不足，已加入 KEV，Critical 等級
- **Delta Electronics CNCSoft-G2** (ICSA-26-064-01)：DOPSoft 元件越界寫入 RCE，CVSS 7.8
- **Moxa 產品**：多個高嚴重程度漏洞影響工業網路設備
- **Hikvision** (CVE-2017-7921)：不當認證漏洞加入 KEV，反映 IoT/監控設備歷史漏洞的持續利用

### 零日趨勢（延續 Google 2025 年度回顧）

延續 W10 Google 發布的 2025 年零日利用年度回顧：
- 企業技術零日利用佔比（48%）創歷史新高
- 邊緣裝置和安全設備仍為國家支持間諜組織首選目標
- 本週 CISA KEV 新增的 CVE-2025-26399（SolarWinds WHD）和 CVE-2026-1603（Ivanti EPM）正好印證此趨勢——攻擊者持續瞄準企業管理和端點產品

**Qdrant 跨層關聯分析**：語意查詢「critical vulnerability remote code execution actively exploited enterprise」回傳 10 筆結果（相似度 0.67-0.75），顯示 2026 年 RCE 類漏洞持續為高優先威脅。最高相似度結果涉及 Ivanti EPMM CVE-2026-1281/1340 積極利用（相似度 0.75），其次為 MS Office 零日 CVE-2026-21509（相似度 0.72）、Chrome 零日 CVE-2026-2441（相似度 0.70）。歷史比對確認，RCE 漏洞從揭露到被積極利用的時間窗口持續縮短。

---

## 活躍利用與 PoC 動態

### 本週 Exploit Intelligence 新增

本週 exploit_intelligence Layer 新增條目：

| CVE | 產品/目標 | 類型 | 嚴重程度 | 狀態 |
|-----|-----------|------|----------|------|
| **CVE-2026-27944** | Nginx UI | Path Traversal → RCE | High | PoC 可用 |
| **CVE-2025-48281** | 未指定 | SQL Injection | Medium-High | PoC 可用 |

### 積極利用中的漏洞（綜合追蹤）

| 漏洞 | 利用者 | 目標 | 本週動態 |
|------|--------|------|----------|
| CVE-2025-26399 (SolarWinds WHD) | 不明 | IT 服務台部署 | **CISA KEV 新增，修補截止 2026-03-12** |
| CVE-2026-1603 (Ivanti EPM) | 不明 | 端點管理系統 | CISA KEV 新增 |
| CVE-2021-22054 (Omnissa) | 不明 | Workspace ONE 部署 | 歷史漏洞回歸 KEV |
| CVE-2026-20079/20131 (Cisco FMC) | 不明 | 企業防火牆管理 | Critical，本週新揭露 |
| CVE-2026-29000 (pac4j JWT) | 不明 | Java 應用程式 | CVSS 10.0，持續警戒 |
| Cisco SD-WAN 零日 | 多方 | 全球 SD-WAN 部署 | CISA 聯合指導已發布 |
| FortiCloud SSO Bypass | 不明 | FortiGate 裝置 | 持續收集 LDAP 連線字串 |
| CrushFTP 多 CVE | 多方 | 企業檔案傳輸系統 | 暴力破解掃描持續活躍 |

### 新公開 PoC / Exploit 彙整

**Exploit-DB 本週新增 PoC**（部分列表）：
- PHPIPam 1.5.1 SQLi / 1.6 Reflected XSS
- phpMyFAQ 2.9.8 CSRF / 3.1.7 Reflected XSS
- Piwigo 13.6.0 SQLi
- Pluck CMS 4.7.7 PHP Code Execution / 4.7.10 File Upload
- RosarioSIS 6.7.2 XSS
- WordPress Quiz Maker 6.7.0.56 SQLi
- OpenSIS CE 8.0 SQLi
- OpenRepeater 2.1 OS Command Injection
- Windows Server 2025 Hyper-V EoP
- FreeBSD rtsold 1.5 RCE (DNSSL)
- D-Link DIR-825 2.10 Stack Buffer Overflow DoS
- Docker Desktop 4.44.3 API Exposure
- aiohttp 3.9.1 Path Traversal
- Ingress NGINX v1.11.1 FD Injection RCE
- WordPress Backup Migration 1.3.7 RCE

**Nuclei Templates 新增**：CVE-2026-27971、CVE-2026-10681、CVE-2026-11001、CVE-2026-21436、CVE-2026-22785、CVE-2026-23885、CVE-2026-2750/2751、CVE-2026-27637、CVE-2026-2848、CVE-2022-1453

### 與 L2 漏洞的交叉關聯

Cisco FMC 漏洞 (CVE-2026-20079/CVE-2026-20131) 同時出現在 vulnerability_tracking（L2）和 security_news_facts/vulnerability_disclosure（L1），且 CERT-RO 與 CERT-FR 同步發布公告，顯示該漏洞被多國安全機構視為高優先處置事項。CVE-2025-26399（SolarWinds WHD）同時出現在 exploit_intelligence/active_exploitation（L3）和 CISA KEV（L1），交叉驗證其積極利用狀態。

---

## 攻擊手法歸納

### 分類統計

依 MITRE ATT&CK 框架歸納本週觀察到的主要攻擊技術：

#### 初始存取 (Initial Access)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 釣魚：惡意連結 | <a href="https://attack.mitre.org/techniques/T1566/002/" class="ttp-badge" target="_blank">T1566.002</a> | 7+ | **俄羅斯 Signal/WhatsApp 大規模釣魚**、InstallFix 惡意廣告、LastPass 釣魚、社交工程 LINE 群組詐騙、CERT.hr 假網站、斯洛伐克惡意 App、BoryptGrab GitHub 連結 |
| 釣魚：惡意附件 | <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a> | 4+ | BadPaw/MeowMeow（烏克蘭邊境文件誘餌）、UAC-0252 (SHADOWSNIFF/SALATSTEALER)、APT36 VibeWare、中東衝突 PDF 誘餌 |
| 供應鏈攻擊 | <a href="https://attack.mitre.org/techniques/T1195/002/" class="ttp-badge" target="_blank">T1195.002</a> | 5+ | **ShinyHunters Salesforce** 資料竊取、BoryptGrab 100+ GitHub repos、OpenClaw 偽造安裝器、NPM 大規模感染、Ericsson 第三方供應商入侵 |
| 利用公開應用程式 | <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> | 5+ | SolarWinds WHD (CVE-2025-26399)、Cisco FMC/SD-WAN、Ivanti EPM、Nginx UI (CVE-2026-27944)、CrushFTP |
| 信任關係利用 | [T1199](https://attack.mitre.org/techniques/T1199/){: .ttp-ref } | 3+ | ShinyHunters Salesforce、Ericsson 第三方供應商、FortiCloud SSO Bypass |
| 搜尋引擎惡意廣告 | [T1583.008](https://attack.mitre.org/techniques/T1583/008/){: .ttp-ref } | 1+ | InstallFix 開發者工具安裝頁面偽造 |

#### 執行 (Execution)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 命令與腳本直譯器 | <a href="https://attack.mitre.org/techniques/T1059/" class="ttp-badge" target="_blank">T1059</a> | 5+ | Dindoor (Deno/JavaScript)、Wikipedia JS 蠕蟲、PlugX、XWorm、APT36 VibeWare (Nim/Zig/Crystal) |
| 使用者執行：惡意檔案 | [T1204.002](https://attack.mitre.org/techniques/T1204/002/){: .ttp-ref } | 5+ | BadPaw ZIP、BoryptGrab GitHub repos、斯洛伐克惡意 App、InstallFix |

#### 持久性 (Persistence)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| DLL 側載 | <a href="https://attack.mitre.org/techniques/T1574/002/" class="ttp-badge" target="_blank">T1574.002</a> | 2+ | Camaro Dragon PlugX、CL-UNK-1068 |
| 瀏覽器擴充功能 | [T1176](https://attack.mitre.org/techniques/T1176/){: .ttp-ref } | 2+ | 惡意 AI 助手（90 萬安裝）、QuickLens |
| 遠端存取工具 | [T1219](https://attack.mitre.org/techniques/T1219/){: .ttp-ref } | 2+ | Dindoor、MeowMeow 後門、簽署 RMM 後門 |

#### 防禦規避 (Defense Evasion)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 程式碼簽署偽裝 | [T1553.002](https://attack.mitre.org/techniques/T1553/002/){: .ttp-ref } | 2+ | Dindoor（Amy Cherne 憑證）、EV 憑證簽署 RMM 後門（TrustConnect Software PTY LTD） |
| 混淆/冷門語言 | [T1027](https://attack.mitre.org/techniques/T1027/){: .ttp-ref } | 1+ | APT36 VibeWare（Nim、Zig、Crystal） |
| 短期憑證規避 | [T1550](https://attack.mitre.org/techniques/T1550/){: .ttp-ref } | 1+ | 雲端服務短期憑證利用（NCSC-FI 報告） |

#### 憑證存取 (Credential Access)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 憑證傾印 | <a href="https://attack.mitre.org/techniques/T1003/" class="ttp-badge" target="_blank">T1003</a> | 3+ | SHADOWSNIFF/SALATSTEALER (UAC-0252)、BoryptGrab Stealer、FortiCloud LDAP 收集 |
| 語音信箱攔截 | [T1123](https://attack.mitre.org/techniques/T1123/){: .ttp-ref } | 1 | 芬蘭 Telegram 帳號劫持 |

#### 命令與控制 (C2)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| Web 服務 C2 | <a href="https://attack.mitre.org/techniques/T1071/001/" class="ttp-badge" target="_blank">T1071.001</a> | 3+ | APT36 (Slack/Discord/Supabase/Google Sheets)、GhostSocks、Cobalt Strike/Sliver C2 |
| 非標準協定 | [T1095](https://attack.mitre.org/techniques/T1095/){: .ttp-ref } | 1+ | PeerTime (BitTorrent C2) — UAT-9244 |
| 加密通道 | [T1573](https://attack.mitre.org/techniques/T1573/){: .ttp-ref } | 2+ | Camaro Dragon PlugX HTTPS、Dindoor 加密 C2 |
| DNS 信譽利用 | <a href="https://attack.mitre.org/techniques/T1583/" class="ttp-badge" target="_blank">T1583</a> | 2+ | .arpa TLD 濫用、BoryptGrab GitHub 基礎設施 |

#### 影響 (Impact)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 資料竊取與勒索 | <a href="https://attack.mitre.org/techniques/T1567/" class="ttp-badge" target="_blank">T1567</a> | 3+ | **ShinyHunters Salesforce ~100 企業**、Ericsson 資料外洩、ShinyHunters 雙重違約 |
| 網路拒絕服務 | <a href="https://attack.mitre.org/techniques/T1498/" class="ttp-badge" target="_blank">T1498</a> | 149+ | Operation Epic Fury / Roaring Lion 駭客主義 DDoS（16 國） |
| 勒索軟體加密 | <a href="https://attack.mitre.org/techniques/T1486/" class="ttp-badge" target="_blank">T1486</a> | — | LockBit 5.0 跨平台能力分析（NCSC-FI 威脅報告） |
| 竄改 | [T1491](https://attack.mitre.org/techniques/T1491/){: .ttp-ref } | 1+ | Wikipedia JS 蠕蟲頁面破壞 |

### IoC 趨勢（abuse.ch 資料）

本週 threat_feeds Layer 觀察到的指標量（1,730 個新條目，含 2026-03-11 更新的 237 筆）：

| 類別 | 本週新增 | 趨勢 | 代表性指標 |
|------|----------|------|-----------|
| **惡意 URL** | ~1,127 | ↑ 持續增長 | **ClearFake 為主導分發平台**，釣魚和惡意軟體分發 URL 大量增加；3/11 新增約 659 筆惡意 URL |
| **惡意軟體樣本** | ~502 | ↑ 小幅增長 | Mirai 家族仍佔多數，GCleaner、Gafgyt 持續活躍；3/11 新增約 250 筆樣本 |
| **IoC 指標** | ~1,782 | ↑ 顯著增長 | 竊密軟體 IoC 為主（StrelaStealer、Lumma Stealer、Remcos）；3/11 新增約 1,016 筆指標 |
| **C2 基礎設施** | ~14 | → 穩定 | **Cobalt Strike、Sliver、Venom RAT**、AsyncRAT；3/11 新增約 7 筆 |

### 惡意軟體家族分布

| 家族 | 類型 | 本週動態 |
|------|------|----------|
| **ClearFake** | 假更新/惡意分發平台 | **本週主導** — 大量惡意 URL 透過 ClearFake 分發 |
| **Cobalt Strike / Sliver** | 後滲透框架 | C2 基礎設施持續活躍 |
| **Venom RAT** | 遠端存取木馬 | C2 活動偵測 |
| **StrelaStealer** | 竊密軟體 | 持續分發，針對電子郵件憑證 |
| **Remcos** | 遠端存取木馬 | 商業 RAT 持續活躍 |
| **Lumma Stealer** | 竊密軟體 | MaaS 模式持續擴張 |
| **Mirai / Gafgyt** | IoT 殭屍網路 | 佔惡意軟體樣本最大比例 |
| **BoryptGrab** | 竊密軟體 | 本週新增，大規模 GitHub 分發（100+ repos） |
| **GhostSocks** | 代理/反偵測 | 透過偽造 GitHub 存儲庫分發 |
| **BadPaw / MeowMeow** | 載入器/後門 | 俄羅斯 APT 新型惡意軟體家族 |

### 與前期比較

| 指標 | W10 | W11 | 變化 |
|------|-----|-----|------|
| 重大事件數 | 12+ | 15+ | ↑ 增加 |
| CISA KEV 新增 | 7 | 8 | → 持平 |
| 新 PoC/Exploit | 38 | 15+ (Exploit-DB) + 10+ (Nuclei) | ↓ 略減 |
| Threat Feeds 新增 | 672 | 1,730 | ↑↑ 大幅增長 (+157%) |
| APT 組織活動 | 7 組織 | 8+ 組織 | ↑ 增加（新增 Camaro Dragon） |
| 供應鏈攻擊 | 4 起 | 5+ 起 | ↑ 增加（新增 ShinyHunters Salesforce） |
| 加密通訊攻擊 | 0 | 2 起 | **↑ 新類別出現** |

**趨勢觀察**：
- W11 的 threat_feeds 新增量較 W10 增長超過 1.5 倍（672 → 1,730），主要由 ClearFake 驅動的惡意 URL 和竊密軟體 IoC 大量增加所致，3/11 單日新增 237 筆進一步鞏固此趨勢
- **加密通訊平台攻擊**為本週新出現的攻擊類別，俄羅斯情報機構和 Telegram 劫持雙重衝擊
- ShinyHunters Salesforce 事件若屬實，將為 2026 年迄今最大規模 SaaS 平台資料竊取

**Qdrant 跨層關聯分析**：語意查詢「phishing credential theft stealer malware supply chain 2026」回傳 10 筆結果（相似度 0.54-0.62），確認竊密軟體（StrelaStealer、Lumma Stealer、Remcos）持續為主要威脅。ClearFake 平台的主導地位與 W10 觀察到的 Mirai IoT 殭屍網路和竊密軟體生態系統平行發展，反映惡意軟體分發基礎設施的專業化和規模化趨勢持續深化。

---

## 新興威脅識別

### 1. SaaS 平台作為「一對多」攻擊入口的系統性風險（信心水準：中高）

**首次出現特徵**：ShinyHunters 聲稱透過 Salesforce 平台單一入口點竊取約 100 家企業資料。若屬實，此模式從 2024 年 Snowflake 事件的「平台憑證重用攻擊」升級為「SaaS 平台直接入侵」，代表第三方風險管理的根本性挑戰。

**跨事件關聯**：結合本週 Ericsson 第三方供應商入侵事件（延遲 11 個月揭露），以及 FortiCloud SSO Bypass 的持續利用，**第三方平台和服務提供商正成為攻擊者最偏好的攻擊向量**。企業對 SaaS 供應商的安全依賴程度與實際控制能力之間的落差持續擴大。

> **推測**：隨著 SaaS 平台整合程度加深，此類「平台級」資料竊取事件可能成為常態。組織應重新評估 SaaS 供應商的安全控制，而非僅依賴供應商的安全聲明。

### 2. 加密通訊平台遭國家級系統性攻擊——認證層成為突破口（信心水準：高）

**升級跡象**：本週同時出現兩個針對加密通訊平台的攻擊事件：
- 俄羅斯情報機構大規模針對 Signal/WhatsApp 用戶進行精準釣魚（荷蘭 AIVD/MIVD 官方警告）
- 芬蘭 Telegram 帳號劫持攻擊利用語音信箱攔截技術

**新興風險面**：加密通訊平台的**認證層**（而非加密層）正成為國家級攻擊的突破口。攻擊者不嘗試破解端到端加密，而是透過社交工程、語音信箱攔截、裝置連結功能等繞過認證。這是一個從技術攻擊向認知攻擊的戰略轉移。

**防禦建議**：啟用所有加密通訊應用的兩步驟驗證（2FA）、停用語音信箱、定期檢查已連結裝置清單、對高風險用戶實施通訊安全培訓。

### 3. ClearFake 成為主導惡意分發基礎設施（信心水準：高）

**升級跡象**：本週 threat_feeds 資料顯示 ClearFake 在惡意 URL 分發中佔據主導地位（468 筆惡意 URL 中佔顯著比例）。ClearFake 利用合法網站的被入侵頁面呈現假瀏覽器更新提示，誘導用戶執行惡意程式碼 [T1189](https://attack.mitre.org/techniques/T1189/){: .ttp-ref }。

**跨事件關聯**：ClearFake 的擴張與 InstallFix 惡意廣告（偽造開發者工具安裝頁面）形成互補——前者攻擊一般用戶，後者針對開發者社群，共同構成「假合法軟體」攻擊面的兩個維度。ClearFake 的規模已接近歷史級分發平台（如 Emotet、QakBot）的水準。

### 4. AI 驅動的「Vibeware」惡意軟體開發——攻擊方的「以量取勝」轉型（信心水準：高）

**首次出現**：APT36 (Transparent Tribe) 轉向 AI 驅動的大量惡意軟體開發模式，搭配冷門程式語言規避偵測。此模式預示國家級 APT 可能從「少量高品質」轉向「大量中品質」策略，對防禦端的簽名檢測造成規模性壓力。

**跨事件關聯**：Google「AI as Tradecraft」報告（2026-03-07）、六國聯合 AI/ML 安全指導（2026-03-05）、惡意 AI 助手擴充功能（2026-03-06）——本週多個信號共同指向 **AI 在網路攻防兩側的角色同時深化**。

### 5. GitHub 作為大規模惡意軟體分發基礎設施的濫用加劇（信心水準：高）

**升級跡象**：BoryptGrab Stealer 擴散至 100+ GitHub 存儲庫（2026-03-09），加上 OpenClaw 偽造安裝器（2026-03-06），GitHub 的信譽正被系統性地武器化。從個別偽造存儲庫到百個存儲庫的規模化操作，標誌「GitHub 即惡意軟體分發基礎設施」的模式正式確立。

**跨層關聯**：結合 NPM 套件感染和 InstallFix 惡意廣告，開發者供應鏈正面臨來自至少四個向量的同時攻擊：套件管理器感染、偽造 GitHub 存儲庫、搜尋引擎惡意廣告、惡意瀏覽器擴充功能。

### 6. LockBit 5.0 跨平台能力與勒索軟體「榮譽守則」崩壞（信心水準：高）

**並行發展**：
- NCSC-FI 報告 LockBit 5.0 跨平台攻擊能力（Windows、Linux、ESXi）的重大提升
- ShinyHunters 違反「榮譽守則」——收取贖金後仍出售資料

**趨勢分析**：勒索軟體經濟模型正經歷結構性轉變：支付意願下降（Chainalysis 報告連續第二年停滯）+ 攻擊者違約增加（ShinyHunters 雙重違約）→ 可能加速向「不問支付，直接變賣資料」模式的轉變。勒索軟體從「加密勒索」→「雙重勒索」→「三重勒索（加密+洩露+賣資料）」的演化正在發生。

### 7. 歷史漏洞的「長尾利用」——攻擊者的耐心策略（信心水準：高）

**模式觀察**：本週 CISA KEV 新增的 8 個漏洞中有 4 個為 2017-2023 年歷史漏洞。攻擊者持續利用未修補的舊系統，尤其是 IoT（Hikvision, CVE-2017-7921）和 ICS（Rockwell, CVE-2021-22681）環境。

**啟示**：「修補最新漏洞」不等於「安全」。組織必須維護完整的資產清單並確保歷史漏洞也已修補，特別是 IoT/ICS 環境中修補週期通常較長的場景。CISA KEV 持續收錄舊 CVE 是對此問題的制度性回應。

### 8. .arpa TLD 濫用——DNS 基礎設施結構性假設的崩壞（信心水準：高）

**首次出現**：Infoblox 揭露威脅行為者濫用 .arpa TLD <a href="https://attack.mitre.org/techniques/T1583/" class="ttp-badge" target="_blank">T1583</a>，利用 Hurricane Electric 和 Cloudflare 的良好信譽，以及安全產品對 .arpa 域名「不應承載內容」的假設來規避偵測。這是一種新型的信譽劫持技術，利用 DNS 基礎設施的結構性假設進行攻擊。

---

## 產業動態補充

### AI 安全雙軌發展

本週 AI 安全議題從攻防兩面同時升溫：
- **攻擊端**：APT36 Vibeware AI 驅動惡意軟體、惡意 AI 擴充功能竊取 LLM 對話（90 萬安裝）、Google「AI as Tradecraft」報告
- **防禦端**：六國聯合 AI/ML 供應鏈安全指導（2026-03-05）、Top 10 AI 安全行動（2026-03-05）、Google 破壞性攻擊防禦指南 2026 版

### 勒索軟體支付停滯但攻擊升級

Chainalysis 報告顯示勒索軟體總支付金額連續第二年停滯，但攻擊數量持續上升。ShinyHunters 雙重違約行為進一步侵蝕受害者支付動機，可能加速攻擊者轉向資料直接變賣模式。

### Encrypted Client Hello (ECH) 準備就緒

CERT-SE（2026-03-09）報告 Encrypted Client Hello 技術已準備就緒進入主流部署。ECH 加密 TLS 握手中的 SNI，將顯著影響網路安全監控和內容過濾的有效性。

### EU 法院顧問：銀行必須退款釣魚受害者

2026-03-09，EU 法院法律顧問建議銀行必須退還網路釣魚受害者的損失。此法律觀點若被採納，將重新定義金融機構在網路詐騙中的責任邊界，可能加速反釣魚技術的採用。

### 技術工具更新

- **YARA-X 1.14.0 發布**（2026-03-07）：惡意軟體分析核心工具的重要更新
- **Wireshark 4.6.4 發布**（2026-03-02）：網路分析工具安全更新

### MFA 覆蓋缺口

分析揭示組織透過 Entra ID、Okta、Google Workspace 部署 MFA 有效保護雲端應用，但許多 Windows 登入仍依賴 Active Directory 認證路徑，從未觸發 MFA 提示。Tycoon 2FA PhaaS 的關閉是正面發展，但 MFA 的架構性缺口仍需系統性解決。

---

## 資料限制與免責聲明

1. **來源偏差**：本報告主要依賴歐洲（NCSC-FI、CERT-FR、SK-CERT、CERT-UA、CERT.hr、CERT-RO、CERT-SE）和北美（CISA、CCCS）CERT/安全機構的 RSS 饋送，以及 Palo Alto Unit 42、Cisco Talos、Check Point、Zscaler、Bitdefender、Microsoft Defender、Huntress 等安全廠商報告。對亞太、非洲地區的覆蓋程度較低。部分非英語來源（斯洛伐克語、芬蘭語、法語、克羅埃西亞語、愛沙尼亞語、捷克語）的細節可能因翻譯或摘要截斷而有所缺失。

2. **時效性**：本報告反映截至 2026-03-11 的已公開資訊。ShinyHunters Salesforce 事件的聲明尚待各受害企業確認，後續發展可能改變評估結論。荷蘭情報機構的 Signal/WhatsApp 警告為官方來源，信心水準較高。2026-03-11 更新主要為 threat_feeds 新增 IoC 資料（237 筆），無重大新事件。

3. **威脅情報歸因**：APT 歸因基於各安全廠商和政府機構的評估。Camaro Dragon 與中國的關聯基於多家廠商長期追蹤（高信心）；俄羅斯 Signal/WhatsApp 釣魚攻擊的歸因來自荷蘭官方情報機構（高信心）；CL-UNK-1068 的中國歸因為「高信心」（Unit 42）；BadPaw/MeowMeow 的俄羅斯歸因為「中信心」（ClearSky）；ShinyHunters Salesforce 為自我宣稱（中信心）。

4. **threat_feeds 統計**：本週 1,730 個新增條目（惡意 URL ~1,127、惡意軟體樣本 ~502、IoC 指標 ~1,782、C2 基礎設施 ~14）來自 abuse.ch 等開源情報饋送，含 2026-03-11 新增的 237 筆。ClearFake 的主導地位基於 URLhaus 和 ThreatFox 資料，可能因資料來源偏差而未完全反映全球惡意軟體分發的完整圖景。

5. **vulnerability_tracking 統計**：本週新增 20 個條目（Critical/High 8、Medium 2、Low/Info 10）。2026-03-11 無重大新增漏洞追蹤條目。

6. **Qdrant 語意查詢**：語意查詢結果基於向量相似度（text-embedding-3-small），可能包含語意相近但時間範圍或語境不同的結果。本報告共執行 5 次 Qdrant 語意查詢，回傳 50 筆相關結果（涵蓋 RCE、勒索軟體、APT 國家級威脅、供應鏈/社交工程、高嚴重度漏洞五大主題）。

7. **預測性聲明**：新興威脅識別中標註為「推測」的內容為基於現有資料的趨勢推斷，非確認的事實。信心水準分級（高/中高/中/低）反映推斷的可靠程度。

8. **免責聲明**：本報告僅供資安態勢感知和研究參考用途，不構成任何特定組織的風險評估或安全建議。各組織應根據自身情境和暴露面進行獨立評估。重大安全決策請結合多方情資來源。

---

> 本報告由資訊安全產業智慧分析系統自動產出（最後更新：2026-03-11），資料來源涵蓋 NCSC-FI、CERT-UA、CERT-FR、SK-CERT、CERT.hr、CERT-RO、CERT-SE、CISA、CCCS、SANS ISC、TWCERT、abuse.ch (MalwareBazaar/ThreatFox/URLhaus)、Unit 42、Cisco Talos、Check Point、Zscaler、Bitdefender、Microsoft Defender、Huntress、Europol 等國際安全機構與開源情報饋送。Qdrant 語意查詢用於跨 Layer 關聯分析，共執行 5 次查詢，回傳 50 筆相關結果。
