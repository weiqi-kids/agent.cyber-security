---
layout: seo-report
last_modified_at: 2026-03-10T23:30:00+08:00
title: 2026 第 11 週防禦建議
description: "2026-03-04 至 2026-03-10 資安防禦建議：CVE-2025-26399 SolarWinds WHD 反序列化 RCE 修補截止 3 天內、CISA KEV 新增 8 個活躍利用漏洞、CVE-2026-29000 pac4j JWT 認證繞過 CVSS 10.0、CVE-2026-1603 Ivanti EPM 認證繞過、Cisco FMC 雙關鍵漏洞 CVSS 10.0、伊朗 Seedworm APT 入侵美國關鍵基礎設施、中國 APT CL-UNK-1068 六年潛伏揭露、NPM 供應鏈大規模感染、惡意 AI 瀏覽器擴充功能竊取 LLM 對話。"
parent: 防禦建議
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-defense-advisory.png
author: 資安情報分析團隊
date: 2026-03-10
---

# 防禦建議 — 2026 第 11 週

> 涵蓋期間：2026-03-04 至 2026-03-10
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV、CISA KEV
> 產出時間：2026-03-10

---

## 執行摘要

本週威脅態勢受**多國國家級 APT 同步活躍**和**軟體供應鏈多向量攻擊**雙重驅動。CISA 新增 8 個已知遭利用漏洞至 KEV 目錄，其中 CVE-2025-26399 SolarWinds Web Help Desk 反序列化 RCE 漏洞修補截止日僅為 2026-03-12（距今 2 天），為本季最短修補期限。同時，伊朗、中國、俄羅斯三大國家級 APT 群體本週均有重大活動揭露：

1. **CVE-2025-26399 SolarWinds Web Help Desk 反序列化 RCE（極緊急，修補截止 2026-03-12）** -- 已加入 CISA KEV，攻擊者可遠端執行任意程式碼，修補至 WHD 12.8.7 Hotfix 1
2. **CVE-2026-29000 pac4j JWT 完全認證繞過（CVSS 10.0）** -- 攻擊者可冒充任何使用者包括管理員，PoC 已公開，修補可用（延續上週）
3. **CVE-2026-20079 / CVE-2026-20131 Cisco FMC 雙關鍵漏洞（CVSS 10.0）** -- 企業防火牆管理中心遠端程式碼執行
4. **CVE-2026-1603 Ivanti EPM 認證繞過** -- 端點管理系統新加入 CISA KEV
5. **CVE-2021-22054 Omnissa Workspace ONE SSRF** -- 歷史漏洞回歸利用，新加入 CISA KEV
6. **CISA 2026-03-05 新增 5 個 KEV** -- CVE-2017-7921 (Hikvision)、CVE-2021-22681 (Rockwell ICS)、CVE-2021-30952/CVE-2023-41974/CVE-2023-43000 (Apple)
7. **Seedworm (MuddyWater) 入侵美國關鍵基礎設施** -- 活躍於美國銀行、機場及軟體公司網路
8. **CL-UNK-1068 中國 APT 六年潛伏揭露** -- 自 2020 年起涵蓋七大關鍵產業
9. **多起供應鏈攻擊同步爆發** -- NPM 感染（26 億/週下載）、GitHub 大規模惡意分發（100+ repos）、簽署惡意軟體

**本週關鍵行動**：
- **極緊急（2026-03-12 前）**：套用 SolarWinds Web Help Desk 12.8.7 Hotfix 1（CVE-2025-26399，CISA KEV 修補截止日僅剩 2 天）
- **立即**：升級 pac4j-jwt 至修補版本（CVE-2026-29000，CVSS 10.0）
- **立即**：套用 Cisco FMC 修補（CVE-2026-20079/CVE-2026-20131，CVSS 10.0）
- **立即**：盤點 Ivanti EPM 部署並套用修補（CVE-2026-1603，CISA KEV）
- **立即**：審計瀏覽器擴充功能，移除未知 AI 助手擴充
- **緊急**：修補 Omnissa Workspace ONE（CVE-2021-22054，CISA KEV）
- **緊急**：推送 Android 2026 年 3 月安全更新及 Google Pixel 安全公告修補
- **優先**：更新所有 Apple 裝置（3 個歷史 CVE 新加入 KEV）
- **優先**：針對伊朗、中國 APT 威脅加強 IP 攝影機、IoT、邊緣裝置安全監控
- **優先**：執行 NPM 供應鏈安全審計，驗證 GitHub 專案來源真實性

---

## 1. 優先修補清單

依照優先級排序：**活躍利用（CISA KEV 緊急期限）> 活躍利用（一般）> CVSS 高分 > 其他關鍵漏洞**

### P0 - 最高優先（CISA KEV 極短修補期限）

#### 1.1 CVE-2025-26399 -- SolarWinds Web Help Desk 反序列化 RCE

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2025-26399 |
| **嚴重程度** | Critical |
| **CWE** | CWE-502（反序列化不受信任的資料） |
| **影響產品** | SolarWinds Web Help Desk（WHD 12.8.7 Hotfix 1 以前版本） |
| **利用狀態** | 活躍利用（CISA KEV） |
| **CISA KEV 新增日期** | 2026-03-09 |
| **修補截止日（聯邦機構）** | **2026-03-12（距今僅 2 天，極緊急）** |

**漏洞描述**：SolarWinds Web Help Desk 存在不安全的反序列化漏洞，未經認證或低權限的遠端攻擊者可利用此漏洞在主機作業系統上執行任意命令，實現遠端程式碼執行 (RCE)。SolarWinds WHD 廣泛部署於企業 IT 服務台環境，一旦被入侵可作為內部網路的跳板進行橫向移動。

**Qdrant 歷史關聯**：語意查詢「SolarWinds vulnerability patch remediation」回傳 10 筆高度相關結果（相似度 0.67-0.71），確認 SolarWinds WHD 自 2026 年 1 月以來持續有多個嚴重漏洞公告。加拿大 CCCS 的 AV26-063 安全公告已更新至第 2 版（2026-02-13），CERT-SE 亦發布過關鍵漏洞警告。歷史上 SolarWinds Orion 平台在 2020-2021 年曾是重大供應鏈攻擊事件的核心，該公司產品持續為高價值攻擊目標。

**修補方式**：
1. **極緊急**：立即更新至 [SolarWinds Web Help Desk 12.8.7 Hotfix 1](https://www.solarwinds.com/trust-center/security-advisories/cve-2025-26399) 或更新版本
2. 若無法在 2026-03-12 前完成修補，應暫時將 WHD 從網路中隔離或限制存取
3. 審查 WHD 伺服器日誌，搜尋異常反序列化活動或未授權命令執行
4. 參閱 [CISA KEV 目錄](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
5. 參閱 [NVD - CVE-2025-26399](https://nvd.nist.gov/vuln/detail/CVE-2025-26399)
6. 參閱 [加拿大 CCCS 安全公告 AV26-063](https://cyber.gc.ca/en/alerts-advisories/solarwinds-security-advisory-av26-063-update-1)

> **警告**：此漏洞修補截止日為 2026-03-12，距今僅剩 2 天。若尚未修補，應視為最高優先級立即處理。聯邦機構依 BOD 22-01 必須在截止日前完成修補。

### P1 - 極緊急（CISA KEV 新增、活躍利用中、CVSS 10.0）

#### 1.2 CVE-2026-29000 -- pac4j JWT 完全認證繞過（延續上週）

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-29000 |
| **CVSS** | 10.0 (Critical) |
| **影響產品** | Java pac4j-jwt JwtAuthenticator |
| **利用狀態** | PoC 已公開，活躍掃描中 |
| **修補狀態** | 修補可用 |

**漏洞描述**：Java pac4j-jwt 安全框架的 JwtAuthenticator 在處理加密 JSON Web Tokens (JWT) 時存在嚴重缺陷。遠端攻擊者只需擁有 RSA 金鑰對，即可偽造惡意 JWT 繞過所有認證檢查，以任何使用者身分（包括管理員）完全存取應用程式。CVSS 滿分 10.0。

**修補方式**：
1. **立即**升級 pac4j-jwt 至最新修補版本
2. 審查應用程式是否使用 pac4j-jwt JwtAuthenticator 進行認證
3. 監控認證日誌中的異常 JWT 認證嘗試
4. 參閱 [CERT.hr 安全公告](https://www.cert.hr/upozorenje-kriticna-ranjivost-jwtauthenticatora-u-pac4j-modulu-cve-2026-29000/)
5. 參閱 [NVD - CVE-2026-29000](https://nvd.nist.gov/vuln/detail/CVE-2026-29000)

#### 1.3 CVE-2026-20079 / CVE-2026-20131 -- Cisco Firewall Management Center 雙關鍵漏洞

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-20079、CVE-2026-20131 |
| **CVSS** | 10.0 (Critical)（兩者） |
| **影響產品** | Cisco Secure Firewall Management Center (FMC) |
| **利用狀態** | 無已知野外利用，但 CVSS 10.0 應視為極高風險 |
| **修補狀態** | 修補可用 |

**漏洞描述**：Cisco Secure Firewall Management Center 存在多個嚴重漏洞，遠端攻擊者可能利用這些漏洞在 FMC 上執行任意程式碼。FMC 是企業防火牆的集中管理平台，一旦被入侵將導致整個防火牆基礎設施失控。

**修補方式**：
1. 參閱 Cisco PSIRT 官方安全公告並立即套用修補
2. 限制 Firewall Management Center 管理介面暴露，僅允許受信任管理網段存取
3. 監控 FMC 管理介面的異常存取活動
4. 參閱 [CERT-RO 警報](https://dnsc.ro/citeste/alert-vulnerabilit-i-critice-n-cisco-secure-firewall-management-center)
5. 參閱 [CERT-FR 公告](https://www.cert.ssi.gouv.fr/)

#### 1.4 CVE-2026-1603 -- Ivanti Endpoint Manager 認證繞過

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2026-1603 |
| **嚴重程度** | High |
| **影響產品** | Ivanti Endpoint Manager (EPM) |
| **利用狀態** | 活躍利用（CISA KEV） |
| **CISA KEV 新增日期** | 2026-03-09 |

**漏洞描述**：Ivanti Endpoint Manager 存在認證繞過漏洞，攻擊者可繞過認證機制取得未授權存取。Ivanti 產品在 2025-2026 年持續為高價值攻擊目標。EPM 作為端點管理系統，一旦被入侵可影響所有受管理的端點裝置。

**修補方式**：
1. 立即套用 Ivanti 官方安全修補
2. 盤點所有 Ivanti EPM 部署，確認版本狀態
3. 限制 EPM 管理介面的網路存取
4. 審查 EPM 認證日誌，搜尋異常存取模式
5. 參閱 [CISA KEV 目錄](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
6. 參閱 [NVD - CVE-2026-1603](https://nvd.nist.gov/vuln/detail/CVE-2026-1603)

> **Qdrant 跨層關聯**：Ivanti 產品在 2025-2026 年間有大量漏洞公告。語意查詢歷史結果確認 Ivanti Connect Secure 在 2025 年 7 月曾被國家支持的攻擊者利用零日漏洞植入 DslogdRAT 惡意軟體（JPCERT/CC 報告）。Ivanti 產品已成為國家級 APT 的優先攻擊目標。

#### 1.5 CVE-2021-22054 -- Omnissa Workspace ONE UEM SSRF

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2021-22054 |
| **嚴重程度** | High |
| **影響產品** | Omnissa (VMware) Workspace ONE UEM |
| **利用狀態** | 活躍利用（CISA KEV，歷史漏洞回歸利用） |
| **CISA KEV 新增日期** | 2026-03-09 |
| **修補截止日（聯邦機構）** | 2026-03-23 |

**漏洞描述**：Omnissa Workspace ONE UEM（原 VMware）存在伺服器端請求偽造 (SSRF) 漏洞。這是 2021 年披露的歷史漏洞，本週回歸利用並新加入 CISA KEV，反映攻擊者持續掃描和利用未修補的企業行動裝置管理系統。

**修補方式**：
1. 套用 [Omnissa (VMware) 官方安全修補](https://www.vmware.com/security/advisories)
2. 確認 Workspace ONE UEM 部署已更新至不受影響的版本
3. 限制 Workspace ONE 管理主控台的網路存取
4. 參閱 [NVD - CVE-2021-22054](https://nvd.nist.gov/vuln/detail/CVE-2021-22054)

#### 1.6 CISA 2026-03-05 新增 5 個 KEV

本週 CISA 於 2026-03-05 新增 5 個已知遭積極利用漏洞至 KEV 目錄：

##### CVE-2017-7921 -- Hikvision 多產品不當認證

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2017-7921 |
| **嚴重程度** | High |
| **影響產品** | Hikvision 多款 IP 攝影機及監控產品 |
| **利用狀態** | 活躍利用（CISA KEV） |
| **背景** | 2017 年披露的老舊漏洞，本週與伊朗攻擊者利用 IP 攝影機進行戰損評估 (BDA) 的威脅態勢高度相關 |

**修補方式**：
1. 更新 Hikvision 產品韌體至最新版本
2. 更改所有預設密碼，啟用強密碼政策
3. 將 IP 攝影機移至獨立 VLAN，限制出站網路連線
4. 參閱 [CISA KEV 目錄](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)

> **關鍵關聯**：伊朗國家駭客確認劫持消費級攝影機用於戰損評估，數百起攻擊企圖與飛彈和無人機攻擊時間高度吻合。Hikvision 漏洞被加入 KEV 可能與此態勢直接相關。Seedworm/MuddyWater 活躍於美國關鍵基礎設施進一步加劇此風險。

##### CVE-2021-22681 -- Rockwell 多產品憑證保護不足

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2021-22681 |
| **嚴重程度** | Critical |
| **影響產品** | Rockwell Studio 5000 Logix Designer、Logix 控制器 |
| **利用狀態** | 活躍利用（CISA KEV） |
| **環境** | ICS/OT |

**漏洞描述**：Studio 5000 Logix Designer 軟體可能允許攻擊者發現用於驗證 Logix 控制器與設計軟體通訊的金鑰。成功利用後，未授權應用程式可連接 Logix 控制器。此漏洞對工業控制系統 (ICS) 環境構成重大威脅。

**修補方式**：
1. 依 [Rockwell 安全公告](https://support.rockwellautomation.com/app/answers/answer_view/a_id/1130301/~/cve-2021-22681%3A-authentication-bypass-vulnerability-found-in-logix-controllers-) 套用緩解措施
2. 參閱 [CISA ICS Advisory ICSA-21-056-03](https://www.cisa.gov/news-events/ics-advisories/icsa-21-056-03)
3. **ICS 環境必須先在測試環境驗證**後再部署至生產環境
4. 實施嚴格網路分段，限制對 Logix 控制器的網路存取
5. 使用 CIP 安全功能強化控制器通訊認證

##### CVE-2021-30952 -- Apple 多產品整數溢位

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2021-30952 |
| **嚴重程度** | High |
| **影響產品** | Apple tvOS、macOS、Safari、iPadOS、watchOS |
| **利用狀態** | 活躍利用（CISA KEV） |

**修補方式**：
1. 更新至 [tvOS 15.2](https://support.apple.com/en-us/HT212975)、[macOS Monterey 12.1](https://support.apple.com/en-us/HT212978)、[Safari 15.2](https://support.apple.com/en-us/HT212982)、[iPadOS 15.2](https://support.apple.com/en-us/HT212976) 或更新版本
2. 確保所有 Apple 裝置啟用自動更新

##### CVE-2023-41974 -- Apple iOS/iPadOS Use-After-Free

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2023-41974 |
| **嚴重程度** | High |
| **影響產品** | Apple iOS、iPadOS |
| **利用狀態** | 活躍利用（CISA KEV） |

**漏洞描述**：惡意應用程式可利用此 Use-After-Free 漏洞以**核心 (kernel) 權限**執行任意程式碼。

**修補方式**：
1. 更新至 [iOS/iPadOS 16.7](https://support.apple.com/en-us/HT213938) 或更新版本
2. 透過 MDM 強制推送更新至企業管理裝置

##### CVE-2023-43000 -- Apple 多產品 Use-After-Free

| 項目 | 內容 |
|------|------|
| **CVE** | CVE-2023-43000 |
| **嚴重程度** | High |
| **影響產品** | Apple macOS、iOS、iPadOS、Safari |
| **利用狀態** | 活躍利用（CISA KEV） |

**修補方式**：
1. 更新至 [macOS Ventura 13.5](https://support.apple.com/en-us/120324)、[iOS/iPadOS 16.6](https://support.apple.com/en-us/120331)、[Safari 16.6](https://support.apple.com/en-us/120338) 或更新版本
2. 確保所有 Apple 裝置啟用自動更新

> **Apple 裝置統一行動建議**：CISA 新增 3 個 Apple 漏洞至 KEV（CVE-2021-30952、CVE-2023-41974、CVE-2023-43000），均已有修補可用。建議統一盤點組織內所有 Apple 裝置（iPhone、iPad、Mac、Apple TV、Apple Watch），確保全部更新至最新系統版本。透過 MDM 強制推送更新為最有效的方式。

### P2 - 緊急（高 CVSS、關鍵基礎設施影響）

#### 1.7 Google Android / Pixel -- 2026 年 3 月安全公告

| 項目 | 內容 |
|------|------|
| **影響產品** | Android 全平台、Google Pixel |
| **嚴重程度** | High（多個漏洞） |
| **修補狀態** | 修補可用（2026-03-01 安全修補等級） |

**修補方式**：
1. 套用 [Android 2026 年 3 月安全公告](https://source.android.com/docs/security/bulletin/2026/2026-03-01)（2026-03-01 安全修補等級或更新）
2. 套用 [Google Pixel 安全公告](https://source.android.com/docs/security/bulletin/pixel)
3. 透過 MDM 強制推送安全更新至所有受管理的 Android 裝置
4. 聯絡裝置製造商取得受影響元件的韌體更新

#### 1.8 Docker Desktop 多漏洞

| 項目 | 內容 |
|------|------|
| **影響產品** | Docker Desktop |
| **嚴重程度** | High |
| **修補狀態** | 修補可用 |

**修補方式**：
1. 更新 Docker Desktop 至最新版本
2. 參閱 [CERT-FR Docker Desktop 多漏洞公告](https://www.cert.ssi.gouv.fr/)
3. 審查 Docker 容器配置，遵循安全最佳實踐

#### 1.9 HPE Aruba Networking AOS 多漏洞

| 項目 | 內容 |
|------|------|
| **影響產品** | HPE Aruba Networking AOS |
| **嚴重程度** | High |
| **修補狀態** | 修補可用 |

**修補方式**：
1. 參閱 [CERT-FR HPE Aruba 公告](https://www.cert.ssi.gouv.fr/) 並套用修補
2. 限制網路設備管理介面存取
3. 監控網路設備日誌中的異常管理活動

#### 1.10 Delta Electronics CNCSoft-G2 RCE

| 項目 | 內容 |
|------|------|
| **CVE** | ICSA-26-064-01 相關 |
| **CVSS** | 7.8 (High) |
| **影響產品** | Delta Electronics CNCSoft-G2 DOPSoft |
| **環境** | ICS/OT |

**漏洞描述**：Delta Electronics CNCSoft-G2 的 DOPSoft 元件在解析 DPAX 檔案時存在越界寫入漏洞，可導致遠端程式碼執行。影響全球關鍵製造基礎設施。

**修補方式**：
1. 更新至 CNCSoft-G2 最新版本
2. 限制對 HMI 系統的網路存取
3. 不開啟來路不明的 DPAX 檔案
4. 參閱 [CISA ICS Advisory](https://www.cisa.gov/news-events/ics-advisories)

### P3 - 重要（其他關鍵漏洞）

#### 1.11 其他本週修補建議

| CVE / 產品 | 嚴重程度 | 類型 | 修補來源 |
|------------|----------|------|----------|
| Tenable Nessus Manager | High | 漏洞掃描工具漏洞 | [CERT-FR 公告](https://www.cert.ssi.gouv.fr/) |
| ClamAV | High | 防毒引擎漏洞 | [CERT-FR 公告](https://www.cert.ssi.gouv.fr/) |
| CPython | High | 語言執行環境漏洞 | [CERT-FR 公告](https://www.cert.ssi.gouv.fr/) |
| NetApp ONTAP 9 | High | 儲存系統漏洞 | [CERT-FR 公告](https://www.cert.ssi.gouv.fr/) |
| Nextcloud Flow | 中-高 | 協作平台漏洞 | [CERT-FR 公告](https://www.cert.ssi.gouv.fr/) |
| SPIP | 中-高 | CMS 漏洞 | [CERT-FR 公告](https://www.cert.ssi.gouv.fr/) |
| Zabbix | 中-高 | 監控系統漏洞 | [CERT-FR 公告](https://www.cert.ssi.gouv.fr/) |
| Google Chrome 多漏洞 | High | 瀏覽器漏洞 | [CERT-FR 公告](https://www.cert.ssi.gouv.fr/) |
| Moxa 產品 | High | 工業網路設備漏洞 | CISA ICS Advisory |
| Linux Kernel (Red Hat/SUSE/Ubuntu) | 中-高 | 核心漏洞 | [CERT-FR 公告](https://www.cert.ssi.gouv.fr/) |
| IBM 多產品 | 中-高 | 企業軟體漏洞 | [CERT-FR 公告](https://www.cert.ssi.gouv.fr/) |
| Wireshark 4.6.4 | 中 | 網路分析工具 | [Wireshark 官方](https://www.wireshark.org/docs/relnotes/wireshark-4.6.4.html) |
| MISP 多漏洞 | 中 | 威脅情報平台漏洞 | [CERT-FR 公告](https://www.cert.ssi.gouv.fr/) |

---

## 2. 安全控制建議

基於本週威脅態勢，以下安全控制建議按層面分類，並標註「通用建議」與「針對本週威脅」。

### 2.1 網路層面

#### 針對本週威脅

| 控制措施 | 對應威脅 | 優先級 |
|----------|----------|--------|
| **隔離 SolarWinds WHD 伺服器** -- 立即將 Web Help Desk 伺服器移至隔離管理網段，僅允許必要的服務台存取，封鎖對外網路連線直到修補完成 | CVE-2025-26399（修補截止 2026-03-12） | 極緊急 |
| **限制 Cisco FMC 管理存取** -- 確保 Firewall Management Center 管理介面不暴露於不受信任的網路，僅允許跳板機存取 | CVE-2026-20079/CVE-2026-20131 (CVSS 10.0) | 極緊急 |
| **限制 Ivanti EPM 管理介面暴露** -- 將端點管理系統管理介面移至受信任管理網段 | CVE-2026-1603 (CISA KEV) | 緊急 |
| **監控 IP 攝影機流量** -- 對所有 IP 攝影機的異常入站/出站連線建立警報規則，特別注意來自中東地區的異常存取 | 伊朗 IP 攝影機攻擊 + CVE-2017-7921 (Hikvision KEV) | 高 |
| **ICS/OT 網路分段強化** -- 確認 Rockwell Logix 控制器、Delta Electronics HMI、Moxa 設備位於隔離的 OT 網段 | CVE-2021-22681 (Rockwell KEV)、Delta CNCSoft-G2、Moxa 漏洞 | 高 |
| **部署 DDoS 緩解措施** -- 針對面向中東/以色列業務的組織，確認 DDoS 緩解服務已啟用 | 駭客主義 DDoS（149+ 攻擊，Operation Epic Fury / Roaring Lion） | 高 |
| **限制 Workspace ONE 管理主控台存取** -- 限制存取來源 IP，啟用管理存取日誌 | CVE-2021-22054 (CISA KEV) | 高 |

#### 通用建議

- 持續執行網路分段，確保 IT、OT、IoT 各自在獨立的網路區域
- 對所有管理介面強制使用加密連線 (TLS 1.2+)
- 定期審查防火牆規則，移除不必要的對外服務暴露
- 對 DNS 查詢啟用威脅情報過濾，注意 .arpa TLD 的異常 A 記錄（上週揭露的濫用手法，來源：Infoblox，本週持續適用）
- 監控邊緣裝置和安全設備的管理介面存取（Google 2025 零日回顧指出國家級 APT 優先攻擊邊緣裝置）

### 2.2 端點層面

#### 針對本週威脅

| 控制措施 | 對應威脅 | 優先級 |
|----------|----------|--------|
| **瀏覽器擴充功能審計** -- 盤點所有 Chromium 瀏覽器（Chrome、Edge）安裝的擴充功能，移除未經企業核准的 AI 助手擴充功能 | 惡意 AI 助手擴充功能竊取 LLM 對話（90 萬安裝量、2 萬+企業租戶） | 極緊急 |
| **Apple 裝置全面更新** -- 透過 MDM 推送最新 iOS、iPadOS、macOS、Safari、tvOS、watchOS 更新 | CVE-2021-30952、CVE-2023-41974、CVE-2023-43000（3 個 KEV） | 緊急 |
| **Android 裝置安全更新** -- 透過 MDM 強制推送 2026 年 3 月 Android/Pixel 安全更新 | Android/Pixel 安全公告 | 緊急 |
| **監控 EV 簽署的可執行檔** -- 在 EDR 中新增規則，對已知被濫用的憑證觸發警報 | 簽署惡意軟體攻擊（EV 憑證濫用持續） | 高 |
| **限制 Deno 執行環境** -- 在應用程式白名單/控制政策中封鎖未授權的 Deno runtime 執行 | Seedworm Dindoor 後門 | 高 |
| **偵測 RMM 工具濫用** -- 監控非預期的遠端管理工具安裝和執行 | 簽署惡意軟體 + RMM 後門 | 高 |
| **封鎖 Hikvision 攝影機預設憑證存取** -- 強制更改所有 Hikvision 裝置預設密碼 | CVE-2017-7921 (Hikvision KEV) | 高 |
| **更新 Chrome 至最新版本** -- Google Chrome 本週發布多個安全修補 | Chrome 多漏洞（CERT-FR） | 高 |

#### 通用建議

- 維持 EDR/XDR 簽章和行為偵測規則更新
- 限制使用者對軟體安裝的權限（最低權限原則）
- 啟用 AMSI (Antimalware Scan Interface) 監控腳本執行
- 限制 Office 巨集執行，僅允許數位簽署的巨集
- 監控 PowerShell、cmd、wscript 等腳本引擎的異常行為
- 加強行為偵測（而非僅依賴簽名），因 APT36 Vibeware 模式預示大量 AI 產生的惡意軟體變體

### 2.3 身分認證層面

#### 針對本週威脅

| 控制措施 | 對應威脅 | 優先級 |
|----------|----------|--------|
| **審查 JWT 認證實作** -- 檢查應用程式是否使用 pac4j-jwt，若是則立即升級 | CVE-2026-29000 (CVSS 10.0) | 極緊急 |
| **Rockwell ICS 認證強化** -- 審查 Studio 5000 Logix Designer 的金鑰管理和控制器認證機制 | CVE-2021-22681 (Rockwell KEV) | 高 |
| **Ivanti EPM 認證審查** -- 審查 EPM 認證日誌，搜尋未授權的管理存取 | CVE-2026-1603 (CISA KEV) | 高 |
| **Workspace ONE 認證強化** -- 確認 UEM 管理介面已啟用 MFA | CVE-2021-22054 (CISA KEV) | 高 |
| **審查數位憑證** -- 確認憑證撤銷清單 (CRL) 和 OCSP 正常運作 | EV 憑證濫用趨勢 | 中 |

#### 通用建議

- 對所有特權帳號和面向外部的服務強制啟用 MFA（抗釣魚型 MFA 優先，如 FIDO2）
- 定期審查服務帳號和 API 金鑰的使用情況
- 實施密碼政策強化（長度 > 複雜度，參考 NIST SP 800-63B）
- 監控異常登入行為（異常地理位置、非工作時間、多次失敗嘗試）

### 2.4 資料保護層面

#### 針對本週威脅

| 控制措施 | 對應威脅 | 優先級 |
|----------|----------|--------|
| **限制 LLM/AI 工具的敏感資料輸入** -- 制定並推行 AI 工具使用政策，禁止在 ChatGPT、DeepSeek 等工具中輸入機密程式碼、內部工作流程、策略文件 | 惡意 AI 助手擴充功能竊取 LLM 對話 | 極緊急 |
| **監控資料外洩管道** -- 強化 DLP 規則，監控 Slack、Discord、Supabase、Google Sheets 等非傳統 C2 管道的異常資料傳輸 | APT36 使用合法雲端服務作 C2 | 高 |
| **NPM 供應鏈安全審計** -- 使用 `npm audit` 和相依性掃描工具檢查專案是否引用受感染的 18 個套件 | NPM 大規模感染（26 億/週下載） | 緊急 |
| **GitHub 專案來源驗證** -- 對所有開源工具安裝驗證來源真實性，避免偽造的 GitHub 存儲庫 | BoryptGrab 100+ repos、OpenClaw 偽造安裝器 | 高 |

#### 通用建議

- 實施資料分類分級制度，對高敏感度資料加密儲存和傳輸
- 定期備份關鍵資料，並驗證備份還原程序
- 對檔案傳輸系統啟用傳輸加密和存取日誌
- 監控大量資料外傳活動
- 定期審查 npm/pip/Maven 等套件管理器的相依性安全性

### 2.5 軟體供應鏈層面

#### 針對本週威脅

| 控制措施 | 對應威脅 | 優先級 |
|----------|----------|--------|
| **NPM 套件完整性檢查** -- 鎖定相依性版本（package-lock.json / yarn.lock），啟用 npm audit 自動掃描 | NPM 大規模感染 | 緊急 |
| **GitHub 存儲庫來源驗證** -- 驗證所有開源工具的 GitHub 來源真實性，避免 100+ 偽造存儲庫的 BoryptGrab 攻擊 | BoryptGrab Stealer、OpenClaw 偽造安裝器 | 高 |
| **瀏覽器擴充功能 SBOM** -- 建立企業核准的擴充功能清單，定期審查已安裝的擴充功能版本 | 惡意 AI 助手擴充功能 | 高 |
| **程式碼簽署信任重新評估** -- 不將數位簽署視為安全性的充分證據，加強行為分析 | 簽署惡意軟體（EV 憑證濫用） | 高 |

#### 通用建議

- 對所有軟體安裝來源進行驗證，避免從非官方管道下載
- 使用 SCA（Software Composition Analysis）工具持續監控開源元件漏洞
- 建立軟體供應鏈安全審查流程（參考 NIST SSDF 及六國聯合 AI/ML 供應鏈安全指導文件，2026-03-05 發布）
- 監控 CI/CD pipeline 中的套件安裝流程，確認使用固定版本

---

## 3. 緩解策略

針對尚無修補或需要額外緩解措施的威脅：

### 3.1 SolarWinds WHD 極緊急修補（CVE-2025-26399）

**問題**：CISA KEV 修補截止日為 2026-03-12，距今僅剩 2 天。反序列化 RCE 漏洞利用門檻低，一旦被入侵可作為內部網路跳板。

**暫時緩解措施**（若無法在截止日前完成修補）：
1. 立即將 Web Help Desk 伺服器從面向網際網路的位置移除
2. 限制 WHD 存取至僅必要的內部 IP 範圍
3. 啟用 WAF 規則過濾可疑的反序列化 payload
4. 啟用增強日誌記錄，監控異常命令執行
5. 評估是否可暫時切換至替代的服務台解決方案
6. 依 BOD 22-01 指引，若無法修補則停止使用產品

**有效期限**：直到 WHD 12.8.7 Hotfix 1 修補完成。**2026-03-12 為硬性截止日**。

**重新評估時間**：2026-03-12（截止日當天）

### 3.2 伊朗網路威脅升級（Seedworm 入侵美國關基設施）

**問題**：Seedworm/MuddyWater（伊朗 MOIS 關聯）確認活躍於美國銀行、機場及軟體公司網路，部署新型後門 Dindoor。伊朗多個 APT 組織利用 IP 攝影機進行戰損評估。149 次駭客主義 DDoS 攻擊針對 16 個國家。

**Qdrant 歷史關聯**：語意查詢「Iranian APT defense mitigation network monitoring」回傳 10 筆結果（相似度 0.54-0.60），其中 Check Point 2026-03-03 發布的「What Defenders Need to Know About Iran's Cyber Capabilities」（相似度 0.55）提供全面的伊朗網路能力分析，以及 2018 年 GovCERT.HK 的「Protecting the Network Infrastructure」（相似度 0.54）提供持久有效的網路基礎設施保護指引。歷史關聯確認伊朗網路威脅已從間歇性活動轉為持續性、多向量的攻擊態勢。

**暫時緩解措施**：
1. **IP 攝影機強化**：更改所有 IP 攝影機預設密碼（特別是 Hikvision）、更新韌體、移至獨立 VLAN、限制出站連線
2. **提高 SOC 警戒等級**：針對伊朗關聯的 TTPs 建立偵測規則（參考 [Check Point 伊朗威脅概述](https://blog.checkpoint.com/research/what-defenders-need-to-know-about-irans-cyber-capabilities/)）
3. **Seedworm 偵測**：
   - 搜尋網路中 Deno runtime 的異常執行
   - 監控與 Seedworm 關聯的 C2 基礎設施 IOC
   - 審查涉及以色列分支的軟體公司供應鏈
4. **DDoS 準備**：若組織業務涉及以色列、科威特、約旦、巴林、阿聯酋、賽普勒斯，應提升 DDoS 緩解等級
5. **網域威脅監控**：加強對衝突主題釣魚郵件和 PDF 誘餌的偵測

**有效期限**：直到中東地緣政治局勢穩定。

**重新評估時間**：每週評估（至少至 2026-04-07）

### 3.3 中國 APT 長期潛伏偵測（CL-UNK-1068、UAT-9244）

**問題**：Unit 42 揭露 CL-UNK-1068 自 2020 年起持續六年未被偵測的中國網路間諜行動，涵蓋航空、能源、政府、執法、製藥、科技及電信七大關鍵產業。Cisco Talos 揭露 UAT-9244 使用三種全新惡意軟體針對南美電信基礎設施。

**暫時緩解措施**：
1. 對航空、能源、電信等關鍵產業進行深度威脅獵捕
2. 搜尋歷史日誌中與中國 APT 關聯的 IOC（參閱 Unit 42 CL-UNK-1068 報告）
3. 監控非標準 C2 協定，特別是 BitTorrent 協定的異常使用（UAT-9244 的 PeerTime 後門）
4. 審查邊緣裝置和 SSH 伺服器的異常存取模式（BruteEntry 工具掃描行為）
5. 加強對冷門程式語言（Nim、Zig、Crystal）編譯的可執行檔偵測

**有效期限**：持續性措施。中國 APT 的長期潛伏特性要求持續監控。

**重新評估時間**：2026-04-10（一個月後）

### 3.4 惡意 AI 助手瀏覽器擴充功能（持續性威脅）

**問題**：惡意擴充功能已影響 90 萬安裝量和 2 萬+企業租戶，竊取 ChatGPT 和 DeepSeek 對話記錄。暴露的資料類型包括專有程式碼、內部工作流程、策略討論和機密資料。

**暫時緩解措施**：
1. 在企業環境中透過 Chrome Enterprise 或 Edge Group Policy 建立擴充功能白名單
2. 封鎖未在白名單中的擴充功能安裝
3. 對已安裝的擴充功能執行安全審計，比對 [Microsoft Defender 報告中的 IOC](https://www.microsoft.com/en-us/security/blog/2026/03/05/malicious-ai-assistant-extensions-harvest-llm-chat-histories/)
4. 教育使用者不在 AI 工具中輸入敏感資訊
5. 考慮部署瀏覽器隔離解決方案用於存取 AI 工具

**有效期限**：持續性措施，應納入常規安全政策。

**重新評估時間**：2026-03-31（納入季度安全政策審查）

### 3.5 NPM 供應鏈大規模感染（延續上週）

**問題**：18 個 NPM 套件遭入侵，涉及每週超過 26 億次下載量。結合 BoryptGrab 透過 100+ GitHub 存儲庫分發竊密軟體、OpenClaw 偽造安裝器，軟體供應鏈正從多個向量被同步攻擊。

**暫時緩解措施**：
1. 立即執行 `npm audit` 檢查專案相依性
2. 鎖定所有相依性版本，使用 `package-lock.json` 或 `yarn.lock`
3. 啟用 npm 的 `--ignore-scripts` 選項限制安裝後腳本執行
4. 部署 SCA 工具（如 Snyk、Dependabot）持續監控相依性安全性
5. 審查 CI/CD pipeline 中的套件安裝流程，確認使用固定版本
6. 參閱 [SK-CERT NPM 感染警告](https://www.sk-cert.sk/sk/masivna-infekcia-softverovych-balikov-npm/)

**有效期限**：直到受感染套件全部清除並發布安全版本。

**重新評估時間**：2026-03-17（一週後）

### 3.6 俄烏衝突相關網路威脅

**問題**：BadPaw/MeowMeow 新型惡意軟體以偽造烏克蘭邊境通行許可文件進行魚叉式釣魚。UAC-0252 持續部署 SHADOWSNIFF 和 SALATSTEALER 竊密軟體。芬蘭家庭攝影機遭俄羅斯駭客主義團體入侵監視。

**暫時緩解措施**：
1. 加強對東歐主題釣魚郵件和 ZIP 附件的偵測
2. 監控偽造政府文件（邊境通行許可、政府公告等）類型的魚叉式釣魚
3. 部署 SHADOWSNIFF/SALATSTEALER 竊密軟體的 IOC 偵測規則
4. 對家用攝影機和 IoT 裝置強化安全（更改預設密碼、更新韌體、網路隔離）

**有效期限**：直到俄烏衝突局勢緩和。

**重新評估時間**：每週評估

---

## 4. 注意事項

### 4.1 適用範圍

- **優先修補清單**適用於所有使用受影響產品的組織。聯邦機構另需遵循 BOD 22-01 和 CISA 緊急指令的強制期限。
- **CVE-2025-26399（SolarWinds WHD）**的修補截止日 2026-03-12 為硬性期限，適用於所有使用 Web Help Desk 的組織，特別是 IT 服務台部署。
- **安全控制建議**為通用框架，各組織應依據自身暴露面、業務性質和風險偏好調整實施優先級。
- **伊朗相關威脅**的緩解措施主要針對以下組織：
  - 在中東地區有業務的組織
  - 與以色列有業務關聯的組織
  - 美國政府機構及相關承包商
  - 國防/航太產業供應鏈
  - 金融、交通（機場）基礎設施
- **中國 APT 相關威脅**主要影響：航空、能源、政府、執法、製藥、科技及電信產業
- **ICS/OT 環境**的修補建議需要特別謹慎，必須遵循工業控制系統的修補管理程序。
- **NPM 供應鏈安全**主要影響使用 JavaScript/Node.js 的開發團隊和 CI/CD pipeline。

### 4.2 修補副作用與測試建議

| 修補項目 | 潛在副作用 | 建議測試步驟 |
|----------|------------|--------------|
| SolarWinds WHD 12.8.7 Hotfix 1（CVE-2025-26399） | 服務台服務短暫中斷、自訂整合可能需要調整 | 1. 完整備份 WHD 資料庫和配置 2. 在測試環境套用 Hotfix 3. 驗證工單建立、分配、通知功能 4. 確認自訂整合正常運作後推送至生產環境 |
| pac4j-jwt 升級（CVE-2026-29000） | 認證邏輯可能需要調整 | 1. 在開發環境完整測試 JWT 認證流程 2. 驗證既有 token 相容性 3. 確認無認證中斷後部署 |
| Cisco FMC 修補（CVE-2026-20079/20131） | 防火牆管理功能暫時中斷 | 1. 確認備援管理路徑可用 2. 在維護窗口執行更新 3. 驗證防火牆規則和監控功能 |
| Ivanti EPM 修補（CVE-2026-1603） | 端點管理服務短暫中斷 | 1. 確認備援管理機制可用 2. 在測試環境驗證修補 3. 分批推送至生產環境 |
| Android 2026-03 安全更新 | 部分 OEM 裝置可能有相容性問題 | 1. 先在少量測試裝置部署 2. 驗證核心應用程式功能 3. 確認後全面推送 |
| Apple 裝置更新（3 個 KEV） | 應用程式相容性、MDM profile 需重新驗證 | 1. 先在測試裝置群組更新 2. 驗證 MDM 管理功能和企業 App 正常運作 3. 全面推送 |
| ICS/OT 修補（Rockwell、Delta Electronics、Moxa） | **高風險 -- 可能影響生產系統** | 1. **必須**在隔離的測試環境完整驗證 2. 確認備援系統可用 3. 安排停機維護窗口 4. 準備回退方案 |

### 4.3 指標與偵測資源

本週可使用的威脅偵測資源：

| 資源 | 用途 | 連結 |
|------|------|------|
| Microsoft Defender 惡意擴充功能 IOC | 偵測惡意 AI 助手擴充功能 | [Microsoft Security Blog](https://www.microsoft.com/en-us/security/blog/2026/03/05/malicious-ai-assistant-extensions-harvest-llm-chat-histories/) |
| Check Point 伊朗威脅分析 | 伊朗 APT TTPs 與防禦 | [Check Point Blog](https://blog.checkpoint.com/research/what-defenders-need-to-know-about-irans-cyber-capabilities/) |
| Unit 42 CL-UNK-1068 報告 | 中國 APT 六年潛伏行動 IOC | [Unit 42 Blog](https://unit42.paloaltonetworks.com/) |
| Cisco Talos UAT-9244 報告 | 中國 APT 電信基礎設施攻擊 IOC | [Talos Blog](https://blog.talosintelligence.com/uat-9244/) |
| CCCS 伊朗威脅公報 | 伊朗網路威脅 TTPs | [CCCS Bulletin](https://cyber.gc.ca/) |
| CISA ICS Advisories | Rockwell、Delta Electronics、Moxa 修補 | [CISA ICS Advisories](https://www.cisa.gov/news-events/ics-advisories) |
| abuse.ch MalwareBazaar | Mirai、AsyncRAT、LummaStealer 樣本 IOC | [MalwareBazaar](https://bazaar.abuse.ch/) |
| SK-CERT NPM 感染警告 | NPM 受感染套件清單 | [SK-CERT](https://www.sk-cert.sk/sk/masivna-infekcia-softverovych-balikov-npm/) |
| SANS ISC XWorm Diary | XWorm 多技術投遞 IOC | [SANS ISC](https://isc.sans.edu/diary/) |
| 六國 AI/ML 供應鏈安全指導 | AI 元件安全評估 | [CCCS AI/ML Guidance](https://cyber.gc.ca/) |
| Google 破壞性攻擊防禦指南 | 2026 版主動準備與強化 | [Google Cloud Threat Intel](https://cloud.google.com/blog/topics/threat-intelligence/) |

### 4.4 IoT/攝影機安全特別提醒

鑑於伊朗攻擊者利用 IP 攝影機進行戰損評估 (BDA)、CISA 新增 Hikvision CVE-2017-7921 至 KEV、俄羅斯駭客主義團體入侵芬蘭家庭攝影機，以及 abuse.ch 資料顯示 Mirai 家族佔惡意軟體樣本最大比例，IoT 裝置安全應提升為優先關注事項：

1. **IP 攝影機**：更改預設密碼（特別是 Hikvision）、更新韌體、移至獨立 VLAN、限制出站連線
2. **IoT 裝置**：定期更新韌體、停用不必要的服務、監控異常流量
3. **邊緣裝置**：確保所有邊緣裝置保持最新修補（Google 2025 零日回顧指出國家級 APT 優先攻擊邊緣裝置）

### 4.5 供應鏈安全提醒

本週觀察到多起供應鏈攻擊，形成**多向量同步攻擊**態勢：

| 攻擊向量 | 事件 | 影響規模 |
|----------|------|----------|
| **套件管理器感染** | 18 個 NPM 套件遭入侵 | 每週 26 億次下載 |
| **GitHub 大規模偽造** | BoryptGrab 100+ 存儲庫分發竊密軟體 | 大規模分發 |
| **偽造開源專案** | OpenClaw GitHub 偽造安裝器 | GhostSocks 惡意軟體分發 |
| **瀏覽器擴充功能** | 惡意 AI 助手擴充功能 | 90 萬安裝量 |
| **簽署惡意軟體** | EV 憑證簽署的偽裝工作場所 App | 信任機制削弱 |
| **AI 驅動惡意軟體** | APT36 Vibeware 模式 | 大量中品質惡意軟體植體 |
| **平台蠕蟲** | Wikipedia 自傳播 JS 蠕蟲 | Web 平台自動化功能武器化 |

建議：
1. 對所有軟體安裝來源進行驗證，避免從非官方管道下載
2. 監控 GitHub 專案的異常變更和新建存儲庫
3. 定期審查瀏覽器擴充功能和 npm/pip 等套件管理器的相依性
4. 建立軟體供應鏈安全審查流程（參考 NIST SSDF 及六國聯合 AI/ML 供應鏈安全指導文件）
5. 加強對 AI 產生惡意軟體變體的行為偵測能力

---

## 5. 優先行動時間表

| 時間框架 | 行動項目 | 對應威脅 |
|----------|----------|----------|
| **極緊急（2026-03-12 前）** | 套用 SolarWinds WHD 12.8.7 Hotfix 1 | CVE-2025-26399 (CISA KEV) |
| **立即（24 小時內）** | 升級 pac4j-jwt（若使用） | CVE-2026-29000 (CVSS 10.0) |
| **立即（24 小時內）** | 套用 Cisco FMC 修補 | CVE-2026-20079/CVE-2026-20131 (CVSS 10.0) |
| **立即（24 小時內）** | 盤點 Ivanti EPM 部署並套用修補 | CVE-2026-1603 (CISA KEV) |
| **立即（24 小時內）** | 審計瀏覽器擴充功能、移除惡意 AI 助手 | 惡意 AI 擴充功能 |
| **緊急（72 小時內）** | 修補 Omnissa Workspace ONE | CVE-2021-22054 (CISA KEV) |
| **緊急（72 小時內）** | 推送 Android 2026-03 安全更新 | Android/Pixel 安全公告 |
| **緊急（72 小時內）** | 更新所有 Apple 裝置 | CVE-2021-30952, CVE-2023-41974, CVE-2023-43000 |
| **緊急（72 小時內）** | 執行 NPM 供應鏈安全審計 | NPM 大規模感染 |
| **本週內** | 部署 Seedworm/Dindoor 偵測規則 | 伊朗 APT 威脅 |
| **本週內** | 部署中國 APT (CL-UNK-1068、UAT-9244) 偵測規則 | 中國 APT 潛伏行動 |
| **本週內** | 強化 IP 攝影機和 IoT 安全 | 伊朗/俄羅斯攝影機攻擊 + Hikvision KEV + Mirai |
| **本週內** | 更新 Chrome、Docker Desktop、HPE Aruba | 多個高嚴重度漏洞 |
| **本週內** | 套用 Rockwell ICS 緩解措施 | CVE-2021-22681 (Rockwell KEV) |
| **2026-03-23 前** | 完成 Omnissa Workspace ONE 修補 | BOD 22-01 |
| **持續** | 監控中東地緣政治態勢及相關威脅情報 | 伊朗衝突升級 |
| **持續** | 監控軟體供應鏈攻擊新動態 | NPM、GitHub、擴充功能 |

---

## 6. Qdrant 跨層關聯分析摘要

本報告產出過程中執行了 3 次 Qdrant 語意查詢，用於跨 Layer 關聯分析：

1. **「SolarWinds vulnerability patch remediation」**（10 筆結果，相似度 0.67-0.71）：確認 SolarWinds WHD 自 2026 年 1 月以來持續有多個嚴重漏洞公告。加拿大 CCCS 的 AV26-063 安全公告已更新至第 2 版，CERT-SE 亦發布過關鍵漏洞警告。歷史上 SolarWinds Orion 平台在 2020-2021 年曾是重大供應鏈攻擊事件的核心（相似度 0.68），該公司產品持續為高價值攻擊目標。最新的 AV25-613 更新（2026-03-10，相似度 0.67）確認 SolarWinds 產品漏洞修補需求為持續性優先事項。

2. **「Iranian APT defense mitigation network monitoring」**（10 筆結果，相似度 0.54-0.60）：關聯到 Check Point 2026-03-03 發布的伊朗網路能力分析（相似度 0.55）、Seedworm/MuddyWater 活躍於美國關鍵基礎設施的最新情報（相似度 0.56）、UAT-9244 中國 APT 電信攻擊（相似度 0.54，方法論比對），以及 2018 年 GovCERT.HK 的網路基礎設施保護指引（相似度 0.54）。歷史關聯確認國家級 APT 的防禦策略核心原則（網路分段、管理介面隔離、異常行為監控）在不同威脅行為者間具有通用性。

3. **「supply chain attack browser extension malware defense」**（10 筆結果，相似度 0.48-0.49）：關聯到大量惡意 URL 分發（URLhaus 資料），確認供應鏈攻擊的分發基礎設施持續活躍。GitHub 作為惡意軟體分發平台的趨勢（github.com/user-attachments 路徑，相似度 0.48）與本週 BoryptGrab 100+ 存儲庫攻擊一致。雖然直接關聯度較低，但結合 docs/ 檔案系統中的 NPM 感染警告、惡意 AI 擴充功能報告，供應鏈攻擊的多向量同步爆發已成為 2026 年確立的趨勢。

---

## 免責聲明

本防禦建議基於國際 CERT/安全機構公開資料彙整，請注意：

1. **非保證**：實施建議不保證完全防禦所有威脅
2. **環境差異**：建議為通用性質，可能不適用於所有環境
3. **請先測試**：在正式環境部署前，請先於測試環境驗證
4. **非法律建議**：本報告不構成法律或合規建議
5. **資料限制**：基於公開資料，不涵蓋非公開威脅情報
6. **翻譯風險**：部分非英文來源經 AI 翻譯，修補建議請以官方原文為準
7. **ICS/OT 修補風險**：工業控制系統修補可能影響生產運行。在套用 ICS/OT 修補前，必須在隔離的測試環境完整驗證，並準備回退方案
8. **漏洞資訊時效性**：本報告反映截至 2026-03-10 的已公開資訊。部分漏洞的技術細節可能在報告產出後才獲得更新
9. **威脅行為者歸因**：APT 歸因（Seedworm/MuddyWater、CL-UNK-1068、UAT-9244、APT36 等）基於各安全廠商的評估，歸因結論可能隨後續調查而調整

重大安全決策請諮詢專業資安顧問，並結合組織實際環境評估。

---

## 自我審核 Checklist

- [x] 包含完整免責聲明（9 項，含固定模板 6 項及補充 3 項）
- [x] 修補建議全部來自官方來源（CISA、SolarWinds、Cisco、Ivanti、Omnissa、Google、Apple、Rockwell、各國 CERT）
- [x] 清楚區分「通用建議」與「針對本週威脅」（每個安全控制層面均有標註）
- [x] 緩解策略標註有效期限和重新評估時間（6 項緩解策略均已標註）
- [x] 無「保證安全」措辭（免責聲明第 1 項明確說明）
- [x] 標註適用範圍與限制（注意事項第 4.1 節）
- [x] CVE 編號正確（CVE-2025-26399、CVE-2026-29000、CVE-2026-20079、CVE-2026-20131、CVE-2026-1603、CVE-2021-22054、CVE-2017-7921、CVE-2021-22681、CVE-2021-30952、CVE-2023-41974、CVE-2023-43000）
- [x] 格式適合 IT/資安管理人員快速閱讀（分級排序、表格、行動時間表）

---

> 本報告由資訊安全產業智慧分析系統自動產出，資料來源涵蓋 CISA、NCSC-FI、CERT-FR、SK-CERT、CERT-UA、CERT-RO、CERT.hr、CCCS、SANS ISC、abuse.ch 等國際安全機構與開源情報饋送。Qdrant 語意查詢用於跨 Layer 關聯分析，共執行 3 次查詢，回傳 30 筆相關結果。
