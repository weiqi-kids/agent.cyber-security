---
layout: seo-report
title: 2026 第 10 週防禦建議
description: "2026-03-02 至 2026-03-08 資安防禦建議週報：VMware Aria Operations 命令注入零日漏洞活躍利用（CVE-2026-22719）、Cisco SD-WAN 緊急指令持續生效（CISA ED 26-03）、Qualcomm 晶片組記憶體損毀漏洞影響 Android 裝置（CVE-2026-21385）、Juniper Junos OS Evolved PTX 系列未授權 RCE PoC 公開（CVE-2026-21902）、WordPress Microsoft 365 SSO 認證繞過 CVSS 9.8（CVE-2026-2628）、伊朗地緣政治網路戰升級及五大 APT 動員、Linux 核心多平台重大安全更新、Apple 多平台修補期限到期。"
parent: 防禦建議
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-defense-advisory.png
author: 資安情報分析團隊
date: 2026-03-04
---

# 防禦建議 -- 2026 第 10 週

> 涵蓋期間：2026-03-02 至 2026-03-08
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV、CISA ICS Advisories、PoC-in-GitHub
> 產出時間：2026-03-04
> 上週報告：[2026 第 9 週防禦建議](../2026-W09-defense-advisory/)

---

## 執行摘要

本週（W10）威脅態勢維持高度嚴峻。在地緣政治衝突催化下，伊朗網路攻擊活動全面升級，多國 CERT 發布聯合警告；兩項新增 CISA KEV 活躍利用漏洞、多項 PoC 公開使企業面臨即時攻擊風險。以下為本週關鍵防禦要點：

1. **VMware Aria Operations 命令注入零日漏洞（CVE-2026-22719，Critical）** -- CISA KEV 2026-03-03 新增，未經身份驗證的遠端攻擊者可執行任意命令，已確認活躍利用，修補截止日 2026-03-24
2. **Qualcomm 多晶片組記憶體損毀漏洞（CVE-2026-21385，High）** -- CISA KEV 2026-03-03 新增，影響 Android 裝置，已列入 2026 年 3 月 Android 安全公告，修補截止日 2026-03-24
3. **CISA 緊急指令 ED 26-03 持續生效（最高優先級）** -- Cisco SD-WAN CVE-2026-20127（CVSS 10.0）與 CVE-2022-20775 持續活躍利用，多國聯合公告確認全球性攻擊
4. **Juniper Junos OS Evolved PTX 系列 RCE PoC 公開（CVE-2026-21902，CVSS 9.3）** -- watchTowr Labs 已發布 Python PoC，未經認證即可 root 權限執行任意程式碼，利用門檻極低
5. **WordPress Microsoft 365 SSO 認證繞過（CVE-2026-2628，CVSS 9.8）** -- PoC 已公開，可完全接管管理員帳號，影響所有使用此外掛的 WordPress 網站
6. **伊朗 Operation Epic Fury 網路戰全面升級** -- 美國/以色列軍事打擊後，加拿大 Cyber Centre 發布伊朗網路威脅公告，Dust Specter APT 新型惡意軟體、SloppyLemming 間諜活動揭露
7. **BeyondTrust CVE-2026-1731 勒索軟體關聯（修補期限已過期 17 天）** -- 持續活躍利用中，與勒索軟體攻擊活動直接關聯
8. **Apple 多平台 CVE-2026-20700 修補期限到期（2026-03-05）** -- 記憶體緩衝區漏洞活躍利用中
9. **Linux 核心重大安全更新** -- SUSE、Red Hat、Ubuntu 同步發布核心安全修補，涵蓋 RCE、權限提升、資訊洩露等多種漏洞
10. **Django 安全釋出（CVE-2026-25673、CVE-2026-25674）** -- DoS 與權限漏洞，建議 Web 開發團隊立即更新

**本週關鍵行動**：
- **立即（CISA 緊急指令）**：持續遵循 CISA ED 26-03 處置所有 Cisco SD-WAN 系統
- **立即（新增 KEV 活躍利用）**：VMware Aria Operations CVE-2026-22719 修補（截止 2026-03-24）、Android 2026-03-01 安全更新
- **立即（勒索軟體關聯、已過期）**：BeyondTrust CVE-2026-1731 修補
- **緊急（3 天內）**：Apple CVE-2026-20700（修補期限 2026-03-05）、Soliton FileZen CVE-2026-25108
- **優先（PoC 已公開）**：Juniper Junos OS Evolved CVE-2026-21902 修補、WordPress SSO 外掛 CVE-2026-2628 更新
- **優先（Linux 核心）**：SUSE、Red Hat、Ubuntu 核心安全更新
- **持續**：伊朗 APT 威脅獵捕、Chrome/Firefox/Edge 瀏覽器更新

---

## 1. 優先修補清單

依照優先級排序：**CISA 緊急指令 > 活躍利用且有勒索軟體關聯（修補期限已過） > 活躍利用（新增 KEV） > PoC 已公開且 Critical > CVSS Critical 新揭露 > 活躍利用持續追蹤**

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

> **針對本週威脅**：GovCERT.HK 於 2026-02-26 發布 A26-02-33 高威脅安全警告，涵蓋 Cisco FXOS、NX-OS、UCS Manager 等多款產品的新漏洞，應一併排程修補。

**修補版本（來自 Cisco 官方安全公告）**：

| SD-WAN Release | 修補版本 |
|----------------|----------|
| < 20.9 | 遷移至受支援版本 |
| 20.9 | 20.9.8.2 |
| 20.12.5 | 20.12.5.3 |
| 20.12.6 | 20.12.6.1 |
| 20.15 | 20.15.4.2 |
| 20.18 | 20.18.2.1 |

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
| **修補期限** | **2026-02-16（已過期 17 天）** |

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

### P1 -- 緊急（本週新增 CISA KEV 活躍利用）

#### VMware Aria Operations -- CVE-2026-22719（本週新增 KEV）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-22719（CWE-77 命令注入） |
| **影響產品** | VMware Aria Operations（前 vRealize Operations / vROps）8.x、VMware Cloud Foundation 4.x/5.x/9.x、VMware Telco Cloud Platform 4.x/5.x、VMware Telco Cloud Infrastructure 2.x/3.x、VMware vSphere Foundation 9.x |
| **利用狀態** | **活躍利用** -- 2026-03-03 新加入 CISA KEV |
| **嚴重程度** | **Critical** |
| **修補截止日** | 2026-03-24 |

> **針對本週威脅**：此漏洞為未經身份驗證的遠端命令注入，攻擊門檻極低。GovCERT.HK A26-02-31 特別標註此 CVE 正在被活躍利用。Qdrant 跨 Layer 查詢確認 vulnerability_tracking 與 exploit_intelligence 兩個 Layer 均有記錄，且與先前 VMware 產品漏洞（A26-02-36）屬同一產品線。

**修補方式（來自 Broadcom 官方安全公告 #36947）**：
1. **立即套用修補**：依廠商指示套用 Broadcom Security Advisory #36947 提供的緩解措施或更新至修補版本
2. **網路隔離**：若無法立即修補，限制對 VMware Aria Operations 管理介面的網路存取，僅允許受信任的管理網段連線
3. **停用產品**：若無法套用緩解措施，依 CISA 建議停止使用受影響的產品
4. **監控異常指令執行**：監控系統日誌，識別非預期的命令執行活動，特別注意與支援輔助遷移相關的異常行為

**參考連結**：
- [CISA KEV - CVE-2026-22719](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
- [Broadcom Security Advisory #36947](https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/SecurityAdvisories/0/36947)
- [Broadcom Knowledge Article #430349](https://knowledge.broadcom.com/external/article/430349)
- [GovCERT.HK Alert A26-02-31](https://www.govcert.gov.hk/en/alerts_detail.php?id=1774)

#### Qualcomm 多晶片組 -- CVE-2026-21385（本週新增 KEV）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-21385（CWE-190 整數溢位導致記憶體損毀） |
| **影響產品** | Qualcomm 多款晶片組（依 2026-03-01 Android Security Bulletin） |
| **利用狀態** | **活躍利用** -- 2026-03-03 新加入 CISA KEV |
| **嚴重程度** | **High** |
| **修補截止日** | 2026-03-24 |

> **針對本週威脅**：此漏洞影響大量 Android 裝置。HKCERT 與 GovCERT.HK 已同步發布安全警告（A26-03-02），Samsung 亦發布 2026 年 3 月安全更新公告涵蓋此修補。

**修補方式（來自 Android Security Bulletin 2026-03-01）**：
1. **套用 Android 安全更新**：立即套用 2026 年 3 月 Android 安全公告中的修補程式（安全修補等級 2026-03-05 或更新）
2. **企業裝置管理**：透過 MDM（行動裝置管理）解決方案強制推送安全更新至所有受管理的 Android 裝置
3. **廠商韌體更新**：聯絡裝置製造商取得針對受影響 Qualcomm 晶片組的韌體或驅動程式更新
4. **停用受影響產品**：若無法取得修補，依 BOD 22-01 指引評估是否停止使用受影響裝置，或限制其存取企業資源
5. **監控裝置完整性**：強化對行動裝置的安全監控，偵測異常行為或特權提升嘗試

**參考連結**：
- [Android Security Bulletin - March 2026](https://source.android.com/docs/security/bulletin/2026/2026-03-01)
- [Samsung Security Updates](https://security.samsungmobile.com/securityUpdate.smsb)
- [GovCERT.HK Alert A26-03-02](https://www.govcert.gov.hk/en/alerts_detail.php?id=1781)
- [NVD - CVE-2026-21385](https://nvd.nist.gov/vuln/detail/CVE-2026-21385)

#### Apple 多平台 -- CVE-2026-20700（修補期限 2026-03-05）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-20700（CWE-119 記憶體緩衝區操作不當） |
| **影響產品** | iOS、macOS、tvOS、watchOS、visionOS |
| **利用狀態** | **活躍利用** |
| **修補期限** | **2026-03-05（剩餘 1 天）** |

**修補方式（來自 Apple 官方安全更新）**：立即安裝最新 Apple 安全更新。

**參考連結**：
- [Apple Security Update 126346](https://support.apple.com/en-us/126346)
- [Apple Security Update 126348](https://support.apple.com/en-us/126348)
- [Apple Security Update 126351](https://support.apple.com/en-us/126351)
- [Apple Security Update 126352](https://support.apple.com/en-us/126352)
- [Apple Security Update 126353](https://support.apple.com/en-us/126353)

#### Dell RP4VMs -- CVE-2026-22769（修補期限已過期）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-22769（CWE-798 硬編碼憑證） |
| **影響產品** | Dell RecoverPoint for Virtual Machines (RP4VMs) |
| **利用狀態** | **持續活躍利用** -- Google TAG 確認威脅組織 UNC6201 正活躍利用 |
| **修補期限** | **2026-02-21（已過期 12 天）** |

**修補方式（來自 Dell 官方公告 DSA-2026-079）**：
1. 執行 [Dell 補救腳本](https://www.dell.com/support/kbdoc/en-us/000426742/recoverpoint-for-vms-apply-the-remediation-script-for-dsa)
2. 檢查系統日誌是否有異常的 root 層級活動
3. 限制 RP4VMs 對外部網路暴露

**參考連結**：
- [Dell DSA-2026-079](https://www.dell.com/support/kbdoc/en-us/000426773/dsa-2026-079)
- [Google Threat Intelligence - UNC6201](https://cloud.google.com/blog/topics/threat-intelligence/unc6201-exploiting-dell-recoverpoint-zero-day)

#### Soliton FileZen -- CVE-2026-25108

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-25108（OS Command Injection） |
| **影響產品** | Soliton Systems K.K FileZen |
| **利用狀態** | **活躍利用** -- 2026-02-24 加入 CISA KEV |

**修補方式（來自 JVN 公告）**：依照廠商指示套用安全更新。若無法立即修補，限制 FileZen 管理介面的網路存取。

**參考連結**：
- [JVN - JVN#84622767](https://jvn.jp/en/jp/JVN84622767/)
- [NVD - CVE-2026-25108](https://nvd.nist.gov/vuln/detail/CVE-2026-25108)

#### Google Chromium CSS -- CVE-2026-2441

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-2441（CWE-416 Use-After-Free） |
| **影響產品** | Google Chromium（影響 Chrome、Edge、Opera 等瀏覽器） |
| **利用狀態** | **活躍利用** -- 列入 CISA KEV |
| **嚴重程度** | High |

> **針對本週威脅**：HKCERT 於 2026-02-20 發布 Google Chrome 多重漏洞安全公告，Firefox/Thunderbird 同時段亦有 RCE 修補。建議企業統一排程瀏覽器更新。

**修補方式（來自 Google/HKCERT 公告）**：
1. 立即更新所有基於 Chromium 的瀏覽器至最新版本（Chrome 145.0.7632.109/110+、Linux 144.0.7559.109+）
2. 啟用瀏覽器自動更新功能
3. 在企業環境中，透過群組原則強制瀏覽器版本更新
4. 配置網路閘道過濾已知的惡意網站

**參考連結**：
- [HKCERT - Google Chrome Multiple Vulnerabilities](https://www.hkcert.org/security-bulletin/google-chrome-multiple-vulnerabilities_20260220)
- [NVD - CVE-2026-2441](https://nvd.nist.gov/vuln/detail/CVE-2026-2441)

### P2 -- 優先（PoC 已公開、利用門檻極低）

#### Juniper Junos OS Evolved PTX Series -- CVE-2026-21902（PoC 公開）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-21902（CWE-732 錯誤權限分配） |
| **影響產品** | Juniper Networks Junos OS Evolved，PTX Series 路由器 |
| **CVSS** | **9.3（CVSS 4.0）** |
| **受影響版本** | 25.4R1-EVO 至 25.4R1-S1-EVO、25.4R2-EVO 之前 |
| **PoC 狀態** | **watchTowr Labs 已發布 Python PoC** -- 大幅降低攻擊門檻 |
| **活躍利用** | 尚未確認，但因 PoC 公開應視為高度近期風險 |

> **針對本週威脅**：此漏洞允許未經認證的網路攻擊者以 root 身份執行任意程式碼。On-Box 異常偵測框架預設啟用且透過外部埠暴露，無需特定配置即可觸發。watchTowr Labs 的 PoC 已於 2026-02-28 至 2026-03-03 持續更新，企業應視為即將被活躍利用的漏洞優先處理。

**修補方式（來自 Juniper 官方安全公告）**：
1. **立即升級**至 Junos OS Evolved **25.4R1-S1-EVO** 或 **25.4R2-EVO** 以上版本
2. **防火牆規則**：在補丁部署前，封鎖外部對 On-Box 異常偵測框架服務埠的存取
3. **存取控制**：確認內部路由實例存取控制，限制僅允許合法內部進程連線
4. 監控 Juniper 官方安全公告（JSA 系列）以取得最新緩解措施

**參考連結**：
- [PoC Repository (watchTowr Labs)](https://github.com/watchtowrlabs/watchTowr-vs-JunosEvolved-CVE-2026-21902)
- [NVD - CVE-2026-21902](https://nvd.nist.gov/vuln/detail/CVE-2026-21902)

#### WordPress Microsoft 365 SSO -- CVE-2026-2628（PoC 公開）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-2628（CWE-288 使用替代路徑繞過身份驗證） |
| **影響產品** | All-in-One Microsoft 365 & Entra ID / Azure AD SSO Login plugin for WordPress，版本 ≤ 2.2.5 |
| **CVSS** | **9.8（CVSS 3.1，Critical）** |
| **PoC 狀態** | **PoC 已公開** -- 2026-03-03 |
| **活躍利用** | 尚未確認 |

> **針對本週威脅**：此漏洞允許未經認證的遠端攻擊者以任意使用者（包括管理員）身份登入 WordPress。CVSS 為最高級別的 9.8，無需認證、無需使用者互動、低攻擊複雜度。所有使用 Microsoft 365 / Entra ID / Azure AD SSO 的 WordPress 網站均面臨完全接管風險。

**修補方式**：
1. **立即更新**外掛至 **2.2.6** 或以上版本（請確認官方 WordPress Plugin 目錄的修補版本）
2. 若無法立即更新，應**暫時停用該外掛**
3. 審查 WordPress 管理員帳號，確認是否有異常登入或帳號被建立
4. 啟用 WordPress 登入日誌記錄，監控異常身份驗證行為
5. 對使用 Microsoft 365 / Entra ID / Azure AD SSO 的 WordPress 網站進行緊急安全稽核
6. 實施多因素驗證（MFA）作為額外防護層

**參考連結**：
- [PoC Repository](https://github.com/b1gchoi/CVE-2026-2628-PoC)

### P3 -- 重要（Critical/High 新揭露，尚無活躍利用確認）

#### Trend Micro Apex One / Vision One Endpoint

| 項目 | 內容 |
|------|------|
| **來源** | GovCERT.HK A26-03-01 |
| **日期** | 2026-03-02 |
| **影響產品** | Trend Micro Apex One、Trend Vision One Endpoint |
| **嚴重程度** | High |
| **風險** | 遠端程式碼執行、權限提升 |

**修補方式**：套用 Trend Micro 官方安全修補。

**參考連結**：
- [GovCERT.HK Alert A26-03-01](https://www.govcert.gov.hk/en/alerts_detail.php?id=1780)

#### SonicWall 多產品漏洞

| 項目 | 內容 |
|------|------|
| **來源** | GovCERT.HK A26-02-32 |
| **日期** | 2026-02-25 |
| **影響產品** | SonicWall 系統 |
| **嚴重程度** | High |
| **風險** | 遠端程式碼執行、認證繞過、資訊洩露 |

> **針對本週威脅**：Qdrant 查詢「firewall network device security update」返回歷史 Zyxel、FortiOS、WatchGuard 等防火牆漏洞記錄，SonicWall 漏洞屬同類型網路設備風險，應與 Cisco、Juniper 設備一併排程修補。

**修補方式**：套用 SonicWall 官方安全修補。

**參考連結**：
- [GovCERT.HK Alert A26-02-32](https://www.govcert.gov.hk/en/alerts_detail.php?id=1775)

#### VMware 產品額外漏洞

| 項目 | 內容 |
|------|------|
| **來源** | GovCERT.HK A26-02-36 |
| **日期** | 2026-02-27 |
| **影響產品** | VMware 產品 |
| **嚴重程度** | High |
| **風險** | 遠端程式碼執行、權限提升、跨站腳本攻擊 |

**修補方式**：套用 VMware/Broadcom 官方安全修補。

**參考連結**：
- [GovCERT.HK Alert A26-02-36](https://www.govcert.gov.hk/en/alerts_detail.php?id=1779)

#### Django 安全釋出 -- CVE-2026-25673、CVE-2026-25674

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-25673（CVSS 7.5，Windows URLField DoS）、CVE-2026-25674（檔案系統權限不正確） |
| **影響產品** | Django 4.2.x（< 4.2.29）、5.2.x（< 5.2.12）、6.0.x（< 6.0.3） |
| **嚴重程度** | High |

**修補方式（來自 Django 官方安全公告）**：
1. Django 4.2.x → 升級至 **4.2.29**
2. Django 5.2.x → 升級至 **5.2.12**
3. Django 6.0.x → 升級至 **6.0.3**

**參考連結**：
- [Django Security Releases](https://www.djangoproject.com/weblog/2026/mar/03/security-releases/)

#### Linux 核心安全更新（SUSE、Red Hat、Ubuntu）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-02 至 2026-03-03 |
| **影響產品** | SUSE Linux Enterprise Server 11-15 SP7、openSUSE Leap 15.4-15.6；Red Hat Enterprise Linux 8/9/10；Ubuntu 22.04 LTS / 24.04 LTS |
| **嚴重程度** | High |
| **風險** | 遠端程式碼執行、拒絕服務、權限提升、資訊洩露、資料操縱 |

**修補方式**：
- **SUSE**：套用 SUSE-SU-2026:0674-1 至 SUSE-SU-2026:0748-1 系列更新
- **Red Hat**：套用 RHSA-2026:3388、RHSA-2026:3464、RHSA-2026:3488、RHSA-2026:3520、RHSA-2026:3579
- **Ubuntu**：套用 USN-8059-6

**參考連結**：
- [SUSE Security Updates](https://www.suse.com/support/update/announcement/2026/)
- [Red Hat RHSA-2026:3388](https://access.redhat.com/errata/RHSA-2026:3388)
- [Ubuntu USN-8059-6](https://ubuntu.com/security/notices/USN-8059-6)

#### 瀏覽器安全更新（Chrome、Firefox、Edge）

| 項目 | 內容 |
|------|------|
| **影響產品** | Google Chrome < 145.0.7632.109/110、Firefox < 147.0.4、Firefox ESR < 115.32.1 / 140.7.1、Thunderbird < 140.7.2 / 147.0.2、Microsoft Edge |
| **嚴重程度** | High |
| **風險** | 遠端程式碼執行、資訊洩露、拒絕服務 |

**修補方式**：
- Chrome：更新至 145.0.7632.109/110+（Windows/Mac）或 144.0.7559.109+（Linux）
- Firefox：更新至 147.0.4+
- Firefox ESR：更新至 115.32.1+ 或 140.7.1+
- Thunderbird：更新至 140.7.2+ 或 147.0.2+
- Edge：套用最新安全更新

**參考連結**：
- [HKCERT - Google Chrome](https://www.hkcert.org/security-bulletin/google-chrome-multiple-vulnerabilities_20260220)
- [HKCERT - Mozilla Products](https://www.hkcert.org/security-bulletin/mozilla-products-multiple-vulnerabilities_20260220)
- [HKCERT - Microsoft Edge](https://www.hkcert.org/security-bulletin/microsoft-edge-multiple-vulnerabilities_20260220)

### P3-TW -- 台灣本地產品漏洞（TWCERT/CC）

以下漏洞由 TWCERT/CC 揭露，主要影響台灣本地部署的產品系統：

| TVN 編號 | 廠商/產品 | 漏洞數 | 嚴重程度 | 風險 |
|----------|-----------|--------|----------|------|
| TVN-202602017 | 廣達電腦 QOCA aim AI醫療雲平台 | 6 | High | SQL Injection、越權存取、資訊洩露 |
| TVN-202602013 | 金諄資訊 警政統計資料庫系統 | 4 | High | SQL Injection、任意檔案讀取 |
| TVN-202602011 | 普羅通信 PrismX MX100 AP Controller | 3 | High | 命令注入、認證繞過 |
| TVN-202602010 | 哈瑪星科技 MeetingHub 無紙化會議 | 3 | High | SQL Injection、檔案上傳漏洞 |
| TVN-202602008 | 葳橋資訊 單一簽入暨電子目錄服務系統 | 3 | High | 認證繞過、SQL Injection、XSS |

**修補方式**：請參閱各 TWCERT/CC 官方公告，聯繫廠商取得安全更新。

**參考連結**：
- [TWCERT/CC 漏洞公告](https://www.twcert.org.tw/tw/lp-132-1.html)

### P4 -- 持續追蹤（活躍利用，上週已通報）

以下漏洞於上週（W09）已通報，本週仍持續活躍利用中，尚未修補的組織應立即處理：

| CVE | 產品 | 利用狀態 | 修補期限 |
|-----|------|----------|----------|
| CVE-2026-24423 | SmarterTools SmarterMail | 活躍利用 + **勒索軟體關聯** | 已過期 |
| CVE-2025-49113 | RoundCube Webmail（反序列化 RCE） | 活躍利用 | 已過期 |
| CVE-2025-68461 | RoundCube Webmail（XSS） | 活躍利用 | 已過期 |
| CVE-2025-40536 | SolarWinds Web Help Desk（認證繞過） | 活躍利用 | 已過期 |
| CVE-2025-40551 | SolarWinds Web Help Desk（反序列化 RCE） | 活躍利用 | 已過期 |
| CVE-2025-52691 | SmarterMail（檔案上傳） | 活躍利用 | -- |
| CVE-2026-20045 | Cisco Unified Communications Manager | 活躍利用 | 已過期 |
| CVE-2025-64328 | Sangoma FreePBX | 活躍利用 | -- |

---

## 2. 安全控制建議

### 2.1 網路層面

#### 針對本週威脅

| 建議 | 對應威脅 | 優先級 |
|------|----------|--------|
| 封鎖對 Cisco SD-WAN VPN 512 介面的非授權存取 | CVE-2026-20127 / CVE-2022-20775 (CISA ED 26-03) | P0 |
| 限制 VMware Aria Operations 管理介面的網路存取至受信任管理網段 | CVE-2026-22719 活躍利用 | P1 |
| 封鎖外部對 Juniper PTX On-Box 異常偵測框架服務埠的存取 | CVE-2026-21902 PoC 公開 | P2 |
| 限制 BeyondTrust RS/PRA 面向網際網路的存取 | CVE-2026-1731 勒索軟體關聯 | P0+ |
| 限制 Dell RP4VMs 對外部網路暴露 | CVE-2026-22769 活躍利用 | P1 |
| 封鎖已知伊朗 APT 組織（MuddyWater、APT33、APT34）的 C2 IP 與網域 | Operation Epic Fury | 持續 |
| 監控 SD-WAN 網路是否有未授權的 rogue peers 加入 | CISA ED 26-03 Hunt Guidance | P0 |

#### 通用建議

- 實施網路分段（Network Segmentation），隔離管理平面與資料平面
- 部署入侵偵測/防禦系統（IDS/IPS），更新至最新威脅規則
- 啟用完整封包日誌記錄，確保威脅獵捕可用的日誌保留期間
- 定期檢視防火牆規則，移除不必要的開放埠
- 將日誌轉發至集中式 SIEM 系統進行即時監控

### 2.2 端點層面

#### 針對本週威脅

| 建議 | 對應威脅 | 優先級 |
|------|----------|--------|
| 透過 MDM 強制推送 Android 2026-03-05 安全更新 | CVE-2026-21385 活躍利用 | P1 |
| 強制更新所有 Chromium 瀏覽器至最新版本 | CVE-2026-2441 活躍利用 | P1 |
| 更新 Firefox/Thunderbird 至最新版本 | RCE 漏洞 | P3 |
| 確認所有 Apple 裝置已安裝最新安全更新 | CVE-2026-20700 修補期限到期 | P1 |
| 套用 Linux 核心安全更新（SUSE/RHEL/Ubuntu） | 多重漏洞 | P3 |
| 掃描端點是否有 Dust Specter APT 惡意軟體 IoC（SPLITDROP、TWINTASK、TWINTALK、GHOSTFORM） | 伊朗 APT 攻擊 | 持續 |
| 掃描端點是否有 SHADOWSNIFF、SALATSTEALER 竊取程式 | UAC-0252 攻擊 | 持續 |

#### 通用建議

- 維持 EDR/XDR 解決方案處於最新狀態
- 確保所有端點啟用安全開機（Secure Boot）
- 實施應用程式白名單政策
- 啟用瀏覽器沙箱隔離機制

### 2.3 身分認證層面

#### 針對本週威脅

| 建議 | 對應威脅 | 優先級 |
|------|----------|--------|
| 審查所有 WordPress 管理員帳號是否有異常登入 | CVE-2026-2628（WordPress SSO 認證繞過） | P2 |
| 停用受影響的 WordPress Microsoft 365 SSO 外掛或更新至 2.2.6+ | CVE-2026-2628 | P2 |
| 強化 SD-WAN 對等身份驗證機制，替換自簽憑證 | CISA ED 26-03 | P0 |
| 對 Dell RP4VMs 執行硬編碼憑證補救腳本 | CVE-2026-22769 | P1 |
| 限制 SmarterMail ConnectToHub API 的網路存取 | CVE-2026-24423 勒索軟體關聯 | P0+ |
| 加強 SIM 卡安全設定（PIN 碼、帳號警報） | 杜拜 SIM-Swap 攻擊 | 持續 |

#### 通用建議

- 對所有管理介面和遠端存取啟用多因素驗證（MFA）
- 定期審查特權帳號使用情況
- 實施條件式存取政策（Conditional Access）
- 教育員工識別社會工程攻擊（尤其偽冒政府機構的釣魚電話）

### 2.4 資料保護層面

#### 針對本週威脅

| 建議 | 對應威脅 | 優先級 |
|------|----------|--------|
| 確認醫療雲平台（QOCA aim）未暴露於公開網路 | TVN-202602017（6 漏洞） | P3-TW |
| 確認警政系統資料庫不受 SQL Injection 影響 | TVN-202602013（4 漏洞） | P3-TW |
| 檢查加密貨幣錢包安全，移除 QuickLens 擴充套件 | Chrome 供應鏈攻擊 | P3 |
| 確認 FortiGate SSL VPN 設備未被植入符號連結後門 | FortiGate 持久化攻擊 | 持續 |

#### 通用建議

- 實施資料加密（靜態加密 + 傳輸加密）
- 定期備份關鍵資料並測試還原程序
- 實施資料外洩防護（DLP）策略
- 監控異常資料存取模式

---

## 3. 緩解策略

### 3.1 VMware Aria Operations 暫時緩解（CVE-2026-22719）

| 項目 | 內容 |
|------|------|
| **適用情境** | 無法立即套用 Broadcom 修補的環境 |
| **緩解措施** | 1. 透過防火牆限制 Aria Operations 管理介面的網路存取，僅允許受信任的管理網段連線<br>2. 監控系統日誌中的異常命令執行<br>3. 若無法實施緩解，依 CISA 建議停止使用受影響產品 |
| **有效期限** | **建議 2026-03-24 前完成修補**（CISA KEV 修補截止日） |
| **重新評估** | 若 2026-03-11 前仍未修補，應評估停用產品 |

### 3.2 Juniper PTX 暫時緩解（CVE-2026-21902）

| 項目 | 內容 |
|------|------|
| **適用情境** | 無法立即升級至 25.4R1-S1-EVO 或 25.4R2-EVO 的環境 |
| **緩解措施** | 1. 透過 ACL/防火牆規則封鎖外部對 On-Box 異常偵測框架服務埠的存取<br>2. 確認內部路由實例存取控制僅允許合法內部進程連線<br>3. 監控網路流量是否有異常存取模式 |
| **有效期限** | **建議 2026-03-14 前完成修補**（PoC 公開後 2 週內，利用風險快速攀升） |
| **重新評估** | 每日監控是否有活躍利用報告 |

### 3.3 WordPress SSO 外掛暫時緩解（CVE-2026-2628）

| 項目 | 內容 |
|------|------|
| **適用情境** | 無法立即更新外掛的 WordPress 網站 |
| **緩解措施** | 1. **暫時停用** All-in-One Microsoft 365 & Entra ID / Azure AD SSO Login 外掛<br>2. 啟用替代身份驗證方式<br>3. 審查管理員帳號是否有異常<br>4. 啟用 WAF 規則過濾可疑認證請求 |
| **有效期限** | **立即更新至 2.2.6+**，不建議長期使用停用外掛作為緩解 |
| **重新評估** | 更新外掛後重新啟用 |

### 3.4 伊朗 APT 威脅緩解

| 項目 | 內容 |
|------|------|
| **適用情境** | 所有位於加拿大及盟邦國家的組織（特別是航空航天、能源、國防、電信產業） |
| **緩解措施** | 1. 強化 MFA 部署，優先保護電子郵件和 VPN<br>2. 加強對 LinkedIn 等社群媒體的社會工程警覺（伊朗 APT 慣用手法）<br>3. 掃描公開暴露設備是否存在已知漏洞<br>4. 確認所有面向網際網路的服務已停用預設密碼<br>5. 部署 DDoS 防護，特別是面向公眾的網站<br>6. 封鎖已知伊朗 APT 組織的 IoC（IP、域名、惡意檔案雜湊值） |
| **有效期限** | **持續至地緣政治緊張局勢緩和**（預計至少 4-8 週） |
| **重新評估** | 每週根據 CISA/CCCS/NCSC 公告更新 IoC 清單 |

### 3.5 Chrome 擴充套件供應鏈攻擊緩解

| 項目 | 內容 |
|------|------|
| **適用情境** | 曾安裝 QuickLens 擴充套件的使用者 |
| **緩解措施** | 1. 立即移除 QuickLens 擴充套件<br>2. 檢查加密貨幣錢包是否有異常交易<br>3. 更改在受影響瀏覽器中使用的所有密碼<br>4. 企業環境中限制擴充套件安裝權限，僅允許白名單內的擴充套件 |
| **有效期限** | 立即執行 |
| **重新評估** | 不適用（一次性處理） |

---

## 4. 注意事項

### 4.1 建議適用範圍與限制

- **環境差異**：本報告提供的修補建議基於廠商官方公告，適用於標準部署環境。高度客製化或老舊系統可能需要額外評估。
- **修補優先級**：依據 CISA KEV、CVSS 分數、活躍利用狀態和勒索軟體關聯性排序，各組織應依據自身資產暴露情況調整優先級。
- **台灣本地產品**：TWCERT/CC 揭露的漏洞（TVN 系列）部分未提供 CVE 編號和 CVSS 評分，信心水準標記為「中」，建議聯繫廠商取得詳細技術資訊。
- **地緣政治威脅**：伊朗 APT 威脅評估基於加拿大 Cyber Centre 公開情報，實際攻擊範圍可能更廣或更窄。

### 4.2 可能的副作用

- **Cisco SD-WAN 修補**：升級 SD-WAN Controller 可能需要計畫性停機；隔離 VPN 512 介面可能暫時影響遠端管理存取。
- **VMware Aria Operations 網路隔離**：限制管理介面存取可能影響監控和維運團隊的日常操作。
- **Linux 核心更新**：核心更新需要重啟系統，生產環境應安排維護窗口。
- **WordPress 外掛停用**：停用 SSO 外掛將影響使用 Microsoft 365 帳號登入的所有使用者，需預先設定替代登入方式。
- **瀏覽器強制更新**：企業中強制更新瀏覽器版本可能影響特定 Web 應用程式的相容性，建議先在測試環境驗證。

### 4.3 建議的測試步驟

1. **修補前**：在非生產環境（staging/dev）完成修補驗證
2. **修補中**：逐批次套用，先從非關鍵系統開始，監控服務可用性
3. **修補後**：執行功能驗證測試，確認服務正常運行；檢查系統日誌是否有異常
4. **緩解措施**：驗證防火牆規則和 ACL 變更是否正確生效，確認合法管理存取未受阻

---

## 5. 本週威脅情報摘要

### 5.1 地緣政治網路威脅

| 事件 | 日期 | 重點 |
|------|------|------|
| 伊朗 Operation Epic Fury 網路戰 | 2026-02-28 起 | 美國/以色列軍事打擊引發伊朗全面網路反擊；加拿大 Cyber Centre 發布專項公告；目標：關鍵基礎設施、國防、能源、電信 |
| 伊朗近全面網路封鎖 | 2026-02-28 | 網路連通性降至 4%，為近年最大規模政府主導斷網 |
| Dust Specter APT 攻擊伊拉克政府 | 2026-03-03 | 疑似伊朗關聯 APT，使用 SPLITDROP/TWINTASK/TWINTALK/GHOSTFORM 四種新型惡意軟體 |
| SloppyLemming 間諜活動 | 2026-03-03 | 印度關聯威脅行為者，一年期間諜活動，目標巴基斯坦/孟加拉/斯里蘭卡政府及關鍵基礎設施 |
| CERT-UA UAC-0252 攻擊 | 2026-03-02 | 釣魚郵件冒充烏克蘭政府機關，部署 SHADOWSNIFF/SALATSTEALER 竊取程式 |
| 杜拜 SIM-Swap 攻擊 | 2026-03-03 | 伊朗飛彈攻擊後數小時，詐騙者冒充「杜拜危機管理」部門對市民發動 SIM 卡交換攻擊 |

### 5.2 供應鏈攻擊

| 事件 | 日期 | 重點 |
|------|------|------|
| QuickLens Chrome 擴充套件遭竄改 | 2026-03-01 | 約 7,000 使用者受 ClickFix 攻擊與加密貨幣竊取影響；v5.8 於 2026-02-17 釋出惡意程式碼 |
| FortiGate SSL VPN 符號連結持久化 | 持續中 | 攻擊者利用三個已知漏洞植入符號連結後門，修補後仍持續存在；全球數千台設備受影響 |

### 5.3 Qdrant 跨 Layer 關聯分析

本週執行的 Qdrant 語意查詢結果摘要：

| 查詢 | 結果筆數 | 關鍵發現 |
|------|----------|----------|
| 「actively exploited critical vulnerability patch urgent」 | 10 | WSUS CVE-2025-59287 活躍利用（TWCERT）、Ivanti EPMM 零日漏洞（CVE-2026-1281/1340）、PUSR USR-W610 多重漏洞（CISA ICS）、n8n 自動化平台 Critical 漏洞 |
| 「firewall network device security update firmware vulnerability」 | 10 | Zyxel 防火牆漏洞（歷史）、D-Link DWR-M960 漏洞（CVE-2026-2881）、WatchGuard Fireware 漏洞（CVE-2026-3344）、FortiOS 歷史漏洞 |
| 「authentication bypass credential theft identity access management」 | 10 | Ivanti EPM 認證繞過、Microsoft Entra ID 認證繞過（CVE-2026-3224）、OneUptime WebAuthn 2FA 繞過、Drupal 認證繞過（CVE-2026-0948）、SmarterMail 認證繞過 |

**跨 Layer 關聯洞察**：
- **認證繞過漏洞激增趨勢**：本週 Qdrant 查詢顯示身分認證相關漏洞密集出現，跨 vulnerability_tracking 與 exploit_intelligence 兩個 Layer，包括 WordPress SSO（CVE-2026-2628）、Cisco SD-WAN（CVE-2026-20127）、Microsoft Entra ID（CVE-2026-3224），建議強化 MFA 部署作為防線
- **網路設備漏洞持續高發**：防火牆/VPN 設備漏洞（Cisco、Juniper、SonicWall、WatchGuard、FortiGate）跨多個 Layer 反覆出現，反映攻擊者對網路邊界設備的持續關注
- **活躍利用漏洞與勒索軟體關聯**：BeyondTrust CVE-2026-1731 和 SmarterMail CVE-2026-24423 均確認勒索軟體關聯，建議將勒索軟體防護納入修補優先級考量

---

## 免責聲明

本防禦建議基於國際 CERT/安全機構公開資料彙整，請注意：

1. **非保證**：實施建議不保證完全防禦所有威脅
2. **環境差異**：建議為通用性質，可能不適用於所有環境
3. **請先測試**：在正式環境部署前，請先於測試環境驗證
4. **非法律建議**：本報告不構成法律或合規建議
5. **資料限制**：基於公開資料，不涵蓋非公開威脅情報
6. **翻譯風險**：部分非英文來源經 AI 翻譯，修補建議請以官方原文為準
7. **時效性**：本報告資料截至 2026-03-04，後續可能有新的漏洞或修補發布

重大安全決策請諮詢專業資安顧問，並結合組織實際環境評估。

---

> 產出時間：2026-03-04 UTC
> 資料來源：CISA KEV、NVD、GovCERT.HK、HKCERT、TWCERT/CC、NCSC-FI、Canadian Centre for Cyber Security、CERT-UA、CERT.at、PoC-in-GitHub、Qdrant 向量資料庫語意查詢
