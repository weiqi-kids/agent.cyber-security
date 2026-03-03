---
layout: seo-report
title: 2026 第 10 週防禦建議
description: "2026-02-24 至 2026-03-02 資安防禦建議週報：Cisco SD-WAN 緊急修補（CISA ED 26-03）、伊朗 Operation Epic Fury 五大 APT 組織同步動員防禦對策、Notepad++ Chrysalis 後門供應鏈攻擊應變、BeyondTrust 勒索軟體關聯漏洞緊急處置、14 項 CISA KEV 活躍利用漏洞修補指引、SolarWinds WHD 雙漏洞修補、供應鏈攻擊防禦（eslint-config-prettier、React Native CLI）、ICS/OT 系統強化建議、VMware Cloud Foundation Critical 修補。"
parent: 防禦建議
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-defense-advisory.png
author: 資安情報分析團隊
date: 2026-03-03
---

# 防禦建議 — 2026 第 10 週

> 涵蓋期間：2026-02-24 至 2026-03-02
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV、CISA ICS Advisories
> 產出時間：2026-03-03

---

## 執行摘要

本週威脅態勢持續嚴峻，**CISA 緊急指令 ED 26-03 針對 Cisco SD-WAN 仍為最高優先事項**，同時伊朗地緣政治網路戰全面升級、多項供應鏈攻擊揭露、14 項活躍利用漏洞列入 CISA KEV，以及 ICS/OT 漏洞大幅增加：

1. **CISA 緊急指令 ED 26-03 持續生效（最高優先級）** -- 全球性攻擊活動針對 Cisco SD-WAN 系統，CVE-2026-20127（CVSS 10.0 身份驗證繞過）與 CVE-2022-20775（路徑遍歷）仍在活躍利用中，國際多國 CERT（NSA、ACSC、NCSC-UK、CERT-FR、CERT.RO、NCSC-NL、Canadian Cyber Centre）聯合發布指引
2. **伊朗 Operation Epic Fury 網路戰全面升級** -- 五大 APT 組織（MuddyWater、APT33、APT34、Charming Kitten、Moses Staff）同步動員，MuddyWater 部署 5 個全新惡意程式家族（含 Rust 工具），加拿大、芬蘭等多國 CERT 發布伊朗網路威脅公告，關鍵基礎設施為主要目標
3. **Notepad++ 供應鏈攻擊（重大）** -- 中國 APT 組織 Lotus Blossom（Violet Typhoon）攻陷代管服務商，透過 WinGUp 更新器散布 Chrysalis 後門，濫用 Microsoft Warbird 框架規避 EDR，影響 2025 年 6-12 月期間使用自動更新的所有使用者
4. **兩個漏洞已確認勒索軟體關聯且修補期限已過** -- CVE-2026-1731（BeyondTrust）和 CVE-2026-24423（SmarterMail）
5. **14 項 CISA KEV 活躍利用漏洞** -- 本週涵蓋的活躍利用清單包含 RoundCube 雙漏洞、SolarWinds WHD 雙漏洞、Cisco UCM、Sangoma FreePBX、Zimbra ZCS 等，含三項供應鏈攻擊（eslint-config-prettier、React Native CLI、Notepad++）
6. **ICS/OT 漏洞激增** -- CISA 發布 10 項 ICS 公告：Johnson Controls（CVSS 9.1 預認證 RCE）、Copeland XWEB（23 CVE）、EV 充電站平台（CVSS 9.4）、Yokogawa CENTUM VP
7. **企業級 Critical 新揭露** -- VMware Cloud Foundation（3 CVE）、SonicWall Gen7/Gen8、SolarWinds Serv-U、Zyxel（CVSS 9.8）
8. **QuickLens Chrome 擴充套件遭竄改** -- 約 7,000 名使用者受 ClickFix 攻擊與加密貨幣竊取影響

**本週關鍵行動**：
- **立即（緊急指令）**：持續遵循 CISA ED 26-03 處置所有 Cisco SD-WAN 系統
- **立即（勒索軟體關聯、已過期）**：BeyondTrust CVE-2026-1731 修補、SmarterMail CVE-2026-24423 修補
- **立即（供應鏈攻擊）**：停用 Notepad++ 自動更新，手動升級至 v8.9.2，執行 IoC 檢查；檢查 npm 依賴是否使用受影響版本的 eslint-config-prettier
- **緊急（3 天內）**：Apple CVE-2026-20700（修補期限 2026-03-05）、Soliton FileZen CVE-2026-25108（新增 KEV）
- **優先**：VMware Cloud Foundation 升級至 9.0.2.0+、SonicWall 韌體更新、SolarWinds Serv-U 升級至 15.5.4+
- **優先（ICS/OT）**：評估 Johnson Controls、Copeland、EV 充電站設備暴露風險
- **持續**：伊朗 APT 威脅獵捕、IoT 殭屍網路 IoC 封鎖

---

## 1. 優先修補清單

依照優先級排序：**CISA 緊急指令 > 活躍利用且有勒索軟體關聯（修補期限已過） > 活躍利用（修補期限即將到期或新增 KEV） > CVSS Critical 新揭露 > 供應鏈攻擊 > 活躍利用持續追蹤**

### P0 -- 最高優先（CISA 緊急指令 ED 26-03）

#### Cisco SD-WAN -- CVE-2026-20127 + CVE-2022-20775

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-20127（CVSS 10.0，CWE-287 不當身份驗證）、CVE-2022-20775（CWE-25 路徑遍歷 + CWE-282 不當權限管理） |
| **影響產品** | Cisco Catalyst SD-WAN Controller（前 vSmart）、Cisco Catalyst SD-WAN Manager（前 vManage） |
| **利用狀態** | **持續活躍利用** -- 國際多國聯合公告確認全球性利用 |
| **勒索軟體** | Unknown |
| **攻擊鏈** | 認證繞過 → NETCONF 存取 → SD-WAN 配置操縱 → 路徑遍歷提權至 root → 惡意 rogue peers 持久化 |

> **CISA 緊急指令 ED 26-03 -- 持續生效中**
>
> 國際合作夥伴（NSA、ASD ACSC、Canadian Cyber Centre、NCSC-NZ、NCSC-UK、CERT-FR、CERT.RO、NCSC-NL）已觀察到惡意行為者在全球範圍內持續攻擊和入侵 Cisco SD-WAN 系統。
>
> **Qdrant 跨 Layer 關聯**：查詢「Cisco SD-WAN mitigation patch remediation」返回 10 筆結果（最高相似度 0.6292），荷蘭 NCSC（NCSC-2026-0071）、加拿大 Cyber Centre（AL26-004）均已發布獨立修補公告，exploit_intelligence 與 vulnerability_tracking 兩個 Layer 均有高密度記錄。

**修補版本（來自 Cisco 官方安全公告）**：

| SD-WAN Release | 修補版本 |
|----------------|----------|
| < 20.9 | 遷移至受支援版本 |
| 20.9 | 20.9.8.2 |
| 20.12.5 | 20.12.5.3 |
| 20.12.6 | 20.12.6.1 |
| 20.15 | 20.15.4.2 |
| 20.18 | 20.18.2.1 |

**受影響部署類型**：On-Prem Deployment、Cisco Hosted SD-WAN Cloud（Cisco Managed）、Cisco Hosted SD-WAN Cloud（FedRAMP）、Cisco Hosted SD-WAN Cloud

**必要行動（來自 CISA Hunt & Hardening Guidance）**：
1. 盤點所有 Cisco SD-WAN 系統
2. 收集虛擬快照和日誌進行威脅獵捕
3. 完整修補 Cisco SD-WAN 系統至上述版本
4. 隔離 VPN 512 介面，使用 IP 封鎖限制存取
5. 替換自簽憑證為可信 CA 簽發的憑證
6. 使用 pairwise keys 強化控制平面與資料平面安全
7. 縮短 session timeout 至最短可行時間
8. 將日誌轉發至遠端 syslog 伺服器進行集中監控
9. 檢查是否有未授權的 rogue peers 加入 SD-WAN 網路配置

**參考連結**：
- [CISA Emergency Directive 26-03](https://www.cisa.gov/news-events/directives/ed-26-03-mitigate-vulnerabilities-cisco-sd-wan-systems)
- [CISA Hunt & Hardening Guidance](https://www.cisa.gov/news-events/directives/supplemental-direction-ed-26-03-hunt-and-hardening-guidance-cisco-sd-wan-systems)
- [Cisco Security Advisory cisco-sa-sdwan-rpa-EHchtZk](https://sec.cloudapps.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-sdwan-rpa-EHchtZk)
- [Cisco Security Advisory cisco-sa-sd-wan-priv-E6e8tEdF](https://www.cisco.com/c/en/us/support/docs/csa/cisco-sa-sd-wan-priv-E6e8tEdF.html)

### P0+ -- 極緊急（勒索軟體關聯、修補期限已過期）

#### BeyondTrust RS/PRA -- CVE-2026-1731

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-1731（CWE-78 OS Command Injection） |
| **影響產品** | BeyondTrust Remote Support (RS)、Privileged Remote Access (PRA) |
| **利用狀態** | **持續活躍利用** -- 未經驗證的遠端攻擊者可執行任意 OS 指令 |
| **勒索軟體** | **Known** -- CISA 已確認被勒索軟體攻擊活動利用 |
| **修補期限** | **2026-02-16（已過期 15 天）** |

> **Qdrant 跨 Layer 關聯**：查詢「authentication bypass remote code execution defense」返回 BeyondTrust Products RCE Vulnerability（相似度 0.5622），確認跨 vulnerability_tracking 與 exploit_intelligence 兩個 Layer 均有記錄。

**修補方式（來自 BeyondTrust 官方公告 BT26-02）**：
1. 立即套用 BeyondTrust 提供的安全更新
2. 若無法立即修補，停止使用該產品或切斷對外網路存取
3. 遵循 BOD 22-01 指引

**緊急行動**：
1. 立即檢查所有對外暴露的 BeyondTrust RS/PRA 實例是否存在入侵跡象
2. 優先處理面向網際網路的實例
3. 檢查 Web Access Log 是否有異常 OS 命令注入模式
4. 若發現入侵跡象，立即隔離並啟動事件回應程序

**參考連結**：
- [BeyondTrust Security Advisory BT26-02](https://www.beyondtrust.com/trust-center/security-advisories/bt26-02)
- [NVD - CVE-2026-1731](https://nvd.nist.gov/vuln/detail/CVE-2026-1731)

#### SmarterTools SmarterMail -- CVE-2026-24423

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-24423（CWE-306 Missing Authentication for Critical Function） |
| **影響產品** | SmarterTools SmarterMail |
| **利用狀態** | **持續活躍利用** -- ConnectToHub API 缺乏認證，可導向惡意 HTTP 伺服器執行 OS 命令 |
| **勒索軟體** | **Known** -- CISA 已確認被勒索軟體攻擊活動利用 |
| **修補期限** | **2026-02-26（已過期）** |

> **Qdrant 跨 Layer 關聯**：查詢「authentication bypass remote code execution defense」返回 SmarterMail RCE Active Exploitation（相似度 0.5554），NCSC-NL（NCSC-2026-0040）已發布獨立公告。

**修補方式（來自 SmarterTools 官方公告）**：
1. 升級至 SmarterMail 最新版本（參閱 SmarterTools Release Notes）
2. 若無法立即升級，限制 ConnectToHub API 的網路存取
3. 遵循 BOD 22-01 指引

**參考連結**：
- [SmarterTools Release Notes](https://www.smartertools.com/smartermail/release-notes/current)
- [NVD - CVE-2026-24423](https://nvd.nist.gov/vuln/detail/CVE-2026-24423)

#### Dell RP4VMs -- CVE-2026-22769

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-22769（CWE-798 硬編碼憑證） |
| **影響產品** | Dell RecoverPoint for Virtual Machines (RP4VMs) |
| **利用狀態** | **持續活躍利用** -- Google TAG 確認威脅組織 UNC6201 正活躍利用 |
| **修補期限** | **2026-02-21（已過期 10 天）** |

**修補方式（來自 Dell 官方公告 DSA-2026-079）**：
1. 執行 [Dell 補救腳本](https://www.dell.com/support/kbdoc/en-us/000426742/recoverpoint-for-vms-apply-the-remediation-script-for-dsa)
2. 檢查系統日誌是否有異常的 root 層級活動
3. 限制 RP4VMs 對外部網路暴露

**參考連結**：
- [Dell DSA-2026-079](https://www.dell.com/support/kbdoc/en-us/000426773/dsa-2026-079)
- [Google Threat Intelligence](https://cloud.google.com/blog/topics/threat-intelligence/unc6201-exploiting-dell-recoverpoint-zero-day)

### P1 -- 緊急（活躍利用、修補期限即將到期或新增 KEV）

#### Apple 多平台 -- CVE-2026-20700（修補期限 2026-03-05）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-20700（CWE-119 記憶體緩衝區操作不當） |
| **影響產品** | iOS、macOS、tvOS、watchOS、visionOS |
| **利用狀態** | **活躍利用** |
| **修補期限** | **2026-03-05（剩餘 2 天）** |

**修補方式（來自 Apple 官方安全更新）**：安裝最新安全更新。

**參考連結**：
- [Apple Security Update 126346](https://support.apple.com/en-us/126346)、[126348](https://support.apple.com/en-us/126348)、[126351](https://support.apple.com/en-us/126351)、[126352](https://support.apple.com/en-us/126352)、[126353](https://support.apple.com/en-us/126353)

#### Soliton FileZen -- CVE-2026-25108（本週新增 KEV）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-25108（OS Command Injection） |
| **影響產品** | Soliton Systems K.K FileZen |
| **利用狀態** | **活躍利用** -- 2026-02-24 新加入 CISA KEV |

**修補方式（來自 JVN 公告）**：依照廠商指示套用安全更新。若無法立即修補，限制 FileZen 管理介面的網路存取。

**參考連結**：
- [JVN - JVN#84622767](https://jvn.jp/en/jp/JVN84622767/)
- [NVD - CVE-2026-25108](https://nvd.nist.gov/vuln/detail/CVE-2026-25108)

#### RoundCube Webmail -- CVE-2025-49113 + CVE-2025-68461

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-49113（反序列化 RCE）、CVE-2025-68461（XSS via SVG animate tag） |
| **影響產品** | RoundCube Webmail |
| **利用狀態** | **持續活躍利用** |

> **Qdrant 跨 Layer 關聯**：查詢「RoundCube Webmail vulnerability exploitation remediation」確認加拿大 CERT 安全建議與 CISA KEV 同步追蹤，HKCERT 亦發布安全公告。

**修補方式（來自 RoundCube 官方安全更新）**：

| 漏洞 | 修補版本（1.6.x） | 修補版本（1.5.x） |
|------|-------------------|-------------------|
| CVE-2025-49113 | 1.6.11+ | 1.5.10+ |
| CVE-2025-68461 | 1.6.12+ | 1.5.12+ |

建議直接升級至 RoundCube **1.6.12** 或 **1.5.12** 可同時修復兩個漏洞。

**參考連結**：
- [RoundCube Security Update 1.6.12/1.5.12](https://roundcube.net/news/2025/12/13/security-updates-1.6.12-and-1.5.12)

#### SolarWinds Web Help Desk -- CVE-2025-40536 + CVE-2025-40551

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-40536（CWE-693 Protection Mechanism Failure，認證繞過）、CVE-2025-40551（反序列化 RCE） |
| **影響產品** | SolarWinds Web Help Desk |
| **利用狀態** | **活躍利用** -- 兩者均列入 CISA KEV |
| **嚴重程度** | Critical |

> **Qdrant 跨 Layer 關聯**：SolarWinds WHD 漏洞同時出現於 HKCERT 與加拿大 CERT 安全公告（Canadian Cyber Centre AV26-162 相似度 0.5813），與 CISA KEV 交叉確認。

**修補方式（來自 SolarWinds 官方安全公告）**：
1. 升級 SolarWinds Web Help Desk 至最新版本
2. 若無法立即升級，限制 Web Help Desk 管理介面的網路存取
3. 遵循 BOD 22-01 指引

**參考連結**：
- [SolarWinds Security Advisory CVE-2025-40536](https://www.solarwinds.com/trust-center/security-advisories/CVE-2025-40536)
- [SolarWinds Web Help Desk Release Notes](https://documentation.solarwinds.com/en/success_center/whd/content/release_notes/whd_2026-1_release_notes.htm)
- [NVD - CVE-2025-40536](https://nvd.nist.gov/vuln/detail/CVE-2025-40536)
- [NVD - CVE-2025-40551](https://nvd.nist.gov/vuln/detail/CVE-2025-40551)

#### SmarterTools SmarterMail -- CVE-2025-52691（無限制檔案上傳）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-52691（CWE-434 Unrestricted Upload of File with Dangerous Type） |
| **影響產品** | SmarterTools SmarterMail |
| **利用狀態** | **活躍利用** -- 列入 CISA KEV |
| **嚴重程度** | Critical |

> **Qdrant 跨 Layer 關聯**：查詢「SmarterMail RCE active exploitation」確認多個安全建議同步追蹤，與 CVE-2026-24423（P0+ 勒索軟體關聯）為同一產品不同漏洞。

**修補方式（來自 SmarterTools 官方公告）**：
1. 升級至 SmarterMail 最新版本（參閱 SmarterTools Release Notes）
2. 確認所有上傳功能已實施嚴格的檔案類型白名單驗證
3. 遵循 BOD 22-01 指引

**參考連結**：
- [SmarterTools Release Notes](https://www.smartertools.com/smartermail/release-notes/current)
- [NVD - CVE-2025-52691](https://nvd.nist.gov/vuln/detail/CVE-2025-52691)

#### Cisco Unified Communications -- CVE-2026-20045

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-20045（CWE-94 Code Injection） |
| **影響產品** | Cisco Unified Communications Manager (Unified CM)、Unified CM SME、Unified CM IM & Presence Service、Unity Connection、Webex Calling Dedicated Instance |
| **利用狀態** | **活躍利用** -- 列入 CISA KEV |
| **嚴重程度** | Critical |
| **修補期限** | **2026-02-11（已過期）** |

**修補方式（來自 Cisco 官方安全公告）**：
1. 依照 Cisco Security Advisory cisco-sa-voice-rce-mORhqY4b 套用更新
2. 攻擊者可獲取使用者層級存取權限後提權至 root，應優先處理面向網際網路的實例
3. 遵循 BOD 22-01 指引

**參考連結**：
- [Cisco Security Advisory cisco-sa-voice-rce-mORhqY4b](https://sec.cloudapps.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-voice-rce-mORhqY4b)
- [NVD - CVE-2026-20045](https://nvd.nist.gov/vuln/detail/CVE-2026-20045)

#### Sangoma FreePBX -- CVE-2025-64328

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-64328（CWE-78 OS Command Injection） |
| **影響產品** | Sangoma FreePBX Endpoint Manager |
| **利用狀態** | **活躍利用** -- 列入 CISA KEV |
| **嚴重程度** | Critical |

**修補方式（來自 Sangoma 官方安全公告）**：
1. 依照 Sangoma 安全公告更新 FreePBX Endpoint Manager 至修補版本
2. 若無法立即更新，限制 FreePBX 管理介面的網路存取
3. 遵循 BOD 22-01 指引

**參考連結**：
- [Sangoma Security Advisory](https://www.sangoma.com/security/)
- [NVD - CVE-2025-64328](https://nvd.nist.gov/vuln/detail/CVE-2025-64328)

#### Zimbra Collaboration Suite -- CVE-2025-68645

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-68645（PHP Remote File Inclusion） |
| **影響產品** | Synacor Zimbra Collaboration Suite (ZCS) |
| **利用狀態** | **活躍利用** -- 列入 CISA KEV |
| **修補期限** | **2026-02-12（已過期 19 天）** |

**修補方式（來自 Zimbra 官方安全中心）**：
1. 依照 Zimbra Security Center 公告套用修補
2. 若無法立即修補，限制 PHP 遠端檔案包含功能
3. 遵循 BOD 22-01 指引

**參考連結**：
- [Zimbra Security Center](https://wiki.zimbra.com/wiki/Security_Center)
- [NVD - CVE-2025-68645](https://nvd.nist.gov/vuln/detail/CVE-2025-68645)

#### Fortinet 多產品 -- CVE-2026-24858

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-24858（Authentication Bypass Using Alternate Path） |
| **影響產品** | FortiAnalyzer、FortiManager、FortiOS、FortiProxy |
| **利用狀態** | **活躍利用** |

**修補方式**：依照 Fortinet 指示套用更新。若啟用 FortiCloud SSO 認證，立即檢查跨帳戶未授權登入。

### P1-SC -- 緊急（供應鏈攻擊）

#### eslint-config-prettier -- CVE-2025-54313（嵌入惡意程式碼）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-54313（Embedded Malicious Code） |
| **影響產品** | Prettier eslint-config-prettier npm 套件 |
| **利用狀態** | **活躍利用** -- 列入 CISA KEV |
| **攻擊類型** | 供應鏈攻擊 -- 受信任的 npm 套件被植入惡意程式碼 |

**修補方式（來自 npm 安全公告）**：
1. 檢查專案 `package.json` 及 `package-lock.json` 中 `eslint-config-prettier` 的版本
2. 移除或降級受影響版本，更新至安全版本
3. 執行 `npm audit` 掃描所有依賴項目
4. 檢查 CI/CD 管線是否自動安裝了受影響版本

**參考連結**：
- [npm Security Advisory](https://www.npmjs.com/advisories)
- [NVD - CVE-2025-54313](https://nvd.nist.gov/vuln/detail/CVE-2025-54313)

#### React Native CLI -- CVE-2025-11953（OS Command Injection）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-11953（OS Command Injection） |
| **影響產品** | React Native Community CLI（Metro Development Server） |
| **利用狀態** | **活躍利用** -- 列入 CISA KEV |
| **攻擊類型** | 供應鏈攻擊 -- 開發工具鏈中的命令注入 |

**修補方式（來自 React Native Community 公告）**：
1. 更新 React Native CLI 至修補版本
2. 在開發環境中限制 Metro Development Server 的網路存取
3. 檢查開發環境是否有異常的系統命令執行紀錄

**參考連結**：
- [React Native Community CLI GitHub](https://github.com/react-native-community/cli)
- [NVD - CVE-2025-11953](https://nvd.nist.gov/vuln/detail/CVE-2025-11953)

#### Notepad++ -- CVE-2025-15556（WinGUp 更新器完整性缺失）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-15556（Code Download Without Integrity Check） |
| **影響產品** | Notepad++（WinGUp updater） |
| **利用狀態** | **活躍利用** -- 列入 CISA KEV，已知被 Lotus Blossom APT 利用 |
| **攻擊類型** | 供應鏈攻擊 -- 自動更新機制遭劫持 |

**修補方式（來自 Notepad++ 官方及 TWCERT/CC）**：
1. 立即停用 Notepad++ 自動更新功能（Settings > Preferences > Update）
2. 手動從官方網站下載 v8.9.2 並驗證 SHA-256 雜湊值
3. 執行 IoC 檢查（詳見「緩解策略 3.2」）

**參考連結**：
- [Notepad++ 官方網站](https://notepad-plus-plus.org/)
- [TWCERT/CC 公告](https://www.twcert.org.tw/tw/cp-104-10725-feaeb-1.html)
- [NVD - CVE-2025-15556](https://nvd.nist.gov/vuln/detail/CVE-2025-15556)

### P2 -- 優先處理（CVSS Critical 新揭露）

#### VMware Cloud Foundation / vSphere Foundation -- CVE-2026-22720/22719/22721

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-22720、CVE-2026-22719、CVE-2026-22721 |
| **影響產品** | VMware Cloud Foundation（< 9.0.2.0）、VMware vSphere Foundation（< 9.0.2.0）、VMware Aria Operations |
| **嚴重程度** | Critical |

**修補方式（來自 VMware/Broadcom 官方公告及 Canadian Cyber Centre AV26-162）**：
1. 更新 VMware Cloud Foundation 至 **9.0.2.0** 或更高版本
2. 更新 VMware vSphere Foundation 至 **9.0.2.0** 或更高版本

**參考連結**：[Canadian Cyber Centre AV26-162](https://cyber.gc.ca/en/alerts-advisories/vmware-security-advisory-av26-162)

#### SonicWall Gen7/Gen8 Firewalls -- AV26-161

| 項目 | 內容 |
|------|------|
| **影響產品** | Gen7 hardware Firewalls（<= 7.0.1-5169）、Gen7 NSv（<= 7.3.1-7013）、Gen8 Firewalls |
| **嚴重程度** | Critical |

**修補方式（來自 SonicWall 官方公告及 Canadian Cyber Centre AV26-161）**：
1. Gen7 hardware Firewalls：升級至 7.0.1-5169 以上版本
2. Gen7 NSv：升級至 7.3.1-7013 以上版本
3. Gen8 Firewalls：參閱官方公告取得對應修補版本

**參考連結**：[Canadian Cyber Centre AV26-161](https://cyber.gc.ca/en/alerts-advisories/sonicwall-security-advisory-av26-161)

#### SolarWinds Serv-U -- CVE-2025-40538

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-40538 |
| **影響產品** | SolarWinds Serv-U（< 15.5.4） |
| **嚴重程度** | Critical |

**修補方式**：更新 SolarWinds Serv-U 至 **15.5.4** 或更高版本。

**參考連結**：[Canadian Cyber Centre AV26-165](https://cyber.gc.ca/en/alerts-advisories/solarwinds-security-advisory-av26-165)

#### Zyxel 多型號 -- CVE-2025-13942（CVSS 9.8）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-13942 |
| **影響產品** | Zyxel 多型號設備 |
| **嚴重程度** | Critical（CVSS 9.8）-- OS 命令注入，遠端未認證利用 |

**修補方式**：立即盤點所有 Zyxel 設備，依照廠商指示套用安全更新。若無可用修補，隔離受影響設備。

#### Vite.js -- CVE-2025-31125

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-31125（Improper Access Control） |
| **影響產品** | Vite Vitejs |
| **利用狀態** | **活躍利用** -- 列入 CISA KEV |
| **修補期限** | **2026-02-12（已過期）** |

**修補方式**：升級至 Vite.js 修補版本。參閱 Vite 官方安全公告。

**參考連結**：
- [Vite GitHub Security Advisory](https://github.com/vitejs/vite/security/advisories)
- [NVD - CVE-2025-31125](https://nvd.nist.gov/vuln/detail/CVE-2025-31125)

#### Versa Concerto -- CVE-2025-34026

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-34026（Improper Authentication） |
| **影響產品** | Versa Concerto |
| **利用狀態** | **活躍利用** -- 列入 CISA KEV |
| **修補期限** | **2026-02-12（已過期）** |

**修補方式**：依照 Versa Networks 廠商指示套用更新。

**參考連結**：
- [NVD - CVE-2025-34026](https://nvd.nist.gov/vuln/detail/CVE-2025-34026)

### P3 -- 持續追蹤（活躍利用、修補期限已過期）

以下漏洞修補期限均已過期，若尚未修補，應立即優先處理：

| CVE | 產品 | 修補期限 | 修補方式 |
|-----|------|----------|----------|
| CVE-2026-21509 | Microsoft Office | 2026-02-16（已過期） | Office 2021 套用最終修補；Office 2019/2016 套用臨時緩解 |
| CVE-2026-24061 | GNU InetUtils | 2026-02-16（已過期） | 依照廠商指示套用更新 |
| CVE-2026-23760 | SmarterMail | 2026-02-16（已過期） | 升級至最新版本 |

---

## 2. 安全控制建議

### 網路層面

#### 針對本週威脅

**Cisco SD-WAN 攻擊鏈防禦**：
1. 將 SD-WAN 控制平面（VPN 512）與管理平面完全隔離，僅允許必要的管理存取
2. 限制 NETCONF（port 830）僅可從受信任的管理網段存取，實施嚴格的 ACL
3. 定期檢查 SD-WAN 網路結構配置，確認無未授權的 peer 節點
4. 替換所有自簽憑證為由可信 CA 簽發的憑證
5. 將所有 SD-WAN 設備日誌轉發至 SIEM，設定針對認證繞過和權限提升的告警規則

**伊朗 APT 組織網路防禦**：
6. 對關鍵基礎設施實施強化的網路監控，特別關注五大 APT 組織（MuddyWater、APT33、APT34、Charming Kitten、Moses Staff）的已知 C2 基礎設施
7. 加強邊界設備（防火牆、VPN、負載平衡器）的日誌記錄與即時告警
8. 封鎖已知伊朗 APT 相關 IoC（IP、域名、雜湊值），持續更新威脅情報饋送

**ICS/OT 網路防禦（CISA 10 項 ICS 公告）**：
9. 確保 ICS/OT 系統與 IT 網路完全分離，使用工業級防火牆與 DMZ
10. 若部署 EV 充電管理平台（EV Energy、Mobility46、Chargemap、CloudCharge、Switch、EV2go），立即檢視 WebSocket 認證配置、暴力破解防護、Session 管理設定
11. Johnson Controls Frick Quantum HD 和 Copeland XWEB 系統應完全隔離於 IT 網路之外，禁止直接暴露於網際網路

> **Qdrant 關聯**：查詢「ICS OT industrial control system defense hardening 2026」返回 10 筆結果（最高相似度 0.5813），Canadian Cyber Centre 於 2026-01-14 發布的「Joint guidance on secure connectivity principles for operational technology」（相似度 0.5577）提供 OT 安全連線原則，建議搭配參閱。

**Notepad++ C2 封鎖**：
12. 封鎖已知惡意網域：`api[.]skycloudcenter[.]com`、`api[.]wiresguard[.]com`
13. 封鎖已知惡意 IP：`95.179.213.0`、`61.4.102.97`、`59.110.7.32`、`124.222.137.114`
14. 監控異常 HTTPS 流量，特別是模仿 DeepSeek API 端點格式（`/a/chat/s/{GUID}`）的 C2 通訊

**IoT 殭屍網路防禦**：
15. 封鎖已知 Mirai Botnet C2 伺服器（如 `143.20.185.59:15154`）
16. 注意使用 `.shop`、`.top`、`.bond` TLD 的可疑 FormBook C2 網域（本週 388 個 IoC）

**供應鏈攻擊網路偵測**：
17. 監控開發環境的異常對外連線，特別是 npm 套件安裝過程中的非預期 HTTP/HTTPS 請求
18. 封鎖來自 CI/CD 管線的非預期對外連線

#### 通用建議

- 實施網路分段，限制橫向移動
- 確保邊界設備（防火牆、VPN、負載平衡器、SD-WAN）已更新
- 啟用 IDS/IPS 並更新特徵碼，加入本週 IoC
- 部署 DNS 過濾封鎖已知惡意網域
- 對所有面向網際網路的服務進行攻擊面盤點

### 端點層面

#### 針對本週威脅

**Notepad++ Chrysalis 後門防禦**：
1. **停用 Notepad++ 自動更新**（Settings > Preferences > Update）
2. **手動更新至 v8.9.2** 並從官方網站下載，驗證 SHA-256 雜湊值
3. **IoC 掃描**：檢查 `%appdata%\Bluetooth\`、`%appdata%\ProShow\`、`%appdata%\Adobe\Scripts\` 是否存在可疑檔案
4. **EDR 強化**：關注 Microsoft Warbird 框架的異常使用，監控 `NtQuerySystemInformation` 的 `SystemCodeFlowTransition (0xB9)` 呼叫
5. **DLL Side-Loading 偵測**：監控合法 Bitdefender 執行檔（BluetoothService.exe）載入非預期 DLL（特別是 log.dll）的行為

**QuickLens Chrome 擴充套件防禦**：
6. 檢查組織內所有 Chrome 瀏覽器是否安裝 QuickLens 擴充套件（v5.8 為惡意版本），若有立即移除
7. 實施 Chrome 擴充套件白名單政策，僅允許經審核的擴充套件
8. 教育使用者識別 ClickFix 社交工程手法

**伊朗 APT 組織偵測**：
9. 針對 MuddyWater、APT33、APT34、Charming Kitten、Moses Staff 的已知 TTP 進行主動威脅獵捕
10. 特別關注異常的 Rust 二進位執行和非預期的 C2 回連模式（MuddyWater 已部署 5 個全新惡意程式家族含 Rust 基礎工具）
11. 監控勒索軟體行為前兆（大量檔案加密、影子複本刪除）
12. 注意伊朗國家級行為者越來越多地採用犯罪戰術（勒索軟體 + 破壞性攻擊組合），需同時具備 APT 偵測與勒索軟體防禦能力

**開發環境供應鏈防禦**：
13. 掃描所有 npm 專案依賴項目，確認是否使用受影響版本的 `eslint-config-prettier`
14. 審查 React Native 專案的 `@react-native-community/cli` 版本，確認已更新至修補版本
15. 啟用 npm/yarn 的 audit 功能並整合至 CI/CD 管線

**威脅情報饋送 IoC 更新**：
16. 將本週 Top 惡意程式家族的 IoC 更新至 EDR：Vidar (109 筆)、IClickFix (69 筆)、AsyncRAT (65 筆)、ClearFake (64 筆)、Cobalt Strike (41 筆)、StrelaStealer (36 筆)、NetSupportManager RAT (32 筆)

#### 通用建議

- 確保 EDR 解決方案已部署並保持最新
- 定期備份關鍵資料並測試還原程序
- 軟體更新驗證：所有軟體更新必須驗證數位簽章和雜湊值
- 更新防毒軟體偵測特徵，涵蓋 Mirai、FormBook、Remcos、ClearFake、AsyncRAT、Stealc、Vidar 等家族

### 身分認證層面

#### 針對本週威脅

1. **Fortinet FortiCloud SSO 檢查**（CVE-2026-24858）：若啟用 FortiCloud SSO 認證，檢查是否有跨帳戶的未授權登入活動
2. **BeyondTrust 存取審計**：檢查所有 BeyondTrust RS/PRA 系統的存取日誌，特別關注 OS 命令注入跡象
3. **Dell RP4VMs 硬編碼憑證**（CVE-2026-22769）：立即執行 Dell 提供的修復腳本或隔離受影響系統
4. **Cisco SD-WAN 管理帳號**：審查 SD-WAN 管理帳號，實施 MFA，限制存取來源 IP
5. **SmarterMail ConnectToHub API**：限制 API 存取來源，檢查未授權存取紀錄
6. **SolarWinds WHD 認證**：檢查 Web Help Desk 系統是否有異常的認證繞過跡象（CVE-2025-40536）
7. **Cisco UCM 帳號審查**（CVE-2026-20045）：審查 Unified Communications Manager 存取權限，注意使用者層級存取提權至 root 的可能性

#### 通用建議

- 在所有管理介面和遠端存取系統上強制啟用 MFA
- 審查特權帳戶使用情況，縮小特權帳戶數量
- 縮短所有管理介面的 Session Timeout
- 定期輪替服務帳號密碼

### 資料保護與監控

#### 針對本週威脅

1. **勒索軟體防備**（CVE-2026-1731、CVE-2026-24423 勒索軟體關聯）：驗證備份完整性與可復原性，實施 3-2-1 備份策略
2. **IoC 整合**：將本週 threat_feeds 新增的 2,659 筆惡意 URL、1,748 筆惡意軟體樣本、2,781 筆 IoC 指標整合至 SIEM/SOAR
3. **伊朗 APT 監控升級**：若組織屬於能源、金融、政府、國防領域，應提升監控層級至最高；加拿大 Cyber Centre 評估伊朗「幾乎確定」（very likely）將使用網路能力進行報復
4. **供應鏈攻擊後調查**：若曾在 2025 年 6 月至 2026 年 2 月使用 Notepad++ 自動更新，需回溯檢查過去 9 個月的網路流量日誌
5. **UAC-0252 釣魚攻擊防範**：教育使用者識別冒充政府機構要求更新行動應用程式的釣魚電子郵件，參閱 CERT-UA#20032 完整公告

#### 通用建議

- 加密敏感資料（靜態與傳輸中）
- 監控異常資料外傳行為
- 定期進行資料備份，將備份隔離於生產網路之外

---

## 3. 緩解策略

### 3.1 Cisco SD-WAN（無法立即升級時）

| 措施 | 說明 |
|------|------|
| **VPN 512 隔離** | 使用 ACL 限制僅允許已知合法 peer IP 連線 |
| **停用 NETCONF** | 若不需要外部 NETCONF 管理，暫時關閉 |
| **加強監控** | 在 SIEM 中設定針對 SD-WAN 認證事件的即時告警 |
| **配置快照** | 定期建立 SD-WAN 設備配置快照，偵測未授權變更 |
| **憑證替換** | 替換所有 SD-WAN Manager 自簽憑證 |

> **有效期限**：臨時措施最多維持至下一個維護窗口（建議不超過 7 天），應儘速完成正式修補。
> **來源**：[CISA ED 26-03](https://www.cisa.gov/news-events/directives/ed-26-03-mitigate-vulnerabilities-cisco-sd-wan-systems)

### 3.2 Notepad++ 供應鏈攻擊後處置

| 措施 | 說明 |
|------|------|
| **停用自動更新** | Settings > Preferences > Update > 取消勾選 |
| **手動升級** | 從官方網站下載 v8.9.2 並驗證 SHA-256 |
| **IoC 全面掃描** | 使用 EDR 或 YARA 規則掃描所有端點的 Chrysalis 後門指標 |
| **C2 封鎖** | 在 DNS 和防火牆層級封鎖已知惡意基礎設施 |
| **流量回溯** | 回溯檢查過去 9 個月的網路流量日誌 |
| **DLL 完整性** | 驗證 BluetoothService.exe 是否載入非預期的 DLL |

> **有效期限**：立即執行，持續監控至少 30 天。
> **若確認受害**：立即隔離系統、保存證據、根除威脅、變更敏感帳戶密碼、通報主管機關。
> **來源**：[TWCERT/CC 公告](https://www.twcert.org.tw/tw/cp-104-10725-feaeb-1.html)

### 3.3 BeyondTrust RS/PRA（修補期限嚴重過期、勒索軟體關聯）

| 措施 | 說明 |
|------|------|
| **立即評估暴露** | 盤點所有可從網際網路存取的 BeyondTrust 產品 |
| **入侵檢查** | 檢查系統日誌是否有異常指令執行、未授權存取跡象 |
| **網路隔離** | 在修補前將管理介面限制為僅允許內部存取 |
| **修補** | 參閱 [BeyondTrust BT26-02](https://www.beyondtrust.com/trust-center/security-advisories/bt26-02) |

> **有效期限**：直到完成修補。**CISA 修補期限 2026-02-16 已過期 15 天**。
> **勒索軟體關聯**：延遲修補將大幅增加被攻擊風險。

### 3.4 伊朗 APT 威脅升級應對（Operation Epic Fury 後續）

| 措施 | 說明 |
|------|------|
| **威脅獵捕** | 針對 MuddyWater、APT33、APT34、Charming Kitten、Moses Staff 的 TTP 進行獵捕 |
| **異常流量監控** | 關注異常 Rust 二進位執行、非預期 C2 回連模式 |
| **勒索軟體防備** | 驗證備份、測試復原程序；注意伊朗國家級行為者正結合勒索軟體與破壞性攻擊 |
| **態勢感知** | 持續追蹤伊朗網路戰態勢發展 |
| **資訊戰防備** | 監控行動 App 推播通知基礎設施，防範心理戰操作 |
| **網路封鎖應變** | 若組織有伊朗業務，準備網路連線中斷應變計畫 |

> **有效期限**：持續執行。Operation Epic Fury 導致網路威脅態勢可能在短期內快速變化。
> **適用對象**：美國及以色列盟友政府機構、能源基礎設施、金融機構、國防承包商。加拿大 Cyber Centre 評估親伊朗駭客主義者可能鎖定加拿大為低技術破壞性攻擊目標。
> **來源**：Canadian Cyber Centre 伊朗網路威脅公告（2026-03-02）、NCSC-FI 公告

### 3.5 Soliton FileZen（等待廠商修補指引時）

| 措施 | 說明 |
|------|------|
| **限制存取** | FileZen 管理介面僅可從內部網路存取 |
| **WAF 防護** | 在 WAF/反向代理上設定規則，過濾異常 HTTP 請求 |
| **日誌監控** | 加強 FileZen 存取日誌監控 |

> **有效期限**：直到廠商發布明確修補版本並完成套用。

### 3.6 ICS/OT 系統（Johnson Controls / Copeland / EV 充電站 / Yokogawa）

| 措施 | 說明 |
|------|------|
| **網路隔離** | 確保 ICS 系統完全與企業 IT 網路隔離 |
| **移除網際網路存取** | 斷開所有 ICS 系統的直接網際網路連線 |
| **VPN 存取** | 若需遠端管理，僅透過 VPN 並搭配 MFA |
| **變更預設認證** | 更改所有預設密碼與帳戶 |
| **實體安全** | 限制 ICS 設備的實體存取權限 |

> **有效期限**：直到廠商發布修補並完成套用。OT 環境修補必須經過完整測試，避免影響生產。
> **來源**：[CISA ICS Advisories](https://www.cisa.gov/news-events/ics-advisories)

### 3.7 供應鏈攻擊防禦（npm / 開發工具鏈）

| 措施 | 說明 |
|------|------|
| **依賴審計** | 對所有 npm 專案執行 `npm audit`，檢查是否使用受影響版本的 eslint-config-prettier |
| **鎖定版本** | 使用 `package-lock.json` 或 `yarn.lock` 固定依賴版本 |
| **CI/CD 掃描** | 在 CI/CD 管線中整合 SCA（Software Composition Analysis）工具 |
| **開發環境隔離** | Metro Development Server 不應暴露於公網 |
| **網路監控** | 監控 npm 安裝過程中的異常對外連線 |

> **有效期限**：持續執行。供應鏈攻擊是長期威脅。
> **重新評估時間**：每次更新依賴項目時重新審計。

### 3.8 SolarWinds WHD 雙漏洞緩解

| 措施 | 說明 |
|------|------|
| **限制管理介面存取** | Web Help Desk 管理介面僅可從受信任的內部網段存取 |
| **WAF 規則** | 在 WAF 上設定規則，阻擋異常的認證繞過嘗試 |
| **日誌審查** | 檢查 WHD 存取日誌是否有未授權存取跡象 |
| **反序列化防護** | 若可能，在應用層防火牆限制序列化物件的傳輸 |

> **有效期限**：直到完成升級至最新版本。
> **來源**：[SolarWinds Security Advisory](https://www.solarwinds.com/trust-center/security-advisories/CVE-2025-40536)

---

## 4. 注意事項

### 適用範圍

1. **Cisco SD-WAN 修補**適用於所有部署類型（On-Prem、Cisco Hosted、FedRAMP），但不同部署類型的修補步驟可能不同。Cisco Hosted 環境需透過 Cisco TAC 協調。
2. **伊朗 APT 防禦建議**主要針對可能成為地緣政治目標的組織，特別是美國、以色列及其盟友（包含加拿大）的政府機構、能源基礎設施、金融機構和國防承包商。一般企業仍應注意伊朗行為者採用勒索軟體作為攻擊手段的趨勢。
3. **ICS/OT 緩解措施**主要針對使用 Johnson Controls Frick Quantum HD 冷凍控制系統、Copeland XWEB/XWEB Pro、Yokogawa CENTUM VP 以及 EV 充電管理平台的食品、農業、商業設施和運輸基礎設施。其他 ICS 環境應參閱對應的 CISA ICS Advisory。
4. **Notepad++ 供應鏈攻擊 IoC**主要適用於 Windows 環境。macOS/Linux 使用者不受此特定攻擊影響。
5. **勒索軟體關聯漏洞**（CVE-2026-1731、CVE-2026-24423）對所有使用相關產品且暴露於網際網路的組織均適用。
6. **供應鏈攻擊防禦**（CVE-2025-54313、CVE-2025-11953）適用於所有使用 npm 生態系統的開發團隊。
7. **SolarWinds WHD 修補**適用於所有部署 SolarWinds Web Help Desk 的組織，兩個漏洞（認證繞過 + 反序列化 RCE）可形成攻擊鏈。

### 已知限制與副作用

| 建議措施 | 可能副作用 | 替代方案 |
|----------|------------|----------|
| SD-WAN VPN 512 隔離 | 可能影響正常 peer 通訊 | 確認所有合法 peer IP 已加入白名單 |
| 停用 Notepad++ 自動更新 | 後續修補需手動套用 | 透過 GPO/MDM 集中管理 |
| ICS 網路隔離 | 可能影響遠端監控能力 | 評估營運影響後實施 |
| Chrome 擴充套件白名單 | 可能影響使用者生產力 | 先調查需求再實施 |
| BeyondTrust 修補 | 可能需重啟遠端存取服務 | 安排維護窗口 |
| ICS/OT 設備修補 | **高風險** -- 可能影響生產控制系統 | 必須在測試環境驗證；安排計劃性停機 |
| SolarWinds Serv-U 修補 | 可能影響檔案傳輸服務 | 安排維護窗口 |
| npm 套件降級 | 可能影響建置流程 | 在 staging 環境先測試後再部署 |
| Metro Server 網路限制 | 可能影響開發者遠端除錯 | 使用 VPN 連線至開發網路 |
| SolarWinds WHD 管理介面限制 | 遠端管理功能受限 | 安排維護窗口進行升級 |

### 測試建議

1. **修補測試**：所有 Critical 修補在部署至生產環境前，應在測試環境中驗證相容性
2. **SD-WAN 修補**：特別注意升級過程中的網路中斷風險，建議在維護窗口內執行
3. **ICS 修補**：工業控制系統修補必須在模擬環境中充分測試，確認不影響製程安全
4. **回滾計畫**：所有修補操作前必須建立回滾計畫和系統快照
5. **IoC 掃描**：在套用修補前，先執行入侵跡象檢查
6. **供應鏈修補**：npm 依賴更新後，需完整執行 CI/CD 測試流程，確認應用程式功能不受影響
7. **SolarWinds WHD 升級**：升級前備份完整資料庫與設定檔

---

## 修補期限總覽表

| 優先級 | CVE | 產品 | 修補期限 | 勒索軟體 | 建議行動 |
|--------|-----|------|----------|----------|----------|
| **P0** | CVE-2026-20127 | Cisco SD-WAN | ED 26-03 | Unknown | 立即修補 + 威脅獵捕 |
| **P0** | CVE-2022-20775 | Cisco SD-WAN | ED 26-03 | Unknown | 立即修補 + 威脅獵捕 |
| **P0+** | CVE-2026-1731 | BeyondTrust RS/PRA | 2026-02-16（逾期） | **Known** | 立即修補 + 入侵檢查 |
| **P0+** | CVE-2026-24423 | SmarterMail | 2026-02-26（逾期） | **Known** | 立即修補 |
| **P0+** | CVE-2026-22769 | Dell RP4VMs | 2026-02-21（逾期） | N/A | 執行修復腳本 |
| **P1** | CVE-2026-20700 | Apple 多平台 | 2026-03-05 | 未確認 | 2 天內完成修補 |
| **P1** | CVE-2026-25108 | Soliton FileZen | TBD | N/A | 儘速修補 |
| **P1** | CVE-2025-49113 | RoundCube | TBD | N/A | 升級至 1.6.12 |
| **P1** | CVE-2025-68461 | RoundCube | TBD | N/A | 升級至 1.6.12 |
| **P1** | CVE-2025-40536 | SolarWinds WHD | 2026-02-15（逾期） | N/A | 升級至最新版本 |
| **P1** | CVE-2025-40551 | SolarWinds WHD | TBD | N/A | 升級至最新版本 |
| **P1** | CVE-2025-52691 | SmarterMail | TBD | N/A | 升級至最新版本 |
| **P1** | CVE-2026-20045 | Cisco UCM | 2026-02-11（逾期） | Unknown | 依 Cisco 公告更新 |
| **P1** | CVE-2025-64328 | Sangoma FreePBX | TBD | N/A | 依廠商公告更新 |
| **P1** | CVE-2025-68645 | Zimbra ZCS | 2026-02-12（逾期） | Unknown | 套用修補 |
| **P1** | CVE-2026-24858 | Fortinet | BOD 22-01 | N/A | 套用更新 |
| **P1-SC** | CVE-2025-54313 | eslint-config-prettier | TBD | N/A | 移除受影響版本 |
| **P1-SC** | CVE-2025-11953 | React Native CLI | TBD | N/A | 更新至修補版本 |
| **P1-SC** | CVE-2025-15556 | Notepad++ WinGUp | TBD | N/A | 停用自動更新 + 手動升級 |
| **P2** | CVE-2026-22720/19/21 | VMware CF/vSF | N/A | N/A | 升級至 9.0.2.0+ |
| **P2** | N/A | SonicWall Gen7/8 | N/A | N/A | 升級韌體 |
| **P2** | CVE-2025-40538 | SolarWinds Serv-U | N/A | N/A | 升級至 15.5.4+ |
| **P2** | CVE-2025-13942 | Zyxel | N/A | N/A | 套用修補 |
| **P2** | CVE-2025-31125 | Vite.js | 2026-02-12（逾期） | N/A | 升級版本 |
| **P2** | CVE-2025-34026 | Versa Concerto | 2026-02-12（逾期） | N/A | 套用更新 |
| **P3** | CVE-2026-21509 | Microsoft Office | 2026-02-16（逾期） | N/A | 套用安全更新 |
| **P3** | CVE-2026-24061 | GNU InetUtils | 2026-02-16（逾期） | N/A | 套用更新 |
| **P3** | CVE-2026-23760 | SmarterMail | 2026-02-16（逾期） | N/A | 升級版本 |

---

## Qdrant 跨 Layer 關聯分析摘要

本報告執行 5 次 Qdrant 語意查詢，為防禦建議提供跨 Layer 情境脈絡：

| # | 查詢內容 | 結果筆數 | 最高相似度 | 關鍵發現 |
|---|----------|----------|------------|----------|
| 1 | "Cisco SD-WAN mitigation patch remediation" | 10 | 0.6292 | 荷蘭 NCSC（NCSC-2026-0071）、加拿大 Cyber Centre（AL26-004）均已發布獨立修補公告；exploit_intelligence Layer 記錄 CVE-2022-20775 路徑遍歷（0.5549） |
| 2 | "critical vulnerability remediation patch 2026 February" | 10 | 0.6701 | Microsoft 2 月安全更新包含 6 個活躍利用 CVE（0.6555）；Oracle 1 月季度更新仍需關注（0.6383）；Palo Alto Networks 公告（0.6319） |
| 3 | "authentication bypass remote code execution defense" | 10 | 0.5622 | BeyondTrust RCE（0.5622）與 SmarterMail RCE Active Exploitation（0.5554）為認證繞過 + RCE 最高風險組合；Ivanti EPMM 歷史案例（0.5163）可供參考防禦策略 |
| 4 | "ICS OT industrial control system defense hardening 2026" | 10 | 0.5813 | CISA ICS 公告 AV26-151（0.5813）、OT 安全連線原則聯合指引（0.5577）、愛沙尼亞電力基礎設施演習（0.5426）、Siemens Industrial Edge 漏洞（0.5420） |
| 5 | "SolarWinds Web Help Desk RoundCube exploitation remediation" | 10 | 0.5944 | HKCERT + 加拿大 CERT 均發布 SolarWinds WHD 安全公告，與 CISA KEV 交叉確認；RoundCube 活躍利用跨多個安全建議追蹤 |

---

## 免責聲明

本防禦建議報告基於公開可取得的資訊來源編製，包括但不限於：CISA Known Exploited Vulnerabilities (KEV) Catalog、CISA Emergency Directives、National Vulnerability Database (NVD)、各國 CERT/CSIRT 公告（NSA、ACSC、NCSC-UK、CERT-FR、CERT.RO、Canadian Cyber Centre、NCSC-NL、NCSC-FI、CERT-SE、CERT-EE、JPCERT/CC、TWCERT/CC、CERT-UA）、廠商官方安全公告，以及 abuse.ch 威脅情報饋送。

**重要聲明**：

1. **非完整評估**：本報告不構成完整的安全評估或滲透測試結果。組織應根據自身環境和風險承受能力制定具體的修補和防禦計畫。

2. **修補建議來源**：所有修補建議均引用自廠商官方安全公告或權威 CERT 機構指引，本報告不自行編造修補方式。實際修補步驟請以廠商最新公告為準。

3. **時效性**：本報告資料收集截至 2026-03-02。安全態勢可能在報告發布後快速變化，特別是伊朗 APT 活動態勢和新漏洞揭露。建議持續追蹤相關 CERT 公告。

4. **環境差異**：每個組織的 IT 環境、資產清單和風險承受能力不同。本報告的優先級排序基於通用風險評估，組織應依據自身暴露面調整優先級。

5. **測試責任**：所有修補操作前應在測試環境中驗證，並備妥回滾計畫。因修補操作導致的服務中斷或系統問題，責任由實施者自行承擔。

6. **ICS/OT 特殊考量**：工業控制系統的修補必須考慮製程安全和可用性需求，不應在未經充分測試的情況下套用至生產環境。

7. **地緣政治風險**：伊朗網路威脅評估基於多國 CERT 公開情報，實際威脅可能因地緣政治發展而快速升級或改變方向。

8. **供應鏈風險**：npm 生態系統的惡意套件可能持續出現新變體，本報告僅涵蓋已知的受影響版本。

9. **地理偏差**：資料來源以歐美和亞太地區的 CERT 機構為主，非洲、南美洲等地區的特有威脅覆蓋不足。

10. **Qdrant 查詢限制**：語意查詢結果的相似度分數反映語意距離，不等同於實際威脅關聯性或防禦有效性。

11. **非法律建議**：本報告不構成法律或合規建議。

本報告僅供參考，不構成安全保證。重大安全決策請結合多方情資來源，並諮詢合格的資訊安全專業人員。

---

## 自我審核 Checklist

- [x] 修補建議是否均來自官方來源（廠商公告、CERT 指引）？
- [x] 是否包含完整免責聲明？
- [x] 是否標註「通用建議」vs「針對本週威脅」？
- [x] 優先修補清單是否依正確優先級排序（活躍利用 > EPSS > CVSS）？
- [x] 每筆修補是否包含：漏洞描述、影響產品、修補方式、利用狀態？
- [x] 安全控制建議是否分類（網路/端點/身分認證/資料保護）？
- [x] 緩解策略是否標註有效期限？
- [x] 注意事項是否包含適用範圍、限制、副作用、測試步驟？
- [x] 是否執行至少 3 次 Qdrant 語意查詢？（實際 5 次，50 筆結果）
- [x] 報告是否 > 10KB？
- [x] 所有 14 項 CISA KEV 活躍利用漏洞是否均已涵蓋？
- [x] 伊朗 APT 威脅是否有獨立的緩解策略段落？
- [x] 供應鏈攻擊是否有獨立的優先級分類（P1-SC）？

---

> 報告產出時間：2026-03-03
> 資料截止時間：2026-03-02 23:59 UTC
> 資料來源：CISA (US)、NSA (US)、ACSC (AU)、NCSC-UK (UK)、CERT-FR (FR)、CERT.RO (RO)、Canadian Cyber Centre (CA)、NCSC-NL (NL)、NCSC-FI (FI)、CERT-SE (SE)、CERT-EE (EE)、CERT-UA (UA)、JPCERT/CC (JP)、TWCERT/CC (TW)、NVD、Exploit-DB、abuse.ch
> 分析模型：Claude Opus 4.6
> Qdrant 語意查詢次數：5
> 版本：3.0
