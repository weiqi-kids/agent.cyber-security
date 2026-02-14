---
layout: default
title: 2026 第 04 週
parent: 防禦建議
nav_order: 4
nav_exclude: false
---

# 防禦建議 — 2026 第 04 週
> 涵蓋期間：2026-01-21 至 2026-01-27
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV
> 產出時間：2026-01-27

---

## 2.1 優先修補清單

以下漏洞依「活躍利用 > CVSS 高分 > PoC 已公開」排序。**標記為「活躍利用」者應於 48 小時內完成修補或緩解。**

### P1-01 [活躍利用] CVE-2026-20045 — Cisco 多產品權限提升至 Root

| 項目 | 內容 |
|------|------|
| **漏洞描述** | Cisco 多產品存在 HTTP 輸入驗證不當漏洞，攻擊者可透過向網頁管理介面發送特製 HTTP 請求取得使用者級別存取權限並提升至 root。 |
| **影響產品** | Cisco Unified CM、Unity Connection、Webex Calling Dedicated Instance、Intersight CVA/PVA、Packaged CCE、Unified CCE、IEC6400 等 |
| **利用狀態** | **已確認野外積極利用** |
| **修補方式** | 套用 Cisco 官方安全修補程式。同批次公告另含 CVE-2026-20055、CVE-2026-20080、CVE-2026-20092、CVE-2026-20109，建議一併修補。 |
| **官方公告** | [HKCERT 公告](https://www.hkcert.org/security-bulletin/cisco-products-multiple-vulnerabilities_20260122) / [Cisco Advisory - Voice RCE](https://sec.cloudapps.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-voice-rce-mORhqY4b) / [Cisco Advisory - Intersight](https://sec.cloudapps.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-intersight-privesc-p6tBm6jk) |

### P1-02 [活躍利用] CVE-2024-37079 — VMware vCenter Server 遠端程式碼執行

| 項目 | 內容 |
|------|------|
| **漏洞描述** | VMware vCenter Server 存在遠端程式碼執行漏洞，攻擊者可透過網路發送特製封包觸發 RCE。結合 Brickstorm 後門威脅（PRC 國家級行為者），VMware 基礎設施面臨多重威脅。 |
| **影響產品** | VMware vCenter Server 7.0/8.0、VMware Cloud Foundation 4.x/5.x |
| **利用狀態** | **已確認野外積極利用**；另有國家級 Brickstorm 後門專門針對 vCenter/ESXi |
| **修補方式** | 套用 Broadcom 官方修補程式。同時審查 vCenter/ESXi 環境是否存在未授權虛擬機器（隱藏 VM 為 Brickstorm 後門特徵）。 |
| **官方公告** | [HKCERT 公告](https://www.hkcert.org/security-bulletin/vmware-products-multiple-vulnerabilities_20260126) / [Broadcom Advisory](https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/SecurityAdvisories/0/24453) |

### P1-03 [活躍利用] CVE-2026-21509 — Microsoft Office 安全限制繞過

| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Office 在安全決策中依賴不受信任的輸入，導致安全限制繞過。 |
| **影響產品** | Microsoft 365 Apps for Enterprise、Office 2016/2019/LTSC 2021/LTSC 2024 |
| **利用狀態** | **已確認野外積極利用** |
| **修補方式** | Office 2021 及更新版本：透過服務端變更自動保護，但需**重新啟動 Office 應用程式**。Office 2016/2019：必須**手動安裝安全更新**，或套用官方描述的註冊表鍵值作為臨時保護。 |
| **官方公告** | [HKCERT 公告](https://www.hkcert.org/security-bulletin/microsoft-office-security-restriction-bypass-vulnerability_20260127) / [Microsoft Security Update Guide](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21509) |

### P1-04 [活躍利用] CVE-2026-24061 — GNU InetUtils Telnet 身份驗證繞過

| 項目 | 內容 |
|------|------|
| **漏洞描述** | GNU InetUtils telnetd 存在身份驗證繞過漏洞，攻擊者僅需在 USER 環境變數中傳送 `-f root` 即可直接以 root 身份登入，繞過所有身份驗證。影響版本自 2015 年（1.9.3）至 2.7，長達 11 年。 |
| **影響產品** | GNU InetUtils telnetd 1.9.3 至 2.7（約 80 萬台暴露的 Telnet 伺服器） |
| **利用狀態** | **已偵測到主動攻擊行為**（Shadowserver 確認） |
| **修補方式** | 立即升級至 GNU InetUtils 2.8（2026-01-20 發布），或**停用 Telnet 服務**並改用 SSH。 |
| **官方公告** | [BleepingComputer 報導](https://www.bleepingcomputer.com/news/security/nearly-800-000-telnet-servers-exposed-to-remote-attacks/) |

### P2-01 [CVSS 9.8] CVE-2026-1363 / CVE-2026-1364 — 銘祥科技 IoT 設備身份驗證缺失

| 項目 | 內容 |
|------|------|
| **漏洞描述** | 銘祥科技 IAQS 室內空氣品質監測器及 I6 IoT 預警控制系統存在兩個 CVSS 9.8 漏洞：客戶端強制執行伺服器端安全（CVE-2026-1363）與缺少身份驗證（CVE-2026-1364），攻擊者無需認證即可取得管理員權限。 |
| **影響產品** | 銘祥科技 IAQS、I6 系統 |
| **利用狀態** | 未確認野外利用，但 CVSS 9.8 且無需認證 |
| **修補方式** | M4 晶片設備：聯繫廠商取得修補程式。**M3 晶片設備無法獲得修補**，建議更換為 M4 晶片設備。在修補前實施網路隔離。 |
| **官方公告** | [TWCERT/CC TVN-202601009](https://www.twcert.org.tw/tw/cp-132-10652-4cdca-1.html) |

### P2-02 [CVSS 9.8] CVE-2026-1019 / CVE-2026-1021 — 金諄資訊警政統計資料庫系統

| 項目 | 內容 |
|------|------|
| **漏洞描述** | 金諄資訊警政統計資料庫系統存在缺失身份驗證（CVE-2026-1019, CVSS 9.8）與任意檔案上傳（CVE-2026-1021, CVSS 9.8）漏洞，攻擊者無需認證即可讀寫刪改資料庫或上傳 Web Shell 執行任意程式碼。 |
| **影響產品** | 金諄資訊警政統計資料庫系統 1.0.2 及更早版本 |
| **利用狀態** | 未確認野外利用，但 CVSS 9.8 且無需認證 |
| **修補方式** | 升級至 1.0.3 或更新版本。 |
| **官方公告** | [TWCERT/CC TVN-202601005](https://www.twcert.org.tw/tw/cp-132-10637-3e4b3-1.html) |

### P2-03 [CVSS 9.8] CVE-2026-1221 — 普羅通信 PrismX MX100 硬編碼憑證

| 項目 | 內容 |
|------|------|
| **漏洞描述** | PrismX MX100 AP controller 韌體中內嵌硬編碼的資料庫憑證，未經認證的遠端攻擊者可直接登入資料庫。另含任意檔案上傳漏洞（CVE-2026-1222, CVSS 7.2）。 |
| **影響產品** | PrismX MX100 AP controller v1.03.23.01 以前版本 |
| **利用狀態** | 未確認野外利用 |
| **修補方式** | 升級韌體至 v1.03.23.01 或更新版本，更新後變更所有預設憑證。 |
| **官方公告** | [TWCERT/CC TVN-202601007](https://www.twcert.org.tw/tw/cp-132-10642-3b808-1.html) |

### P2-04 [CVSS 8.8] CVE-2025-15240 — 廣達電腦 QOCA aim 醫療雲平台任意檔案上傳

| 項目 | 內容 |
|------|------|
| **漏洞描述** | 廣達電腦 QOCA aim AI 醫療雲平台存在任意檔案上傳漏洞，已認證攻擊者可上傳並執行 Web Shell 後門，實現伺服器任意程式碼執行。同批次另有 5 個中風險漏洞（CVE-2025-15235~15239）。 |
| **影響產品** | QOCA aim AI Medical Cloud Platform v2.7.5 及更早版本 |
| **利用狀態** | 未確認野外利用 |
| **修補方式** | 升級至 v2.7.6 或更新版本。在更新前限制存取權限並實施 MFA。 |
| **官方公告** | [TWCERT/CC TVN-202601001](https://www.twcert.org.tw/tw/cp-132-10615-157a3-1.html) |

### P2-05 [CVSS 8.8] CVE-2026-0854 / CVE-2026-0855 — 利凌監控設備 OS 命令注入

| 項目 | 內容 |
|------|------|
| **漏洞描述** | 利凌（Merit LILIN）多款 DVR/NVR 監控主機及 IP 攝影機存在 OS 命令注入漏洞，已認證攻擊者可注入任意 OS 指令。 |
| **影響產品** | Merit LILIN DH032、DVR708/716、DVR804/808/816、NVR 多型號、P2/P3/Z7/P6/V1 攝影機系列（停產型號 IPD/IPR/LD/LR 無修補） |
| **利用狀態** | 未確認野外利用 |
| **修補方式** | 依廠商安全公告 M00175/M00176 更新韌體。**停產型號（IPD/IPR/LD/LR）無法修補，建議更換設備。** |
| **官方公告** | [TWCERT/CC TVN-202601003](https://www.twcert.org.tw/tw/cp-132-10624-6599c-1.html) / [TWCERT/CC TVN-202601004](https://www.twcert.org.tw/tw/cp-132-10625-fac5c-1.html) |

### P3-01 [PoC 已公開] CVE-2025-4427 + CVE-2025-4428 — Ivanti EPMM 驗證繞過 + RCE 鏈

| 項目 | 內容 |
|------|------|
| **漏洞描述** | Ivanti Endpoint Manager Mobile 存在驗證繞過（CVE-2025-4427）與表達式語言注入（CVE-2025-4428）的連鎖攻擊，未認證攻擊者可執行任意系統命令。Ivanti 產品線本週另有 SPAWNCHIMERA、DslogdRAT 等惡意軟體活動記錄。 |
| **影響產品** | Ivanti EPMM 12.5.0.0 及 2025.1 以前版本 |
| **利用狀態** | PoC 已公開（EDB-52421），Ivanti 產品為攻擊者優先目標 |
| **修補方式** | 升級至 Ivanti EPMM 2025.1 或更新版本。限制管理介面的網路存取。 |
| **官方公告** | [Exploit-DB EDB-52421](https://www.exploit-db.com/exploits/52421) |

### P3-02 [PoC 已公開] CVE-2025-7441 — StoryChief WordPress Plugin 任意檔案上傳

| 項目 | 內容 |
|------|------|
| **漏洞描述** | StoryChief WordPress Plugin 使用空字串作為 HMAC 密鑰驗證 webhook，攻擊者無需憑證即可偽造請求上傳惡意 PHP 檔案。CVSS 9.8。 |
| **影響產品** | StoryChief WordPress Plugin <= 1.0.42 |
| **利用狀態** | PoC 已公開（EDB-52422） |
| **修補方式** | 升級至 1.0.42 以上版本。暫時停用外掛或限制 `/wp-json/storychief/webhook` 端點存取。 |
| **官方公告** | [Exploit-DB EDB-52422](https://www.exploit-db.com/exploits/52422) |

### P3-03 GitLab 多漏洞 / Zoom RCE

| 項目 | 內容 |
|------|------|
| **GitLab** | CVE-2025-13335、CVE-2025-13927、CVE-2025-13928、CVE-2026-0723、CVE-2026-1102 — DoS 及安全限制繞過。更新至 GitLab 18.8.2/18.7.2/18.6.4。[GitLab 公告](https://about.gitlab.com/releases/2026/01/21/patch-release-gitlab-18-8-2-released/) |
| **Zoom** | CVE-2026-22844 — Zoom Node MMR 模組 RCE。更新至 5.2.1716.0 或更新版本。[Zoom Security Bulletin ZSB-26001](https://www.zoom.com/en/trust/security-bulletin/zsb-26001/) |

### P3-04 Windows 11 Administrator Protection 繞過

| 項目 | 內容 |
|------|------|
| **漏洞描述** | Google Project Zero 發現 Windows 11 25H2 Administrator Protection 功能存在 9 個繞過漏洞，可靜默取得完整管理員權限。 |
| **修補方式** | 確認已安裝 KB5067036 更新。此修補已由 Microsoft 發布。 |
| **官方公告** | [Google Project Zero](https://projectzero.google/2026/26/windows-administrator-protection.html) |

---

## 2.2 安全控制建議

### 網路層

| 類型 | 建議 | 依據 |
|------|------|------|
| **針對本週威脅** | 審查 vCenter Server 管理介面的網路存取控制，限制僅允許管理 VLAN 存取。掃描虛擬化環境中是否存在隱藏或未授權虛擬機器。 | CVE-2024-37079 活躍利用 + Brickstorm 後門 |
| **針對本週威脅** | 封鎖或嚴格限制 Telnet 協定（TCP port 23）的所有入站連線。全面盤點仍使用 Telnet 的系統並轉遷至 SSH。 | CVE-2026-24061，80 萬台暴露伺服器 |
| **針對本週威脅** | 將 IoT/監控設備（攝影機、NVR/DVR、空氣品質監測器）隔離至獨立網段，限制與企業內網的直接通訊。 | 本週多筆 IoT 設備 CVSS 9.8 漏洞（銘祥、利凌、普羅通信） |
| **針對本週威脅** | 監控 Cisco 產品管理介面的異常 HTTP 請求模式，特別是對網頁管理介面的特製請求。 | CVE-2026-20045 活躍利用 |
| **通用建議** | 部署網路分段，將管理平面與資料平面分離。確保所有管理介面不暴露於公網。 | 防禦深度原則 |
| **通用建議** | 啟用 BGP RPKI 與路由篩選機制，防止路由洩漏影響。 | Cloudflare BGP 路由洩漏事件 |

### 端點層

| 類型 | 建議 | 依據 |
|------|------|------|
| **針對本週威脅** | 確認所有 Microsoft Office 安裝已套用最新安全更新並重新啟動。Office 2016/2019 需手動安裝更新或套用註冊表鍵值。 | CVE-2026-21509 活躍利用 |
| **針對本週威脅** | 確認 Windows 11 25H2 系統已安裝 KB5067036 安全更新。 | Administrator Protection 繞過 |
| **針對本週威脅** | 在開發人員工作站上，配置 VSCode 在執行自動任務前顯示提示。審查所有專案中的 `.vscode/tasks.json` 是否包含 `runOn: folderOpen` 觸發器。 | VSCode 自動腳本執行風險 |
| **針對本週威脅** | 部署行為偵測規則，監控 `SyncAppvPublishingServer.vbs`（App-V LOLBIN）的異常執行、Google Calendar API 呼叫作為 C2、以及 PNG 檔案的異常記憶體載入行為。 | Amatera Stealer 攻擊鏈 |
| **通用建議** | 維持端點偵測與回應（EDR）解決方案的簽章與行為規則更新。特別關注 LOLBIN 執行鏈的偵測。 | 防禦深度原則 |
| **通用建議** | 啟用 ASLR、DEP 等記憶體保護機制。 | Mbed TLS UAF 漏洞（CVE-2025-47917） |

### 身分認證層

| 類型 | 建議 | 依據 |
|------|------|------|
| **針對本週威脅** | 審查 VMware vCenter/ESXi 環境的管理員帳號與存取日誌，檢查是否有未授權存取或異常的虛擬機器快照操作。 | Brickstorm 後門竊取 VM 快照中的憑證 |
| **針對本週威脅** | 變更所有 IoT/監控設備的預設密碼，停用不必要的遠端管理帳號。 | 多筆 IoT 設備漏洞 |
| **通用建議** | 對所有管理介面實施多因素認證（MFA）。 | 防禦深度原則 |
| **通用建議** | 實施最小權限原則，定期審查特權帳號使用情況。 | 防禦深度原則 |

### 供應鏈與開發安全

| 類型 | 建議 | 依據 |
|------|------|------|
| **針對本週威脅** | JavaScript 開發環境應更新 pnpm 至修補版本（修補 CVE-2025-69263/69264），更新 vlt 和 Bun。**npm 目前無修補**，建議額外實施 lockfile 手動校驗或考慮使用已修補的替代套件管理器。 | PackageGate 零日漏洞 |
| **針對本週威脅** | 僅從受信任來源開啟程式碼專案。在開啟新專案前，審查 `.vscode` 目錄內容。 | VSCode + Lazarus 攻擊手法 |
| **通用建議** | 實施軟體組成分析（SCA），監控專案依賴的已知漏洞。定期進行依賴稽核。 | 供應鏈攻擊趨勢 |

---

## 2.3 緩解策略

以下為針對尚無完整修補或新興威脅的緩解策略。

### 2.3.1 銘祥科技 M3 晶片 IoT 設備（無修補可用）

**威脅**：CVE-2026-1363/CVE-2026-1364（CVSS 9.8），M3 晶片設備廠商不提供安全更新。

**緩解措施**：
1. 將受影響設備置於專屬 VLAN，實施嚴格防火牆規則，僅允許必要的監控流量
2. 完全阻斷設備管理介面的外部網路存取
3. 部署網路入侵偵測系統（NIDS）監控進出該網段的異常流量
4. 制定設備更換時程表，遷移至支援安全更新的 M4 晶片設備

**有效期限**：此緩解策略為過渡性質，建議於 **2026-03-31 前**完成設備更換，届時重新評估。

### 2.3.2 利凌停產監控設備（IPD/IPR/LD/LR，無修補可用）

**威脅**：CVE-2026-0855（CVSS 8.8），停產型號無韌體更新支援。

**緩解措施**：
1. 網路隔離：將停產攝影機隔離至獨立監控網段
2. 存取控制：僅允許特定管理主機存取攝影機管理介面
3. 停用遠端管理功能，僅保留本地管理存取
4. 加速規劃設備汰換時程

**有效期限**：建議於 **2026-Q2 前**完成設備汰換，每月重新評估風險。

### 2.3.3 npm 套件管理器供應鏈風險（廠商拒絕修補）

**威脅**：PackageGate 零日漏洞可繞過 lifecycle script 禁用與 lockfile 完整性防禦，npm（Microsoft）拒絕修補。

**緩解措施**：
1. 在 CI/CD 管線中加入額外的完整性校驗步驟，不僅依賴 lockfile
2. 使用 `npm audit` 搭配第三方供應鏈安全工具進行雙重檢查
3. 考慮在高安全性專案中遷移至已修補的 pnpm
4. 監控專案依賴的異常變更
5. 限制開發環境的網路存取，使用私有 registry 鏡像

**有效期限**：持續有效，直至 npm 發布安全修補。建議每月重新評估 npm 是否已回應。**下次評估日期：2026-02-28。**

### 2.3.4 Fake CAPTCHA + LOLBIN 攻擊鏈

**威脅**：Amatera Stealer 攻擊鏈利用 Microsoft 簽章的 LOLBIN、Google Calendar C2、PNG 隱寫術，全程記憶體執行。

**緩解措施**：
1. 透過 AppLocker 或 Windows Defender Application Control（WDAC）限制 `SyncAppvPublishingServer.vbs` 的執行（若組織未使用 App-V）
2. 在 proxy/firewall 層級監控對 Google Calendar API 的異常存取模式
3. 部署記憶體掃描能力，偵測 fileless 惡意程式
4. 加強使用者教育，識別 Fake CAPTCHA 頁面

**有效期限**：此攻擊手法為持續性威脅，建議作為常態防禦措施。**每季重新評估：下次 2026-04-30。**

### 2.3.5 VMware 基礎設施 Brickstorm 後門

**威脅**：PRC 國家級行為者使用 Brickstorm 後門針對 VMware vCenter/ESXi，可建立隱藏虛擬機器、竊取快照中的憑證。

**緩解措施**：
1. 下載並執行 CISA/NSA/加拿大 Cyber Centre 聯合報告中提供的 IoC 檢測工具
2. 完整盤點所有虛擬機器，比對管理控制台可見清單與後端資料存儲
3. 審查 vCenter 管理日誌中的異常操作（特別是快照建立、VM 配置變更）
4. 對 vCenter 管理帳號啟用 MFA 並定期輪換憑證
5. 部署 ESXi 主機層級的完整性監控

**有效期限**：此為國家級持續性威脅，建議作為常態防禦措施。**每月重新評估：下次 2026-02-28。**

---

## 2.4 注意事項

### 適用範圍

- 本報告以企業 IT 環境為主要適用對象，涵蓋伺服器、端點、網路設備、IoT 設備及開發環境。
- 台灣地區 TWCERT/CC 通報的漏洞（銘祥科技、利凌、金諄資訊、廣達電腦、普羅通信）主要影響使用相關台灣廠商產品的組織。
- 國家級 APT 威脅（Brickstorm、Salt Typhoon）主要影響政府、關鍵基礎設施、電信及 IT 產業。

### 限制

- 部分漏洞缺乏完整的 CVSS 評分（如 CVE-2026-20045、CVE-2024-37079），嚴重程度依據 CERT 公告評級。
- L3 漏洞利用情報層的 active_exploitation 類別目前無資料，活躍利用資訊主要來自 L2 層 HKCERT 公告。
- IoT 設備修補可能受限於廠商支援週期，部分停產設備無法獲得安全更新。
- npm PackageGate 漏洞因廠商拒絕修補，緩解措施僅能降低而非消除風險。

### 可能副作用

- **Cisco 修補**：更新 Unified CM/Unity Connection 等產品可能需要排定維護窗口，通訊服務可能短暫中斷。建議在非營業時間進行。
- **VMware 修補**：vCenter Server 更新可能需要重啟 vCenter 服務，影響虛擬化管理能力。建議先在測試環境驗證。
- **Telnet 停用**：停用 Telnet 可能影響依賴此協定的舊式系統管理流程，需先確認替代方案（SSH）已就緒。
- **App-V LOLBIN 限制**：若組織使用 Microsoft Application Virtualization（App-V），限制 `SyncAppvPublishingServer.vbs` 可能影響 App-V 正常運作。
- **npm 遷移**：從 npm 遷移至 pnpm 可能需要調整 CI/CD 管線與開發流程。

### 建議測試步驟

1. **修補前**：在測試環境部署所有安全更新，驗證系統功能正常後再推送至正式環境。
2. **修補後**：執行功能測試確認業務流程未受影響，特別是通訊平台（Cisco）、虛擬化管理（VMware）、辦公軟體（Office）。
3. **緩解措施**：在非正式環境測試防火牆規則、WDAC 政策、網路隔離配置後，再部署至正式環境。
4. **IoT 設備**：隔離措施實施後，驗證監控設備的核心功能（視訊串流、告警通知）仍正常運作。

---

## 免責聲明

本防禦建議基於國際 CERT/安全機構公開資料彙整，請注意：

1. **非保證**：實施建議不保證完全防禦所有威脅
2. **環境差異**：建議為通用性質，可能不適用於所有環境
3. **請先測試**：在正式環境部署前，請先於測試環境驗證
4. **非法律建議**：本報告不構成法律或合規建議
5. **資料限制**：基於公開資料，不涵蓋非公開威脅情報
6. **翻譯風險**：部分非英文來源經 AI 翻譯，修補建議請以官方原文為準

重大安全決策請諮詢專業資安顧問，並結合組織實際環境評估。

---

> 報告產出時間：2026-01-27
> 資料來源層級：M1 威脅態勢報告、L1 資安新聞事實層、L2 漏洞追蹤層（1,776 筆）、L3 漏洞利用情報層（50 筆）
> 本報告由 Defense Advisory Mode 產出，經自我審核 Checklist 驗證
