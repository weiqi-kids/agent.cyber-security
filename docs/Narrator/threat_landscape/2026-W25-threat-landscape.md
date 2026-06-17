# 威脅態勢分析 — 2026 第 25 週

> 涵蓋期間：2026-06-10 至 2026-06-17
> 資料來源：國際 CERT/安全機構 RSS（CISA、CERT-FR、NCSC-FI、CERT-RO、CERT-SE 等）、NVD、EPSS、Exploit-DB、abuse.ch MalwareBazaar/URLhaus、CISA KEV

---

## 摘要（本週重點）

本週威脅態勢由**多起 CISA KEV 新增的活躍利用漏洞**主導，其中 Oracle PeopleSoft（CVE-2026-35273）與 Ivanti Sentry（CVE-2026-10520）皆屬「未驗證即可完整接管」等級，前者更確認與勒索軟體活動相關。攻擊事件面則出現顯著的**國家級威脅行為者活動高峰**：北韓 ScarCruft（APT37）與 Contagious Interview、中國 Earth Lusca 同週現身，攻擊手法集中於社交工程（仿冒 Microsoft 警報、開發者招募誘騙）與開發工具濫用。勒索軟體 DragonForce 則展示了濫用 Microsoft Teams TURN 中繼隱藏 C2 的新型逃避技術。威脅情報饋送層以 **Mirai 殭屍網路樣本（334 筆）持續居首**，反映 IoT/路由器層面的攻擊壓力未減。

---

## 1. 近期重大資安事件

依嚴重程度與戰略意義排序，本週 L1 資安新聞事實層新增 16 起 attack_incident（截至 06-17），以下為最值得關注者：

### 1.1 DragonForce 勒索軟體濫用 Microsoft Teams TURN 中繼隱藏 C2（嚴重）

- **事件摘要**：DragonForce 勒索軟體組織使用客製後門「Backdoor.Turn」，濫用 Microsoft Teams 使用的 TURN（Traversal Using Relays around NAT）協議中繼基礎設施，將命令與控制（C2）流量隱藏於合法的 Teams 中繼流量中。
- **影響範圍**：採用 Microsoft Teams 的企業環境；此技術使傳統網路偵測難以區分惡意 C2 與正常協作流量。
- **時間線**：2026-06-17 揭露（NCSC-FI Daily News 轉載 BleepingComputer）。
- **關聯**：DragonForce 自 2023 年起活躍，採卡特爾式組織結構，並與 Scattered Spider 威脅組織有關聯。
- **來源**：NCSC-FI Daily News（[BleepingComputer 原文](https://www.bleepingcomputer.com/news/security/ransomware-gang-abuses-microsoft-teams-relays-to-hide-malicious-traffic/)）

### 1.2 ScarCruft（APT37）以仿冒 Microsoft 警報投遞 NarwhalRAT（嚴重）

- **事件摘要**：北韓國家支持的 APT37（ScarCruft）使用仿冒 Microsoft 帳號安全通知的魚叉式網路釣魚郵件，附件為含惡意 LNK 檔案的 ZIP 壓縮檔（而非預期的 HWP 文件），最終投遞 NarwhalRAT。
- **影響範圍**：以社交工程製造緊迫感（聲稱帳號異常、重複產生 OTP），誘使受害者執行附件。
- **時間線**：2026-06-17（Genians Security Center 分析）。
- **來源**：NCSC-FI Daily News（[The Hacker News](https://thehackernews.com/2026/06/fake-microsoft-alerts-used-to-deploy.html)）

### 1.3 北韓 Contagious Interview 將開發者工具武器化（嚴重）

- **事件摘要**：Proofpoint 記錄到與北韓 Contagious Interview（Famous Chollima / Void Dokkaebi）相關的活動 UNK_DeadDrop，透過開發者招募/代碼審查主題郵件，誘騙近 100 個組織開啟惡意 GitHub 儲存庫，利用 VS Code「runOn: folderOpen」技術在開啟編輯器時自動觸發跨平台惡意軟體（macOS/Linux/Windows，含 Go 框架 Overlord）。
- **影響範圍**：六週內向近 100 個組織發送 250+ 封郵件，目標集中於美國（>75%），涉及金融、加密貨幣、教育、科技領域。
- **時間線**：2026-06-17；「runOn: folderOpen」技術自 2025-12 起被採用。
- **來源**：NCSC-FI Daily News（[The Hacker News](https://thehackernews.com/2026/06/north-korean-hackers-are-turning.html)）

### 1.4 中國 Earth Lusca 部署 SprySOCKS Windows 變體攻擊政府機關（嚴重）

- **事件摘要**：ESET 發現原為 Linux 的 SprySOCKS 惡意軟體出現 Windows 變體，被中國威脅組織 Earth Lusca 用於攻擊台灣、泰國、巴基斯坦、洪都拉斯的政府組織（外交、科技、電信領域）。
- **時間線**：攻擊發生於 2023–2024，2026-06-17 揭露。
- **戰略意義**：台灣為直接受害國，對本地政府/關鍵基礎設施防禦具高度參考價值。
- **來源**：NCSC-FI Daily News

### 1.5 Fortinet FortiSandbox 三個嚴重漏洞遭積極利用（嚴重）

- **事件摘要**：威脅情報公司 Defused 指出，FortiSandbox 的 CVE-2026-39813、CVE-2026-39808、CVE-2026-25089 正遭積極利用，攻擊者可透過低複雜度指令注入（無需使用者互動）升級權限並達成未驗證遠端程式碼執行。Fortinet 已於 2026-04-14 發布更新。
- **時間線**：2026-06-17 確認在野利用。
- **來源**：NCSC-FI Daily News

### 1.6 其他值得留意的事件

| 事件 | 行為者 / 惡意軟體 | 重點 | 來源 |
|------|------------------|------|------|
| VHDX → Remcos RAT 多階段感染 | Remcos RAT | 惡意 ZIP 內含 VHDX 自動掛載，經 JS → PowerShell → .NET → shellcode；針對德語用戶 | SANS ISC (06-16) |
| Lorem Ipsum 轉向 ClickFix | Lorem Ipsum loader | 微軟打擊 Fox Tempest 簽署服務（吊銷 1,000+ 憑證）後，操作者改用 ClickFix 誘餌 | NCSC-FI (06-17) |
| Rokarolla Android 銀行木馬 | Rokarolla | 針對 217 個銀行/加密應用，137 個遠端指令，竊取 PIN/SMS/錢包 | NCSC-FI (06-17) |
| EtherRat / EvilTokens 釣魚基礎設施 | EtherRat | 惡意基礎設施與 token 竊取釣魚 | NCSC-FI (06-17) |

> **跨層關聯（Qdrant）**：本週 DragonForce 濫用 Teams 中繼的手法，與歷史上「Microsoft Teams Phishing Campaign Deploys A0Backdoor」（2026-03-11）及「Signed Malware Impersonating Workplace Apps Deploys RMM Backdoors」（2026-03-05）形成同一趨勢線 —— **協作平台（Teams）正持續被武器化為投遞與 C2 通道**。

---

## 2. 漏洞趨勢分析

### 2.1 本週新增漏洞數量

| Layer / 分類 | 本週新增（自 06-10） | 說明 |
|--------------|---------------------|------|
| vulnerability_tracking / critical_high | 1,463 | NVD 高/嚴重漏洞（含回填歷史 CVE） |
| vulnerability_tracking / medium | 3,380 | NVD 中度漏洞 |
| security_news_facts / vulnerability_disclosure | 94 | CERT 公告（CERT-FR AVI 系列、CISA KEV、廠商公告） |

> **樣本說明**：vulnerability_tracking 的高計數包含 NVD 回填的歷史 CVE（如 CVE-2016-2006x、CVE-2017-2024x 系列），並非全屬本週新揭露。因此本節**廠商分布以本週 CERT 公告（vulnerability_disclosure）為主要趨勢依據**，統計推論請參酌此限制。

### 2.2 按廠商分布（本週 CERT 公告 / 廠商揭露）

CERT-FR 本週發布密集的廠商安全公告（AVI-0716 至 AVI-0753），主要集中於：

- **Microsoft**（Patch Tuesday 6 月）：Edge、Office、Windows、.NET、Azure、Microsoft 產品（AVI-0726~0731、0737、0753）
- **Linux 核心**：SUSE、Ubuntu、Red Hat（AVI-0745~0747）
- **Spring 框架**：多份公告（AVI-0739、0744）含 Spring AI 漏洞
- **網路/基礎設施**：Fortinet（AVI-0725）、Palo Alto Networks（AVI-0734）、Traefik（AVI-0738）、NetApp、Moxa、IBM
- **OT/ICS**：Rockwell Automation 本週揭露 5 份公告（CompactLogix 5370 DoS、Logix 5370/5570 CIP DoS、FLEX I/O EtherNet/IP、RSLinx Classic 堆疊溢位、FactoryTalk Analytics）
- **其他**：GitLab、MongoDB、Splunk、LibreNMS、Cisco Catalyst、Mattermost、Redmine

### 2.3 按嚴重程度分布

本週多份公告達 Critical 等級，重點包括：
- **Splunk Enterprise** 嚴重漏洞（CERT-RO，06-15）
- **Check Point**（CVE-2026-50751，CERT-RO，06-10）
- **Ivanti Sentry** 多重嚴重漏洞（CERT-RO，06-10）
- **Oracle PeopleSoft**（CVE-2026-35273，AVI-0749）

### 2.4 EPSS / 高利用可能性觀察

本週進入 KEV 的漏洞（見第 3 節）本質上即代表 EPSS/在野利用可能性的最高端訊號。其中具備**未驗證遠端接管**特性的 CVE-2026-35273（PeopleSoft）與 CVE-2026-10520（Ivanti Sentry）應列為最優先修補目標。

> **限制**：本週 docs 萃取資料未直接提供 EPSS 數值排序，故 EPSS Top 10 改以「KEV 在野利用 + 嚴重程度 + 暴露面」綜合判斷代替，數值化排序待後續資料補強。

---

## 3. 活躍利用與 PoC 動態

### 3.1 CISA KEV 本週新增活躍利用漏洞清單

| CVE | 產品 | 類型 | 嚴重 | 勒索關聯 | BOD 26-04 期限 | 來源 |
|-----|------|------|------|----------|----------------|------|
| **CVE-2026-35273** | Oracle PeopleSoft Enterprise PeopleTools | 缺少身份驗證（CWE-306）→ 完整接管 | Critical | **Known（已知）** | 2026-06-15 | [Oracle Alert](https://www.oracle.com/security-alerts/alert-cve-2026-35273.html) |
| **CVE-2026-10520** | Ivanti Sentry（MobileIron Sentry） | OS 命令注入（CWE-78）→ root RCE，未驗證 | Critical | 否 | 2026-06-14 | [Ivanti Advisory](https://hub.ivanti.com/s/article/Security-Advisory-Ivanti-Sentry-CVE-2026-10520-CVE-2026-10523?language=en_US) |
| **CVE-2026-48907** | Widget Factory Joomla Content Editor (JCE) | 存取控制不當（CWE-284）→ PHP 上傳 RCE，未驗證 | Critical | 否 | 2026-06-19 | [JCE Advisory](https://www.joomlacontenteditor.net/news/jce-security-update-and-a-free-patch-for-older-sites) |
| **CVE-2026-20262** | Cisco Catalyst SD-WAN Manager | 路徑遍歷（CWE-22）→ 任意檔案寫入，需驗證 | High | 否 | 2026-06-29 | [Cisco SA](https://sec.cloudapps.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-sdwan-arbfw-c2rZvQ) |
| **CVE-2026-54420** | LiteSpeed cPanel Plugin | Symlink 跟隨（CWE-61）→ CageFS 沙盒逃逸 | High | 否 | 2026-06-18 | [LiteSpeed Blog](https://blog.litespeedtech.com/2026/06/01/security-update-for-litespeed-cpanel-plugin-2/) |

**重點研判**：
- **CVE-2026-35273（PeopleSoft）** 為本週最高威脅 —— 未驗證即可完整接管，且已確認 `knownRansomwareCampaignUse: Known`。HR/財務等關鍵業務系統若對外暴露，須立即隔離並驗證備份還原流程 [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref }。
- **CVE-2026-10520（Ivanti Sentry）** 與 CVE-2026-10523（驗證繞過，CWE-288）為同一安全公告的配套漏洞，建議一併修補。

### 3.2 新公開 PoC / Exploit-DB 動態

本週 exploit_intelligence/poc_available 新增大量 Exploit-DB 與 GitHub PoC（含 06-10 至 06-13 的 PoC GitHub 每日更新）。值得注意的 RCE 類 PoC：

- **Apache HertzBeat 1.8.0 RCE**、**Cockpit 359 RCE**、**FUXA 1.2.9 RCE**（SCADA/監控平台）
- **Langflow 1.3.0 RCE**、**Grav CMS 2.0.0-beta-2 RCE**、**mixPHP 2.2.17 反序列化 RCE**
- **Wing FTP Server 8.1.3 Authenticated RCE**
- **Fortinet FortiWeb SQLi-RCE**、**Ingress-NGINX v1.11.1 FD Injection RCE**、**Redis 8.0.2 RCE**
- Linux 核心多個本機提權（LPE）PoC（含 6.8 LPE）、Realtek RTL819x LPE

### 3.3 與 L2 漏洞的交叉關聯（Qdrant 驗證）

針對 **Ivanti Sentry** 的 Qdrant 語意查詢確認了跨層一致性：active_exploitation 的 CVE-2026-10520（exploit_intelligence，相似度 0.71）與 vulnerability_tracking 的 CVE-2026-10523 驗證繞過（critical_high，0.64）相互佐證，顯示同一產品的**利用情報層與漏洞追蹤層已完整對應**。

> **FortiSandbox 觀察**：第 1.5 節的 FortiSandbox 在野利用（CVE-2026-39813/39808/25089）目前見於 L1 事件報導，建議後續確認是否進入 KEV 並補入 L3 active_exploitation。

---

## 4. 攻擊手法歸納（含 ATT&CK 映射）

### 4.1 本週主要攻擊手法分類

| 攻擊手法 | 本週案例 | ATT&CK TTP |
|----------|----------|------------|
| 魚叉式網路釣魚（附件） | ScarCruft 仿冒 MS 警報 ZIP/LNK、AgentTesla 釣魚 | <a href="https://attack.mitre.org/techniques/T1566/001/" class="ttp-badge" target="_blank">T1566.001</a> |
| 釣魚連結 / 招募誘騙 | Contagious Interview 開發者招募郵件 | <a href="https://attack.mitre.org/techniques/T1566/002/" class="ttp-badge" target="_blank">T1566.002</a> |
| 利用對外服務 | PeopleSoft、Ivanti Sentry、FortiSandbox、Joomla JCE | <a href="https://attack.mitre.org/techniques/T1190/" class="ttp-badge" target="_blank">T1190</a> |
| 使用者執行（ClickFix） | Lorem Ipsum 轉向 ClickFix 誘餌 | <a href="https://attack.mitre.org/techniques/T1204/" class="ttp-badge" target="_blank">T1204</a> |
| 勒索軟體加密 | DragonForce（PeopleSoft KEV 勒索關聯） | <a href="https://attack.mitre.org/techniques/T1486/" class="ttp-badge" target="_blank">T1486</a> |
| C2 通道濫用合法協議 | DragonForce 濫用 Teams TURN 中繼 | <a href="https://attack.mitre.org/techniques/T1572/" class="ttp-badge" target="_blank">T1572</a> |
| 開發工具持久化 | VS Code「runOn: folderOpen」自動執行 | <a href="https://attack.mitre.org/techniques/T1546/" class="ttp-badge" target="_blank">T1546</a> |
| 持久化（登錄機碼） | VHDX → Remcos RAT（Registry Run key） | <a href="https://attack.mitre.org/techniques/T1547/001/" class="ttp-badge" target="_blank">T1547.001</a> |
| 反射式組件載入 / EDR 規避 | Remcos 鏈使用 WMI 啟動 PowerShell、Assembly.Load | <a href="https://attack.mitre.org/techniques/T1620/" class="ttp-badge" target="_blank">T1620</a> |

### 4.2 L4 威脅情報饋送趨勢（IoC）

本週 threat_feeds 層擷取量（自 06-10）：

| 分類 | 筆數 | 說明 |
|------|------|------|
| malicious_url | 16,826 | URLhaus 惡意 URL |
| ioc_indicator | 3,404 | IoC 指標 |
| malware_sample | 951 | MalwareBazaar 樣本 |

**惡意程式家族分布（malware_sample，自 06-14）Top 10**：

| 排名 | 家族 | 樣本數 | 類型 |
|------|------|--------|------|
| 1 | **Mirai** | 334 | IoT/路由器殭屍網路 |
| 2 | (n/a 未標記) | 213 | — |
| 3 | **ConnectWise** | 57 | RMM 工具濫用 |
| 4 | **AgentTesla** | 52 | 資訊竊取器 |
| 5 | **Kimsuky** | 38 | 北韓 APT |
| 6 | **RemcosRAT** | 34 | 遠端存取木馬 |
| 7 | SilentNet | 26 | 注入器 |
| 8 | Formbook | 25 | 資訊竊取器 |
| 9 | PhantomStealer | 12 | 竊取器 |
| 10 | Kaiji | 10 | Linux 殭屍網路 |

（其餘：NanoCore 9、Gafgyt 9、XWorm 8、Vidar 8、PureLogsStealer 8）

### 4.3 與前期比較

- **Mirai 持續居首**：IoT/路由器層面攻擊壓力延續，與 exploit-db 本週多筆路由器/IoT PoC（ZTE、D-Link、Realtek、Siklu EtherHaul、Meig SLT711）形成「漏洞公開 → 殭屍網路收編」的閉環風險。
- **RAT / 竊取器（AgentTesla、RemcosRAT、Formbook、Vidar）合計顯著**：與第 1 節 Remcos RAT 多階段感染事件呼應，資訊竊取與遠端控制仍是商品化攻擊主力。
- **APT 家族樣本入榜（Kimsuky 38）**：與本週 ScarCruft/Contagious Interview 兩起北韓事件共構出**北韓網路活動的高峰期**。

---

## 5. 新興威脅識別

> **以下判斷均標註信心水準。跨事件關聯結合 L1（事件）、L3（利用情報）、L4（IoC）資料。**

### 5.1 協作平台 C2 中繼化（信心水準：中–高）

DragonForce 濫用 Microsoft Teams TURN 中繼隱藏 C2，是本週最具新意的逃避技術。結合 Qdrant 查得的歷史（A0Backdoor Teams 釣魚 2026-03、RMM 後門偽裝工作場所應用 2026-03），可研判 **「合法 SaaS/協作平台被用作 C2 與投遞通道」已從零星事件演變為持續趨勢**。
- **推論（推測）**：未來六個月內，依賴網路位置/網域信譽的偵測將進一步失效，需轉向行為與身份層面偵測。此為趨勢推論，非確證。

### 5.2 開發者供應鏈與開發工具武器化（信心水準：高）

北韓 Contagious Interview 利用 VS Code「runOn: folderOpen」+ 惡意 GitHub 儲存庫，將**開發環境本身**變為初始存取媒介。SK-CERT 本週亦發布「軟體開發者供應鏈攻擊」警示，兩者獨立佐證 [T1195](https://attack.mitre.org/techniques/T1195/){: .ttp-ref }。對開發者/DevOps 團隊的針對性已明確上升。

### 5.3 共享主機與沙盒逃逸（信心水準：中）

CVE-2026-54420（LiteSpeed/CageFS symlink 逃逸）顯示攻擊者對**多租戶共享主機隔離邊界**的興趣。單一事件樣本，趨勢判定保守。

### 5.4 國家級活動同步高峰（信心水準：中）

同週出現北韓（ScarCruft、Contagious Interview、Kimsuky 樣本）與中國（Earth Lusca/SprySOCKS，含台灣政府目標）多起 APT 活動。
- **推論（推測）**：此為短窗口內的群聚觀察，可能受揭露時機影響，不必然代表攻擊量實質躍升；列為待持續追蹤項目。

---

## 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資
2. **時效性**：資料可能存在數小時至數天的延遲
3. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務等來源
4. **分析局限**：趨勢分析基於公開資料樣本，統計推論應謹慎解讀。本週 vulnerability_tracking 高計數含 NVD 回填歷史 CVE，廠商/嚴重度趨勢以 CERT 公告為主要依據；EPSS 數值化排序待補強
5. **翻譯風險**：部分非英文來源（CERT-FR、CERT-RO、CERT-SE、SK-CERT 等）經 AI 翻譯，可能存在語義偏差

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源。

---

> 產出時間：2026-06-18（UTC+8） · Mode：威脅態勢分析（Threat Landscape Analysis）
> 跨層關聯由 Qdrant 語意查詢（cyber-security collection）輔助驗證
