---
layout: seo-report
last_modified_at: 2026-03-06T22:00:00+08:00
title: 2026 第 10 週防禦建議
description: "2026-02-27 至 2026-03-06 資安防禦建議週報：Cisco SD-WAN 零日漏洞全球攻擊（CVE-2026-20127，CISA ED 26-03）、VMware Aria Operations 命令注入活躍利用（CVE-2026-22719，Critical）、Qualcomm 晶片組記憶體損毀（CVE-2026-21385）、Windows MSHTML 被 APT28 利用（CVE-2026-21513，CVSS 8.8）、CISA 新增 7 個 KEV、ICS/SCADA 多重漏洞（Delta Electronics、Hitachi Energy、Mitsubishi Electric）、EV 充電基礎設施 OCPP 漏洞、伊朗 Operation Epic Fury 引爆中東網路衝突升級、Tycoon 2FA 查封與 AiTM 釣魚防禦、Chrome Gemini CVE-2026-0628、約 1,956 筆威脅指標。"
parent: 防禦建議
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-defense-advisory.png
author: 資安情報分析團隊
date: 2026-03-06
period_start: 2026-02-27
period_end: 2026-03-06
tags:
  - weekly-report
  - defense-advisory
  - 2026-W10
  - Cisco-SD-WAN
  - VMware
  - APT28
  - Iran
  - ICS
  - SCADA
  - EV-charging
  - phishing
  - ransomware
  - zero-day
---

# 防禦建議 -- 2026 第 10 週

> 涵蓋期間：2026-02-27 至 2026-03-06
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV、CISA KEV、CISA ICS Advisories、PoC-in-GitHub、abuse.ch ThreatFox
> 產出時間：2026-03-06
> 上週報告：[2026 第 9 週防禦建議](../2026-W09-defense-advisory/)

---

## 執行摘要

本週（W10）威脅態勢維持極高嚴峻水準，地緣政治驅動的網路衝突急劇升溫與多起零日漏洞活躍利用同時發生。CISA 本週新增 7 個 KEV，Cisco SD-WAN 零日漏洞持續遭全球性攻擊，伊朗 Operation Epic Fury 引爆的中東網路衝突覆蓋 16 國 110 個組織，ICS/SCADA 工控系統漏洞密集揭露，EV 充電基礎設施 OCPP 後端漏洞持續擴大。以下為本週關鍵防禦要點：

1. **Cisco Catalyst SD-WAN 零日漏洞（CVE-2026-20127，CVSS 10.0）** -- CISA ED 26-03 緊急指令持續生效，SK-CERT 2026-03-04 發布法定緊急警告，多國聯合威脅獵捕指引，全球性持續活躍利用中
2. **VMware Aria Operations 命令注入（CVE-2026-22719，Critical）** -- CISA KEV 2026-03-03 新增，未經身份驗證遠端命令注入，修補截止日 2026-03-24
3. **Qualcomm 多晶片組記憶體損毀（CVE-2026-21385，High）** -- CISA KEV 2026-03-03 新增，影響 Android 裝置，修補截止日 2026-03-24
4. **CISA 再新增 5 個 KEV（2026-03-05）** -- 總計本週 7 個 KEV，基於活躍利用證據
5. **Windows MSHTML 安全繞過（CVE-2026-21513，CVSS 8.8）** -- APT28（俄羅斯國家支持）正積極利用，2026 年 2 月 Patch Tuesday 已修補
6. **ICS/SCADA 關鍵基礎設施漏洞激增** -- Delta Electronics CNCSoft-G2（CVE-2026-3094，RCE）、Hitachi Energy RTU500（4 CVE）、Mitsubishi Electric MELSEC、Johnson Controls Frick Quantum HD（RCE）等
7. **EV 充電基礎設施 OCPP 後端漏洞** -- 9 個平台受影響，持續擴大
8. **伊朗 Operation Epic Fury 網路報復** -- 149 次 DDoS 攻擊、IP 攝影機鎖定、Dust Specter APT 新型惡意軟體
9. **Tycoon 2FA 釣魚平台被查封** -- 330 個網域關閉，但 AiTM 技術仍在擴散
10. **Chrome Gemini 漏洞（CVE-2026-0628）** -- AI 瀏覽器整合帶來新型攻擊面
11. **CrushFTP 暴力破解掃描活動顯著增加** -- 三個嚴重 CVE 被探測
12. **約 1,956 筆威脅指標（IoC）** -- 來自 abuse.ch ThreatFox

**本週關鍵行動**：
- **立即（CISA 緊急指令）**：持續遵循 CISA ED 26-03 處置所有 Cisco SD-WAN 系統
- **立即（新增 KEV 活躍利用）**：VMware Aria Operations CVE-2026-22719 修補（截止 2026-03-24）、Android 2026-03-05 安全更新
- **立即（APT28 活躍利用）**：套用 2026 年 2 月 Windows Patch Tuesday（CVE-2026-21513）
- **立即（勒索軟體關聯、已過期）**：BeyondTrust CVE-2026-1731 修補
- **緊急（ICS/SCADA）**：Delta Electronics CNCSoft-G2、Hitachi Energy RTU500、Mitsubishi Electric 工控系統修補
- **優先（PoC 已公開）**：Juniper Junos OS Evolved CVE-2026-21902、WordPress SSO CVE-2026-2628
- **評估（EV 充電）**：審查 EV 充電基礎設施 OCPP 後端安全配置
- **持續**：伊朗 APT 威脅獵捕、瀏覽器更新（Chrome/Gemini CVE-2026-0628）、IoC 封鎖、CrushFTP 防護

---

## 1. 優先修補清單

依照優先級排序：**CISA 緊急指令 > 活躍利用且有勒索軟體關聯（修補期限已過） > 活躍利用（新增 KEV） > APT 國家級利用 > ICS/SCADA 關鍵基礎設施 > PoC 已公開且 Critical > CVSS Critical 新揭露 > 活躍利用持續追蹤**

### P0 -- 最高優先（CISA 緊急指令 ED 26-03）

#### Cisco SD-WAN -- CVE-2026-20127 + CVE-2022-20775

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-20127（CVSS 10.0，CWE-287 不當身份驗證）、CVE-2022-20775（CWE-25 路徑遍歷 + CWE-282 不當權限管理） |
| **影響產品** | Cisco Catalyst SD-WAN Controller（前 vSmart）、Cisco Catalyst SD-WAN Manager（前 vManage） |
| **利用狀態** | **持續活躍利用** -- SK-CERT 2026-03-04 發布緊急警告確認全球性活躍利用，多國聯合公告持續有效 |
| **勒索軟體** | Unknown |
| **攻擊鏈** | 認證繞過 -> NETCONF 存取 -> SD-WAN 配置操縱 -> 路徑遍歷提權至 root -> 惡意 rogue peers 持久化 |

> **CISA 緊急指令 ED 26-03 -- 持續生效中**
>
> 國際合作夥伴（NSA、ASD ACSC、Canadian Cyber Centre、NCSC-NZ、NCSC-UK、CERT-FR、CERT.RO、NCSC-NL）已觀察到惡意行為者在全球範圍內持續攻擊和入侵 Cisco SD-WAN 系統。
>
> **本週新增**：SK-CERT（斯洛伐克國家網路安全中心）於 2026-03-04 根據斯洛伐克網路安全法 69/2018 Z.z. 第 27 條第 1 款 a 項發布正式警告，確認 Cisco Catalyst SD-WAN 存在被積極利用的關鍵零日漏洞。NCSC-NL 同步發布 NCSC-2026-0071 公告，確認 Cisco Catalyst SD-WAN Manager 存在多個嚴重漏洞。

**Qdrant 跨 Layer 關聯分析**：語意查詢「Cisco SD-WAN patch remediation」返回 10 筆結果（最高相似度 0.6425），發現 NCSC-NL NCSC-2026-0071（critical_high）、GovCERT.HK 歷史 SD-WAN vManage 漏洞警告、以及 2026-03-05 NCSC-2026-0077 Cisco Secure Firewall 漏洞。Cisco 網路設備生態系統正面臨系統性安全危機，多個元件同時存在嚴重漏洞。

**修補版本（來自 Cisco 官方安全公告）**：

| SD-WAN Release | 修補版本 |
|----------------|----------|
| < 20.9 | 遷移至受支援版本 |
| 20.9 | 20.9.8.2 |
| 20.12.5 | 20.12.5.3 |
| 20.12.6 | 20.12.6.1 |
| 20.15 | 20.15.4.2 |
| 20.18 | 20.18.2.1 |

**必要行動（來自 CISA Hunt & Hardening Guidance + 多國聯合指引）**：
1. 盤點所有 Cisco SD-WAN 系統
2. 收集虛擬快照和日誌進行威脅獵捕
3. 完整修補 Cisco SD-WAN 系統至上述版本
4. 隔離 VPN 512 介面，使用 IP 封鎖限制存取
5. 替換自簽憑證為可信 CA 簽發的憑證
6. 使用 pairwise keys 強化控制平面與資料平面安全
7. 縮短 session timeout 至最短可行時間
8. 將日誌轉發至遠端 syslog 伺服器進行集中監控
9. 檢查是否有未授權的 rogue peers 加入 SD-WAN 網路配置
10. 使用 ACSC 發布的威脅獵捕指南進行入侵偵測

**參考連結**：
- [CISA Emergency Directive 26-03](https://www.cisa.gov/news-events/directives/ed-26-03-mitigate-vulnerabilities-cisco-sd-wan-systems)
- [CISA Hunt & Hardening Guidance](https://www.cisa.gov/news-events/directives/supplemental-direction-ed-26-03-hunt-and-hardening-guidance-cisco-sd-wan-systems)
- [Cisco Security Advisory cisco-sa-sdwan-rpa-EHchtZk](https://sec.cloudapps.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-sdwan-rpa-EHchtZk)
- [SK-CERT Warning](https://www.sk-cert.sk/sk/varovanie-aktivne-zneuzivana-kriticka-zero-day-zranitelnost-v-cisco-catalyst-sd-wan/)
- [Joint guidance on malicious cyber threats to SD-WAN networks](https://cyber.gc.ca/en/news-events/joint-guidance-malicious-cyber-threats-sd-wan-networks)

### P0+ -- 極緊急（勒索軟體關聯、修補期限已過期）

#### BeyondTrust RS/PRA -- CVE-2026-1731

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-1731（CWE-78 OS Command Injection） |
| **影響產品** | BeyondTrust Remote Support (RS)、Privileged Remote Access (PRA) |
| **利用狀態** | **持續活躍利用** -- 未經驗證的遠端攻擊者可執行任意 OS 指令 |
| **勒索軟體** | **Known** -- CISA 已確認被勒索軟體攻擊活動利用 |
| **修補期限** | **2026-02-16（已過期 19 天）** |

> **針對本週威脅**：結合本週觀察到的勒索軟體生態系統結構性轉變（付款金額下降 8% 但攻擊數量上升 50%），遠端存取工具仍是勒索軟體入口點的首要目標。

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

> **針對本週威脅**：此漏洞為未經身份驗證的遠端命令注入，攻擊門檻極低。Broadcom 已發布安全公告 #36947 及 Knowledge Article #430349。

**修補方式（來自 Broadcom 官方安全公告 #36947）**：
1. **立即套用修補**：依廠商指示套用 Broadcom Security Advisory #36947 提供的緩解措施或更新至修補版本
2. **網路隔離**：若無法立即修補，限制對 VMware Aria Operations 管理介面的網路存取，僅允許受信任的管理網段連線
3. **停用產品**：若無法套用緩解措施，依 CISA 建議停止使用受影響的產品
4. **雲端服務**：遵循 BOD 22-01 對雲端服務的相關指引
5. **監控異常指令執行**：監控系統日誌，識別非預期的命令執行活動

**參考連結**：
- [CISA KEV - CVE-2026-22719](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
- [Broadcom Security Advisory #36947](https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/SecurityAdvisories/0/36947)
- [Broadcom Knowledge Article #430349](https://knowledge.broadcom.com/external/article/430349)

#### Qualcomm 多晶片組 -- CVE-2026-21385（本週新增 KEV）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-21385（CWE-190 整數溢位導致記憶體損毀） |
| **影響產品** | Qualcomm 多款晶片組（依 2026-03-01 Android Security Bulletin） |
| **利用狀態** | **活躍利用** -- 2026-03-03 新加入 CISA KEV |
| **嚴重程度** | **High** |
| **修補截止日** | 2026-03-24 |

**修補方式（來自 Android Security Bulletin 2026-03-01）**：
1. **套用 Android 安全更新**：立即套用 2026 年 3 月 Android 安全公告中的修補程式（安全修補等級 2026-03-05 或更新）
2. **企業裝置管理**：透過 MDM 解決方案強制推送安全更新至所有受管理的 Android 裝置
3. **廠商韌體更新**：聯繫裝置製造商取得針對受影響 Qualcomm 晶片組的韌體或驅動程式更新
4. **停用受影響產品**：若無法取得修補，依 BOD 22-01 指引評估是否停止使用受影響裝置

**參考連結**：
- [Android Security Bulletin - March 2026](https://source.android.com/docs/security/bulletin/2026/2026-03-01)
- [Samsung Security Updates](https://security.samsungmobile.com/securityUpdate.smsb)
- [NVD - CVE-2026-21385](https://nvd.nist.gov/vuln/detail/CVE-2026-21385)

#### CISA 新增 5 個 KEV（2026-03-05）

| 項目 | 內容 |
|------|------|
| **來源** | CISA Alerts 2026-03-05 |
| **數量** | 5 個新增 KEV |
| **利用狀態** | 所有 5 個均已確認活躍利用 |

> 聯邦機構需依 BOD 22-01 在指定期限內修復。所有組織應檢視 CISA KEV 目錄確認是否受影響。

**參考連結**：
- [CISA Adds Five Known Exploited Vulnerabilities to Catalog](https://www.cisa.gov/news-events/alerts/2026/03/05/cisa-adds-five-known-exploited-vulnerabilities-catalog)

#### Windows MSHTML -- CVE-2026-21513（APT28 活躍利用）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-21513（CWE-184 安全功能繞過） |
| **影響產品** | 所有 Windows 版本（MSHTML 框架） |
| **CVSS** | **8.8（High）** |
| **利用狀態** | **活躍利用** -- Akamai 確認 APT28（Fancy Bear / Sofacy，俄羅斯國家支持）正積極利用 |
| **修補時間** | 2026 年 2 月 Patch Tuesday 已修補 |

> **針對本週威脅**：Akamai 研究員使用 PatchDiff-AI 分析此漏洞並發布完整技術報告，包含 IOC。APT28 透過 MSHTML 攻擊通常以文件誘餌（Office 文件、HTML 檔案）為載體。此漏洞影響所有依賴 MSHTML 進行文件渲染的系統，包括 Internet Explorer 遺留組件、Office 文件和 HTML Help。

**修補方式（來自 Microsoft 2026 年 2 月 Patch Tuesday）**：
1. **套用 2 月 Patch Tuesday 更新**：立即安裝 Microsoft 2026 年 2 月安全更新
2. **檢查 IOC**：參閱 Akamai 部落格文章中提供的攻擊指標進行威脅獵捕
3. **加強文件過濾**：對電子郵件附件實施進階過濾，特別針對 Office 文件和 HTML 檔案
4. **監控 MSHTML 活動**：監控 MSHTML 相關的異常進程活動

**參考連結**：
- [Akamai - CVE-2026-21513 MSHTML Exploit Analysis](https://www.akamai.com/blog/security-research/2026/feb/inside-the-fix-cve-2026-21513-mshtml-exploit-analysis)
- [Microsoft Security Update Guide](https://msrc.microsoft.com/update-guide/)
- [NVD - CVE-2026-21513](https://nvd.nist.gov/vuln/detail/CVE-2026-21513)

#### Microsoft 2026 年 2 月 Patch Tuesday -- 6 項活躍利用 CVE

| 項目 | 內容 |
|------|------|
| **來源** | CERT-FR CERTFR-2026-AVI-0232、CISA KEV |
| **影響產品** | Microsoft 多產品 |
| **活躍利用 CVE 數** | **6 項**（包含 CVE-2026-21513 MSHTML） |
| **其他 KEV CVE** | CVE-2026-21514、CVE-2026-21519、CVE-2026-21525、CVE-2026-21533 |

**修補方式**：立即套用 Microsoft 2026 年 2 月累積安全更新。

**參考連結**：
- [CERT-FR CERTFR-2026-AVI-0232](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0232/)
- [Microsoft Security Update Guide](https://msrc.microsoft.com/update-guide/)

#### Dell RP4VMs -- CVE-2026-22769（修補期限已過期）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-22769（CWE-798 硬編碼憑證） |
| **影響產品** | Dell RecoverPoint for Virtual Machines (RP4VMs) |
| **利用狀態** | **持續活躍利用** -- Google TAG 確認威脅組織 UNC6201 正活躍利用 |
| **修補期限** | **2026-02-21（已過期 14 天）** |

**修補方式（來自 Dell 官方公告 DSA-2026-079）**：
1. 執行 [Dell 補救腳本](https://www.dell.com/support/kbdoc/en-us/000426742/recoverpoint-for-vms-apply-the-remediation-script-for-dsa)
2. 檢查系統日誌是否有異常的 root 層級活動
3. 限制 RP4VMs 對外部網路暴露

**參考連結**：
- [Dell DSA-2026-079](https://www.dell.com/support/kbdoc/en-us/000426773/dsa-2026-079)
- [Google Threat Intelligence - UNC6201](https://cloud.google.com/blog/topics/threat-intelligence/unc6201-exploiting-dell-recoverpoint-zero-day)

#### Chrome/Gemini -- CVE-2026-0628（AI 瀏覽器新型攻擊面）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-0628 |
| **影響產品** | Google Chrome（涉及 Gemini AI 整合組件） |
| **嚴重程度** | **High** |
| **來源** | Palo Alto Unit 42、NCSC-FI 2026-03-03 |

> **針對本週威脅**：此漏洞標誌著一個新興威脅類別。惡意瀏覽器擴充功能可劫持 Chrome Gemini 面板並存取本機檔案系統。隨著瀏覽器整合 AI 助手功能，每個 AI 功能節點都可能成為新的攻擊面。

**修補方式**：
1. 更新 Google Chrome 至最新版本
2. 審查已安裝的瀏覽器擴充功能，移除不信任的擴充
3. 在企業環境中限制擴充功能安裝權限

**參考連結**：
- [Unit 42 - Taming Agentic Browsers: CVE-2026-0628](https://unit42.paloaltonetworks.com/gemini-live-in-chrome-hijacking/)

#### Soliton FileZen -- CVE-2026-25108

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-25108（OS Command Injection） |
| **影響產品** | Soliton Systems K.K FileZen |
| **利用狀態** | **活躍利用** -- 2026-02-24 加入 CISA KEV |

**修補方式（來自 JVN 公告）**：依照廠商指示套用安全更新。若無法立即修補，限制 FileZen 管理介面的網路存取。

**參考連結**：
- [JVN - JVN#84622767](https://jvn.jp/en/jp/JVN84622767/)

#### Google Chromium CSS -- CVE-2026-2441

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-2441（CWE-416 Use-After-Free） |
| **影響產品** | Google Chromium（影響 Chrome、Edge、Opera 等瀏覽器） |
| **利用狀態** | **活躍利用** -- 列入 CISA KEV |
| **嚴重程度** | High |
| **修補期限** | 2026-03-10 |

**修補方式**：
1. 立即更新所有基於 Chromium 的瀏覽器至最新版本
2. 啟用瀏覽器自動更新功能
3. 在企業環境中，透過群組原則強制瀏覽器版本更新

### P1-ICS -- 緊急（ICS/SCADA 關鍵基礎設施）

> **重要**：以下 ICS/SCADA 漏洞影響關鍵基礎設施，應由 OT 安全團隊優先評估。所有修補建議均來自 CISA ICS Advisories 或廠商官方公告。

**Qdrant 跨 Layer 關聯分析**：語意查詢「ICS SCADA vulnerability mitigation」返回 10 筆結果（最高相似度 0.6612），關聯到 Schneider Electric CODESYS Runtime（ICSA-26-020-02）、InSAT MasterSCADA CVE-2026-22553 OS Command Injection（ICSA-26-055-01）、Siemens Industrial Edge、Weintek HMI、CISA ICS AV26-183 等。ICS/SCADA 漏洞在 vulnerability_tracking 和 security_news_facts 兩個 Layer 密集出現，反映工業控制系統面臨持續且多元的威脅。

#### Delta Electronics CNCSoft-G2 -- CVE-2026-3094（本週新增）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-3094（越界寫入） |
| **CVSS** | **7.8（High）** |
| **影響產品** | Delta Electronics CNCSoft-G2 DOPSoft 元件，版本 < V2.1.0.39 |
| **來源** | CISA ICS Advisory ICSA-26-064-01（2026-03-05） |
| **產業影響** | 全球關鍵製造基礎設施 |

> **針對本週威脅**：攻擊者可透過精心構造的 DPAX 檔案觸發越界寫入，實現遠端程式碼執行。

**修補方式**：
1. 更新至 CNCSoft-G2 V2.1.0.39 或更新版本
2. 不要開啟來路不明的 DPAX 檔案
3. 限制對工程工作站的網路存取

**參考連結**：
- [CISA ICS Advisory ICSA-26-064-01](https://www.cisa.gov/news-events/ics-advisories/icsa-26-064-01)

#### Hitachi Energy RTU500 -- 4 CVE（本週新增）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2024-8176、CVE-2025-59375、CVE-2026-1772、CVE-2026-1773 |
| **CVSS** | 最高 **7.5（High）** |
| **影響產品** | Hitachi Energy RTU500 遠端終端裝置 |
| **來源** | CISA ICS Advisory ICSA-26-062-03 |
| **產業影響** | 全球電力輸配系統 |

**修補方式**：
1. 套用 Hitachi Energy 官方安全更新
2. 限制對 RTU500 裝置的網路存取
3. 將 OT 網路與 IT 網路實施物理或邏輯隔離
4. 監控裝置通訊是否有異常行為

**參考連結**：
- [CISA ICS Advisory ICSA-26-062-03](https://www.cisa.gov/news-events/ics-advisories/icsa-26-062-03)

#### Hitachi Energy Relion REb500

| 項目 | 內容 |
|------|------|
| **影響產品** | Hitachi Energy Relion REb500 保護繼電器 |
| **來源** | CISA ICS Advisory 2026-03-03 |
| **產業影響** | 電力輸配系統、變電站自動化 |
| **嚴重程度** | High |

**修補方式**：套用 Hitachi Energy 官方安全更新，限制對 Relion REb500 裝置的網路存取。

#### Mitsubishi Electric MELSEC iQ-F Series EtherNet/IP

| 項目 | 內容 |
|------|------|
| **影響產品** | Mitsubishi Electric MELSEC iQ-F Series（EtherNet/IP 模組） |
| **來源** | CISA ICS Advisory 2026-03-03 |
| **產業影響** | 製造業自動化、工業控制 |
| **嚴重程度** | High |

**修補方式**：套用 Mitsubishi Electric 官方安全更新，限制 EtherNet/IP 模組的網路存取。

#### InSAT MasterSCADA BUK-TS -- CVE-2026-22553

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-22553（OS Command Injection） |
| **影響產品** | InSAT MasterSCADA BUK-TS |
| **來源** | CISA ICS Advisory ICSA-26-055-01 |
| **產業影響** | SCADA 監控系統 |
| **嚴重程度** | Critical |

**修補方式**：套用 InSAT 官方安全更新。若無法修補，實施嚴格的網路存取控制，隔離 SCADA 系統。

#### Schneider Electric EcoStruxure Building Operation

| 項目 | 內容 |
|------|------|
| **影響產品** | Schneider Electric EcoStruxure Building Operation |
| **來源** | CISA ICS Advisory 2026-02-24 |
| **產業影響** | 建築管理系統（BMS）、智慧建築 |
| **嚴重程度** | High |

**修補方式**：套用 Schneider Electric 官方安全更新。

**參考連結**：
- [Schneider Electric Security Notification](https://www.se.com/ww/en/work/support/cybersecurity/security-notifications.jsp)

#### Johnson Controls Frick Quantum HD（RCE）

| 項目 | 內容 |
|------|------|
| **影響產品** | Johnson Controls Frick Controls Quantum HD |
| **來源** | CISA ICS Advisory 2026-02-26 |
| **風險** | 遠端程式碼執行（RCE） |
| **嚴重程度** | Critical |

**修補方式**：套用 Johnson Controls 官方安全更新，限制對 Frick Quantum HD 控制器的網路存取。

#### 其他 ICS/SCADA 漏洞

| 產品 | 來源日期 | 嚴重程度 | 風險 |
|------|----------|----------|------|
| Labkotec LID-3300IP | 2026-03-03 | High | 液位感測器漏洞 |
| Portwell Engineering Toolkits | 2026-03-03 | High | 工程工具套件漏洞 |
| Valmet DNA Engineering Web Tools | 2026-02-19 | High | 紙漿/造紙工業 DCS 漏洞 |
| Jinan USR IoT PUSR USR-W610 | 2026-02-19 | High | IoT 串口伺服器漏洞 |

**通用 ICS 修補建議**：
1. 參閱各廠商 CISA ICS Advisory 取得修補指引
2. 實施 ICS 網路分段，將 OT 網路與 IT 網路隔離
3. 避免將工控系統直接暴露於網際網路
4. 使用 VPN 進行遠端存取，並啟用 MFA
5. 監控異常的 OT 網路通訊

### P1-EV -- 緊急（EV 充電基礎設施）

> **持續擴大**：本週再新增 3 個 EV 充電平台漏洞揭露（ePower、Everon、Mobiliti-e），延續上週的大規模揭露趨勢。

| 平台 | 來源日期 | 風險 |
|------|----------|------|
| CloudCharge (cloudcharge.se) | 2026-02-26 | OCPP 後端漏洞 |
| EV Energy (evenergy) | 2026-02-26 | OCPP 後端漏洞 |
| EV2Go (ev2go.io) | 2026-02-26 | OCPP 後端漏洞 |
| Mobility46 (mobility46.se) | 2026-02-26 | OCPP 後端漏洞 |
| Switch EV (swtchenergy.com) | 2026-02-26 | OCPP 後端漏洞 |
| ePower (epower.ie) | 2026-03-03 | OCPP 後端漏洞 |
| Everon OCPP Backends | 2026-03-03 | OCPP 後端漏洞 |
| Mobiliti-e (mobi.hu) | 2026-03-03 | OCPP 後端漏洞 |
| Chargemap | -- | OCPP 後端漏洞 |

**修補建議**：
1. 聯繫 EV 充電平台營運商確認是否已套用安全更新
2. 審查 OCPP 後端配置安全性
3. 限制 OCPP 管理介面的網路存取
4. 監控充電站與後端之間的通訊是否有異常
5. 實施 TLS 加密保護 OCPP 通訊

**參考連結**：
- [CISA ICS Advisories](https://www.cisa.gov/news-events/ics-advisories)

### P2 -- 優先（PoC 已公開、利用門檻極低）

#### Juniper Junos OS Evolved PTX Series -- CVE-2026-21902（PoC 公開）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-21902（CWE-732 錯誤權限分配） |
| **影響產品** | Juniper Networks Junos OS Evolved，PTX Series 路由器 |
| **CVSS** | **9.3（CVSS 4.0）** |
| **受影響版本** | 25.4R1-EVO 至 25.4R1-S1-EVO、25.4R2-EVO 之前 |
| **PoC 狀態** | **watchTowr Labs 已發布 Python PoC** -- 大幅降低攻擊門檻 |

**修補方式（來自 Juniper 官方安全公告）**：
1. **立即升級**至 Junos OS Evolved **25.4R1-S1-EVO** 或 **25.4R2-EVO** 以上版本
2. **防火牆規則**：封鎖外部對 On-Box 異常偵測框架服務埠的存取
3. **存取控制**：確認內部路由實例存取控制

**參考連結**：
- [PoC Repository (watchTowr Labs)](https://github.com/watchtowrlabs/watchTowr-vs-JunosEvolved-CVE-2026-21902)

#### WordPress Microsoft 365 SSO -- CVE-2026-2628（PoC 公開）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-2628（CWE-288 使用替代路徑繞過身份驗證） |
| **影響產品** | All-in-One Microsoft 365 & Entra ID / Azure AD SSO Login plugin for WordPress，版本 <= 2.2.5 |
| **CVSS** | **9.8（CVSS 3.1，Critical）** |
| **PoC 狀態** | **PoC 已公開** |

**修補方式**：
1. **立即更新**外掛至 **2.2.6** 或以上版本
2. 若無法立即更新，應**暫時停用該外掛**
3. 審查 WordPress 管理員帳號是否有異常登入
4. 實施多因素驗證（MFA）作為額外防護層

**參考連結**：
- [PoC Repository](https://github.com/b1gchoi/CVE-2026-2628-PoC)

#### 其他 PoC 公開漏洞

| CVE | 產品 | CVSS | PoC 說明 |
|-----|------|------|----------|
| CVE-2026-26416 | -- | -- | PoC 公開 |
| CVE-2026-26417 | -- | -- | PoC 公開 |
| CVE-2026-26418 | -- | -- | PoC 公開 |
| CVE-2025-25198 | -- | -- | PoC 公開 |
| CVE-2025-62360 | -- | -- | PoC 公開 |
| CVE-2023-3643 | -- | -- | PoC 公開（歷史漏洞） |
| CVE-2023-48223 | -- | -- | PoC 公開（歷史漏洞） |
| CVE-2024-9765 | -- | -- | PoC 公開（歷史漏洞） |
| CVE-2025-31700 | -- | -- | PoC 公開 |
| CVE-2025-66680 | -- | -- | PoC 公開 |

**建議**：檢查組織是否使用受影響產品，若有則參閱 NVD 和 Exploit-DB 取得修補指引。

### P3 -- 重要（Critical/High 新揭露，尚無活躍利用確認）

#### Docker Desktop 漏洞

| 項目 | 內容 |
|------|------|
| **來源** | CERT-FR CERTFR-2026-AVI-0230 |
| **日期** | 2026-03-03 |
| **影響產品** | Docker Desktop |
| **嚴重程度** | High |

**修補方式**：更新 Docker Desktop 至最新版本。

**參考連結**：
- [CERT-FR CERTFR-2026-AVI-0230](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0230/)

#### Google Android 2026 年 3 月安全公告

| 項目 | 內容 |
|------|------|
| **來源** | CERT-FR CERTFR-2026-AVI-0231、CERT.RO |
| **日期** | 2026-03-03 |
| **影響產品** | Google Android |
| **嚴重程度** | Critical/High |

**修補方式**：套用 2026-03-05 或更新的 Android 安全修補等級。

**參考連結**：
- [CERT-FR CERTFR-2026-AVI-0231](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0231/)
- [Android Security Bulletin - March 2026](https://source.android.com/docs/security/bulletin/2026/2026-03-01)

#### CrushFTP 暴力破解掃描活動

| 項目 | 內容 |
|------|------|
| **來源** | SANS ISC StormCast 2026-03-03 |
| **性質** | 偵察/掃描活動顯著增加 |
| **關聯 CVE** | CVE-2024-4040（RCE）、CVE-2025-31161（認證繞過）、CVE-2025-54309（零日） |
| **風險** | 暴力破解可能導致未授權存取，結合已知 CVE 可實現完整入侵 |

**建議**：
1. 確認 CrushFTP 已套用所有可用修補（特別是 CVE-2024-4040、CVE-2025-31161、CVE-2025-54309）
2. 確認 CrushFTP 實例已啟用帳號鎖定策略
3. 監控 CrushFTP 登入日誌是否有異常暴力破解嘗試
4. 限制 CrushFTP 管理介面的網路存取
5. 考慮在防火牆封鎖已知掃描來源 IP

#### Wireshark 4.6.4

| 項目 | 內容 |
|------|------|
| **影響產品** | Wireshark < 4.6.4 |
| **嚴重程度** | Medium |

**修補方式**：更新至 Wireshark 4.6.4。

#### FortiCloud SSO 繞過 -- CVE-2025-59718/59719

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-59718、CVE-2025-59719 |
| **影響產品** | FortiCloud SSO |
| **來源** | 2026-01-22 揭露，2026-01-27 確認威脅行為者利用繞過收集 LDAP 連線資訊 |

**修補方式**：套用 Fortinet 官方安全更新。

### P4 -- 持續追蹤（活躍利用，上週已通報）

以下漏洞於上週（W09）或更早已通報，本週仍持續活躍利用中，尚未修補的組織應立即處理：

| CVE | 產品 | 利用狀態 | 修補期限 |
|-----|------|----------|----------|
| CVE-2026-24858 | -- | 活躍利用（CISA KEV 2026） | -- |
| CVE-2026-24423 | SmarterTools SmarterMail | 活躍利用 + **勒索軟體關聯** | 已過期 |
| CVE-2026-23760 | -- | 活躍利用（CISA KEV 2026） | -- |
| CVE-2026-24061 | -- | 活躍利用（CISA KEV 2026） | -- |
| CVE-2025-49113 | RoundCube Webmail（反序列化 RCE） | 活躍利用 | 已過期 |
| CVE-2025-68461 | RoundCube Webmail（XSS） | 活躍利用 | 已過期 |
| CVE-2026-20045 | Cisco Unified Communications Manager | 活躍利用 | 已過期 |

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
| 封鎖已知伊朗 APT 組織（MuddyWater、APT33、APT34、Dust Specter）的 C2 IP 與網域 | 伊朗 Operation Epic Fury 網路報復 | 持續 |
| 監控 SD-WAN 網路是否有未授權的 rogue peers 加入 | CISA ED 26-03 Hunt Guidance | P0 |
| 實施 OT/IT 網路分段，隔離 ICS/SCADA 系統 | 多項 ICS 漏洞（Delta、Hitachi、Mitsubishi） | P1-ICS |
| 限制 OCPP 管理介面的網路存取 | EV 充電基礎設施漏洞 | P1-EV |
| 部署 DDoS 防護，特別是面向公眾的網站 | 149 次駭客主義 DDoS 攻擊、Keymous+/DieNet/NoName057(16) | 持續 |
| 監控 CrushFTP 存取日誌，封鎖異常掃描來源 IP | CrushFTP 暴力破解掃描（3 個嚴重 CVE） | P3 |
| 匯入 ThreatFox 約 1,956 筆 IoC 至防火牆/IDS 封鎖清單 | 活躍 C2 基礎設施（含 103.39.16.0/24、103.41.7.0/24、156.234.21.0/24 集群） | 持續 |
| 監控 IP 攝影機暴露狀況，限制公開暴露 | 伊朗鎖定 IP 攝影機作為動能行動前哨站 | 持續 |

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
| 套用 Microsoft 2026 年 2 月 Patch Tuesday 更新 | CVE-2026-21513 APT28 活躍利用（6 項 CVE） | P1 |
| 透過 MDM 強制推送 Android 2026-03-05 安全更新 | CVE-2026-21385 活躍利用 | P1 |
| 強制更新所有 Chromium 瀏覽器至最新版本 | CVE-2026-2441 活躍利用、CVE-2026-0628 Gemini 漏洞 | P1 |
| 掃描端點是否有 Dust Specter APT 惡意軟體 IoC（SPLITDROP、TWINTASK、TWINTALK、GHOSTFORM） | 伊朗 APT 攻擊伊拉克政府 | 持續 |
| 掃描端點是否有 BadPaw/MeowMeow 惡意軟體 | 俄羅斯疑似 APT 針對烏克蘭 | 持續 |
| 掃描端點是否有 SloppyLemming BurrowShell 後門和鍵盤記錄器 | SloppyLemming 南亞間諜活動 | 持續 |
| 掃描端點是否有 SHADOWSNIFF、SALATSTEALER 竊取程式 | CERT-UA UAC-0252 攻擊 | 持續 |
| 偵測 EV 簽署惡意軟體（TrustConnect Software PTY LTD 憑證） | EV 憑證簽署惡意軟體偽裝工作場所 App | 持續 |
| 偵測修改版 Havoc C2 的 indirect syscalls 行為 | 偽技術支援投遞 Havoc C2 | 持續 |
| 移除 QuickLens Chrome 擴充功能 v5.8 | 供應鏈攻擊，約 7,000 用戶受影響 | P3 |
| 更新 Docker Desktop 至最新版本 | CERT-FR 公告 | P3 |

#### 通用建議

- 維持 EDR/XDR 解決方案處於最新狀態
- 確保所有端點啟用安全開機（Secure Boot）
- 實施應用程式白名單政策
- 啟用瀏覽器沙箱隔離機制
- 限制瀏覽器擴充功能安裝權限至白名單

### 2.3 身分認證層面

#### 針對本週威脅

| 建議 | 對應威脅 | 優先級 |
|------|----------|--------|
| 強化 SD-WAN 對等身份驗證機制，替換自簽憑證 | CISA ED 26-03 | P0 |
| 審查所有 WordPress 管理員帳號是否有異常登入 | CVE-2026-2628（WordPress SSO 認證繞過） | P2 |
| 停用受影響的 WordPress Microsoft 365 SSO 外掛或更新至 2.2.6+ | CVE-2026-2628 | P2 |
| 對 Dell RP4VMs 執行硬編碼憑證補救腳本 | CVE-2026-22769 | P1 |
| 部署抗釣魚 MFA（FIDO2/WebAuthn），因傳統 MFA 可被 AiTM 繞過 | Tycoon 2FA 查封，但 AiTM 技術持續擴散 | 持續 |
| 加強電子郵件過濾，攔截 MSHTML 文件誘餌 | CVE-2026-21513 APT28 利用 | P1 |
| 審查 FortiCloud SSO 配置，防止 LDAP 連線資訊洩露 | CVE-2025-59718/59719 | P3 |
| 加強 SIM 卡安全設定（PIN 碼、帳號警報） | 杜拜/芬蘭 SIM-Swap 攻擊 | 持續 |
| 限制 SmarterMail ConnectToHub API 的網路存取 | CVE-2026-24423 勒索軟體關聯 | P0+ |

**Qdrant 跨 Layer 關聯分析**：語意查詢「phishing defense two factor authentication bypass」返回 10 筆結果（最高相似度 0.5453），關聯到 OneUptime WebAuthn 2FA 繞過（GHSA-gjjc-pcwp-c74m，2026-03-02）、WordPress 2FA 外掛漏洞（CVE-2025-13587）、以及歷史 Facebook/WhatsApp 釣魚攻擊紀錄。特別值得注意的是 OneUptime WebAuthn 2FA 繞過案例 -- 伺服器接受客戶端提供的 challenge 而非伺服器儲存的值，允許 credential replay。這表明即使是現代 WebAuthn 實作也可能存在致命缺陷，建議驗證 WebAuthn 伺服器端實作的正確性。

#### 通用建議

- 對所有管理介面和遠端存取啟用多因素驗證（MFA），優先採用 FIDO2/WebAuthn
- 定期審查特權帳號使用情況
- 實施條件式存取政策（Conditional Access）
- 教育員工識別社會工程攻擊（特別注意偽裝為政府機構的釣魚、RedAlert 惡意 App、工作場所會議 App 誘餌）

### 2.4 資料保護層面

#### 針對本週威脅

| 建議 | 對應威脅 | 優先級 |
|------|----------|--------|
| 檢查加密貨幣錢包安全，移除 QuickLens 擴充套件 | Chrome 供應鏈攻擊（ClickFix + 加密貨幣竊取） | P3 |
| 確認 FortiGate SSL VPN 設備未被植入符號連結後門 | FortiGate 持久化攻擊 | 持續 |
| 確保 SCADA/DCS 系統歷史資料完整性 | ICS 漏洞（Delta、Hitachi、Mitsubishi） | P1-ICS |
| 監控 EV 充電交易資料完整性 | OCPP 後端漏洞 | P1-EV |
| 加強對惡意 PDF/Excel 附件的偵測和過濾 | SloppyLemming 間諜活動 | 持續 |
| 監控 Chrome Gemini 面板存取的本機檔案 | CVE-2026-0628 AI 瀏覽器攻擊面 | 持續 |
| 驗證勒索軟體備份策略（付款不再保證資料安全） | ShinyHunters 打破「榮譽守則」-- 收款後仍出售資料 | 持續 |

#### 通用建議

- 實施資料加密（靜態加密 + 傳輸加密）
- 定期備份關鍵資料並測試還原程序
- 實施資料外洩防護（DLP）策略
- 監控異常資料存取模式

---

## 3. 緩解策略

> 以下緩解策略針對尚無修補或無法立即修補的漏洞。每項策略均標註有效期限或重新評估時間。

### 3.1 Cisco SD-WAN 緊急緩解（CVE-2026-20127）

| 項目 | 內容 |
|------|------|
| **適用情境** | 無法立即完成 SD-WAN 系統修補的環境 |
| **緩解措施** | 1. 隔離 VPN 512 介面，使用 IP 封鎖限制存取<br>2. 替換 Web 管理介面的自簽憑證<br>3. 使用 pairwise keying 強化控制和資料平面安全<br>4. 設定最短可能的 session 逾時<br>5. 將日誌轉發至遠端 syslog 伺服器<br>6. 使用 ACSC 威脅獵捕指南檢查 rogue peers |
| **有效期限** | **CISA ED 26-03 持續生效 -- 必須盡快完成修補** |
| **重新評估** | 每日監控 Cisco PSIRT 和 CISA 公告更新 |

### 3.2 VMware Aria Operations 暫時緩解（CVE-2026-22719）

| 項目 | 內容 |
|------|------|
| **適用情境** | 無法立即套用 Broadcom 修補的環境 |
| **緩解措施** | 1. 透過防火牆限制 Aria Operations 管理介面的網路存取，僅允許受信任的管理網段連線<br>2. 監控系統日誌中的異常命令執行<br>3. 若無法實施緩解，依 CISA 建議停止使用受影響產品 |
| **有效期限** | **建議 2026-03-24 前完成修補**（CISA KEV 修補截止日） |
| **重新評估** | 若 2026-03-12 前仍未修補，應評估停用產品 |

### 3.3 Juniper PTX 暫時緩解（CVE-2026-21902）

| 項目 | 內容 |
|------|------|
| **適用情境** | 無法立即升級至 25.4R1-S1-EVO 或 25.4R2-EVO 的環境 |
| **緩解措施** | 1. 透過 ACL/防火牆規則封鎖外部對 On-Box 異常偵測框架服務埠的存取<br>2. 確認內部路由實例存取控制僅允許合法內部進程連線<br>3. 監控網路流量是否有異常存取模式 |
| **有效期限** | **建議 2026-03-14 前完成修補**（PoC 公開後 2 週內，利用風險快速攀升） |
| **重新評估** | 每日監控是否有活躍利用報告 |

### 3.4 WordPress SSO 外掛暫時緩解（CVE-2026-2628）

| 項目 | 內容 |
|------|------|
| **適用情境** | 無法立即更新外掛的 WordPress 網站 |
| **緩解措施** | 1. **暫時停用** All-in-One Microsoft 365 & Entra ID / Azure AD SSO Login 外掛<br>2. 啟用替代身份驗證方式<br>3. 審查管理員帳號是否有異常<br>4. 啟用 WAF 規則過濾可疑認證請求 |
| **有效期限** | **立即更新至 2.2.6+**，不建議長期使用停用外掛作為緩解 |
| **重新評估** | 更新外掛後重新啟用 |

### 3.5 伊朗 APT 與地緣政治網路威脅緩解

| 項目 | 內容 |
|------|------|
| **適用情境** | 所有位於受 Operation Epic Fury 影響區域的組織（特別是中東 16 國、美國、以色列及盟邦；航空航天、能源、國防、電信、政府機構） |
| **緩解措施** | 1. 強化 MFA 部署，優先保護電子郵件和 VPN<br>2. 部署 DDoS 防護（本週 149 次攻擊，47.8% 針對政府部門）<br>3. 保護暴露的 IP 攝影機（關閉非必要遠端存取、更新韌體、變更預設密碼）<br>4. 掃描公開暴露設備是否存在已知漏洞<br>5. 封鎖已知伊朗 APT 組織的 IoC（IP、域名、惡意檔案雜湊值）<br>6. 部署端點偵測規則識別 SPLITDROP、TWINTASK、TWINTALK、GHOSTFORM 惡意軟體<br>7. 教育員工警惕 RedAlert 惡意 App 及類似偽裝 |
| **有效期限** | **持續至地緣政治緊張局勢緩和**（預計至少 4-8 週） |
| **重新評估** | 每週根據 CISA/CCCS/NCSC 公告更新 IoC 清單 |

### 3.6 ICS/SCADA 系統緩解

| 項目 | 內容 |
|------|------|
| **適用情境** | 使用本週揭露受影響 ICS/SCADA 產品且無法立即修補的關鍵基礎設施營運者 |
| **緩解措施** | 1. 實施 OT 網路與 IT 網路的物理或邏輯隔離<br>2. 使用防火牆限制對 ICS/SCADA 裝置的網路存取，僅允許必要的通訊<br>3. 停用非必要的遠端存取功能<br>4. 對 OT 環境實施嚴格的 USB 裝置控制<br>5. 加強 OT 網路流量監控，偵測異常通訊模式<br>6. 建立 OT 資產清冊，確認所有裝置的韌體版本<br>7. 不要開啟來路不明的 DPAX 檔案（Delta Electronics 漏洞觸發方式） |
| **有效期限** | **持續至各廠商發布修補並完成部署** |
| **重新評估** | 每月檢查 CISA ICS Advisories 是否有新的修補或緩解指引 |

### 3.7 EV 充電基礎設施 OCPP 後端緩解

| 項目 | 內容 |
|------|------|
| **適用情境** | 使用受影響 OCPP 後端平台的 EV 充電營運者（9 個已知受影響平台） |
| **緩解措施** | 1. 聯繫平台供應商確認漏洞修補狀態<br>2. 限制 OCPP 管理介面的網路存取<br>3. 審查充電站與後端之間的認證機制<br>4. 監控充電交易紀錄是否有異常活動<br>5. 實施網路加密（TLS）保護 OCPP 通訊 |
| **有效期限** | **持續至各平台供應商確認完成修補** |
| **重新評估** | 2026-03-20 前向供應商確認修補進度 |

### 3.8 APT28 MSHTML 攻擊緩解（CVE-2026-21513）

| 項目 | 內容 |
|------|------|
| **適用情境** | 尚未套用 2026 年 2 月 Patch Tuesday 的 Windows 環境 |
| **緩解措施** | 1. 限制 MSHTML 組件的執行（透過 GPO 限制 IE 組件）<br>2. 加強電子郵件閘道過濾 Office 文件和 HTML 附件<br>3. 教育使用者不要開啟來路不明的文件附件<br>4. 部署 Akamai 發布的 IOC 進行端點偵測 |
| **有效期限** | **立即套用 2026 年 2 月 Patch Tuesday 更新** |
| **重新評估** | 修補套用後即解除 |

### 3.9 Tycoon 2FA 查封後 AiTM 釣魚防禦

| 項目 | 內容 |
|------|------|
| **適用情境** | 所有依賴傳統 MFA（OTP、推播通知）的組織 |
| **緩解措施** | 1. 評估並部署抗釣魚 MFA（FIDO2 安全金鑰 / WebAuthn）<br>2. 實施條件式存取政策，檢查登入裝置合規性<br>3. 監控異常的即時認證會話攔截行為<br>4. 教育員工識別中間人釣魚頁面<br>5. 驗證 WebAuthn 伺服器端實作（參照 OneUptime GHSA-gjjc-pcwp-c74m 案例） |
| **有效期限** | **持續 -- AiTM 技術仍在擴散，預計替代平台將迅速填補 Tycoon 2FA 空缺** |
| **重新評估** | 持續監控新的 PhaaS/AiTM 平台出現 |

### 3.10 Chrome 擴充套件供應鏈攻擊緩解

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
- **ICS/SCADA 特殊考量**：工控系統修補需考慮營運連續性，不可在未經測試和計畫的情況下直接在生產環境套用修補。OT 環境修補應遵循 IEC 62443 標準流程。
- **EV 充電基礎設施**：OCPP 後端漏洞的影響程度取決於各平台的具體實作，建議聯繫供應商取得詳細風險評估。
- **地緣政治威脅**：伊朗 Operation Epic Fury 網路報復的評估基於多國 CERT 公開情報（加拿大 Cyber Centre、NCSC-FI、Orange Cyberdefense、Check Point Research），實際攻擊範圍可能持續擴大。
- **APT 歸因**：Dust Specter 與伊朗的歸因為「中-高信心」，BadPaw/MeowMeow 與俄羅斯的歸因為「疑似」，SloppyLemming 與印度的歸因基於 Arctic Wolf 分析。歸因評估可能隨新情報更新。
- **Tycoon 2FA 查封效果**：330 個網域已關閉，但 AiTM 技術已廣泛傳播，預計替代平台將迅速出現。組織不應因查封而放鬆 MFA 防護。

### 4.2 可能的副作用

- **Cisco SD-WAN 修補**：升級 SD-WAN Controller 可能需要計畫性停機；隔離 VPN 512 介面可能暫時影響遠端管理存取。
- **VMware Aria Operations 網路隔離**：限制管理介面存取可能影響監控和維運團隊的日常操作。
- **WordPress 外掛停用**：停用 SSO 外掛將影響使用 Microsoft 365 帳號登入的所有使用者，需預先設定替代登入方式。
- **ICS/SCADA 修補**：工控系統修補可能影響生產流程，需在維護窗口內執行，並準備回滾計畫。Delta Electronics CNCSoft-G2 更新需在工程工作站排程。
- **EV 充電系統修補**：充電站韌體更新可能需要暫停充電服務，應提前通知使用者。
- **瀏覽器強制更新**：企業中強制更新瀏覽器版本可能影響特定 Web 應用程式的相容性。
- **DDoS 防護部署**：新增 DDoS 防護可能引入額外延遲，需監控對合法流量的影響。
- **IoC 封鎖**：大量匯入約 1,956 筆 IoC 至防火牆可能影響效能，建議分批匯入並監控誤報。

### 4.3 建議的測試步驟

1. **修補前**：在非生產環境（staging/dev）完成修補驗證；對 ICS/SCADA 系統使用廠商提供的測試程序
2. **修補中**：逐批次套用，先從非關鍵系統開始，監控服務可用性
3. **修補後**：執行功能驗證測試，確認服務正常運行；檢查系統日誌是否有異常
4. **緩解措施**：驗證防火牆規則和 ACL 變更是否正確生效，確認合法管理存取未受阻
5. **IoC 封鎖**：先在監控模式（detect-only）運行 24 小時，確認無誤報後再切換至封鎖模式

---

## 5. 本週威脅情報摘要

### 5.1 地緣政治網路威脅

| 事件 | 日期 | 重點 |
|------|------|------|
| Operation Epic Fury 引爆中東網路衝突 | 2026-02-28 起 | 美國/以色列聯合行動後，伊朗網路連線降至 4%，149 次 DDoS 攻擊命中 16 國 110 個組織 |
| 伊朗 IP 攝影機鎖定 | 2026-03-01 起 | 針對以色列等 6 國 IP 攝影機攻擊，用於飛彈行動戰損評估 |
| 加拿大 Cyber Centre 伊朗網路威脅公告 | 2026-03-02 | 目標：關鍵基礎設施、國防、能源、電信 |
| Dust Specter APT 攻擊伊拉克政府 | 2026-03-03 | 伊朗關聯 APT，使用 4 種新型惡意軟體 |
| SloppyLemming 間諜活動 | 2026-03-03 | 印度關聯，一年期南亞政府間諜活動 |
| CERT-UA UAC-0252 攻擊 | 2026-03-02 | 釣魚郵件冒充烏克蘭政府機關 |
| BadPaw/MeowMeow 針對烏克蘭 | 2026-03-05 | 俄羅斯疑似，兩個先前未記錄的惡意軟體 |
| 杜拜/芬蘭 SIM-Swap 攻擊 | 2026-03-03 | 利用地緣政治危機發動 SIM 交換攻擊 |

### 5.2 APT 活動

| 威脅行為者 | 關聯國家 | 活動 | IoC 關鍵字 |
|-----------|----------|------|-----------|
| APT28 (Fancy Bear) | 俄羅斯 | 利用 CVE-2026-21513 MSHTML 繞過 | MSHTML exploit, document lures |
| Dust Specter | 伊朗（中-高信心） | 攻擊伊拉克政府 | SPLITDROP, TWINTASK, TWINTALK, GHOSTFORM |
| SloppyLemming | 印度（疑似） | 南亞政府間諜活動 | BurrowShell, malicious PDFs, keylogger |
| UAC-0252 | -- | 烏克蘭政府目標釣魚 | SHADOWSNIFF, SALATSTEALER |
| BadPaw/MeowMeow | 俄羅斯（疑似） | 針對烏克蘭釣魚 | BadPaw loader, MeowMeow backdoor |

### 5.3 執法行動

| 事件 | 日期 | 防禦意涵 |
|------|------|----------|
| Tycoon 2FA 釣魚平台查封 | 2026-03-05 | 330 個網域關閉，但 AiTM 技術已擴散。組織應加速部署抗釣魚 MFA |
| LeakBase 駭客論壇拆除 | 2026-03-05 | 142,000+ 成員、數億組帳號憑證。組織應強制密碼重設並監控憑證外洩 |

### 5.4 勒索軟體趨勢

| 事件 | 重點 |
|------|------|
| 付款趨勢轉變 | 攻擊數量上升 50%，總付款下降 8% 至 $820M，但中位數暴增 368% |
| ShinyHunters 打破「榮譽守則」 | 收取贖金後仍出售被盜資料 -- 付款不再保證資料安全 |
| BeyondTrust CVE-2026-1731 勒索軟體關聯 | CISA 確認被用於勒索軟體攻擊活動 |
| SmarterMail CVE-2026-24423 勒索軟體關聯 | 持續活躍利用中 |

### 5.5 威脅指標（IoC）摘要

| 來源 | 日期 | 數量 | 類型 |
|------|------|------|------|
| abuse.ch ThreatFox | 2026-03-03 | **約 1,956 筆** | C2 IP、惡意 URL、惡意軟體樣本 |

**IoC 涵蓋範圍**：
- 活躍 C2（Command & Control）基礎設施 IP 位址和埠號
- 惡意 URL 和網域（含 ClearFake 惡意程式網域）
- 惡意軟體樣本雜湊值
- IP 位址集群：103.39.16.0/24（port 3093）、103.41.7.0/24（port 3093）、156.234.21.0/24（port 3093）

**建議行動**：
1. 將 IoC 匯入 SIEM/SOAR 平台進行即時比對
2. 更新防火牆和 IDS/IPS 封鎖規則
3. 在端點偵測方案中建立對應的偵測規則
4. 定期從 abuse.ch ThreatFox 更新 IoC 清單

### 5.6 Qdrant 跨 Layer 關聯分析

本週執行的 Qdrant 語意查詢結果摘要：

| # | 查詢 | 結果筆數 | 最高相似度 | 主要發現 |
|---|------|----------|-----------|----------|
| 1 | "Cisco SD-WAN patch remediation" | 10 | 0.6425 | NCSC-NL NCSC-2026-0071 critical_high、GovCERT.HK 歷史 SD-WAN 漏洞、NCSC-2026-0077 Cisco Secure Firewall |
| 2 | "ICS SCADA vulnerability mitigation" | 10 | 0.6612 | Schneider Electric CODESYS Runtime ICSA-26-020-02、InSAT MasterSCADA CVE-2026-22553、Siemens Industrial Edge、Weintek HMI |
| 3 | "phishing defense two factor authentication bypass" | 10 | 0.5453 | OneUptime WebAuthn 2FA 繞過（GHSA-gjjc-pcwp-c74m）、WordPress 2FA 外掛漏洞（CVE-2025-13587）、Facebook/WhatsApp 釣魚歷史 |
| 4 | "supply chain attack browser extension malware signed certificate" | 10 | 0.5108 | SalatStealer 惡意軟體樣本（MalwareBazaar）、多個惡意 URL（URLhaus） |

**跨 Layer 關聯洞察**：
- **認證繞過漏洞激增趨勢**：本週跨 vulnerability_tracking 與 exploit_intelligence 兩個 Layer 密集出現身分認證相關漏洞，包括 WordPress SSO（CVE-2026-2628）、Cisco SD-WAN（CVE-2026-20127）、FortiCloud SSO（CVE-2025-59718/59719）、OneUptime WebAuthn 2FA 繞過，反映攻擊者對認證機制的系統性攻擊。建議優先部署抗釣魚 MFA（FIDO2/WebAuthn）並驗證實作正確性。
- **網路設備漏洞持續高發**：Cisco SD-WAN/Secure Firewall、Juniper、SonicWall、FortiGate 漏洞跨多個 Layer 反覆出現，搭配多國聯合 SD-WAN 惡意威脅指引，反映攻擊者對網路邊界設備的持續高度關注。
- **ICS/SCADA 漏洞密集揭露**：本週同時出現 Delta Electronics、Hitachi Energy、Mitsubishi Electric、Schneider Electric、Johnson Controls、InSAT 等多家 ICS 廠商漏洞，加上 EV 充電基礎設施持續擴大，關鍵基礎設施面臨的攻擊面顯著擴大。
- **信任鏈持續被破壞**：EV 憑證簽署惡意軟體（TrustConnect Software PTY LTD）、QuickLens 供應鏈入侵、Chrome Gemini AI 面板劫持 -- 攻擊者越來越善於利用信任機制，傳統的簽章驗證和品牌信任不再可靠。

---

## 免責聲明

本防禦建議基於國際 CERT/安全機構公開資料彙整，請注意：

1. **非保證**：實施建議不保證完全防禦所有威脅
2. **環境差異**：建議為通用性質，可能不適用於所有環境
3. **請先測試**：在正式環境部署前，請先於測試環境驗證
4. **非法律建議**：本報告不構成法律或合規建議
5. **資料限制**：基於公開資料，不涵蓋非公開威脅情報
6. **翻譯風險**：部分非英文來源（SK-CERT 斯洛伐克語、CERT.RO 羅馬尼亞語等）經 AI 翻譯，修補建議請以官方原文為準
7. **時效性**：本報告資料截至 2026-03-06，後續可能有新的漏洞或修補發布
8. **ICS/SCADA 特殊風險**：工控系統修補具有高度環境依賴性，錯誤的修補操作可能影響生產安全，請務必遵循廠商指引和 IEC 62443 標準
9. **勒索軟體付款風險**：根據本週 Chainalysis 報告，付款後仍有資料被出售的風險（ShinyHunters 案例），付款決策應慎重評估
10. **地緣政治不確定性**：伊朗 Operation Epic Fury 相關網路威脅可能隨軍事局勢變化而迅速升級或降級，建議密切關注官方 CERT 公告

重大安全決策請諮詢專業資安顧問，並結合組織實際環境評估。

---

> 產出時間：2026-03-06 UTC
> 資料來源：CISA KEV、CISA ICS Advisories、NVD、SK-CERT、CERT-FR、CERT.RO、NCSC-FI、Canadian Centre for Cyber Security、CERT-UA、SANS ISC、abuse.ch ThreatFox、Akamai、Palo Alto Unit 42、Zscaler ThreatLabz、Europol、PoC-in-GitHub、Qdrant 向量資料庫語意查詢
> 下次更新：2026-W11
