---
layout: seo-report
last_modified_at: 2026-03-26T10:00:00+08:00
title: 2026 第 13 週威脅態勢分析
description: "2026-03-20 至 2026-03-26 資安威脅週報：FBI/CISA 警告俄羅斯情報機構鎖定 Signal/WhatsApp 帳號釣魚、TeamPCP 透過 Trivy CI/CD 管線入侵 LiteLLM 套件供應鏈（三階段攻擊鏈）、Tycoon2FA PhaaS 平台於 Europol 打擊後數日即復原營運、東南亞詐騙園區系統性整合 AI 深偽視訊詐騙、GSocket 後門透過惡意 Bash 腳本傳播、北韓遠端工作者使用 IP KVM 規避偵測、CISA KEV 新增 7 筆含 Cisco FMC 確認勒索軟體利用、本週 90 份漏洞揭露與 1,870 筆新增 IoC。"
parent: 威脅態勢分析
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-threat-landscape.png
author: 資安情報分析團隊
date: 2026-03-26
---

# 威脅態勢分析 — 2026 第 13 週

> 涵蓋期間：2026-03-20 至 2026-03-26
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-03-26
> 分析模型：Claude Opus

---

## 執行摘要

本週威脅態勢以**國家級即時通訊應用程式釣魚攻擊、開發工具供應鏈 CI/CD 管線劫持、以及犯罪即服務（CaaS）生態系統的高韌性復原**為三大主軸。攻擊者對軟體供應鏈的攻擊手法持續演化，從 NPM/PyPI 套件投毒升級至 CI/CD 管線劫持；國家級威脅行為者則將目標從傳統電子郵件釣魚擴展至加密通訊平台。

**國家級威脅與情報行動**：
- **FBI/CISA 聯合警告俄羅斯情報機構鎖定 Signal/WhatsApp 帳號**（2026-03-25）：俄方透過社交工程與裝置連結功能劫持目標帳號，對外交人員、記者與政策制定者構成重大威脅
- **CERT-FR 發布 CERTFR-2026-ALE-003 警報**（2026-03-20）：獨立確認商業即時通訊應用程式已成為戰略情報蒐集目標
- **北韓遠端工作者使用 IP KVM 規避偵測**（2026-03-24）：SANS ISC 揭露北韓 IT 工作者透過 IP KVM 硬體設備偽裝實際位置，規避企業安全控制

**供應鏈攻擊升級**：
- **TeamPCP 透過 Trivy CI/CD 管線入侵 LiteLLM Python 套件**（2026-03-25）：三階段攻擊鏈——憑證竊取器、K8s 橫向移動、systemd 持久性後門，代表供應鏈攻擊從「套件投毒」進化至「CI/CD 管線劫持」
- **Trivy 漏洞掃描器供應鏈攻擊散布資訊竊取程式**（2026-03-22）：安全工具本身遭入侵，產生信任鏈危機

**犯罪即服務復原與新興威脅**：
- **Tycoon2FA PhaaS 平台於 Europol 3 月 4 日打擊後數日即復原**（2026-03-25）：展現犯罪即服務基礎設施的極高韌性與分散式架構
- **LeakNet 勒索軟體新興組織出現**（2026-03-22）：新勒索軟體品牌加入犯罪生態系統
- **東南亞詐騙園區招募「AI 模型」進行深偽視訊詐騙**（2026-03-25）：AI 技術被有組織犯罪系統性整合至工業化運作模式

**關鍵漏洞態勢**：
- 本週 90 份漏洞揭露公告，涵蓋 VMware、Google Chrome、Linux 核心、Spring、Elastic、IBM、Oracle 等主要產品
- CISA KEV 新增 7+ 筆活躍利用漏洞：Langflow CVE-2026-33017（20 小時內武器化）、Craft CMS CVE-2025-32432、Laravel Livewire CVE-2025-54068、Apple 三筆、Cisco FMC CVE-2026-20131（**確認勒索軟體利用**）
- Apple 2026 年 3 月修補 85 項漏洞，CERT-FR 發布約 40 份安全公告

**威脅情報饋送**：
- ThreatFox/URLhaus/MalwareBazaar 新增 573 筆 IoC 指標
- 各饋送源去重後合計 1,870 筆新增項目

**資料規模**：本週攻擊事件數量達 28 件，供應鏈攻擊與國家級威脅警報為主要驅動因素。

---

## 資料來源統計

| Layer | 本週新增/更新 | 說明 |
|-------|-------------|------|
| security_news_facts | 28 件攻擊事件 | attack_incident（FBI/CISA 聯合警告、TeamPCP 供應鏈、Tycoon2FA 復原等）、industry_trend、vulnerability_disclosure |
| vulnerability_tracking | 90 | CERT-FR 約 40 份、ICS-CERT 多份、Apple 85 項修補等 |
| exploit_intelligence | 8+ | CISA KEV 新增活躍利用、Exploit-DB 新增 PoC（WordPress Backup Migration、mailcow、Redis、FortiWeb） |
| threat_feeds | 1,870 | ThreatFox 573 筆 IoC、URLhaus 惡意 URL、MalwareBazaar 惡意程式樣本 |

> 統計時間：2026-03-26 UTC

---

## 2.1 近期重大資安事件

本週資安事件聚焦於國家級即時通訊釣魚行動、開發工具供應鏈入侵、犯罪基礎設施韌性展現、以及 AI 技術被犯罪集團系統性採用。以下按嚴重程度排序。

### 1. FBI/CISA 聯合警告：俄羅斯情報機構鎖定 Signal/WhatsApp 帳號

**嚴重程度：極高 | 來源：FBI、CISA、CERT-FR、NCSC-FI | 日期：2026-03-25**

美國聯邦調查局與網路安全暨基礎設施安全局聯合發布警告，確認俄羅斯情報機構正積極鎖定使用 Signal 與 WhatsApp 的高價值目標帳號：

- **攻擊手法**：透過社交工程誘騙目標點擊偽造的「裝置連結」邀請 [T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref }，利用 Signal/WhatsApp 的多裝置連結功能將攻擊者裝置同步至目標帳號 [T1098](https://attack.mitre.org/techniques/T1098/){: .ttp-ref }，實現即時讀取所有訊息 [T1530](https://attack.mitre.org/techniques/T1530/){: .ttp-ref }
- **目標群體**：外交人員、政策制定者、記者、非營利組織人員、流亡異見人士
- **多國交叉驗證**：CERT-FR 於 2026-03-20 獨立發布 CERTFR-2026-ALE-003 警報確認相同威脅；芬蘭 NCSC-FI 於 2026-03-25 亦同步發布警告，確認境內已觀測到相關攻擊活動。三個獨立來源的交叉驗證確立了此威脅的真實性
- **戰略意義**：不同於傳統的帳號釣魚，此攻擊利用加密通訊平台的合法設計功能（裝置連結），繞過而非破解端對端加密

**Qdrant 跨層關聯**：語意查詢「Russian phishing messaging apps」在歷史記錄中發現明確升級趨勢——2020 年芬蘭觀測到 WhatsApp 釣魚（一般犯罪）→ 2026-01 月 Facebook 為基礎的 WhatsApp 帳號劫持（有組織犯罪）→ 2026-03 月 FBI/CISA 聯合警告國家級情報行動。攻擊者層級從一般犯罪升級至國家級情報機構。

**防禦建議**：立即審查所有已連結裝置清單、啟用 Signal/WhatsApp 註冊鎖定（Registration Lock）功能、教育高風險人員辨識偽造裝置連結邀請。

### 2. TeamPCP 透過 Trivy CI/CD 管線入侵 LiteLLM 套件供應鏈

**嚴重程度：極高 | 來源：GitHub 安全公告、多家資安媒體 | 日期：2026-03-25**

攻擊團體 TeamPCP 被揭露透過劫持 Trivy 漏洞掃描器的 CI/CD 管線，在 LiteLLM Python 套件中植入惡意程式碼，執行三階段攻擊鏈：

- **第一階段——憑證竊取器** [T1195.002](https://attack.mitre.org/techniques/T1195/002/){: .ttp-ref } → [T1059.006](https://attack.mitre.org/techniques/T1059/006/){: .ttp-ref }：植入的惡意程式碼在套件安裝時蒐集開發環境憑證
- **第二階段——K8s 橫向移動** [T1021](https://attack.mitre.org/techniques/T1021/){: .ttp-ref } → [T1552.001](https://attack.mitre.org/techniques/T1552/001/){: .ttp-ref }：利用竊取的憑證存取目標組織的 Kubernetes 叢集
- **第三階段——systemd 持久性後門** [T1543.002](https://attack.mitre.org/techniques/T1543/002/){: .ttp-ref }：部署 systemd 服務實現系統重啟後的持久性存取
- **攻擊創新**：不同於傳統套件投毒（直接上傳惡意套件至 PyPI），本次攻擊劫持了合法的 CI/CD 建置管線，使得受信任的自動化流程產出受感染套件，偵測難度遠高於傳統方式
- **信任鏈危機**：Trivy 為 Aqua Security 開發的知名安全掃描工具，LiteLLM 為熱門 LLM API 閘道器——兩者皆為開發者高度信任的工具，入侵這些工具動搖了整個開發安全生態系統的信任基礎

**Qdrant 跨層關聯**：語意查詢「supply chain attack CI/CD pipeline」在歷史記錄中發現清晰的演化路徑——2021 年 dependency confusion → 2025 年 NPM 套件感染 → 2026-02 月 Notepad++ 供應鏈攻擊（Lotus Blossom APT）→ 2026-03 月 Trivy/LiteLLM CI/CD 劫持。供應鏈攻擊已從「套件層」進化至「建置管線層」，攻擊面進一步深入軟體開發流程。

**防禦建議**：審計 CI/CD 管線的存取控制與完整性驗證機制、實施軟體材料清單（SBOM）追蹤、對關鍵套件啟用簽章驗證、監控 GitHub Actions 工作流程的異常修改。

### 3. Tycoon2FA PhaaS 平台於 Europol 打擊後數日復原

**嚴重程度：高 | 來源：CrowdStrike、多家資安媒體 | 日期：2026-03-25**

釣魚即服務（Phishing-as-a-Service）平台 Tycoon2FA 在 Europol 於 2026 年 3 月 4 日的打擊行動後，僅數日即恢復正常營運量能：

- **復原速度**：從被打擊到完全恢復僅需數日，展現犯罪即服務基礎設施的極高韌性
- **架構推論**：快速復原暗示該平台採用高度分散式架構、備援基礎設施、以及快速域名切換機制 [T1583.003](https://attack.mitre.org/techniques/T1583/003/){: .ttp-ref }
- **2FA 繞過能力**：Tycoon2FA 專門鎖定 Microsoft 365 與 Google Workspace，能即時攔截並轉發雙因素驗證令牌 [T1539](https://attack.mitre.org/techniques/T1539/){: .ttp-ref }，使傳統 OTP 型 2FA 保護失效
- **執法困境**：本事件與上週（W12）Europol 關閉 370,000 暗網頁面、瓦解 AISuru/KimWolf 殭屍網路形成鮮明對比——大規模打擊行動可削弱犯罪基礎設施，但高價值 CaaS 平台具備迅速復原的能力

**防禦建議**：從 OTP 型 2FA 升級至 FIDO2/WebAuthn 硬體安全金鑰、實施條件式存取策略、監控異常登入地理位置與設備指紋。

### 4. 東南亞詐騙園區系統性整合 AI 深偽技術

**嚴重程度：高 | 來源：多家國際媒體與執法機構 | 日期：2026-03-25**

東南亞詐騙園區（主要位於緬甸、寮國、柬埔寨）被揭露正大規模招募具有外貌條件的人員操作深偽視訊通話系統，以工業化規模進行詐騙：

- **手法升級**：從傳統文字/語音詐騙升級為即時深偽視訊通話 [T1566.003](https://attack.mitre.org/techniques/T1566/003/){: .ttp-ref }，大幅提升詐騙可信度
- **工業化規模**：詐騙園區以工廠模式運作，將 AI 工具標準化供非技術人員使用，顯著降低犯罪門檻
- **規模影響**：結合社交工程與 AI 深偽的詐騙手法可能向全球各地區擴散
- **人口販運關聯**：多數園區工作者為人口販運受害者，凸顯此議題的多面向社會危害

### 5. GSocket 後門透過惡意 Bash 腳本傳播

**嚴重程度：高 | 來源：SANS ISC | 日期：2026-03-20**

SANS Internet Storm Center 報導攻擊者利用 GSocket 合法工具建立隱蔽後門通訊通道：

- **工具濫用**：GSocket 為合法網路工具，可在 NAT/防火牆後方建立加密對等連線，攻擊者將其武器化作為 C2 通道 [T1572](https://attack.mitre.org/techniques/T1572/){: .ttp-ref }
- **傳播方式**：透過惡意 Bash 腳本自動下載與安裝 [T1059.004](https://attack.mitre.org/techniques/T1059/004/){: .ttp-ref }
- **偵測困難**：GSocket 使用合法加密連線，流量特徵與正常 SSH/TLS 流量相似，難以透過傳統網路監控偵測 [T1573.002](https://attack.mitre.org/techniques/T1573/002/){: .ttp-ref }

### 6. 北韓 IT 工作者使用 IP KVM 規避偵測

**嚴重程度：高 | 來源：SANS ISC | 日期：2026-03-24**

SANS ISC 揭露北韓 IT 工作者使用 IP KVM（鍵盤/影像/滑鼠）硬體設備規避企業遠端存取偵測：

- **手法**：在目標企業提供的實體電腦上安裝 IP KVM 設備，遠端存取完全發生在硬體層級，不留下任何軟體痕跡 [T1219](https://attack.mitre.org/techniques/T1219/){: .ttp-ref }
- **規避效果**：繞過所有端點偵測與回應（EDR）工具、VPN 日誌、遠端桌面監控 [T1564](https://attack.mitre.org/techniques/T1564/){: .ttp-ref }
- **背景**：北韓長期派遣 IT 工作者以假身份受雇於外國企業，賺取外匯資助武器計畫，並可能同時進行情報蒐集
- **偵測建議**：實施定期實體設備稽核、監控硬體資產變動與異常網路流量來源

### 7. Microsoft Azure Monitor 回呼釣魚

**嚴重程度：中高 | 來源：多家資安媒體 | 日期：2026-03-22**

攻擊者利用 Microsoft Azure Monitor 的通知回呼功能發動釣魚攻擊：

- **手法**：濫用 Azure Monitor 合法告警回呼功能，向目標發送看似來自 Microsoft 的合法通知 [T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref }
- **可信度**：由於通知確實來自 Microsoft 基礎設施，能繞過大多數郵件安全閘道的寄件者驗證 [T1036.005](https://attack.mitre.org/techniques/T1036/005/){: .ttp-ref }
- **趨勢**：延續攻擊者濫用合法雲端服務功能進行釣魚的長期趨勢（2025 年 Google Calendar 邀請釣魚 → 2026 年 Azure Monitor 回呼釣魚）

### 8. LeakNet 勒索軟體新興組織

**嚴重程度：中 | 來源：多家資安媒體 | 日期：2026-03-22**

新勒索軟體組織 LeakNet 被觀測到建立資料外洩揭露網站（Leak Site）：

- **初始觀察**：尚處於早期營運階段，目前公開的受害者數量有限
- **營運模式**：採用雙重勒索策略——資料加密 [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref } 加上資料外洩威脅 [T1567](https://attack.mitre.org/techniques/T1567/){: .ttp-ref }
- **趨勢**：勒索軟體生態系統持續分裂與重組，新品牌頻繁出現，可能為既有集團的品牌重塑或成員分裂產物

### 9. OVHcloud 疑似遭入侵 160 萬筆記錄外洩

**嚴重程度：中 | 來源：威脅情報社群 | 日期：2026-03-25**

歐洲主要雲端服務供應商 OVHcloud 疑似遭資料外洩，據稱涉及 160 萬筆記錄：

- **現狀**：截至本週報告發布時，OVHcloud 尚未正式確認或否認此事件
- **信心水準：低至中**——消息主要來自威脅情報社群與地下論壇，尚缺乏官方驗證
- **潛在影響**：OVHcloud 為歐洲最大雲端服務商之一，若屬實將影響大量歐洲企業客戶

### 10. GitHub OpenClaw Deployer 木馬攻擊行動

**嚴重程度：中 | 來源：GitHub 安全團隊、Netskope | 日期：2026-03-25**

GitHub 上發現偽裝為合法開發工具「OpenClaw Deployer」的木馬程式攻擊行動：

- **手法**：在 GitHub 建立看似合法的儲存庫，透過 SEO 與社交工程吸引開發者下載含木馬的工具 [T1195.002](https://attack.mitre.org/techniques/T1195/002/){: .ttp-ref }
- **規模**：據 Netskope 報告涉及超過 300 個 GitHub 套件遭木馬化
- **趨勢**：與 TeamPCP/LiteLLM 事件共同反映開發者生態系統持續成為高價值攻擊目標

---

## 2.2 漏洞趨勢分析

### 本週漏洞總覽

| 指標 | 數值 | 與上週比較 |
|------|------|-----------|
| 漏洞揭露公告總數 | 90 | ↓（W12: 203） |
| 新增 Critical/High CVE | 11 | 穩定 |
| CISA KEV 新增 | 7+ | ↑（W12: 7） |
| Apple 修補漏洞數 | 85 | 季度修補週期 |
| CERT-FR 安全公告 | ~40 | 穩定 |

> 漏洞公告總數下降主要因為本週非微軟 Patch Tuesday 週期，MSRC 與 GitHub Advisories 新增量減少。

### CISA KEV 新增活躍利用漏洞

| CVE | 產品 | 類型 | 特殊標記 |
|-----|------|------|----------|
| CVE-2026-33017 | Langflow | Broken Access Control / RCE | **20 小時內遭武器化** |
| CVE-2025-32432 | Craft CMS | Code Injection / RCE | — |
| CVE-2025-54068 | Laravel Livewire | RCE | — |
| CVE-2025-43510 | Apple（多產品） | Improper Locking | — |
| CVE-2025-43520 | Apple（多產品） | Buffer Overflow | — |
| CVE-2025-31277 | Apple（多產品） | Buffer Overflow | — |
| CVE-2026-20131 | Cisco FMC | Deserialization RCE | **已確認勒索軟體攻擊鏈利用** |

### 按廠商分布

| 廠商 | 公告數 | 重點漏洞 |
|------|--------|----------|
| Apple | 85 | iOS/macOS/watchOS/tvOS/visionOS 全平台修補，3 筆進入 KEV |
| CERT-FR 綜合 | ~40 | VMware(5+)、Chrome(3+)、Linux 核心(4)、Spring(2)、Microsoft(3+)、IBM、Oracle、Elastic |
| Schneider Electric | 7 | EcoStruxure Foxboro DCS、EcoStruxure Automation Expert、Modicon M241/M251/M258/M262、Plant iT/brewmaxx、SCADAPack RemoteConnect |
| Siemens | 4 | SICAM SIAPP SDK、SIMATIC、Heliox EV 充電器、RUGGEDCOM APE1808 |
| 其他 ICS | 5+ | Mitsubishi Electric CNC、CTEK ChargePortal、Automated Logic WebCTRL、Pharos Controls Mosaic、Grassroots DICOM |

### 按嚴重程度分布

| 嚴重程度 | 數量 | 佔比 |
|----------|------|------|
| Critical | 3 | ~3% |
| High | 8 | ~9% |
| Medium | 45 | ~50% |
| Low / Unspecified | 34 | ~38% |

### ICS/OT 漏洞專題

本週工業控制系統漏洞數量顯著（19+ 份公告），反映 OT 環境面臨的持續安全挑戰：

| 廠商/產品 | 公告日期 | 影響領域 |
|-----------|----------|----------|
| Schneider Electric EcoStruxure Foxboro DCS | 2026-03-25 | 分散式控制系統（石化、電力） |
| Schneider Electric Plant iT/brewmaxx | 2026-03-25 | 製造業自動化（食品飲料） |
| Pharos Controls Mosaic Show Controller | 2026-03-25 | 照明控制系統（娛樂場所） |
| Grassroots DICOM (GDCM) | 2026-03-25 | 醫療影像系統 |
| CTEK ChargePortal | 2026-03-19 | EV 充電基礎設施 |
| Automated Logic WebCTRL Premium Server | 2026-03-19 | 建築管理系統（HVAC） |
| Mitsubishi Electric CNC Series | 2026-03-19 | 數控加工設備 |
| Siemens Heliox EV Chargers | 2026-03-12 | EV 充電基礎設施 |
| Schneider Electric Modicon M241/M251/M258/M262 | 2026-03-19 | 可程式邏輯控制器 |
| Siemens SICAM SIAPP SDK | 2026-03-17 | 電力自動化 |

**趨勢觀察**：EV 充電基礎設施（CTEK、Siemens Heliox）連續出現漏洞，隨著全球 EV 充電網路快速擴建，此攻擊面值得長期關注。

---

## 2.3 活躍利用與 PoC 動態

### CISA KEV 活躍利用漏洞分析

本週 CISA 新增多筆已確認遭活躍利用的漏洞至 Known Exploited Vulnerabilities 目錄。**CVE-2026-20131（Cisco FMC）明確標記為勒索軟體攻擊鏈的一環**，為本年度少數被 CISA 關聯至勒索軟體的 KEV 條目。

| CVE | 武器化速度 | 攻擊類型 | 利用現狀 |
|-----|-----------|----------|----------|
| CVE-2026-33017 | **20 小時** | 未認證 RCE | Langflow AI 平台遭大規模利用 |
| CVE-2026-20131 | — | Deserialization RCE | **確認勒索軟體攻擊鏈利用** |
| CVE-2025-43510/43520/31277 | — | 記憶體損壞 | Apple 全平台，可能關聯商業間諜軟體 |
| CVE-2025-32432 | — | Code Injection / RCE | Craft CMS 內容管理系統 |
| CVE-2025-54068 | — | RCE | Laravel Livewire PHP 框架 |

**Qdrant 跨層關聯**：語意查詢「CISA KEV ransomware exploitation」發現 CISA 每月穩定新增 5-10 筆 KEV 條目，但明確標記「Known ransomware campaign use」的比例較低（約 10-15%）。CVE-2026-20131 的此標記結合本週 Interlock 勒索軟體持續鎖定 Cisco 設備的報告，顯示 Cisco 安全管理基礎設施已成為勒索軟體集團的優先目標。

### 新公開 PoC / Exploit 彙整

本週 Exploit Intelligence 層追蹤到以下新公開的利用方式：

| 來源 | 目標 | 類型 | 風險評估 |
|------|------|------|----------|
| Exploit-DB | WordPress Backup Migration | RCE | 高——WordPress 外掛廣泛部署 |
| Exploit-DB | mailcow | Header Poisoning | 中——企業自架郵件伺服器 |
| Exploit-DB | Redis | RCE | 高——資料庫暴露於網際網路風險 |
| Exploit-DB | FortiWeb | SQLi → RCE | 極高——Fortinet WAF 安全設備 |
| Exploit Intelligence | Langflow | Broken Access Control | 極高——已進入 KEV，20hr 武器化 |
| Exploit Intelligence | Budibase | Auth Bypass | 中——低程式碼開發平台 |
| Exploit Intelligence | Mastodon/Astro/JumpServer | Open Redirect | 低至中——可用於釣魚鏈 |
| Exploit Intelligence | ownCloud | User Enumeration | 低——資訊蒐集階段 |

### 與漏洞追蹤層交叉關聯

| CVE | vulnerability_tracking | exploit_intelligence | 雙層交叉確認 |
|-----|----------------------|---------------------|-------------|
| CVE-2026-33017 (Langflow) | Critical | KEV + PoC 公開 | 確認 |
| CVE-2026-20131 (Cisco FMC) | High | KEV + 勒索軟體標記 | 確認 |
| CVE-2025-32432 (Craft CMS) | 追蹤中 | KEV | 確認 |
| CVE-2025-54068 (Laravel Livewire) | 追蹤中 | KEV | 確認 |

---

## 2.4 攻擊手法歸納

### MITRE ATT&CK TTP 本週觀測統計

本週觀測到的攻擊技術涵蓋 ATT&CK 框架多個戰術階段，供應鏈攻擊（T1195）與社交工程（T1566）為最頻繁出現的初始存取向量：

| 戰術階段 | TTP ID 與技術名稱 | 關聯事件 |
|----------|-------------------|----------|
| **初始存取** | [T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref } Spearphishing Link | FBI/CISA 俄羅斯 Signal/WhatsApp 釣魚、Azure Monitor 回呼釣魚 |
| | [T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } Exploit Public-Facing Application | Langflow CVE-2026-33017、Cisco FMC CVE-2026-20131、Craft CMS、Laravel Livewire |
| | [T1195.002](https://attack.mitre.org/techniques/T1195/002/){: .ttp-ref } Supply Chain Compromise: Software | TeamPCP/Trivy/LiteLLM CI/CD 劫持、OpenClaw Deployer 木馬 |
| | [T1566.003](https://attack.mitre.org/techniques/T1566/003/){: .ttp-ref } Phishing via Service | 東南亞深偽視訊詐騙 |
| **執行** | [T1059.004](https://attack.mitre.org/techniques/T1059/004/){: .ttp-ref } Unix Shell | GSocket 後門 Bash 腳本 |
| | [T1059.006](https://attack.mitre.org/techniques/T1059/006/){: .ttp-ref } Python | LiteLLM 惡意 Python 載荷 |
| **持久性** | [T1543.002](https://attack.mitre.org/techniques/T1543/002/){: .ttp-ref } Systemd Service | TeamPCP 第三階段 systemd 後門 |
| | [T1098](https://attack.mitre.org/techniques/T1098/){: .ttp-ref } Account Manipulation | Signal/WhatsApp 裝置連結劫持 |
| **防禦規避** | [T1036.005](https://attack.mitre.org/techniques/T1036/005/){: .ttp-ref } Match Legitimate Name or Location | Azure Monitor 回呼釣魚（合法基礎設施） |
| | [T1564](https://attack.mitre.org/techniques/T1564/){: .ttp-ref } Hide Artifacts | 北韓 IP KVM 硬體層級規避 |
| | [T1572](https://attack.mitre.org/techniques/T1572/){: .ttp-ref } Protocol Tunneling | GSocket 加密對等通道 |
| | [T1573.002](https://attack.mitre.org/techniques/T1573/002/){: .ttp-ref } Encrypted Channel: Asymmetric Cryptography | GSocket 加密流量 |
| **憑證存取** | [T1539](https://attack.mitre.org/techniques/T1539/){: .ttp-ref } Steal Web Session Cookie | Tycoon2FA 即時 2FA 令牌攔截 |
| | [T1552.001](https://attack.mitre.org/techniques/T1552/001/){: .ttp-ref } Credentials in Files | LiteLLM 憑證竊取階段 |
| **橫向移動** | [T1021](https://attack.mitre.org/techniques/T1021/){: .ttp-ref } Remote Services | TeamPCP K8s 叢集橫向移動 |
| **蒐集** | [T1530](https://attack.mitre.org/techniques/T1530/){: .ttp-ref } Data from Cloud Storage Object | Signal/WhatsApp 訊息同步讀取 |
| **滲漏** | [T1567](https://attack.mitre.org/techniques/T1567/){: .ttp-ref } Exfiltration Over Web Service | LeakNet 雙重勒索資料外洩 |
| **影響** | [T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref } Data Encrypted for Impact | Cisco FMC 勒索軟體、LeakNet |
| **資源開發** | [T1583.003](https://attack.mitre.org/techniques/T1583/003/){: .ttp-ref } Acquire Infrastructure: Virtual Private Server | Tycoon2FA 分散式備援基礎設施 |
| **遠端存取** | [T1219](https://attack.mitre.org/techniques/T1219/){: .ttp-ref } Remote Access Software | 北韓 IP KVM 遠端存取 |

### 攻擊手法分類與趨勢比較

| 攻擊類型 | W13 事件數 | W12 事件數 | 趨勢 | 分析 |
|----------|-----------|-----------|------|------|
| 供應鏈攻擊 | 3 | 1 | ↑↑ | CI/CD 管線成為新攻擊面，顯著升級 |
| 國家級釣魚/情報 | 3 | 1 | ↑↑ | 從傳統郵件擴展至即時通訊平台 |
| 勒索軟體 | 2 | 2 | → | 穩定，但 LeakNet 新組織出現 |
| 釣魚即服務 | 1 | 0 | ↑ | Tycoon2FA 復原為重要韌性信號 |
| AI 輔助犯罪 | 1 | 0 | ↑ | 深偽技術系統性犯罪化 |
| 後門/C2 | 2 | 1 | ↑ | GSocket + IP KVM 為新觀測手法 |
| 公開應用漏洞利用 | 5+ | 5+ | → | Langflow 20hr 為最快武器化速度 |

### IoC 趨勢（L4 威脅情報饋送）

本週 573 筆新增 ThreatFox IoC 指標的分布分析：

| IoC 類型 | 估計數量 | 主要關聯惡意程式家族 |
|----------|---------|---------------------|
| C2 IP 位址 | ~350 | Cobalt Strike、AsyncRAT、RedLine Stealer |
| 惡意域名 | ~150 | 釣魚基礎設施、惡意軟體 C2 |
| 惡意 URL | ~50 | 載荷投遞、釣魚登入頁面 |
| 檔案雜湊 | ~23 | 資訊竊取程式、RAT、後門 |

---

## 2.5 新興威脅識別

### 1. CI/CD 管線劫持——供應鏈攻擊第三代範式

**信心水準：高**

TeamPCP 對 Trivy/LiteLLM 的攻擊代表供應鏈攻擊手法的重要世代演化：

| 世代 | 時期 | 攻擊方式 | 代表事件 | 偵測難度 |
|------|------|----------|----------|----------|
| 第一代 | 2020-2021 | Dependency Confusion / Typosquatting | npm/PyPI 命名混淆 | 低 |
| 第二代 | 2021-2024 | 帳號劫持 → 合法套件投毒 | ua-parser-js、event-stream | 中 |
| **第三代** | **2025-2026** | **CI/CD 管線劫持** | **TeamPCP/Trivy/LiteLLM、Notepad++/Lotus Blossom** | **高** |

**趨勢判斷**：第三代供應鏈攻擊透過劫持自動化建置流程，能在不直接修改原始碼儲存庫的情況下污染建置產出物。由於 CI/CD 管線通常被視為「受信任的自動化流程」，偵測難度顯著高於前兩代。預期未來 6-12 個月內將出現更多 CI/CD 管線劫持案例，特別針對 AI/ML 工具鏈（因其快速成長且安全成熟度較低）。

### 2. 加密通訊平台成為國家級情報蒐集新戰場

**信心水準：高**

FBI/CISA 與 CERT-FR 的獨立警報交叉驗證了一個重要趨勢——國家級威脅行為者正系統性地將情報蒐集目標從傳統電子郵件轉向加密即時通訊平台：

- **驅動因素**：高價值目標越來越多地使用端對端加密通訊取代傳統電子郵件，傳統郵件監控效果持續下降
- **攻擊策略轉變**：不再嘗試破解加密協定，而是利用社交工程劫持帳號或利用合法功能（裝置連結）建立平行存取
- **防禦矛盾**：Signal/WhatsApp 的安全模型設計上可抵抗大規模監控，但對針對個別帳號的社交工程攻擊存在結構性弱點
- **預期擴散**：隨著更多組織採用加密通訊工具，預期其他國家級行為者（不限於俄羅斯）將發展類似能力

### 3. 犯罪即服務（CaaS）基礎設施展現執法抗性

**信心水準：中高**

Tycoon2FA 在 Europol 打擊後數日復原，揭示了一個令人擔憂的結構性趨勢：

- **基礎設施韌性**：現代 CaaS 平台採用分散式架構、多層冗餘基礎設施、防彈託管（bulletproof hosting）、快速域名切換機制
- **打擊效果遞減**：儘管 Europol 持續加大打擊力度（W12 關閉 370,000 暗網頁面、瓦解 AISuru/KimWolf），高價值 CaaS 平台展現出遠超預期的復原速度
- **經濟激勵**：Tycoon2FA 等 PhaaS 平台的高利潤率（月訂閱制、低運營成本）提供了充分的經濟動機投資韌性基礎設施
- **預期趨勢**：CaaS 平台將持續投資抗打擊基礎設施，執法機構需要發展更持久的打擊策略（如金流追蹤、客戶端瓦解）而非依賴單點基礎設施查扣

### 4. AI 技術被有組織犯罪系統性武器化

**信心水準：中**

東南亞詐騙園區對深偽技術的工業化採用標誌著 AI 犯罪化的新階段：

- **當前階段**：將 AI 工具（深偽視訊生成、語音合成、自動文本生成）標準化為犯罪作業標準流程（SOP）的一部分
- **門檻降低**：非技術人員可透過標準化工具介面執行 AI 輔助詐騙，無需理解底層技術
- **規模化生產**：工廠化運作模式使單一園區的詐騙量能大幅增加
- **未來風險**：隨著生成式 AI 能力持續提升，深偽品質與即時性將更難辨識（信心水準：中——取決於 AI 偵測技術能否同步發展，目前偵測方落後於生成方）

### 5. 硬體層級規避技術出現

**信心水準：中**

北韓 IT 工作者使用 IP KVM 設備代表了一種罕見的硬體層級規避策略：

- **創新性**：完全繞過軟體層級的所有偵測機制——EDR、DLP、UEBA、行為分析均無法偵測硬體層級的遠端存取
- **偵測盲區**：傳統安全架構完全專注於軟體層級監控，對硬體層級異常幾乎無能為力
- **預期擴散**：信心水準為低至中——目前僅觀測到北韓相關案例，但若此手法被更廣泛的威脅行為者採用，將對遠端/混合工作安全模型構成根本性挑戰
- **長期影響**：可能推動企業重新評估實體安全與硬體資產管理的重要性

---

## 本週關鍵指標摘要

| 指標 | 數值 | 意義 |
|------|------|------|
| 重大攻擊事件 | 28 | 較 W12 增加 |
| 供應鏈攻擊事件 | 3 | CI/CD 管線劫持為第三代範式 |
| 國家級威脅警報 | 3 | FBI/CISA + CERT-FR + NCSC-FI 交叉驗證 |
| CISA KEV 新增 | 7+ | 含 1 筆確認勒索軟體利用（Cisco FMC） |
| 漏洞揭露公告 | 90 | 含 11 筆 Critical/High |
| ICS/OT 漏洞公告 | 19+ | EV 充電基礎設施為新關注面 |
| 新增 IoC 指標 | 1,870（去重） | 含 573 筆 ThreatFox |
| 最快武器化時間 | 20 小時 | Langflow CVE-2026-33017 |
| CaaS 復原時間 | 數日 | Tycoon2FA 展現高韌性 |

---

## 防禦優先建議

基於本週威脅態勢分析，建議組織依以下優先順序強化防禦：

### 立即行動（24-48 小時內）

1. **即時通訊安全強化**：
   - 審查所有 Signal/WhatsApp 已連結裝置清單，移除不明裝置
   - 啟用註冊鎖定（Registration Lock）功能
   - 對高風險人員（高階主管、外交人員、記者）進行裝置連結詐騙防範教育

2. **關鍵漏洞修補**：
   - **最高優先**：CVE-2026-33017（Langflow）——已大規模利用、CVE-2026-20131（Cisco FMC）——確認勒索軟體利用
   - **高優先**：Apple 2026 年 3 月安全更新（85 項漏洞，3 筆 KEV）
   - **高優先**：CVE-2025-32432（Craft CMS）、CVE-2025-54068（Laravel Livewire）

### 短期加強（1-2 週內）

3. **供應鏈安全審計**：
   - 審計 CI/CD 管線存取控制與完整性驗證機制
   - 檢查 Trivy/LiteLLM 套件版本，確認未使用受影響版本
   - 實施 SBOM 追蹤與套件簽章驗證
   - 監控 GitHub Actions 工作流程的異常修改

4. **2FA 升級規劃**：
   - 從 OTP 型 2FA 升級至 FIDO2/WebAuthn 硬體安全金鑰
   - 實施條件式存取策略因應 Tycoon2FA 類 AiTM 攻擊

### 中期規劃（1-3 個月內）

5. **實體安全與硬體資產管理**：
   - 對遠端員工設備建立定期實體稽核機制
   - 建立 IP KVM 等硬體規避手法的偵測能力
   - 評估網路層級異常流量偵測（識別非授權硬體設備）

6. **ICS/OT 漏洞管理**：
   - 盤點 Schneider Electric、Siemens 等 ICS 設備版本
   - 特別關注 EV 充電基礎設施（CTEK、Siemens Heliox）的安全更新

---

## 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資
2. **時效性**：資料可能存在數小時至數天的延遲
3. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務等來源
4. **分析局限**：趨勢分析基於公開資料樣本，統計推論應謹慎解讀
5. **翻譯風險**：部分非英文來源經 AI 翻譯，可能存在語義偏差
6. **未驗證事件**：OVHcloud 疑似入侵事件尚未經官方確認（信心水準：低至中）
7. **IoC 統計精度**：ThreatFox/URLhaus/MalwareBazaar 數據基於去重後統計，跨饋送源的重複率可能影響精確數字

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源。
