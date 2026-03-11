---
layout: seo-report
last_modified_at: 2026-03-11T23:30:00+08:00
title: 2026 第 11 週防禦建議
description: "2026-03-05 至 2026-03-11 資安防禦建議：Cisco FMC/SCC 雙 CVSS 10.0 漏洞 CVE-2026-20079/CVE-2026-20131、CISA KEV 新增 7 個活躍利用漏洞、Camaro Dragon PlugX 針對中東、俄羅斯 Signal/WhatsApp 大規模帳號劫持、ShinyHunters Salesforce 百企資料竊取、KadNap 殭屍網路感染 14000 台 ASUS 路由器、Microsoft Teams 釣魚部署 A0Backdoor、BoryptGrab 竊密程式透過 100+ GitHub 惡意倉庫散布。"
parent: 防禦建議
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-defense-advisory.png
author: 資安情報分析團隊
date: 2026-03-11
---

# 防禦建議 — 2026 第 11 週

> 涵蓋期間：2026-03-05 至 2026-03-11
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV、CISA KEV
> 產出時間：2026-03-11

---

## 執行摘要

本週威脅態勢呈現**多國 APT 同步活動**與**大規模供應鏈/平台型攻擊**並行的嚴峻格局。Cisco 網路安全管理平台爆出兩個 CVSS 10.0 滿分漏洞，俄羅斯、中國、伊朗三大國家級威脅行為者同時啟動攻擊行動，ShinyHunters 透過 Salesforce 平台竊取近百家企業資料：

1. **CVE-2026-20079 / CVE-2026-20131 — Cisco FMC/SCC（CVSS 10.0 x 2）** — SQL Injection 導致遠端程式碼執行，影響所有使用 Cisco Secure Firewall Management Center 與 Security Cloud Control 的組織，CERT-SE、CERT-RO 同步發布緊急警告
2. **CISA KEV 本週新增 7 個漏洞** — 含 Hikvision（CVE-2017-7921）、Rockwell ICS（CVE-2021-22681）、Apple 多產品（CVE-2021-30952/CVE-2023-41974/CVE-2023-43000）、Qualcomm 晶片組（CVE-2026-21385）、VMware Aria Operations（CVE-2026-22719），均已確認野外活躍利用
3. **俄羅斯 Signal/WhatsApp 大規模帳號劫持** — 荷蘭 AIVD/MIVD 警告俄羅斯威脅行為者透過社交工程針對全球政府官員、記者、軍事人員的即時通訊帳號
4. **Camaro Dragon（中國）PlugX 攻擊卡達** — 利用中東衝突升級為釣魚誘餌，24 小時內啟動攻擊
5. **Seedworm/MuddyWater（伊朗）Dindoor 後門** — 入侵美國銀行、機場、軟體公司，使用 Deno runtime 規避偵測
6. **ShinyHunters Salesforce 資料竊取** — 宣稱竊取約 100 家企業、400 個網站資料，含 Snowflake、Okta、LastPass、Sony、AMD
7. **KadNap 殭屍網路** — 14,000+ 台 ASUS 路由器遭感染，使用 P2P Kademlia 協定建立去中心化 C2
8. **Microsoft Teams 釣魚 → A0Backdoor** — 鎖定金融業與醫療業，透過 Teams 訊息社交工程部署後門
9. **BoryptGrab 竊密程式** — 透過 100+ 個 GitHub 惡意倉庫散布，竊取瀏覽器憑證、加密貨幣錢包

**本週關鍵行動**：
- **立即**：套用 Cisco FMC/SCC 修補（CVE-2026-20079/CVE-2026-20131，CVSS 10.0）
- **立即**：推送 Android 2026 年 3 月安全更新（含 Qualcomm 晶片組修補）
- **立即**：更新所有 Apple 裝置（CISA KEV 新增 3 個 Apple 活躍利用漏洞）
- **緊急**：審查 Salesforce 帳號配置，停用不必要的 Guest 帳號
- **緊急**：向員工發布 Signal/WhatsApp 帳號安全警告，啟用兩步驟驗證
- **優先**：盤點 ASUS 路由器韌體版本，立即更新或替換 EoL 設備
- **優先**：審計 GitHub 專案相依性與開發者工作站安全
- **優先**：更新 ICS/OT 環境中的 Delta Electronics、Mitsubishi Electric、Honeywell 設備

---

## 1. 優先修補清單

依照優先級排序：**活躍利用（國家級 APT）> CISA KEV 新增 > CVSS Critical > CVSS High**

### P0 — 最高優先（CVSS 10.0 / 多國 CERT 同步警告）

#### 1.1 CVE-2026-20079 / CVE-2026-20131 — Cisco Secure Firewall Management Center (FMC) 與 Security Cloud Control (SCC)

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-20079、CVE-2026-20131 |
| **CVSS** | 10.0 (Critical) x 2 |
| **影響產品** | Cisco Secure Firewall Management Center (FMC)、Cisco Security Cloud Control (SCC) |
| **利用狀態** | 已確認活躍利用（針對本週威脅） |
| **修補狀態** | Cisco 已發布修補 |
| **通報機構** | CERT-SE（瑞典）、CERT-RO（羅馬尼亞）、CERT-FR（法國）同步警告 |

**漏洞描述**：Cisco Secure Firewall Management Center 與 Security Cloud Control 存在兩個獨立的 SQL Injection 漏洞，均獲 CVSS 10.0 最高評分。未經身份驗證的遠端攻擊者可利用這些漏洞在受影響的管理平台上執行任意 SQL 指令，進而取得完整系統控制權。由於 FMC/SCC 是防火牆集中管理平台，一旦淪陷將導致整個防火牆基礎設施失去防禦能力。

**修補方式**：
1. **立即**套用 Cisco 官方安全更新 — 參閱 [Cisco PSIRT](https://sec.cloudapps.cisco.com/security/center/publicationListing.x)
2. 若無法立即修補，限制 FMC/SCC 管理介面僅允許受信任的管理網段存取
3. 監控 FMC/SCC 存取日誌，搜尋異常 SQL 查詢或未授權登入
4. 參閱 [CERT-SE 警告](https://www.cert.se/2026/03/kritiska-sarbarheter-i-cisco-fmc-och-cisco-scc.html)
5. 參閱 [CERT-RO 警告](https://dnsc.ro/citeste/alert-vulnerabilit-i-critice-n-cisco-secure-firewall-management-center)
6. 參閱 [CERT-FR 多漏洞公告](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0242/)

> **重要**：FMC/SCC 為防火牆管理核心元件，若遭入侵可能導致攻擊者修改防火牆規則、停用安全策略、存取所有受管設備配置。建議將此漏洞視為**基礎設施保護最高優先級**。

---

### P1 — 極緊急（CISA KEV 新增、活躍利用中）

#### 1.2 CVE-2026-21385 — Qualcomm 多晶片組記憶體損毀

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-21385 |
| **影響產品** | Qualcomm 多款晶片組平台 |
| **利用狀態** | 活躍利用（CISA KEV） |
| **CISA KEV 新增日期** | 2026-03-03 |
| **修補截止日（聯邦機構）** | 2026-03-24 |

**漏洞描述**：Qualcomm 多款晶片組存在記憶體損毀漏洞，影響大量 Android 裝置。已確認野外活躍利用。

**修補方式**：
1. 推送 [Android 2026 年 3 月安全更新](https://source.android.com/docs/security/bulletin/2026-03-01)
2. 企業 MDM 平台應強制裝置更新政策
3. 參閱 [CISA KEV 目錄](https://www.cisa.gov/news-events/alerts/2026/03/03/cisa-adds-two-known-exploited-vulnerabilities-catalog)

#### 1.3 CVE-2026-22719 — Broadcom VMware Aria Operations 命令注入

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-22719 |
| **影響產品** | VMware Aria Operations（vRealize Operations / vROps） |
| **利用狀態** | 活躍利用（CISA KEV） |
| **CISA KEV 新增日期** | 2026-03-03 |
| **修補截止日（聯邦機構）** | 2026-03-24 |

**漏洞描述**：VMware Aria Operations 存在命令注入漏洞，未經身份驗證的遠端攻擊者可利用此漏洞執行任意命令，導致遠端程式碼執行（RCE）。

**修補方式**：
1. 依 [Broadcom Security Advisory](https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/SecurityAdvisories/0/36947) 套用修補或停用產品
2. 限制 VMware Aria Operations 管理介面的網路存取

#### 1.4 CISA 2026-03-05 新增 5 個 KEV

| CVE | 產品 | 類型 |
|-----|------|------|
| **CVE-2017-7921** | Hikvision 多產品 | 不當身份驗證 |
| **CVE-2021-22681** | Rockwell 多 ICS 產品 | 憑證保護不足 |
| **CVE-2021-30952** | Apple 多產品 | 整數溢位 |
| **CVE-2023-41974** | Apple iOS / iPadOS | Use-After-Free |
| **CVE-2023-43000** | Apple 多產品 | Use-After-Free |

**修補方式**：
1. **Hikvision**：更新受影響的 IP 攝影機/NVR 韌體至最新版本。若設備已達 EoL，應立即更換
2. **Rockwell ICS**：參閱 [Rockwell Automation 安全公告](https://www.rockwellautomation.com/en-us/trust-center/security-advisories.html)，更新 PLC/控制器韌體
3. **Apple**：更新所有 iOS、iPadOS、macOS、Safari、tvOS、watchOS 至最新版本
4. 參閱 [CISA 公告](https://www.cisa.gov/news-events/alerts/2026/03/05/cisa-adds-five-known-exploited-vulnerabilities-catalog)

> **特別注意 ICS/OT 環境**：CVE-2021-22681 影響 Rockwell Automation 工業控制產品，修補時需配合維護窗口並評估對製程的影響。

---

### P2 — 緊急（CVSS Critical / 公開 PoC）

#### 1.5 CVE-2026-29000 — pac4j JWT 認證繞過（CVSS 10.0）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-29000 |
| **CVSS** | 10.0 (Critical) |
| **影響產品** | pac4j-jwt（Java 認證框架） |
| **利用狀態** | 公開 PoC 可用 |

**漏洞描述**：pac4j JWT 實作存在認證繞過漏洞，攻擊者可透過 JWT 操控冒充任何使用者（包括管理員），完全繞過身份驗證機制。影響所有使用 pac4j-jwt 進行 JWT 認證的 Java 應用程式。

**修補方式**：
1. 升級 pac4j-jwt 至修補版本（請參閱 [pac4j 官方安全公告](https://github.com/pac4j/pac4j/security/advisories)）
2. 審查應用程式日誌，搜尋異常 JWT token 使用模式
3. 考慮在修補前增加額外的認證層（如 IP 白名單、MFA）

#### 1.6 HPE Aruba Networking AOS-CX — 多重漏洞

| 項目 | 內容 |
|------|------|
| **影響產品** | HPE Aruba Networking AOS-CX |
| **嚴重程度** | High（含多個漏洞） |

**漏洞描述**：HPE Aruba Networking AOS-CX 存在多重漏洞，可導致遠端阻斷服務（DoS）、資料機密性與完整性受損。

**修補方式**：
1. 參閱 [CERT-FR 公告](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0235/) 取得受影響版本與修補資訊
2. 套用 HPE Aruba 官方提供的韌體更新

#### 1.7 CVE-2026-3094 — Delta Electronics CNCSoft-G2 越界寫入

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-3094 |
| **CVSS** | 7.8 (High) |
| **CWE** | CWE-787（越界寫入） |
| **影響產品** | Delta Electronics CNCSoft-G2 < V2.1.0.39 |
| **利用狀態** | 尚無公開利用 |

**漏洞描述**：Delta Electronics CNCSoft-G2 在解析 DPAX 檔案的 DOPSoft 元件中存在越界寫入漏洞，成功利用可導致遠端程式碼執行。

**修補方式**：
1. 更新至 [Version 2.1.0.39](https://downloadcenter.deltaww.com/en-US/DownloadCenter?v=1&q=cncsoft&sort_expr=cdate&sort_dir=DESC)
2. 參閱 [CISA ICS 公告 ICSA-26-064-01](https://www.cisa.gov/news-events/ics-advisories/icsa-26-064-01)
3. 參閱 [Delta 安全公告 Delta-PCSA-2026-00004](https://filecenter.deltaww.com/news/download/doc/Delta-PCSA-2026-00004_CNCSoft-G2_File%20Parsing%20Out-Of-Bounds%20Write.pdf)

#### 1.8 CVE-2026-1874/1875/1876 — Mitsubishi Electric MELSEC iQ-F 系列

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-1874、CVE-2026-1875、CVE-2026-1876 |
| **CVSS** | 7.5 (High) |
| **影響產品** | MELSEC iQ-F FX5-ENET/IP (<=1.106)、FX5-EIP (所有版本) |
| **利用狀態** | 尚無公開利用 |

**漏洞描述**：Mitsubishi Electric MELSEC iQ-F 系列 EtherNet/IP 與 Ethernet 模組存在多重漏洞，遠端攻擊者可透過持續傳送 UDP 封包造成阻斷服務。

**修補方式**：
1. FX5-ENET/IP：更新韌體至 1.106 以上版本
2. FX5-EIP：等待 Mitsubishi Electric 官方修補（目前所有版本受影響）
3. 參閱 [CISA ICS 公告 ICSA-26-062-01](https://www.cisa.gov/news-events/ics-advisories/icsa-26-62-01)
4. 將 ICS 網路隔離在防火牆後方，確保不可從網際網路直接存取

---

### P3 — 優先（High 等級 / 廣泛影響）

#### 1.9 Google Android 2026 年 3 月安全公告

| 項目 | 內容 |
|------|------|
| **影響產品** | Android 平台（所有版本） |
| **嚴重程度** | High |

**修補方式**：
1. 參閱 [Android 2026 年 3 月安全公告](https://source.android.com/docs/security/bulletin/2026-03-01)
2. 透過 MDM 強制推送更新
3. 參閱 [CERT-RO 警告](https://dnsc.ro/citeste/alerta-remedieri-disponibile-pentru-multiple-vulnerabilitati-de-securitate-android)

#### 1.10 Google Chrome 多重漏洞

| 項目 | 內容 |
|------|------|
| **影響產品** | Google Chrome |
| **嚴重程度** | Medium |

**修補方式**：
1. 更新 Chrome 至最新版本
2. 參閱 [CERT-FR 公告](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0239/)

#### 1.11 Traefik 多重漏洞

| 項目 | 內容 |
|------|------|
| **影響產品** | Traefik（反向代理/負載均衡） |
| **嚴重程度** | Medium |
| **影響** | 遠端 DoS、安全策略繞過 |

**修補方式**：
1. 更新 Traefik 至最新版本
2. 參閱 [CERT-FR 公告](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0236/)

#### 1.12 ClamAV 漏洞

| 項目 | 內容 |
|------|------|
| **影響產品** | ClamAV |
| **嚴重程度** | Medium |
| **影響** | 阻斷服務 |

**修補方式**：
1. 更新 ClamAV 至最新版本
2. 參閱 [CERT-FR 公告](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0241/)

#### 1.13 CPython 漏洞

| 項目 | 內容 |
|------|------|
| **影響產品** | CPython |
| **嚴重程度** | Medium |

**修補方式**：
1. 更新 CPython 至最新版本
2. 參閱 [CERT-FR 公告](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0240/)

#### 1.14 FortiCloud SSO 繞過（CVE-2025-59718/59719）— 持續追蹤

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-59718、CVE-2025-59719 |
| **影響產品** | FortiGate（啟用 FortiCloud SSO 的裝置） |
| **利用狀態** | 持續活躍利用 |

**漏洞描述**：Fortinet SAML 處理漏洞，允許完全繞過管理介面身份驗證。CERT.at 報告攻擊者已在利用此漏洞匯出組態備份及收集 LDAP 連線字串。Fortinet 已確認修補未完全解決問題，並發布後續更新。

**修補方式**：
1. 套用 Fortinet 最新修補版本（確認包含 CVE-2025-59718/59719 的完整修補）
2. 參閱 [CERT.at 分析](https://www.cert.at/en/blog/2026/1/look-at-forticloud-sso-bypass-exploitation)
3. 審查 FortiGate 日誌中 `/remote/saml/login` 的異常請求
4. 若使用 FortiCloud SSO，考慮暫時切換至其他認證方式

---

## 2. 安全控制建議

### 2.1 網路層面

#### 針對本週威脅

| 建議 | 對應威脅 | 優先級 |
|------|----------|--------|
| **限制 Cisco FMC/SCC 管理介面存取** — 僅允許受信任的管理網段 | CVE-2026-20079/20131 | 立即 |
| **盤點所有 ASUS 路由器** — 確認韌體版本，更新至最新或替換 EoL 設備 | KadNap 殭屍網路 / Operation WrtHug | 緊急 |
| **停用不必要的 Salesforce Guest 帳號** — 審查所有外部共享設定 | ShinyHunters 攻擊 | 緊急 |
| **加強 SD-WAN 設備監控** — 持續追蹤 Cisco SD-WAN 全球利用事件（延續上週 CISA ED 26-03） | CVE-2026-20127 持續利用 | 持續 |
| **ICS/OT 網路隔離** — 確保 Delta Electronics、Mitsubishi Electric、Rockwell 設備不可從網際網路存取 | ICS 漏洞叢 | 優先 |

#### 通用建議

- 實施網路分段（Network Segmentation），將管理網路與營運網路隔離
- 部署入侵偵測/防禦系統（IDS/IPS），更新最新威脅特徵碼
- 監控出站流量異常，尤其是對已知 C2 基礎設施的連線
- 定期掃描暴露於外部的服務，減少攻擊面

### 2.2 端點層面

#### 針對本週威脅

| 建議 | 對應威脅 | 優先級 |
|------|----------|--------|
| **審計瀏覽器擴充功能與 GitHub 相依性** — 移除來源不明的擴充功能，檢查專案是否使用 BoryptGrab 受汙染的倉庫 | BoryptGrab 竊密程式 | 緊急 |
| **加強 EDR 監控 — 偵測 EDR 停用行為** — 假求職信攻擊會先殺死 EDR 再竊取資料 | 假求職信惡意程式 | 緊急 |
| **推送 Android 2026 年 3 月更新** — 含 Qualcomm 晶片組修補 | CVE-2026-21385 | 立即 |
| **更新所有 Apple 裝置** — 3 個活躍利用漏洞已加入 CISA KEV | CVE-2021-30952/CVE-2023-41974/CVE-2023-43000 | 立即 |
| **監控 Deno runtime 異常執行** — Seedworm Dindoor 後門使用 Deno runtime 規避偵測 | Seedworm 攻擊 | 優先 |

#### 通用建議

- 確保所有端點安裝最新作業系統修補
- 啟用端點偵測與回應（EDR）並確保 tamper protection 已開啟
- 定期執行完整系統掃描（含 rootkit 偵測）
- 限制使用者安裝未經核准的軟體

### 2.3 身分認證層面

#### 針對本週威脅

| 建議 | 對應威脅 | 優先級 |
|------|----------|--------|
| **立即發布 Signal/WhatsApp 安全警告** — 通知全體員工俄羅斯威脅行為者正大規模針對政府官員與記者的即時通訊帳號 | 俄羅斯帳號劫持行動 | 立即 |
| **強制啟用 Signal 註冊鎖定（Registration Lock）** — 防止帳號被社交工程轉移 | 俄羅斯帳號劫持行動 | 立即 |
| **審查 Signal/WhatsApp 已連結裝置** — 移除不明連結裝置 | 俄羅斯帳號劫持行動 | 立即 |
| **停用手機語音信箱服務** — 或設定強密碼。芬蘭已出現透過語音信箱攔截驗證碼劫持 Telegram 帳號的案例 | Telegram 語音信箱劫持 | 優先 |
| **審查 pac4j JWT 實作** — 若使用 pac4j-jwt，立即升級至修補版本 | CVE-2026-29000 | 緊急 |
| **審查 Microsoft Teams 外部訊息設定** — 限制或監控外部使用者的 Teams 訊息 | Teams A0Backdoor 攻擊 | 緊急 |

#### 通用建議

- 對所有特權帳號啟用多因素認證（MFA），優先使用硬體安全金鑰
- 定期輪換服務帳號密碼與 API 金鑰
- 實施最小權限原則（Principle of Least Privilege）
- 監控異常登入行為（地理位置、時間、裝置異常）

### 2.4 資料保護層面

#### 針對本週威脅

| 建議 | 對應威脅 | 優先級 |
|------|----------|--------|
| **審查 Salesforce 資料存取控制** — 盤點所有 Guest 帳號、API 整合、外部分享設定 | ShinyHunters 攻擊 | 緊急 |
| **審計第三方供應商存取權限** — Ericsson 事件顯示第三方服務供應商為重要攻擊面 | Ericsson 資料外洩 | 優先 |
| **加強開發環境安全** — 審查 GitHub 倉庫來源，勿直接執行未經驗證的程式碼 | BoryptGrab 竊密程式 | 優先 |

#### 通用建議

- 實施資料分級保護，加密靜態與傳輸中的敏感資料
- 建立資料外洩偵測機制（DLP）
- 定期備份關鍵資料並測試還原程序
- 審查雲端服務（SaaS）的共享與存取設定

---

## 3. 緩解策略

針對尚無完整修補或需要額外防護的威脅，提供臨時緩解措施：

### 3.1 Cisco FMC/SCC 管理介面防護

**有效期限**：至套用修補為止 | **重新評估日期**：2026-03-18

**適用情境**：無法立即套用修補的 Cisco FMC/SCC 部署

**緩解措施**：
1. 透過 ACL 限制 FMC/SCC 管理介面僅接受來自指定管理工作站的連線
2. 啟用管理介面的存取日誌並設定即時告警
3. 監控任何異常的 SQL 查詢模式或大量認證嘗試
4. 考慮在管理介面前方部署 WAF 過濾 SQL Injection 攻擊
5. 暫時停用不必要的 API 端點

### 3.2 即時通訊帳號保護策略

**有效期限**：持續執行 | **重新評估日期**：2026-04-11

**適用情境**：所有使用 Signal、WhatsApp、Telegram 的組織

**緩解措施**：
1. **Signal**：啟用 Registration Lock（註冊鎖定），定期檢查已連結裝置清單
2. **WhatsApp**：啟用兩步驟驗證，檢查 WhatsApp Web 連結工作階段
3. **Telegram**：停用語音信箱或設定強密碼，啟用兩步驟驗證
4. 對員工進行社交工程防範教育，強調攻擊者不嘗試破解加密，而是透過社交工程取得帳號存取權
5. 高風險人員（政府官員、記者、軍事人員）應額外加強安全意識

### 3.3 ASUS 路由器安全強化

**有效期限**：至韌體更新或設備更換完成 | **重新評估日期**：2026-03-25

**適用情境**：使用 ASUS 路由器的組織與家庭使用者

**緩解措施**：
1. **立即**更新路由器韌體至最新版本
2. 停用 AiCloud 服務（若不需要）
3. 更換已達 EoL 的路由器型號（特別是 Operation WrtHug 列出的 8 款型號：4G-AC55U、4G-AC860U、DSL-AC68U、GT-AC5300、GT-AX11000、RT-AC1200HP、RT-AC1300GPLUS、RT-AC1300UHP）
4. 變更預設管理密碼，停用遠端管理
5. 監控路由器異常出站流量（P2P Kademlia 協定通訊特徵）
6. 參閱 [ASUS 產品安全公告](https://www.asus.com/content/asus-product-security-advisory/)

### 3.4 Salesforce 環境安全強化

**有效期限**：至完成安全審查 | **重新評估日期**：2026-03-25

**適用情境**：所有使用 Salesforce 平台的組織

**緩解措施**：
1. **立即**審查並停用所有不必要的 Guest 帳號
2. 檢查 Salesforce 共享設定（Sharing Settings），確認外部存取範圍最小化
3. 啟用 Salesforce Shield 或 Event Monitoring（若可用），監控異常資料存取
4. 審查所有第三方 API 整合的權限範圍
5. 啟用 Salesforce 登入歷史監控，搜尋可疑登入模式
6. 對管理員帳號強制啟用 MFA

### 3.5 開發環境供應鏈安全

**有效期限**：持續執行 | **重新評估日期**：2026-04-11

**適用情境**：所有軟體開發團隊

**緩解措施**：
1. 審查 GitHub 專案中的第三方相依性來源，確認是否引用可疑倉庫
2. 使用 `npm audit`、`pip audit` 等工具掃描已知漏洞
3. 實施程式碼簽署驗證機制
4. 開發工作站安裝 EDR 並啟用即時保護
5. 限制開發環境中瀏覽器儲存的憑證數量，使用密碼管理器
6. 加密貨幣錢包金鑰不應存放在開發工作站

### 3.6 ICS/OT 環境防護

**有效期限**：至完成修補評估 | **重新評估日期**：2026-03-25

**適用情境**：使用 Delta Electronics、Mitsubishi Electric、Rockwell Automation 設備的工業環境

**緩解措施**：
1. 確保所有 ICS 設備位於隔離網段，不可從網際網路直接存取
2. 使用 VPN 進行遠端存取（注意 VPN 本身也需保持最新）
3. 監控 ICS 網路中的異常 UDP 流量（CVE-2026-1874 利用 UDP 封包）
4. 不開啟不明來源的 DPAX 檔案（CVE-2026-3094 利用途徑）
5. 參閱 [CISA ICS 最佳實踐](https://www.cisa.gov/ics)

### 3.7 Microsoft Teams 釣魚防護

**有效期限**：持續執行 | **重新評估日期**：2026-04-11

**適用情境**：所有使用 Microsoft Teams 的組織

**緩解措施**：
1. 在 Microsoft Teams 管理中心限制外部使用者傳送訊息的能力
2. 啟用 Microsoft Defender for Office 365 的安全連結（Safe Links）與安全附件（Safe Attachments）功能
3. 對使用者進行 Teams 釣魚意識教育，提醒不要點擊來自不明外部使用者的連結
4. 監控 Teams 稽核日誌中的異常外部通訊模式
5. 金融業與醫療業組織應特別加強監控（本週攻擊鎖定這兩個產業）

---

## 4. 注意事項

### 4.1 適用範圍與限制

- **環境差異**：本報告建議為通用性質。不同組織的網路架構、安全成熟度、業務需求各有差異，實施前請結合自身環境評估
- **ICS/OT 修補特殊性**：工業控制環境的修補需配合生產排程與維護窗口，不可在無測試的情況下直接套用
- **雲端環境**：Salesforce 相關建議需依據組織的 Salesforce 版本（Enterprise、Professional 等）調整，部分功能（如 Shield）可能需要額外授權
- **行動裝置管理**：Android 修補推送速度取決於裝置製造商與電信商，非 Google Pixel 裝置可能延遲數週
- **ShinyHunters 資訊可信度**：ShinyHunters 的受害企業名單為其自行宣稱，尚未經第三方獨立驗證，但該組織過去有可信的大規模資料竊取紀錄

### 4.2 可能的副作用

| 措施 | 可能副作用 | 建議處理方式 |
|------|------------|-------------|
| 限制 FMC/SCC 管理介面存取 | 遠端管理員可能無法存取 | 預先設定 VPN 存取路徑 |
| 停用 Salesforce Guest 帳號 | 外部合作夥伴/客戶可能無法存取共享資源 | 逐一確認後再停用，提供替代存取方式 |
| 停用路由器 AiCloud | 遠端存取路由器儲存裝置的功能失效 | 使用 VPN 或其他安全遠端存取方案替代 |
| 停用語音信箱 | 漏接電話時來電者無法留言 | 評估業務需求，至少設定強密碼 |
| 限制 Teams 外部訊息 | 可能影響與外部合作夥伴的溝通 | 使用白名單允許特定組織 |
| ICS 韌體更新 | 可能導致製程中斷 | 在維護窗口執行，準備回復計畫 |

### 4.3 建議的測試步驟

1. **修補前**：在測試環境或非關鍵系統上先行驗證修補，確認無相容性問題
2. **修補中**：記錄修補步驟與系統狀態，保留回復（rollback）能力
3. **修補後**：執行功能驗證測試，確認業務系統正常運作
4. **緩解措施**：在實施 ACL、防火牆規則等變更前，先在測試環境驗證不會阻斷合法流量
5. **EDR 規則**：新增偵測規則後，監控誤報率，必要時調整閾值

### 4.4 本週威脅情報數據

本週新增威脅指標統計（來源：abuse.ch / MalwareBazaar / ThreatFox）：

| 類型 | 數量 |
|------|------|
| 新惡意 URL（URLhaus） | 526 |
| 新惡意程式樣本（MalwareBazaar） | 141 |
| 新入侵指標（ThreatFox） | 640 |
| **合計** | **1,307** |

> 建議將上述威脅指標匯入組織的 SIEM/TIP 平台，加強即時偵測。

### 4.5 APT 活動態勢與防禦優先級

本週觀察到三大國家級威脅行為者同步活動，建議依組織屬性調整防禦優先級：

| 威脅行為者 | 國家歸屬 | 本週活動 | 高風險目標產業 |
|-----------|----------|----------|-------------|
| Sednit / APT28 | 俄羅斯 | BeardShell + Covenant 雙植入攻擊烏克蘭軍方；Signal/WhatsApp 帳號劫持 | 政府、軍事、媒體 |
| Camaro Dragon | 中國 | PlugX + Cobalt Strike 攻擊卡達 | 政府、戰略產業 |
| Seedworm / MuddyWater | 伊朗 | Dindoor 後門入侵美國關鍵基礎設施 | 金融、航空、軟體 |
| UAT-9244 | 中國 | TernDoor/PeerTime/BruteEntry 攻擊南非電信 | 電信 |

---

## 5. 免責聲明

本防禦建議基於國際 CERT/安全機構公開資料彙整，請注意：

1. **非保證**：實施建議不保證完全防禦所有威脅
2. **環境差異**：建議為通用性質，可能不適用於所有環境
3. **請先測試**：在正式環境部署前，請先於測試環境驗證
4. **非法律建議**：本報告不構成法律或合規建議
5. **資料限制**：基於公開資料，不涵蓋非公開威脅情報
6. **翻譯風險**：部分非英文來源經 AI 翻譯，修補建議請以官方原文為準

重大安全決策請諮詢專業資安顧問，並結合組織實際環境評估。

---

## 附錄：本週重要參考連結

### 漏洞公告
- [CERT-SE — Cisco FMC/SCC 嚴重漏洞](https://www.cert.se/2026/03/kritiska-sarbarheter-i-cisco-fmc-och-cisco-scc.html)
- [CERT-RO — Cisco FMC 嚴重漏洞](https://dnsc.ro/citeste/alert-vulnerabilit-i-critice-n-cisco-secure-firewall-management-center)
- [CERT-FR — Cisco 多漏洞](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0242/)
- [CISA — 新增 5 個 KEV（2026-03-05）](https://www.cisa.gov/news-events/alerts/2026/03/05/cisa-adds-five-known-exploited-vulnerabilities-catalog)
- [CISA — 新增 2 個 KEV（2026-03-03）](https://www.cisa.gov/news-events/alerts/2026/03/03/cisa-adds-two-known-exploited-vulnerabilities-catalog)
- [CISA ICS — Delta Electronics CNCSoft-G2](https://www.cisa.gov/news-events/ics-advisories/icsa-26-064-01)
- [CISA ICS — Mitsubishi Electric MELSEC iQ-F](https://www.cisa.gov/news-events/ics-advisories/icsa-26-62-01)
- [CERT-FR — HPE Aruba AOS](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0235/)
- [CERT-FR — Traefik](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0236/)
- [CERT-FR — ClamAV](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0241/)
- [CERT-FR — CPython](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0240/)
- [CERT-FR — Google Chrome](https://www.cert.ssi.gouv.fr/avis/CERTFR-2026-AVI-0239/)
- [CERT-RO — Android 2026 年 3 月](https://dnsc.ro/citeste/alerta-remedieri-disponibile-pentru-multiple-vulnerabilitati-de-securitate-android)

### 攻擊事件
- [AIVD/MIVD — 俄羅斯 Signal/WhatsApp 帳號劫持](https://www.theregister.com/2026/03/09/dutch_spies_say_russian_cybercrims/)
- [Check Point — Camaro Dragon PlugX 攻擊卡達](https://blog.checkpoint.com/research/china-nexus-activity-against-qatar-observed-amid-expanding-regional-tensions/)
- [ShinyHunters Salesforce 資料竊取](https://www.theregister.com/2026/03/09/shinyhunters_claims_more_highprofile_victims/)
- [BoryptGrab GitHub 散布](https://securityaffairs.com/189110/malware/massive-github-malware-operation-spreads-boryptgrab-stealer.html)
- [Ericsson 第三方資料外洩](https://www.bleepingcomputer.com/news/security/ericsson-us-discloses-data-breach-after-service-provider-hack/)
- [CERT.at — FortiCloud SSO 利用分析](https://www.cert.at/en/blog/2026/1/look-at-forticloud-sso-bypass-exploitation)
- [ASUS 產品安全公告](https://www.asus.com/content/asus-product-security-advisory/)

### CISA 持續追蹤
- [CISA/NSA — Cisco SD-WAN 全球利用指南](https://www.cisa.gov/news-events/alerts/2026/02/25/cisa-and-partners-release-guidance-ongoing-global-exploitation-cisco-sd-wan-systems)
- [CISA ICS 防禦最佳實踐](https://www.cisa.gov/ics)

---

> 本報告由資安情報分析系統自動彙整國際 CERT/安全機構公開資料產出。
> 下次更新：2026-03-18（第 12 週）
