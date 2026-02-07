---
layout: default
title: 威脅態勢分析 — 2026 第 04 週
parent: 威脅態勢分析
nav_order: 3
nav_exclude: false
---

# 威脅態勢分析 — 2026 第 04 週
> 涵蓋期間：2026-01-21 至 2026-01-27
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-01-27

---

## 2.1 近期重大資安事件

以下事件按嚴重程度排列，綜合來自 L1 資安新聞事實層的多來源情資。

### 2.1.1 [嚴重] Cisco 多產品漏洞遭野外利用（CVE-2026-20045）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-22 |
| **來源** | HKCERT |
| **嚴重程度** | 嚴重（Extremely High Risk） |

Cisco 多個產品線發現 5 個漏洞（CVE-2026-20045、CVE-2026-20055、CVE-2026-20080、CVE-2026-20092、CVE-2026-20109），其中 **CVE-2026-20045 已被確認在野外積極利用**。攻擊者透過向網頁管理介面發送特製 HTTP 請求，利用輸入驗證不當漏洞取得使用者級別存取權限並提升至 root。受影響產品涵蓋 Cisco Unified CM、Unity Connection、Webex Calling Dedicated Instance 等多個企業通訊平台。

**建議行動**：立即套用 Cisco 發布的安全修補程式。

### 2.1.2 [嚴重] VMware vCenter Server 遠端程式碼執行遭野外利用（CVE-2024-37079）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-26 |
| **來源** | HKCERT |
| **嚴重程度** | 嚴重（Extremely High Risk） |

VMware vCenter Server 7.0/8.0 及 Cloud Foundation 4.x/5.x 存在多個漏洞（CVE-2024-37079、CVE-2024-37080、CVE-2024-37081），其中 **CVE-2024-37079 已遭野外積極利用**。攻擊者可透過網路存取 vCenter Server，藉由特製網路封包觸發遠端程式碼執行。結合本週同步揭露的 Brickstorm 後門程式（見 2.1.5），VMware 基礎設施面臨多重威脅。

**建議行動**：立即套用 Broadcom 修補程式，並審查 vCenter/ESXi 環境是否存在未授權虛擬機器。

### 2.1.3 [嚴重] Microsoft Office 安全限制繞過遭野外利用（CVE-2026-21509）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | HKCERT |
| **嚴重程度** | 嚴重 |

Microsoft Office 存在安全限制繞過漏洞（CVE-2026-21509），**已在野外被積極利用**。該漏洞涉及 Microsoft Office 在安全決策中依賴不受信任的輸入，影響 Microsoft 365 Apps for Enterprise 及 Office 2016/2019/LTSC 2021/LTSC 2024。Office 2021 及更新版本將透過服務端變更自動受到保護（需重新啟動），但 Office 2016 和 2019 使用者需手動安裝安全更新。

**建議行動**：確認所有 Office 安裝已套用最新安全更新，重新啟動 Office 應用程式。

### 2.1.4 [嚴重] GNU InetUtils Telnet 身份驗證繞過影響 80 萬台伺服器（CVE-2026-24061）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | NCSC-FI Daily News（BleepingComputer/Shadowserver） |
| **嚴重程度** | 嚴重 |

GNU InetUtils telnetd 存在重大身份驗證繞過漏洞（CVE-2026-24061），影響版本從 1.9.3（2015 年）至 2.7，**長達 11 年**。攻擊者僅需在 USER 環境變數中傳送 `-f root` 即可直接以 root 身份登入，繞過所有身份驗證。Shadowserver 追蹤到近 80 萬個 IP 位址存在 Telnet 指紋，且已偵測到主動攻擊行為。修補版本 2.8 已於 2026-01-20 發布。

**建議行動**：立即升級至 GNU InetUtils 2.8，或停用 Telnet 服務。

### 2.1.5 [高] PRC 國家支持的 Brickstorm 後門瞄準 VMware 基礎設施

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-04 |
| **來源** | Canadian Centre for Cyber Security（聯合 CISA、NSA） |
| **嚴重程度** | 高 |

加拿大網路安全中心、CISA 與 NSA 聯合發布 Brickstorm 後門惡意軟體分析報告，歸因於中華人民共和國國家支持的威脅行為者。Brickstorm 專門針對 VMware vCenter Server 和 ESXi，可在 Linux 及 Windows 環境運作。該後門能竊取虛擬機器快照中的憑證與加密金鑰，並建立隱藏的惡意虛擬機器作為持久性後門。主要目標為政府服務、關鍵基礎設施及 IT 產業。

### 2.1.6 [高] 新型 Fake CAPTCHA 攻擊鏈投遞 Amatera Stealer

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | NCSC-FI Daily News（Blackpoint Cyber） |
| **嚴重程度** | 高 |

Blackpoint Cyber SOC 發現新型 Fake CAPTCHA 攻擊鏈，利用微軟簽章的 `SyncAppvPublishingServer.vbs`（App-V LOLBIN）作為初始執行手段，透過 Google Calendar 取得 C2 配置，並以 PNG 隱寫術隱藏加密 payload，最終在記憶體中執行 Amatera Stealer。此攻擊鏈全程避免檔案落地偵測，展現高度規避能力。

### 2.1.7 [高] Salt Typhoon 持續攻擊全球電信基礎設施

| 項目 | 內容 |
|------|------|
| **日期** | 2025-06-19 至 2025-08-27（持續追蹤） |
| **來源** | Canadian Centre for Cyber Security |
| **嚴重程度** | 高 |

中華人民共和國國家支持的 Salt Typhoon 威脅組織持續針對全球電信基礎設施進行間諜活動。已確認加拿大電信公司的 3 台網路設備於 2025 年 2 月遭到入侵。攻擊者利用 CVE-2023-20198 等邊緣設備漏洞，建立 GRE 隧道進行流量攔截與資料竊取，目標包括通話記錄、位置資訊、簡訊等。評估認為此活動將持續至少兩年。

### 2.1.8 [高] PackageGate：JavaScript 套件管理器 6 個零日漏洞

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | NCSC-FI Daily News（Koi.ai） |
| **嚴重程度** | 高 |

安全研究人員發現 npm、pnpm、vlt、Bun 等 JavaScript 套件管理器中存在 6 個零日漏洞，可繞過生命週期腳本禁用與 lockfile 完整性防禦。pnpm 已修補（CVE-2025-69263、CVE-2025-69264），vlt 和 Bun 已修補，**但 npm（現屬 Microsoft）將報告關閉為「Works as expected」**，使最大的 JavaScript 生態系統仍處於風險中。

### 2.1.9 [高] Cloudflare BGP 路由洩漏事件

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-22 |
| **來源** | NCSC-FI Daily News（BleepingComputer） |
| **嚴重程度** | 中 |

2026 年 1 月 22 日，Cloudflare 因 Miami 路由器的策略配置錯誤，導致為時 25 分鐘的 BGP 路由洩漏，造成 IPv6 流量受到影響，約 12 Gbps 流量丟失，波及 Cloudflare 以外的外部網路。此事件屬 RFC7908 定義的 Type 3/Type 4 路由洩漏。

---

## 2.2 漏洞趨勢分析

### 本週漏洞概況

| 指標 | 數量 |
|------|------|
| **L2 漏洞追蹤層總計** | **1,776 筆** |
| 嚴重/高風險（Critical/High） | 524 筆 |
| 中風險（Medium） | 1,204 筆 |
| 低風險/資訊（Low/Info） | 48 筆 |
| **本週期（2026 年）新增** | **48 筆** |
| 其中嚴重/高風險 | 25 筆 |
| 其中中風險 | 21 筆 |
| 其中低風險/資訊 | 2 筆 |

> **注意**：L2 層涵蓋多個國際 CERT 來源的歷史累積資料，並非全部為本週新增。2026 年標記的 48 筆為近期新增或更新的漏洞公告。

### 廠商分布（2026 年新增之嚴重/高風險漏洞）

根據本週期可識別的嚴重/高風險漏洞公告：

| 廠商 | 漏洞數/公告數 | 代表 CVE |
|------|-------------|---------|
| **Cisco** | 5 CVE | CVE-2026-20045（野外利用） |
| **Microsoft** | 2+ 公告 | CVE-2026-21509（Office，野外利用）、Edge 更新 |
| **VMware (Broadcom)** | 3 CVE | CVE-2024-37079（野外利用） |
| **銘祥科技 (JNC)** | 2 CVE（CVSS 9.8） | CVE-2026-1363、CVE-2026-1364（IoT 設備） |
| **廣達電腦** | 6 CVE（最高 8.8） | CVE-2025-15240（醫療雲平台） |
| **Zoom** | 1 CVE | CVE-2026-22844（RCE） |
| **GitLab** | 5 CVE | CVE-2026-0723 等（DoS/繞過） |
| **GNU InetUtils** | 1 CVE | CVE-2026-24061（驗證繞過） |

### 已確認野外利用漏洞（本週）

本週有 **3 個漏洞被確認在野外積極利用**，需優先修補：

1. **CVE-2026-20045**（Cisco）— HTTP 輸入驗證不當導致權限提升至 root
2. **CVE-2024-37079**（VMware vCenter）— 特製封包觸發遠端程式碼執行
3. **CVE-2026-21509**（Microsoft Office）— 安全限制繞過

### 嚴重程度分布特徵

- 2026 年新增漏洞中，**嚴重/高風險占比 52%**（25/48），顯示近期披露的漏洞品質偏高
- IoT 設備（銘祥科技 IAQS/I6）出現 CVSS 9.8 的重大漏洞，且 M3 晶片設備無法獲得修補
- 醫療系統漏洞（廣達電腦 QOCA aim）凸顯醫療產業軟體安全問題

---

## 2.3 活躍利用與 PoC 動態

### L3 漏洞利用情報層概況

| 分類 | 數量 |
|------|------|
| **PoC 已公開** | 49 筆 |
| **漏洞揭露** | 1 筆 |
| **活躍利用** | 0 筆（L3 層內；但 L2 層確認 3 個野外利用） |

> **注意**：L3 層「active_exploitation」目錄目前無檔案。已確認的野外利用漏洞資訊來自 L2 層 HKCERT 公告。

### 本週關鍵 PoC 與 Exploit

| CVE | 產品 | 類型 | 嚴重程度 | PoC 來源 |
|-----|------|------|---------|---------|
| CVE-2025-4427 + CVE-2025-4428 | Ivanti Endpoint Manager Mobile 12.5.0.0 | 驗證繞過 + RCE 鏈 | Critical（預估 9.0+） | Exploit-DB (EDB-52421) |
| CVE-2025-7441 | StoryChief WordPress Plugin 1.0.42 | 任意檔案上傳 → RCE | Critical（CVSS 9.8） | Exploit-DB (EDB-52422) |
| CVE-2025-9090 | Tenda AC20 WiFi Router | 命令注入 | Critical | Exploit-DB (EDB-52418) |
| CVE-2025-47917 | Mbed TLS 3.6.4 | Use-After-Free | High | Exploit-DB (EDB-52427) |
| CVE-2025-26264 | GeoVision ASManager 6.1.2.0 | RCE（需認證） | Critical | Exploit-DB (EDB-52424) |
| CVE-2025-26263 | GeoVision ASManager 6.1.2.0 | 憑證揭露（本地） | High | Exploit-DB (EDB-52423) |
| CVE-2023-44487 | HTTP/2 協議 | HTTP/2 Rapid Reset DoS | High | Exploit-DB (EDB-52426) |

### L2 與 L3 交叉關聯

- **Ivanti 產品**為高風險焦點：L1 層記錄了 SPAWNCHIMERA 惡意軟體（利用 CVE-2025-0282）與 DslogdRAT（同樣利用 CVE-2025-0282），L3 層新增 Ivanti EPMM 的驗證繞過+RCE PoC（CVE-2025-4427/4428）。Ivanti 產品線持續是攻擊者的優先目標。
- **VMware 基礎設施**面臨雙重威脅：L2 層確認 CVE-2024-37079 野外利用 + L1 層揭露 Brickstorm 後門專門針對 vCenter/ESXi。
- **IoT/嵌入式設備** PoC 持續增長：Tenda 路由器命令注入、銘祥科技 IoT 設備 CVSS 9.8 漏洞均無需認證即可遠端利用。

### Windows 安全機制繞過研究動態

Google Project Zero 發現 Windows 11 25H2 的 Administrator Protection 功能（UAC 替代方案）存在 9 個繞過漏洞，可靜默取得完整管理員權限。所有問題已由 Microsoft 修補（KB5067036），但此研究揭示新安全功能在部署初期可能存在多個繞過路徑。

---

## 2.4 攻擊手法歸納

### 攻擊手法分類（來自 L1 + L4）

#### 國家級 APT 活動

本週期資料顯示中華人民共和國國家支持的威脅行為者活動持續活躍：

| 威脅組織/活動 | 攻擊手法 | 目標 |
|--------------|---------|------|
| Salt Typhoon | 邊緣設備漏洞利用 → GRE 隧道 → 流量攔截 | 全球電信基礎設施 |
| PRC 國家行為者 | 路由器修改 → 持久化 → 橫向移動 | 電信、政府、交通、軍事 |
| PRC 國家行為者 | Brickstorm 後門 → 隱藏虛擬機器 → 憑證竊取 | VMware 基礎設施 |
| UNC1151 | Roundcube 漏洞利用 → 魚叉式釣魚 | 波蘭實體組織 |

#### 社交工程與身分冒充

| 手法 | 技術特徵 | 來源 |
|------|---------|------|
| AI 深偽冒充政府官員 | SMS + AI 語音 + 來電顯示偽造 | Canadian CCCS (2025-06-23) |
| 北韓 IT 人員滲透 | 偽造身分 + VPN 隱藏來源 + AI 憑證 | RCMP/CCCS (2025-07-18) |
| Scattered Spider | IT Help Desk 社交工程 → 憑證竊取 | FBI/CCCS (2025-07-29) |

#### 供應鏈與開發工具攻擊

| 手法 | 技術特徵 | 來源 |
|------|---------|------|
| VSCode tasks.json 自動執行 | `runOn: folderOpen` + Base64 編碼命令 | SANS ISC (2026-01-21) |
| PackageGate 套件管理器零日 | 繞過 lifecycle script 禁用 + lockfile 完整性 | Koi.ai (2026-01-27) |
| Fake CAPTCHA → LOLBIN → 隱寫術 | App-V VBS + Google Calendar C2 + PNG Steganography | Blackpoint Cyber (2026-01-27) |

### L4 威脅情報饋送層 IoC 趨勢

#### IoC 指標分布統計（L4 共 935 筆 IoC）

| 惡意軟體家族 | IoC 數量 | 占比 | IoC 類型 |
|-------------|---------|------|---------|
| **Cobalt Strike** | 235 | 25.1% | IP |
| **Meterpreter** | 168 | 18.0% | IP |
| Unknown malware (URL) | 38 | 4.1% | URL |
| Unknown malware (IP) | 33 | 3.5% | IP |
| **Vidar** (URL+IP+Domain) | 58 | 6.2% | 混合 |
| **xworm** | 15 | 1.6% | Domain |
| **Remcos** | 15 | 1.6% | IP |
| **AsyncRAT** | 25 | 2.7% | Domain + URL |
| **Quasar RAT** | 14 | 1.5% | Domain |
| **ValleyRAT** | 19 | 2.0% | IP + Domain |
| DeiMos C2 | 12 | 1.3% | IP |
| Mirai | 8 | 0.9% | IP |
| 其他 | 295 | 31.5% | 混合 |

**關鍵觀察**：
- **Cobalt Strike 與 Meterpreter 合計占 IoC 的 43.1%**，顯示滲透測試工具仍是最廣泛使用的攻擊框架
- RAT 類惡意軟體（Remcos、AsyncRAT、Quasar RAT、ValleyRAT、xworm）合計占 9.4%，遠端存取木馬活動活躍
- **ValleyRAT**（別名 Winos）的出現值得關注，此為中國語系威脅行為者使用的新興 RAT

#### 惡意軟體樣本分布（L4 共 837 筆樣本）

| 惡意軟體家族 | 樣本數 | 占比 | 檔案類型 |
|-------------|--------|------|---------|
| **Mirai** | 399 | 47.7% | ELF |
| 未分類（n/a） | 166 | 19.8% | 混合 |
| **GCleaner** | 63 | 7.5% | EXE |
| **AdwareNeoReklami** | 35 | 4.2% | EXE |
| **AsyncRAT** | 17 | 2.0% | EXE |
| **Gafgyt** | 14 | 1.7% | ELF |
| Quasar RAT | 9 | 1.1% | EXE |
| ConnectWise | 9 | 1.1% | EXE |
| Tsunami | 7 | 0.8% | ELF |
| StealC | 7 | 0.8% | EXE |

**關鍵觀察**：
- **Mirai 殭屍網路樣本占 47.7%**，IoT 設備持續為大規模殭屍網路的主要目標
- Mirai + Gafgyt + Tsunami（IoT 殭屍網路）合計占比超過 50%
- Windows 平台惡意軟體以 GCleaner、AsyncRAT、StealC 等資訊竊取與遠端存取類為主

#### C2 基礎設施動態（L4 共 6 筆 C2）

| 惡意軟體 | C2 IP | 託管商 | 地區 | 首次發現 | 狀態 |
|---------|-------|-------|------|---------|------|
| QakBot | 172.232.59.14:443 | Akamai/Linode | FR | 2026-01-19 | Offline |
| QakBot | 34.204.119.63:443 | AWS | US | 2026-01-13 | Offline |
| QakBot | 50.16.16.211 | - | - | 2025 | Offline |
| QakBot | 137.184.9.29 | - | - | 2025 | Offline |
| Emotet | 167.86.75.145 | - | - | 2022 | Offline |
| Emotet | 162.243.103.246 | - | - | 2022 | Offline |

**QakBot 觀察**：2026 年 1 月偵測到 2 個新的 QakBot C2 伺服器（FR、US），儘管目前均已離線，顯示 QakBot 基礎設施仍在持續更新與輪替。攻擊者偏好使用主流雲端服務商（Akamai Linode、AWS）作為 C2 託管。

---

## 2.5 新興威脅識別

### 2.5.1 LOLBIN + 公共基礎設施 C2 攻擊鏈成熟化

**信心水準：高**

本週 Amatera Stealer 攻擊鏈展示了 LOLBIN（Living-off-the-Land Binary）技術與公共基礎設施濫用的成熟結合：
- 利用微軟簽章的 `SyncAppvPublishingServer.vbs` 規避偵測
- 使用 Google Calendar 作為 C2 配置通道（living off someone else's infrastructure）
- PNG 隱寫術實現全記憶體執行

此攻擊模式預示攻擊者將更頻繁地利用合法雲端服務作為攻擊基礎設施，傳統基於 IP/Domain 的封鎖策略將面臨更大挑戰。

### 2.5.2 JavaScript 供應鏈防禦繞過

**信心水準：高**

PackageGate 研究揭示 JavaScript 套件管理器的安全防禦（禁用 lifecycle scripts + 鎖定 lockfile）可被繞過，且 npm 拒絕修補。考慮到 2024 年 Shai-Hulud 攻擊已影響 700+ 套件、25,000 個儲存庫，此類繞過技術一旦被攻擊者採用，可能造成新一波供應鏈攻擊。

### 2.5.3 開發者工具鏈作為攻擊向量

**信心水準：中高**

VSCode `tasks.json` 自動腳本執行（已被 Lazarus 等組織使用）與 PackageGate 供應鏈漏洞形成互補攻擊面：
- VSCode 惡意專案可在開發者打開資料夾時自動執行惡意程式碼
- 套件管理器漏洞可在安裝依賴時執行惡意腳本
- 兩者結合可形成完整的開發者工具鏈攻擊路徑

**推測**：國家級威脅行為者（如 Lazarus）可能已在將這兩類攻擊向量進行組合利用。

### 2.5.4 IoT 設備身份驗證缺失問題持續惡化

**信心水準：高**

本週資料顯示多個 IoT 設備存在 CVSS 9.8 級別的身份驗證缺失漏洞：
- 銘祥科技 IAQS/I6 設備（CVE-2026-1363、CVE-2026-1364）可遠端無需認證即取得管理員權限
- Tenda AC20 路由器（CVE-2025-9090）可未認證執行任意命令
- GNU InetUtils Telnet（CVE-2026-24061）影響 80 萬台伺服器

結合 Mirai 殭屍網路樣本占惡意軟體樣本近半數的事實，IoT 設備安全問題仍是最廣泛且持續的威脅面。

### 2.5.5 ValleyRAT 生態系統擴展

**信心水準：中**

L4 資料顯示 ValleyRAT（別名 Winos）在近期 IoC 中持續出現（19 筆 IoC），其 C2 域名命名模式（如 `yandishuang1234.com`）顯示中文語系特徵。ValleyRAT 作為相對較新的 RAT 家族，其持續活躍可能意味著特定威脅行為者正在擴展其基礎設施。此趨勢需要持續監控。

---

## 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資。來源包括 HKCERT、Canadian Centre for Cyber Security、NCSC-FI、SANS ISC、JPCERT/CC、CERT.PL、TWCERT/CC、Exploit-DB、abuse.ch（Feodo Tracker、ThreatFox、MalwareBazaar）。
2. **時效性**：資料可能存在數小時至數天的延遲。部分 L1 資料來自 2025 年公告但於本週期內收錄。
3. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務（如 Mandiant、CrowdStrike、Recorded Future）等來源。L3 漏洞利用情報層的 active_exploitation 類別目前無資料。
4. **分析局限**：趨勢分析基於公開資料樣本，統計推論應謹慎解讀。漏洞總量數據包含歷史累積，不僅限於本週新增。IoC 統計基於 abuse.ch 單一來源平台。
5. **翻譯風險**：部分非英文來源（中文、愛沙尼亞文、波蘭文、巴西葡萄牙文）經 AI 翻譯，可能存在語義偏差。
6. **樣本偏差**：L4 惡意軟體樣本分布受 abuse.ch 收集偏好影響，Mirai 高比例可能反映蜜罐偵測特性而非整體威脅態勢。

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源。

---

> 報告產出時間：2026-01-27
> 資料來源層級：L1 資安新聞事實層（1,434 筆）、L2 漏洞追蹤層（1,776 筆）、L3 漏洞利用情報層（50 筆）、L4 威脅情報饋送層（1,778 筆）
> 本報告由 Threat Landscape Analysis Mode 自動產出，經自我審核 Checklist 驗證
