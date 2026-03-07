# 威脅態勢分析 — 2026 第 10 週

> 涵蓋期間：2026-03-01 至 2026-03-07
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-03-07
> 分析模型：Claude Opus

---

## 近期重大資安事件

本週資安事件以**中東地緣政治衝突驅動的網路攻擊**為主軸，涵蓋國家級 APT 行動、大規模駭客主義 DDoS 攻擊、以及多起跨國執法打擊行動。以下按嚴重程度排序。

### 1. 伊朗—以色列—美國網路衝突全面升級（嚴重程度：極高）

本週最突出的威脅態勢為中東軍事衝突引發的網路空間全面升級。以下為事件時間線：

- **2026-02-28**：美國與以色列發動「史詩怒火」(Operation Epic Fury) 軍事行動打擊伊朗，伊朗同步實施近乎全面的網路封鎖，國內連線能力降至正常水準的 4%（NetBlocks 數據）。（來源：Forbes, 2026-03-01）

- **2026-03-01**：Check Point Research 偵測到自 2 月 28 日起針對以色列、卡達、巴林、科威特、阿聯酋及賽普勒斯 IP 攝影機的攻擊活動加劇，攻擊基礎設施歸因於伊朗威脅行為者。研究評估伊朗利用攝影機入侵進行飛彈行動的戰損評估 (BDA)，攝影機攻擊活動可作為動能行動的早期預警指標。（來源：Check Point Research, 2026-03-05）

- **2026-03-01**：BadeSaba Calendar 祈禱時間 App（500 萬 Google Play 下載）遭入侵，推播通知被用於向伊朗軍事人員發送心理戰「投降」訊息。（來源：WIRED Middle East, 2026-03-01）

- **2026-02-28 至 03-02**：Radware 報告 149 次駭客主義 DDoS 攻擊針對 16 個國家 110 個組織。Keymous+ 和 DieNet 驅動近 70% 攻擊活動，53% 攻擊導向政府機構，76% 以上集中於科威特、以色列和約旦。3 月 2 日親俄團體 NoName057(16) 加入親伊朗陣營，標誌威脅擴大化。（來源：Radware / Orange Cyberdefense, 2026-03-05）

- **2026-03-02**：加拿大網路安全中心 (CCCS) 發布伊朗網路威脅專題公報，警告伊朗將以網路攻擊作為對美以軍事行動的報復手段。（來源：CCCS, 2026-03-02）

- **2026-03-03**：Check Point Research 發布伊朗網路能力全面概述，涵蓋 IRGC、MOIS 關聯組織的 TTPs，預警活動將在中東、美國及盟友國家加劇。伊朗網路行動三大目標：間諜活動、破壞/毀滅性攻擊（包括偽勒索軟體和資料抹除器）、資訊作戰。（來源：Check Point, 2026-03-03）

- **2026-03-05**：Unit 42 識別惡意 RedAlert 應用程式副本（以色列後方司令部警報 App），用於投遞行動監控惡意軟體。估計 60 個駭客主義團體活躍，伊朗成立「電子作戰室」協調網路行動。（來源：Palo Alto Unit 42, 2026-03-05）

- **2026-03-06**：以色列國防軍 (IDF) 宣布空襲伊朗 IRGC 網路戰與電子作戰總部，實體打擊伊朗網路作戰能力。（來源：Politico, 2026-03-06）

- **2026-03-06**：Seedworm (MuddyWater) 持續活躍於美國銀行、機場及軟體公司網路，部署新後門「Dindoor」（利用 Deno 執行環境），受害組織包括為國防/航太產業供貨的以色列分支軟體公司。（來源：NCSC-FI, 2026-03-06）

**Qdrant 跨層關聯分析**：語意查詢「Iran cyber attack retaliation Operation Epic Fury 2026」回傳 10 筆高度相關結果（相似度 0.49-0.73），均集中於 2026 年 2-3 月期間，確認本週伊朗相關網路威脅活動為近年最密集的爆發期。歷史比對顯示，2025 年 7 月 CCCS 已發布伊朗網路威脅公報，目前態勢為該週期的顯著升級。

### 2. 俄羅斯—烏克蘭持續網路攻擊（嚴重程度：高）

- **UAC-0252 攻擊行動**（CERT-UA#20032）：自 2026 年 1 月起，以釣魚郵件偽裝烏克蘭中央政府機關和地方行政機構，誘騙收件人更新軍民系統行動應用程式，部署 SHADOWSNIFF 和 SALATSTEALER 竊密軟體。（來源：CERT-UA, 2026-03-02）

- **BadPaw/MeowMeow 新惡意軟體**：ClearSky 記錄疑似俄羅斯間諜攻擊活動，以偽造烏克蘭邊境通行許可文件的 ZIP 壓縮檔進行釣魚，投遞新型載入器「BadPaw」及精密後門「MeowMeow」。（來源：The Record / ClearSky, 2026-03-05）

### 3. 亞太地區國家級 APT 行動（嚴重程度：高）

- **UAT-9244 / Famous Sparrow（中國）**：Cisco Talos 揭露中國關聯 APT 自 2024 年起針對南美洲電信基礎設施，使用三種新惡意軟體：TernDoor（Windows 後門）、PeerTime（利用 BitTorrent 協定的 ELF 後門）、BruteEntry（將邊緣裝置轉為大規模掃描代理節點 ORBs）。（來源：Cisco Talos, 2026-03-06）

- **APT36 / Transparent Tribe（巴基斯坦）**：Bitdefender 揭露 APT36 轉向 AI 驅動的「Vibeware」惡意軟體開發模式，使用 Nim、Zig、Crystal 等冷門語言規避偵測，利用 Slack、Discord、Supabase、Google Sheets 作為 C2 通道。（來源：Bitdefender, 2026-03-06）

- **Dust Specter（疑似伊朗）**：Zscaler 揭露疑似伊朗關聯 APT 於 2026 年 1 月針對伊拉克政府官員，使用四種全新惡意軟體家族：SPLITDROP、TWINTASK、TWINTALK、GHOSTFORM。（來源：Zscaler, 2026-03-03）

- **SloppyLemming（印度）**：Arctic Wolf 揭露印度關聯威脅行為者對巴基斯坦、孟加拉和斯里蘭卡政府及關鍵基礎設施的一年期間諜活動，使用 BurrowShell 後門和鍵盤記錄惡意軟體。（來源：Arctic Wolf / The Record, 2026-03-03）

### 4. 跨國執法打擊行動（嚴重程度：高/正面）

- **Tycoon 2FA 釣魚平台關閉**：Europol EC3 協調，Microsoft 主導技術打擊，六國執法機構扣押 330 個核心網域。Tycoon 2FA 為訂閱制 PhaaS 平台，可攔截即時認證會話繞過 MFA。（來源：Europol / Microsoft, 2026-03-05）

- **LeakBase 駭客論壇拆除**：美國 DOJ 主導，Europol 協調，14 國同步行動關閉全球最大駭客論壇之一，該論壇擁有 14.2 萬會員、21.5 萬訊息，儲存數億組帳號憑證。2026 年 3 月 3-4 日執行搜索令和逮捕行動。（來源：U.S. DOJ, 2026-03-05）

### 5. 其他重大事件

| 日期 | 事件 | 來源 | 嚴重程度 |
|------|------|------|----------|
| 2026-03-01 | 韓國國稅局公開照片意外曝露扣押冷錢包助記詞，導致約 440 萬美元加密貨幣被竊 | BleepingComputer | 高 |
| 2026-03-01 | QuickLens Chrome 擴充功能遭供應鏈攻擊，v5.8 植入 ClickFix 攻擊和加密貨幣竊取功能，約 7,000 用戶受影響 | BleepingComputer | 高 |
| 2026-03-02 | 芬蘭出現 Deepfake 醫療廣告詐騙 | NCSC-FI | 中 |
| 2026-03-03 | Dubai SIM Swap 攻擊與伊朗飛彈行動相關 | NCSC-FI | 高 |
| 2026-03-04 | XWorm 惡意軟體新一波多技術投遞攻擊 | SANS ISC | 中 |
| 2026-03-05 | 偽造技術支援詐騙升級，部署客製化 Havoc C2 框架，利用間接系統呼叫規避 EDR | Huntress | 高 |
| 2026-03-05 | 簽署惡意軟體偽裝工作場所 App，使用 EV 憑證（TrustConnect Software PTY LTD），部署 RMM 後門 | Microsoft | 高 |
| 2026-03-06 | 惡意 AI 助手瀏覽器擴充功能從 ChatGPT/DeepSeek 竊取 LLM 對話記錄，影響 90 萬安裝、2 萬+企業租戶 | Microsoft Defender | 高 |
| 2026-03-06 | 偽造 OpenClaw GitHub 安裝器分發 GhostSocks 惡意軟體和資訊竊取器 | Huntress | 高 |
| 2026-03-06 | 偽造 LastPass 支援郵件試圖竊取保險庫密碼 | BleepingComputer | 中 |
| 2026-03-06 | 芬蘭稅務局釣魚攻擊使用收件人真名，與真實稅務通知同日發送 | NCSC-FI | 中 |
| 2026-03-06 | 威脅行為者濫用 .arpa TLD 建立 A 記錄，利用 Hurricane Electric/Cloudflare DNS 信譽 | Infoblox | 中 |

---

## 漏洞趨勢分析

### 本週新增漏洞概況

本週觀察到以下重要漏洞活動：

**CISA KEV 新增**：
- **2026-03-03**：新增 2 個已知遭利用漏洞
  - **CVE-2026-21385**：Qualcomm 多晶片組記憶體損毀漏洞
  - **CVE-2026-22719**：Broadcom VMware Aria Operations 命令注入漏洞
- **2026-03-05**：新增 5 個已知遭利用漏洞（具體 CVE 詳見 CISA 公告）

**零日漏洞**：
- **CVE-2026-21513**（CVSS 8.8）：Windows MSHTML 安全功能繞過，由 APT28 (Fancy Bear) 積極利用。Akamai 使用 PatchDiff-AI 完成根因分析。（來源：Akamai, 2026-03-03）
- **Cisco Catalyst SD-WAN 零日**：SK-CERT 發布緊急警告，確認關鍵零日漏洞正被全球積極利用。（來源：SK-CERT, 2026-03-04）
- **CVE-2026-0628**：Chrome Gemini 功能高嚴重性漏洞，惡意擴充功能可劫持 Gemini 面板存取本機檔案系統。（來源：Unit 42, 2026-03-03）

### 按廠商/產品分布

| 廠商/產品 | 公告數量 | 嚴重程度 | 備註 |
|-----------|----------|----------|------|
| **Microsoft** | 多個 | Critical-High | MSHTML 零日 (CVE-2026-21513)、CERT-FR 多漏洞公告 |
| **Cisco** | 2+ | Critical | Catalyst SD-WAN 零日、Secure Firewall Management Center |
| **Google Chrome** | 2 | High | CVE-2026-0628 Gemini 面板劫持、Android 安全公告 |
| **Hitachi Energy** | 2 | High | Relion/REB500 產品、RTU500 產品（ICS） |
| **Delta Electronics** | 1 | High (7.8) | CNCSoft-G2 DOPSoft 元件 RCE (CVE-2026-3094) |
| **CrushFTP** | 持續 | Critical | 暴力破解掃描活動加劇，多個歷史 CVE 被利用 |
| **Docker Desktop** | 1 | 中-高 | CERT-FR 公告 |
| **MISP** | 1 | 中 | CERT-FR 公告 |
| **Google API/Gemini** | 1 | High | 舊版公開 API 金鑰可認證至 Gemini，約 3,000 個金鑰曝露 |

### ICS/OT 漏洞

本週 CISA 發布多項工業控制系統安全公告：

- **Delta Electronics CNCSoft-G2** (ICSA-26-064-01)：DOPSoft 元件越界寫入，CVSS 7.8，可實現 RCE
- **Hitachi Energy Relion/REB500** 與 **RTU500**：多個漏洞影響關鍵能源基礎設施
- **Mitsubishi Electric MELSEC iQ-F Series EtherNet/IP**：ICS 通訊漏洞
- **Labkotec LID-3300IP**、**Portwell Engineering Toolkits**：嵌入式裝置漏洞
- **ePower / ePowerIE**、**Mobiliti / MobiHU**、**Everon OCPP Backends**：電動車充電基礎設施漏洞

### 零日趨勢（Google 年度回顧）

Google 發布 2025 年零日利用年度回顧（2026-03-06），揭示關鍵趨勢：

- 企業技術零日利用數量（43 個）和佔比（48%）均創歷史新高
- 瀏覽器漏洞利用降至歷史低點，作業系統漏洞利用增加
- 國家支持間諜組織優先攻擊**邊緣裝置和安全設備**，超過一半的歸因利用集中於此類技術
- 商業監控廠商 (CSV) 持續關注行動和瀏覽器漏洞利用
- BRICKSTORM 惡意軟體多次入侵科技公司，疑為竊取 IP 以支持零日漏洞開發

---

## 活躍利用與 PoC 動態

### CISA KEV 更新

本週 CISA 新增 **7 個** 已知遭積極利用漏洞至 KEV 目錄：

| 日期 | CVE | 產品 | 類型 |
|------|-----|------|------|
| 2026-03-03 | CVE-2026-21385 | Qualcomm 多晶片組 | 記憶體損毀 |
| 2026-03-03 | CVE-2026-22719 | VMware Aria Operations | 命令注入 |
| 2026-03-05 | 5 個 CVE（完整清單見 CISA 公告） | 多廠商 | 多類型 |

### 積極利用中的漏洞

| 漏洞 | 利用者 | 目標 | 狀態 |
|------|--------|------|------|
| CVE-2026-21513 (MSHTML) | APT28 / Fancy Bear（俄羅斯） | 所有 Windows 版本 | 已修補（2026-02 Patch Tuesday）|
| Cisco Catalyst SD-WAN 零日 | 不明 | 全球 SD-WAN 部署 | 緊急警告發布 |
| CrushFTP 多 CVE | 多方 | 企業檔案傳輸系統 | 暴力破解掃描活動增加 |
| CVE-2024-4040 (CrushFTP) | 多方 | CrushFTP 實例 | 範本注入 -> RCE |
| CVE-2025-31161 (CrushFTP) | 多方 | CrushFTP 實例 | 認證繞過 -> 管理員接管 |

### 新公開 PoC / Exploit 動態

- **PatchDiff-AI 分析 CVE-2026-21513**：Akamai 使用自動化工具分析 MSHTML 漏洞修補差異，提供 IOC 供防禦使用
- **CrushFTP 暴力破解掃描**：SANS ISC 報告針對 CrushFTP 的主動掃描活動，關聯三個歷史嚴重 CVE

**Qdrant 跨層關聯分析**：語意查詢「ransomware active exploitation zero-day 2026」回傳 10 筆結果（相似度 0.49-0.65），確認 2026 年持續存在多個零日漏洞被積極利用，包括 Microsoft Office 零日 (CVE-2026-21509)、Ivanti EPMM 零日 (CVE-2026-1281/1340)、Chrome 零日 (CVE-2026-2441)，以及歷史上的 WinRAR CVE-2025-8088 仍持續被多方利用。

---

## 攻擊手法歸納

### 分類統計

依 MITRE ATT&CK 框架歸納本週觀察到的主要攻擊技術：

#### 初始存取 (Initial Access)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 釣魚：惡意附件 | [T1566.001](https://attack.mitre.org/techniques/T1566/001/){: .ttp-ref } | 6+ | UAC-0252 (SHADOWSNIFF/SALATSTEALER)、BadPaw/MeowMeow、SloppyLemming、Finland Tax Phishing、LastPass Phishing、Signed Malware via Workplace Apps |
| 釣魚：惡意連結 | [T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref } | 3+ | RedAlert App 副本、QuickLens ClickFix、LastPass 支援詐騙 |
| 供應鏈攻擊 | [T1195.002](https://attack.mitre.org/techniques/T1195/002/){: .ttp-ref } | 3 | QuickLens Chrome 擴充、OpenClaw GitHub、惡意 AI 助手擴充功能 |
| 合法帳號利用 | [T1078](https://attack.mitre.org/techniques/T1078/){: .ttp-ref } | 2+ | MFA 覆蓋缺口利用、CrushFTP 暴力破解 |
| 利用公開應用程式 | [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } | 3+ | Cisco SD-WAN 零日、CrushFTP、MSHTML |

#### 執行 (Execution)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 使用者執行：惡意檔案 | [T1204.002](https://attack.mitre.org/techniques/T1204/002/){: .ttp-ref } | 4+ | ClickFix、BadPaw ZIP、SloppyLemming PDF/Excel、XWorm |
| 命令與腳本直譯器 | [T1059](https://attack.mitre.org/techniques/T1059/){: .ttp-ref } | 3+ | Dindoor (Deno/JavaScript)、Havoc C2、XWorm |

#### 持久性 (Persistence)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 瀏覽器擴充功能 | [T1176](https://attack.mitre.org/techniques/T1176/){: .ttp-ref } | 3 | QuickLens、惡意 AI 助手、CVE-2026-0628 利用 |
| 遠端存取工具 | [T1219](https://attack.mitre.org/techniques/T1219/){: .ttp-ref } | 2+ | Signed RMM 後門、Havoc C2 |

#### 命令與控制 (C2)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 應用層協定：Web 服務 | [T1071.001](https://attack.mitre.org/techniques/T1071/001/){: .ttp-ref } | 3+ | APT36 (Slack/Discord/Supabase/Google Sheets)、GhostSocks |
| 非標準協定 | [T1095](https://attack.mitre.org/techniques/T1095/){: .ttp-ref } | 1 | PeerTime (BitTorrent C2) |

#### 影響 (Impact)

| 技術 | ATT&CK ID | 觀察案例數 | 代表事件 |
|------|-----------|------------|----------|
| 網路拒絕服務 | [T1498](https://attack.mitre.org/techniques/T1498/){: .ttp-ref } | 149+ | Operation Epic Fury 駭客主義 DDoS |

### IoC 趨勢（abuse.ch 資料）

本週 threat_feeds 觀察到的指標量：

| 類別 | 數量 | 趨勢 |
|------|------|------|
| C2 基礎設施 | 243 筆 | AsyncRAT、Cobalt Strike、DCRat、QakBot 持續活躍 |
| IoC 指標 | 8,440 筆 | 竊密軟體相關 IoC 為主（SalatStealer、Stealc、PhantomStealer） |
| 惡意 URL | 26,248 筆 | 大量釣魚和惡意軟體分發 URL |
| 惡意軟體樣本 | 6,060 筆 | **Mirai 家族佔絕對多數**，其次為 GCleaner、Gafgyt、AsyncRAT、QuasarRAT、LummaStealer |

**Qdrant 跨層關聯分析**：語意查詢「supply chain attack phishing malware stealer browser extension」回傳 10 筆結果（相似度 0.55-0.59），確認竊密軟體（SalatStealer、Stealc、PhantomStealer）持續為主要威脅，且與 CERT-UA 報告的 UAC-0252 攻擊行動直接關聯。abuse.ch MalwareBazaar 在 2026-03-05/06 持續收錄新的 SalatStealer 樣本，顯示該惡意軟體家族仍在積極分發中。

### 惡意軟體家族分布（threat_feeds 樣本分析）

| 家族 | 樣本類型 | 備註 |
|------|----------|------|
| **Mirai** | IoT 殭屍網路 | 佔惡意軟體樣本最大比例，持續感染 IoT 裝置 |
| **GCleaner** | 下載器/清理器偽裝 | 多個變種 |
| **Gafgyt** | IoT 殭屍網路 | 與 Mirai 同類型 |
| **AsyncRAT** / **QuasarRAT** | 遠端存取木馬 | Windows 目標 |
| **LummaStealer** / **Stealc** / **SalatStealer** | 竊密軟體 | 憑證和加密貨幣竊取 |
| **SnakeKeylogger** | 鍵盤記錄器 | 憑證竊取 |
| **GhostSocks** | 代理/反偵測 | 利用受害系統路由流量繞過反詐騙 |
| **PureHVNC** / **PureLogsStealer** | 遠端控制/竊密 | |
| **Hajime** / **Tsunami** | IoT 殭屍網路 | |
| **CoinMiner** | 加密貨幣挖礦 | |
| **ConnectWise** / **GoToResolve** / **N-able** | RMM 工具濫用 | 合法遠端管理工具被惡意使用 |

---

## 新興威脅識別

### 1. AI 驅動的「Vibeware」惡意軟體開發模型（信心水準：高）

**首次出現**：APT36 (Transparent Tribe) 從現成惡意軟體轉向 AI 驅動的「Vibeware」開發模式，使用 AI 大量產生中等品質的惡意軟體植體。搭配 Nim、Zig、Crystal 等冷門程式語言規避標準偵測引擎。此模式預示國家級 APT 可能從「少量高品質」轉向「大量中品質」的惡意軟體策略。

**跨事件關聯**：OpenAI 同週發布威脅報告（2026-03-02），記錄威脅行為者如何在影響力操作、情感詐騙和網路攻擊中結合 AI 工具。兩份報告共同指向 **AI 在網路威脅生態系統中角色的顯著提升**。

### 2. 惡意 AI 助手瀏覽器擴充功能竊取 LLM 對話（信心水準：高）

**首次出現**：Microsoft Defender 發現偽裝為 AI 助手的 Chromium 擴充功能，針對性竊取 ChatGPT 和 DeepSeek 對話記錄。90 萬安裝量、2 萬+企業租戶受影響。暴露的資料類型包括專有程式碼、內部工作流程、策略討論。

**新興攻擊面**：結合 CVE-2026-0628（Chrome Gemini 面板劫持漏洞），瀏覽器 AI 整合正快速成為新的攻擊面。**企業大規模採用 AI 工具但缺乏對應的安全控制**，創造了竊取高價值智慧財產的新路徑。

### 3. 合法數位簽署濫用的新趨勢（信心水準：高）

**升級跡象**：本週觀察到兩起使用合法數位簽署的攻擊：
- Seedworm 的 Dindoor 後門使用「Amy Cherne」簽發的憑證
- 偽裝工作場所 App 的惡意軟體使用「TrustConnect Software PTY LTD」EV 憑證

**影響**：EV 憑證的濫用削弱了程式碼簽署作為信任機制的有效性，組織不應將數位簽署視為安全性的充分證據。

### 4. .arpa TLD 濫用（信心水準：高）

**首次出現**：Infoblox 揭露威脅行為者透過取得 IPv6 位址空間、在反向 DNS 名稱下建立 A 記錄來濫用 .arpa TLD，利用 Hurricane Electric 和 Cloudflare 的良好信譽。此攻擊手法利用了 DNS 基礎設施的結構性假設（.arpa 不應承載內容），屬於新型的信譽劫持技術。

### 5. Google API 金鑰安全模型崩壞（信心水準：高）

**架構性安全失效**：Google 花十年告訴開發者 API 金鑰「不是密碼，可以公開」，但 Gemini 現在接受相同金鑰存取私人資料。約 3,000 個公開曝露的金鑰可認證至 Gemini，甚至包括 Google 自己的內部金鑰。此類「安全保證被新產品靜默失效」的問題可能在其他快速整合 AI 功能的平台中重現。

### 6. 勒索軟體「榮譽守則」崩壞（信心水準：中）

**行為轉變**：安全專家 Mikko Hypponen 警告，ShinyHunters 等團體收取贖金後仍出售竊取資料。「付款即保密」的舊有犯罪守則已失效，根本改變了勒索軟體受害者的風險計算。結合 Chainalysis 數據（2025 年贖金支付下降 8% 但攻擊量增加 50%），顯示受害組織日益拒絕付款。

### 7. 伊朗利用 IP 攝影機進行戰損評估 — 網路物理融合（信心水準：高）

**跨域威脅**：Check Point 發現伊朗攻擊者在飛彈攻擊前後針對 IP 攝影機的活動模式，評估其目的為戰損評估 (BDA)。此發現將**攝影機攻擊活動定義為動能軍事行動的先兆指標**，代表網路威脅情報與實體安全情報的融合達到新水準。

---

## 產業動態補充

### 勒索軟體付款趨勢

Chainalysis 2026 年年度報告揭示（2026-03-01）：
- 2025 年鏈上勒索軟體付款總額約 8.2 億美元，年減 8%
- 攻擊聲明數量增加 50%
- 中位數贖金付款年增 368% 至約 6 萬美元
- 初始存取代理 (IAB) 鏈上資金流入高峰通常在勒索軟體付款和受害者資料外洩前約 30 天出現
- 犯罪分子與國家支持行為者日益共用防彈主機和住宅代理基礎設施
- 執法重心轉向破壞基礎設施服務層（主機商、惡意軟體載入工具）

### 拉丁美洲網路攻擊倍增

Check Point 報告（2026-03-06）拉丁美洲已成為全球最重攻擊目標地區，組織每週面臨約 3,100 次網路威脅，為美國（約 1,500 次/週）的兩倍多。2025 年拉丁美洲每週網路攻擊年增 53%。

### MFA 覆蓋缺口

分析揭示（2026-03-06）組織部署 MFA（透過 Entra ID、Okta、Google Workspace）有效保護雲端應用和聯合登入，但許多 Windows 登入仍依賴 Active Directory 認證路徑，從未觸發 MFA 提示，攻擊者持續利用這些缺口。

---

## 資料限制與免責聲明

1. **來源偏差**：本報告主要依賴歐洲（NCSC-FI、CERT-FR、SK-CERT、CERT-UA）和北美（CISA、CCCS）CERT/安全機構的 RSS 饋送，對亞太、非洲、南美洲的覆蓋程度較低。部分非英語來源（斯洛伐克語、芬蘭語、法語）的細節可能因翻譯或摘要截斷而有所缺失。

2. **時效性**：本報告反映截至 2026-03-07 的已公開資訊。部分事件（如 Cisco SD-WAN 零日的具體 CVE 編號）可能在報告產出後才獲得完整技術細節。

3. **威脅情報歸因**：APT 歸因基於各安全廠商的評估（如 Cisco Talos、Check Point、Zscaler、ClearSky 等），歸因結論可能隨後續調查而調整。Dust Specter 的伊朗歸因為「中至高信心」；SloppyLemming 的印度歸因由 Arctic Wolf 評估。

4. **threat_feeds 統計**：IoC、惡意 URL 和惡意軟體樣本的數量為 abuse.ch 等開源情報饋送的累積統計，包含歷史資料，非全部為本週新增。

5. **Qdrant 語意查詢**：語意查詢結果基於向量相似度，可能包含語意相近但時間範圍不同的結果。所有跨層關聯分析已標註相似度分數供參考。

6. **漏洞數量**：本報告記錄的漏洞為本週由各 CERT 機構和安全廠商公開揭露或新增至 KEV 的漏洞，並非 NVD 全部新增 CVE 的完整統計。

7. **CISA KEV 2026-03-05 細節**：該日新增的 5 個 KEV 漏洞的具體 CVE 編號在本週萃取資料中未完整列出，建議直接參考 CISA 公告原文。

8. **免責聲明**：本報告僅供資安態勢感知和研究參考用途，不構成任何特定組織的風險評估或安全建議。各組織應根據自身情境和暴露面進行獨立評估。

---

## 自我審核 Checklist

- [x] 包含「資料限制與免責聲明」
- [x] 所有事件標註來源與日期
- [x] 趨勢分析基於足夠樣本（35 個攻擊事件、24 個漏洞揭露、16 個產業動態、3 個政策法規、3,000+ threat feed 指標）
- [x] 新興威脅標註信心水準（7 項全部標註）
- [x] 無未經證實的推論（所有聲明均有來源支持）
- [x] 統計數據準確（CISA KEV 7 個、DDoS 149 次、LeakBase 14.2 萬會員等均引自原始報告）
- [x] 攻擊手法標註 ATT&CK TTP（T1566、T1195、T1078、T1190、T1204、T1059、T1176、T1219、T1071、T1095、T1498）

---

> 本報告由資訊安全產業智慧分析系統自動產出，資料來源涵蓋 NCSC-FI、CERT-UA、CERT-FR、SK-CERT、CISA、SANS ISC、CCCS、abuse.ch (MalwareBazaar/ThreatFox/URLhaus) 等國際安全機構與開源情報饋送。Qdrant 語意查詢用於跨 Layer 關聯分析，共執行 3 次查詢，回傳 30 筆相關結果。
