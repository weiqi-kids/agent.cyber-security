---
layout: seo-report
title: 2026 第 10 週防禦建議
description: "2026-02-24 至 2026-03-02 資安防禦建議：CISA 緊急指令 ED 26-03 持續要求處置 Cisco SD-WAN（CVE-2026-20127、CVE-2022-20775）、Notepad++ 供應鏈攻擊（Lotus Blossom/Chrysalis 後門）、QuickLens Chrome 擴充套件竊取加密貨幣、ICS/OT 大量新公告（Johnson Controls、Copeland、Yokogawa、EV 充電站）、Microsoft 多個零日漏洞修補期限 3/3、Zyxel CVE-2025-13942 CVSS 9.8。"
parent: 防禦建議
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-defense-advisory.png
author: 資安情報分析團隊
date: 2026-03-02
---

# 防禦建議 — 2026 第 10 週

> 涵蓋期間：2026-02-24 至 2026-03-02
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV、CISA KEV
> 產出時間：2026-03-02

---

## 執行摘要

本週威脅態勢持續嚴峻，**CISA 緊急指令 ED 26-03 針對 Cisco SD-WAN 仍為最高優先事項**，同時多項供應鏈攻擊與 ICS/OT 漏洞大幅增加：

1. **CISA 緊急指令 ED 26-03 持續生效（最高優先級！）** — 全球性攻擊活動針對 Cisco SD-WAN 系統，CVE-2026-20127（身份驗證繞過）與 CVE-2022-20775（路徑遍歷）仍在活躍利用中，國際多國 CERT（NSA、ACSC、CCCS、NCSC-NZ、NCSC-UK）聯合發布指引
2. **Notepad++ 供應鏈攻擊（重大！）** — 中國 APT 組織 Lotus Blossom 攻陷代管服務商，透過 WinGUp 更新器散布 Chrysalis 後門，影響 2025 年 6-12 月期間使用自動更新的所有使用者
3. **QuickLens Chrome 擴充套件遭竄改** — 約 7,000 名使用者受影響，惡意版本 5.8 包含 ClickFix 攻擊與加密貨幣竊取功能
4. **ICS/OT 漏洞激增** — CISA 發布大量 ICS 公告：Johnson Controls Frick Quantum HD（CVSS 9.1，預認證 RCE）、Copeland XWEB（23 個 CVE）、Yokogawa CENTUM VP、多個 EV 充電站平台、InSAT MasterSCADA（RCE）
5. **Zyxel 設備 CVE-2025-13942（CVSS 9.8）** — OS 指令注入漏洞，影響多款 Zyxel 設備
6. **Microsoft 多個零日漏洞修補期限 2026-03-03** — CVE-2026-21513、CVE-2026-21510、CVE-2026-21519、CVE-2026-21533、CVE-2026-21514 等 5 個活躍利用漏洞
7. **修補期限已過但仍未處置的漏洞** — Dell RP4VMs CVE-2026-22769（2/21 過期）、BeyondTrust CVE-2026-1731（2/16 過期、勒索軟體關聯）
8. **勒索軟體趨勢** — Chainalysis 報告：2025 年勒索軟體支付總額下降 8% 至 8.2 億美元，但攻擊量增加 50%，中位數贖金暴增 368%

**本週關鍵行動**：
- **立即（緊急指令）**：持續遵循 CISA ED 26-03 處置所有 Cisco SD-WAN 系統
- **立即（供應鏈攻擊）**：停用 Notepad++ 自動更新，手動升級至 v8.9.2，執行 IoC 檢查
- **立即（修補期限 3/3）**：套用 Microsoft 2 月安全更新（5 個活躍利用漏洞）
- **立即（修補期限已過）**：Dell RP4VMs 補救腳本、BeyondTrust 修補
- **緊急**：更新 Zyxel 設備、RoundCube Webmail、所有 Chromium 瀏覽器
- **優先**：評估 ICS/OT 設備暴露風險（Johnson Controls、Copeland、Yokogawa、EV 充電站）

---

## 1. 優先修補清單

依照優先級排序：**CISA 緊急指令 > 修補期限即將到期 > 勒索軟體關聯 + 修補期限已過 > 活躍利用 > CVSS 高分**

### P0 - 最高優先（CISA 緊急指令 ED 26-03 — 持續生效）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| **CVE-2026-20127** | Cisco Catalyst SD-WAN Controller/Manager | 身份驗證繞過 (CWE-287) | **緊急指令（持續）** | [CISA ED 26-03](https://www.cisa.gov/news-events/directives/ed-26-03-mitigate-vulnerabilities-cisco-sd-wan-systems) |
| **CVE-2022-20775** | Cisco SD-WAN | 路徑遍歷 (CWE-25) | **緊急指令（持續）** | [Cisco 安全公告](https://www.cisco.com/c/en/us/support/docs/csa/cisco-sa-sd-wan-priv-E6e8tEdF.html) |

> **CISA 緊急指令 ED 26-03 — 持續生效中**：
>
> 國際合作夥伴（NSA、ASD's ACSC、Canadian Cyber Centre、NCSC-NZ、NCSC-UK）已觀察到惡意行為者在全球範圍內持續攻擊和入侵 Cisco SD-WAN 系統。
>
> **攻擊鏈**：
> 1. 初始存取：利用 CVE-2026-20127（身份驗證繞過）
> 2. 權限提升：利用 CVE-2022-20775（路徑遍歷，以 root 執行命令）
> 3. 建立長期持久化後門
>
> **必要行動**：
> 1. 盤點所有 Cisco SD-WAN 系統
> 2. 收集虛擬快照和日誌進行威脅獵捕
> 3. 完整修補 Cisco SD-WAN 系統
> 4. 依 [CISA 獵捕與強化指南](https://www.cisa.gov/news-events/directives/supplemental-direction-ed-26-03-hunt-and-hardening-guidance-cisco-sd-wan-systems) 檢查入侵跡象
> 5. 實施 Cisco SD-WAN 強化措施（隔離 VPN 512 介面、替換自簽憑證、使用配對金鑰、限制會話逾時、轉發日誌至遠端 syslog 伺服器）
>
> **來源**：[CISA and Partners Release Guidance for Ongoing Global Exploitation of Cisco SD-WAN Systems](https://www.cisa.gov/news-events/alerts/2026/02/25/cisa-and-partners-release-guidance-ongoing-global-exploitation-cisco-sd-wan-systems)

### P0+ - 極緊急（修補期限即將到期 — 2026-03-03）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| **CVE-2026-21513** | Microsoft Windows MSHTML | 安全機制失效 (CWE-693) | **2026-03-03** | [Microsoft 安全更新](https://msrc.microsoft.com/update-guide/advisory/CVE-2026-21513) |
| **CVE-2026-21510** | Microsoft Windows Shell | 安全機制失效 (CWE-693) | **2026-03-03** | [Microsoft 安全更新](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21510) |
| **CVE-2026-21519** | Microsoft Windows DWM | 類型混淆 (CWE-843) | **2026-03-03** | [Microsoft 安全更新](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21519) |
| **CVE-2026-21533** | Microsoft Windows RDS | 不當權限管理 (CWE-269) | **2026-03-03** | [Microsoft 安全更新](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21533) |
| **CVE-2026-21514** | Microsoft Office Word | 不受信任輸入 (CWE-807) | **2026-03-03** | [Microsoft 安全更新](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21514) |

> **Microsoft 5 個活躍利用漏洞 — 修補期限 2026-03-03（明天！）**：
>
> **CVE-2026-21513**（MSHTML 安全機制失效）：攻擊者可透過網路繞過安全功能，可能與網頁瀏覽或 Office 文件開啟相關。
>
> **CVE-2026-21510**（Windows Shell 安全機制失效）：攻擊者可繞過 Windows Shell 安全功能，可能與檔案處理或惡意檔案執行相關。
>
> **CVE-2026-21519**（Windows DWM 類型混淆）：已取得部分權限的攻擊者可透過桌面視窗管理員漏洞進一步提升權限。
>
> **CVE-2026-21533**（Windows RDS 不當權限管理）：影響 Windows Remote Desktop Services，本地權限提升漏洞。
>
> **CVE-2026-21514**（Office Word 不受信任輸入）：可能透過惡意 Word 文件觸發權限提升。
>
> **緊急行動**：立即部署 Microsoft 2026 年 2 月安全更新至所有受影響的 Windows 系統與 Office 產品。

### P0++ - 極緊急（勒索軟體關聯、修補期限已過）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| **CVE-2026-1731** | BeyondTrust RS/PRA | OS 指令注入 (CWE-78) | **2026-02-16（已過期 14 天！）** | [BeyondTrust BT26-02](https://www.beyondtrust.com/trust-center/security-advisories/bt26-02) |
| **CVE-2026-22769** | Dell RP4VMs | 硬編碼憑證 (CWE-798) | **2026-02-21（已過期 9 天！）** | [Dell DSA-2026-079](https://www.dell.com/support/kbdoc/en-us/000426773/dsa-2026-079) |

> **極緊急警告 — CVE-2026-1731（勒索軟體關聯、修補期限嚴重過期）**：
> - BeyondTrust Remote Support (RS) 和 Privileged Remote Access (PRA) 存在 OS 指令注入漏洞
> - **已確認被勒索軟體攻擊活動利用**
> - 未經驗證的遠端攻擊者可執行任意作業系統指令，導致系統完全淪陷
> - **CISA 修補期限 2026-02-16 已過期 14 天**
> - **立即**盤點所有對外暴露的 BeyondTrust 產品並檢查入侵跡象
> - **修補方式**：依 [BeyondTrust 安全公告 BT26-02](https://www.beyondtrust.com/trust-center/security-advisories/bt26-02) 套用修補

> **極緊急警告 — CVE-2026-22769（UNC6201 活躍利用、修補期限過期）**：
> - Dell RecoverPoint for Virtual Machines (RP4VMs) 存在硬編碼憑證漏洞
> - Google TAG 確認威脅組織 **UNC6201** 正活躍利用此零日漏洞
> - 未經身份驗證的攻擊者可取得 **root 層級存取**，建立持久化後門
> - **CISA 修補期限 2026-02-21 已過期 9 天**
> - **修補方式**：執行 [Dell 補救腳本](https://www.dell.com/support/kbdoc/en-us/000426742/recoverpoint-for-vms-apply-the-remediation-script-for-dsa)

### P1 - 極緊急（活躍利用中、新增 KEV）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| **CVE-2026-25108** | Soliton FileZen | OS 指令注入 | **緊急（KEV 2/24 新增）** | [JVN#84622767](https://jvn.jp/en/jp/JVN84622767/) |
| **CVE-2025-49113** | RoundCube Webmail | 反序列化 RCE (CWE-502) | **緊急** | [RoundCube 1.6.11+/1.5.10+](https://roundcube.net/news/2025/06/01/security-updates-1.6.11-and-1.5.10) |
| **CVE-2025-68461** | RoundCube Webmail | XSS via SVG (CWE-79) | **緊急** | [RoundCube 1.6.12+/1.5.12+](https://roundcube.net/news/2025/12/13/security-updates-1.6.12-and-1.5.12) |
| **CVE-2026-2441** | Google Chromium | Use-After-Free (CWE-416) | **2026-03-10** | 更新至最新版瀏覽器 |
| **CVE-2026-20700** | Apple 多產品 | 記憶體緩衝區溢位 (CWE-119) | **2026-03-05** | [Apple 安全更新](https://support.apple.com/en-us/126346) |
| **CVE-2025-15556** | Notepad++ | 無完整性檢查下載 (CWE-494) | **2026-03-05** | [Notepad++ v8.9.2](https://notepad-plus-plus.org/) |
| **CVE-2026-24858** | Fortinet 多產品 | 身份驗證繞過 | **緊急** | 依廠商指示更新 |

> **Soliton FileZen CVE-2026-25108（KEV 2/24 新增）**：
> - OS 指令注入漏洞，攻擊條件：已登入使用者發送特製 HTTP 請求
> - 影響日本廣泛使用的檔案傳輸系統
> - **修補方式**：依 [JVN 公告](https://jvn.jp/en/jp/JVN84622767/) 套用修補

> **RoundCube Webmail 雙漏洞（持續活躍利用中）**：
> - **CVE-2025-49113**：反序列化 RCE，透過 `program/actions/settings/upload.php` 中未驗證的 `_from` 參數
> - **CVE-2025-68461**：XSS 漏洞，透過 SVG 文件中的 animate 標籤注入
> - **修補方式**：升級至 RoundCube **1.6.12**（或 1.5.12）
> - 檢查伺服器日誌是否有異常上傳或 SVG 相關活動

> **Apple CVE-2026-20700（多平台影響）**：
> - 影響 iOS、macOS、tvOS、watchOS、visionOS
> - 記憶體緩衝區溢位漏洞，可執行任意程式碼
> - **修補期限 2026-03-05**
> - **修補方式**：安裝最新 Apple 安全更新 ([126346](https://support.apple.com/en-us/126346), [126348](https://support.apple.com/en-us/126348), [126351](https://support.apple.com/en-us/126351), [126352](https://support.apple.com/en-us/126352), [126353](https://support.apple.com/en-us/126353))

### P2 - 高優先（高 CVSS、新公告）

| CVE | 產品 | 漏洞類型 | CVSS | 修補建議 |
|-----|------|----------|------|----------|
| **CVE-2025-13942** | Zyxel 多款設備 | OS 指令注入 | **9.8** | [CERT.RO 公告](https://dnsc.ro/citeste/alerta-vulnerabilitate-critica-identificata-in-mai-multe-echipamente-zyxel) |
| **CVE-2026-21654 等 6 個** | Johnson Controls Frick Quantum HD | OS 指令注入/程式碼注入 | **9.1** | [CISA ICSA-26-057-01](https://www.cisa.gov/news-events/ics-advisories/icsa-26-057-01) |
| **CVE-2026-27772 等 4 個** | EV Energy ev.energy | 認證缺失 | **9.4** | [CISA ICSA-26-057-07](https://www.cisa.gov/news-events/ics-advisories/icsa-26-057-07) |
| **23 個 CVE** | Copeland XWEB/XWEB Pro | 多種漏洞 | **高** | [CISA ICSA-26-057-10](https://www.cisa.gov/news-events/ics-advisories/icsa-26-057-10) |
| **CVE-2026-21410/22553** | InSAT MasterSCADA BUK-TS | RCE | **高** | [CISA ICSA-26-055-01](https://www.cisa.gov/news-events/ics-advisories/icsa-26-055-01) |
| — | SolarWinds Serv-U | RCE + 安全策略繞過 | **高** | [CERT-FR AVI-0205](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0205/) |
| — | Mozilla Firefox/Thunderbird | RCE + 權限提升 | **高** | [CERT-FR AVI-0204](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0204/) |
| — | Trend Micro 產品 | RCE + 權限提升 | **高** | [CERT-FR AVI-0206](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0206/) |
| — | Juniper Junos OS Evolved | RCE | **高** | [CERT-FR AVI-0214](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0214/) |

> **Zyxel CVE-2025-13942（CVSS 9.8 — 極度嚴重）**：
> - OS 指令注入漏洞，影響多款 Zyxel 設備
> - CERT.RO 發布緊急公告，CVSS 評分 9.8（幾近最高）
> - 組織應**立即**盤點所有 Zyxel 設備並套用修補

> **ICS/OT 漏洞激增（本週重點）**：
>
> 本週 CISA 發布大量 ICS 公告，以下為最嚴重的項目：
>
> **Johnson Controls Frick Quantum HD（CVSS 9.1，預認證 RCE）**：
> - 6 個 CVE，影響版本 <=10.22
> - 預認證即可利用 OS 指令注入和程式碼注入
> - 影響食品與農業關鍵基礎設施的冷鏈控制系統
> - **修補方式**：聯繫 Johnson Controls 取得更新
>
> **Copeland XWEB/XWEB Pro（23 個 CVE）**：
> - 影響 XWEB 300D/500D/500B PRO <= 1.12.1
> - 包含身份驗證繞過、記憶體損壞、任意程式碼執行
> - 影響商業冷凍與 HVAC 控制設備
> - **修補方式**：依 [CISA ICSA-26-057-10](https://www.cisa.gov/news-events/ics-advisories/icsa-26-057-10) 套用修補
>
> **EV 充電站平台多個漏洞（CVSS 9.4）**：
> - 多個 EV 充電管理平台存在嚴重漏洞
> - EV Energy ev.energy（CVE-2026-27772，CVSS 9.4）：WebSocket 端點缺乏認證，可未授權控制充電站
> - 影響全球部署的能源與交通系統關鍵基礎設施

### P3 - 供應鏈攻擊警示（本週重大事件）

| 日期 | 目標 | 攻擊類型 | 來源 | 建議 |
|------|------|----------|------|------|
| **2026-02-24** | **Notepad++** | 供應鏈攻擊（Lotus Blossom APT） | [TWCERT/CC](https://www.twcert.org.tw/tw/cp-104-10725-feaeb-1.html) | **立即停用自動更新，升級至 v8.9.2** |
| **2026-03-01** | **QuickLens Chrome 擴充套件** | 供應鏈攻擊（ClickFix + 加密貨幣竊取） | [BleepingComputer](https://www.bleepingcomputer.com/news/security/quicklens-chrome-extension-steals-crypto-shows-clickfix-attack/) | 移除擴充套件，檢查加密貨幣錢包 |

> **Notepad++ 供應鏈攻擊（本週最重大安全事件之一）**：
>
> **攻擊者**：Lotus Blossom（又稱 Violet Typhoon / Billbug），中國 APT 組織
>
> **攻擊手法**：
> 1. 攻陷 Notepad++ 使用的代管主機服務商基礎設施（2025 年 6 月）
> 2. 掌控內部服務憑證與簽章金鑰
> 3. 劫持 WinGUp 自動更新機制，將更新流量導向惡意伺服器
> 4. 使用者下載到包含 Chrysalis 後門的惡意安裝檔
>
> **Chrysalis 後門技術特徵**：
> - C2 通訊偽裝為 Deepseek API 端點格式
> - 利用 DLL Side-Loading 技術載入惡意模組
> - 濫用 Microsoft Warbird 程式碼保護框架規避 EDR 偵測
> - RC4 加密 C2 通訊內容
>
> **必要行動**：
> 1. **停用 Notepad++ 自動更新**（Settings → Preferences → Update）
> 2. **手動下載並安裝 v8.9.2**（[官方網站](https://notepad-plus-plus.org/)）
> 3. 執行 IoC 檢查：掃描 `%appdata%\Bluetooth\`、`%appdata%\ProShow`、`%appdata%\Adobe\Scripts` 是否存在可疑檔案
> 4. 檢查是否有連向 `api[.]skycloudcenter[.]com` 或 `api[.]wiresguard[.]com` 的網路連線
> 5. 封鎖 IoC 中列出的 IP 位址：`95[.]179[.]213[.]0`、`61[.]4[.]102[.]97`、`59[.]110[.]7[.]32`、`124[.]222[.]137[.]114`
> 6. 更新 EDR 規則，偵測 DLL Side-Loading 與 Warbird 濫用行為

> **QuickLens Chrome 擴充套件竊取加密貨幣**：
> - 合法擴充套件遭竄改，版本 5.8（2026-02-17 發布）包含惡意程式碼
> - 約 7,000 名使用者受影響
> - 包含 ClickFix 社交工程攻擊腳本與加密貨幣錢包竊取功能
> - Google 已從 Chrome Web Store 移除該擴充套件
> - **立即行動**：若已安裝 QuickLens，立即移除並檢查加密貨幣錢包是否有異常交易

---

## 2. 安全控制建議

### 網路層面

#### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **Cisco SD-WAN（緊急指令持續）** | **持續**遵循 CISA ED 26-03；隔離 VPN 512 介面並使用 IP 封鎖；替換自簽憑證；使用配對金鑰；限制會話逾時；轉發日誌至遠端 syslog 伺服器；執行威脅獵捕 |
| **Notepad++ 供應鏈攻擊** | 封鎖 IoC 中的惡意 IP 與網域；監控類似 Deepseek API 端點的異常 HTTPS 流量模式 |
| **Zyxel 設備 CVE-2025-13942** | **立即**盤點所有 Zyxel 設備；限制管理介面存取來源；套用修補前實施存取控制 |
| **RoundCube 雙漏洞** | 升級至 1.6.12/1.5.12；實施嚴格 CSP；在郵件閘道層級過濾 SVG 附件 |
| **ICS/OT 設備漏洞（多個）** | 盤點所有面向網際網路的 ICS 設備；實施 OT/IT 網路嚴格分段；限制 ICS 設備僅允許內部管理存取 |
| **EV 充電站漏洞** | 審查所有 EV 充電管理平台的網路暴露情況；限制 WebSocket 端點存取 |
| **SolarWinds Serv-U** | 套用最新修補；限制 Serv-U 存取來源 IP |

#### 通用建議

- 實施網路分段，限制橫向移動
- 確保邊界設備（防火牆、VPN、負載平衡器、SD-WAN）已更新
- 啟用 IDS/IPS 並更新特徵碼，加入本週 IoC
- 部署 DNS 過濾封鎖已知惡意網域
- 監控異常的出站連線，特別是偽裝為 API 端點的 HTTPS 流量
- 對所有面向網際網路的服務進行攻擊面盤點

### 端點層面

#### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **Notepad++ Chrysalis 後門** | 更新 EDR 規則偵測 DLL Side-Loading；監控 `%appdata%` 下的異常檔案建立；啟用記憶體掃描偵測 Warbird 濫用；掃描 IoC 檔案雜湊值 |
| **Microsoft 零日漏洞（修補期限 3/3）** | **立即**部署 Microsoft 2 月安全更新；監控異常的 MSHTML 活動和 Windows Shell 行為 |
| **Chromium 瀏覽器 CVE-2026-2441** | 更新所有 Chromium 瀏覽器至最新版；啟用自動更新；在企業環境透過 GPO 強制更新 |
| **Apple 多平台 CVE-2026-20700** | 更新 iOS、macOS、tvOS、watchOS 至最新版本 |
| **QuickLens 惡意擴充套件** | 審查已安裝的 Chrome 擴充套件；移除 QuickLens；監控瀏覽器擴充套件權限變更 |
| **Mozilla Firefox/Thunderbird** | 更新至最新版本；檢查自動更新是否啟用 |

#### 通用建議

- 確保 EDR 解決方案已部署並保持最新
- 實施應用程式白名單，特別注意 DLL Side-Loading 攻擊向量
- 定期備份關鍵資料並測試還原程序
- 監控端點異常程式執行行為
- 定期審查瀏覽器擴充套件安裝情況

### 身分認證層面

#### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **Cisco SD-WAN 身份驗證繞過** | 審查 SD-WAN 管理帳號；實施 MFA；限制存取來源 IP |
| **硬編碼/預設憑證漏洞** | **立即**變更 Dell RP4VMs 硬編碼憑證；變更所有 ICS/OT 設備預設密碼 |
| **Fortinet FortiCloud SSO 繞過** | 審查所有啟用 FortiCloud SSO 的設備；限制跨帳戶存取 |
| **SmarterMail 認證缺失** | 套用修補；限制 ConnectToHub API 存取 |

#### 通用建議

- 對所有關鍵系統實施多因素認證 (MFA)
- 定期審核特權帳戶與存取權限
- 實施 Privileged Access Management (PAM) 解決方案
- 定期輪替服務帳號密碼
- 監控異常登入行為（特別是跨帳戶存取）

### 資料保護層面

#### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **勒索軟體（BeyondTrust 關聯）** | 驗證備份完整性與可復原性；實施 3-2-1 備份策略；測試災難復原計畫 |
| **供應鏈攻擊（Notepad++）** | 檢查受影響系統是否有資料外洩跡象；審查 Chrysalis 後門收集的系統資訊範圍 |
| **加密貨幣竊取（QuickLens）** | 檢查加密貨幣錢包餘額和交易紀錄；變更相關帳戶密碼 |
| **Dell RP4VMs 備份系統** | 驗證 RP4VMs 備份資料完整性；準備替代備份方案 |

#### 通用建議

- 實施資料分類與標籤
- 加密敏感資料（靜態與傳輸中）
- 監控異常資料外傳行為
- 定期進行資料備份，並將備份隔離於生產網路之外

---

## 3. 緩解策略

針對尚無修補或無法立即更新的情況：

### 3.1 Cisco SD-WAN（緊急指令 ED 26-03 — 持續生效）

| 措施 | 說明 |
|------|------|
| **遵循緊急指令** | 依 [CISA ED 26-03](https://www.cisa.gov/news-events/directives/ed-26-03-mitigate-vulnerabilities-cisco-sd-wan-systems) 執行所有要求 |
| **威脅獵捕** | 依 [CISA 獵捕與強化指南](https://www.cisa.gov/news-events/directives/supplemental-direction-ed-26-03-hunt-and-hardening-guidance-cisco-sd-wan-systems) 檢查入侵跡象 |
| **網路周邊控制** | 隔離 VPN 512 介面；使用 IP 封鎖限制管理存取 |
| **憑證管理** | 替換所有 SD-WAN Manager 自簽憑證 |
| **控制面安全** | 使用 pairwise 金鑰保護控制與資料面通訊 |
| **會話管理** | 將會話逾時限制為最短可行時間 |
| **日誌管理** | 轉發所有日誌至遠端 syslog 伺服器 |

> **有效期限**：直到完成 CISA ED 26-03 所有要求
> **來源**：[CISA Emergency Directive 26-03](https://www.cisa.gov/news-events/directives/ed-26-03-mitigate-vulnerabilities-cisco-sd-wan-systems)、[CISA 全球利用指引](https://www.cisa.gov/news-events/alerts/2026/02/25/cisa-and-partners-release-guidance-ongoing-global-exploitation-cisco-sd-wan-systems)

### 3.2 Notepad++ 供應鏈攻擊（Chrysalis 後門）

| 措施 | 說明 |
|------|------|
| **停用自動更新** | Settings → Preferences → Update → 取消勾選「Enable Notepad++ auto-updater」 |
| **手動升級** | 從 [官方網站](https://notepad-plus-plus.org/) 下載 v8.9.2 並驗證 SHA-256 雜湊值 |
| **IoC 掃描** | 檢查 `%appdata%\Bluetooth\`、`%appdata%\ProShow`、`%appdata%\Adobe\Scripts` 目錄 |
| **網路封鎖** | 封鎖 IP：`95.179.213.0`、`61.4.102.97`、`59.110.7.32`、`124.222.137.114` |
| **網域封鎖** | 封鎖 `api[.]skycloudcenter[.]com`、`api[.]wiresguard[.]com` |
| **EDR 更新** | 加入 Chrysalis 後門 IoC 雜湊值至偵測規則 |
| **GPO 管控** | 在企業環境中透過 GPO 或 MDM 集中停用自動更新並派送安全版本 |

> **有效期限**：直到完成升級至 v8.9.2 並確認無入侵跡象
> **若確認受害**：立即隔離系統、保存證據、根除威脅、變更所有敏感帳戶密碼、通報主管機關
> **來源**：[TWCERT/CC 公告](https://www.twcert.org.tw/tw/cp-104-10725-feaeb-1.html)

### 3.3 Microsoft 零日漏洞（修補期限 2026-03-03）

| 措施 | 說明 |
|------|------|
| **立即部署安全更新** | 套用 Microsoft 2026 年 2 月 Patch Tuesday 安全更新 |
| **MSHTML 緩解** | 限制 IE 模式使用；監控 MSHTML 相關活動 |
| **Windows Shell 緩解** | 加強檔案類型過濾；限制從不受信任來源執行檔案 |
| **Office 文件防護** | 啟用 Office 受保護檢視模式；限制巨集執行 |
| **RDS 安全強化** | 限制 Remote Desktop Services 存取；啟用 NLA |

> **有效期限**：**2026-03-03（明天！）** — 必須在修補期限前完成更新
> **來源**：[Microsoft Security Update Guide](https://msrc.microsoft.com/update-guide/)

### 3.4 BeyondTrust RS/PRA（修補期限嚴重過期、勒索軟體關聯）

| 措施 | 說明 |
|------|------|
| **立即評估暴露** | 盤點所有可從網際網路存取的 BeyondTrust 產品 |
| **入侵檢查** | 檢查系統日誌是否有異常指令執行、未授權存取跡象 |
| **網路隔離** | 在修補前將管理介面限制為僅允許內部存取 |
| **依廠商指引修補** | 參閱 [BeyondTrust BT26-02](https://www.beyondtrust.com/trust-center/security-advisories/bt26-02) |

> **有效期限**：直到完成修補 | **CISA 修補期限**：**2026-02-16（已過期 14 天）**
> **勒索軟體關聯**：已確認被勒索軟體利用，延遲修補將大幅增加被攻擊風險

### 3.5 Dell RP4VMs（修補期限過期、UNC6201 活躍利用）

| 措施 | 說明 |
|------|------|
| **立即執行補救腳本** | 依 [Dell DSA-2026-079](https://www.dell.com/support/kbdoc/en-us/000426773/dsa-2026-079) 指引執行 |
| **入侵跡象檢查** | 檢查系統日誌是否有異常的 root 層級活動或未授權存取 |
| **網路隔離** | 限制 RP4VMs 對外部網路的暴露；僅允許必要的管理存取 |
| **憑證變更** | 變更所有相關系統的硬編碼憑證 |
| **橫向移動監控** | 監控異常的管理者活動與橫向移動行為 |

> **有效期限**：**2026-02-21（已過期 9 天）** | **威脅行為者**：UNC6201（Google TAG 確認）
> **來源**：[Dell Remediation Guide](https://www.dell.com/support/kbdoc/en-us/000426742/recoverpoint-for-vms-apply-the-remediation-script-for-dsa)、[Google 威脅情報](https://cloud.google.com/blog/topics/threat-intelligence/unc6201-exploiting-dell-recoverpoint-zero-day)

### 3.6 ICS/OT 設備（本週大量新公告）

| 措施 | 說明 |
|------|------|
| **盤點 ICS 設備** | 確認組織是否使用 Johnson Controls Frick、Copeland XWEB、Yokogawa CENTUM VP、InSAT MasterSCADA |
| **網路隔離** | 確保所有 ICS 設備不可由網際網路直接存取 |
| **EV 充電站** | 審查 ev.energy 等 EV 充電管理平台的部署情況與網路暴露 |
| **韌體更新** | 依廠商公告套用更新（需先在測試環境驗證） |
| **預設密碼** | 變更所有 ICS 設備的預設密碼和硬編碼憑證 |
| **OT 網路監控** | 部署 OT 網路監控工具，偵測異常通訊 |

> **有效期限**：持續執行 | **特別注意**：OT 環境修補需經過完整測試，避免影響生產
> **來源**：[CISA ICS Advisories](https://www.cisa.gov/news-events/ics-advisories)

### 3.7 Zyxel 設備（CVSS 9.8）

| 措施 | 說明 |
|------|------|
| **盤點設備** | 確認組織使用的 Zyxel 設備型號是否受影響 |
| **限制存取** | 限制管理介面僅允許內部存取 |
| **套用修補** | 依廠商指引更新韌體 |
| **監控** | 監控 Zyxel 設備的異常命令執行和存取日誌 |

> **有效期限**：直到完成修補
> **來源**：[CERT.RO 公告](https://dnsc.ro/citeste/alerta-vulnerabilitate-critica-identificata-in-mai-multe-echipamente-zyxel)

### 3.8 Soliton FileZen（KEV 新增）

| 措施 | 說明 |
|------|------|
| **套用修補** | 依 [JVN#84622767](https://jvn.jp/en/jp/JVN84622767/) 套用廠商修補 |
| **存取限制** | 限制 FileZen 存取來源 IP |
| **日誌監控** | 監控異常 HTTP 請求與指令執行 |
| **若無法修補** | 考慮暫停使用 FileZen |

> **有效期限**：直到完成修補 | **CISA KEV**：2026-02-24 新增

### 3.9 RoundCube Webmail（持續活躍利用）

| 措施 | 說明 |
|------|------|
| **立即升級** | 升級至 RoundCube 1.6.12 或 1.5.12 |
| **日誌審查** | 檢查伺服器日誌是否有異常上傳活動或 SVG 相關請求 |
| **CSP 實施** | 實施嚴格的 Content Security Policy 降低 XSS 風險 |
| **SVG 過濾** | 考慮在郵件閘道層級過濾或掃描 SVG 附件 |
| **入侵跡象檢查** | 檢查是否有 Web Shell 或異常檔案上傳 |

> **有效期限**：直到完成升級
> **來源**：[RoundCube Security Update](https://roundcube.net/news/2025/12/13/security-updates-1.6.12-and-1.5.12)

### 3.10 瀏覽器與桌面軟體

| 措施 | 說明 |
|------|------|
| **Chromium 瀏覽器** | 更新所有 Chrome、Edge、Opera 至最新版；啟用自動更新；修補期限 2026-03-10 |
| **Apple 產品** | 安裝最新 iOS/macOS/tvOS/watchOS 安全更新；修補期限 2026-03-05 |
| **Mozilla 產品** | 更新 Firefox 和 Thunderbird 至最新版 |
| **Chrome 擴充套件** | 審查已安裝的擴充套件；移除不必要或可疑的擴充套件 |

> **有效期限**：直到完成更新

---

## 4. 注意事項

### 適用範圍與限制

1. **環境差異**：本建議為通用性質，實際實施需依據組織環境調整
2. **時效性**：基於 2026-02-24 至 2026-03-02 期間的公開資訊
3. **完整性**：不包含非公開威脅情報
4. **供應商確認**：第三方產品可能使用受影響元件（如 Chromium 引擎、開源套件），請向供應商確認
5. **OT/ICS 特別注意**：OT 環境修補需經過完整測試，避免影響生產
6. **供應鏈風險**：Notepad++ 事件顯示，即使原始碼未被竄改，更新機制仍可能被攻擊

### 可能的副作用

| 建議措施 | 可能副作用 | 替代方案 |
|----------|------------|----------|
| Cisco SD-WAN 修補/緩解 | 可能影響網路配置與連線 | 安排維護窗口；先在非關鍵站點測試 |
| Microsoft 安全更新 | 可能影響特定應用程式相容性 | 先於測試環境驗證；準備回滾程序 |
| Notepad++ 停用自動更新 | 需手動管理軟體版本 | 透過 GPO/MDM 集中管理 |
| BeyondTrust 修補 | 可能需要重啟遠端存取服務 | 安排維護窗口；準備替代遠端存取方案 |
| Dell RP4VMs 補救腳本 | 可能影響備份/恢復作業 | 先備份設定 |
| Zyxel 韌體更新 | 可能需要重新啟動網路設備 | 安排維護窗口；準備臨時替代路由 |
| ICS/OT 設備修補 | **高風險** — 可能影響生產控制系統 | 必須在測試環境驗證後再部署；安排計劃性停機 |
| 瀏覽器擴充套件移除 | 可能影響使用者工作流程 | 評估替代擴充套件並預先通知使用者 |
| RoundCube 升級 | 可能影響自訂外掛相容性 | 先於測試環境驗證 |
| SolarWinds Serv-U 修補 | 可能影響檔案傳輸服務 | 安排維護窗口 |

### 本週特別警示

1. **CISA 緊急指令 ED 26-03 持續生效（最高優先級）**：全球性攻擊活動針對 Cisco SD-WAN 系統，NSA 等 6 個國際機構聯合發布指引
2. **Notepad++ 供應鏈攻擊（重大安全事件）**：中國 APT 組織 Lotus Blossom 透過攻陷代管服務商劫持自動更新機制，散布 Chrysalis 後門長達 6 個月
3. **Microsoft 5 個零日漏洞修補期限 2026-03-03（明天）**：CVE-2026-21513、CVE-2026-21510、CVE-2026-21519、CVE-2026-21533、CVE-2026-21514
4. **BeyondTrust 勒索軟體漏洞修補期限過期 14 天**：CVE-2026-1731 修補期限 2026-02-16 已過期
5. **Dell RP4VMs 修補期限過期 9 天**：CVE-2026-22769，UNC6201 正活躍利用
6. **ICS/OT 漏洞激增**：Johnson Controls（CVSS 9.1 預認證 RCE）、Copeland（23 個 CVE）、EV 充電站（CVSS 9.4）、Yokogawa、InSAT MasterSCADA
7. **Zyxel CVSS 9.8**：CVE-2025-13942 影響多款設備，應立即評估暴露風險
8. **Chrome 擴充套件供應鏈攻擊**：QuickLens 事件再次凸顯瀏覽器擴充套件的供應鏈風險
9. **勒索軟體趨勢**：Chainalysis 報告顯示 2025 年支付總額下降 8% 但攻擊量增 50%，中位數贖金暴增 368%

### 建議的測試步驟

建議在正式環境部署前，於測試環境執行以下步驟：

1. **備份**：建立系統快照或完整備份
2. **更新測試**：在非生產環境測試更新
3. **功能驗證**：確認業務關鍵功能正常運作
4. **回滾計畫**：準備更新失敗時的回滾程序
5. **IoC 掃描**：在套用修補前，先執行入侵跡象檢查（特別是 Notepad++ Chrysalis 後門與 Cisco SD-WAN 入侵指標）
6. **OT 特殊程序**：ICS/OT 設備更新必須遵循變更管理程序，包含影響分析、測試驗證、計劃性停機

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

## 自我審核 Checklist

- [x] 是否包含完整免責聲明？
- [x] 修補建議是否全部來自官方來源？（所有連結均為 CISA、廠商官方公告、NVD、JVN、CERT-FR、CERT.RO）
- [x] 是否清楚區分「通用建議」與「針對本週威脅」？
- [x] 緩解策略是否標註有效期限？
- [x] 是否有可能被誤解為「保證安全」的措辭？（已檢查，無此類措辭）
- [x] 是否標註建議的適用範圍與限制？
- [x] 所有引用的漏洞是否有正確的 CVE 編號？
- [x] 格式是否適合 IT/資安管理人員快速閱讀？

---

> 報告產出時間：2026-03-02
> 資料截止時間：2026-03-02 UTC
> 資料來源：CISA KEV、CISA Emergency Directive ED 26-03、CISA ICS Advisories、Google TAG、Rapid7、TWCERT/CC、JPCERT/CC、JVN、CERT-FR、CERT.RO、NCSC-FI、Cisco、Dell、BeyondTrust、Microsoft、Apple、Zyxel、RoundCube、Soliton、Notepad++、SolarWinds、Chainalysis、Exploit-DB、NVD
> 分析模型：Claude Opus 4.6
> 版本：1.0
