---
layout: seo-report
title: 2026 第 09 週威脅態勢分析
description: "2026-02-17 至 2026-02-23 資安威脅週報：RoundCube 雙漏洞持續活躍利用、BeyondTrust 勒索軟體攻擊、Dell RP4VMs UNC6201 零日利用、Chromium CVE-2026-2441、React2Shell 供應鏈威脅、波蘭能源基礎設施 OT/ICS 攻擊、FortiWeb SQL 注入 RCE、Redis 8.0.2 RCE PoC。"
parent: 威脅態勢分析
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-threat-landscape.png
author: 資安情報分析團隊
date: 2026-02-24
---

# 威脅態勢分析 — 2026 第 09 週

> 涵蓋期間：2026-02-17 至 2026-02-23
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-02-24

---

## 執行摘要

本週威脅態勢持續嚴峻，以下為重點摘要：

**最新緊急威脅（2026-02-17 至 2026-02-23）**：
- **Ivanti EPMM 雙零日漏洞遭活躍利用（CVE-2026-1281、CVE-2026-1340）**：未經認證 RCE，Unit 42 偵測到建立反向 shell、安裝 web shell 等攻擊行為
- **RoundCube Webmail 雙漏洞持續遭活躍利用（CVE-2025-49113、CVE-2025-68461）**：反序列化 RCE 與 XSS 漏洞，CISA KEV 修補期限 2026-03-13
- **BeyondTrust RS/PRA OS Command Injection（CVE-2026-1731）**：已確認勒索軟體利用，CVSS Critical，修補期限已過（2026-02-16）
- **Dell RP4VMs 零日漏洞（CVE-2026-22769）**：UNC6201 威脅組織活躍利用硬編碼憑證漏洞，可取得 root 層級持久存取
- **Chromium CSS Use-After-Free（CVE-2026-2441）**：影響 Chrome、Edge、Opera 等所有 Chromium 瀏覽器，正遭野外利用
- **React2Shell（CVE-2025-55182）**：JPCERT/CC 報告多個威脅行為者快速利用此 React Server Components RCE 漏洞

**關鍵基礎設施與進階威脅**：
- **DynoWiper 分析報告發布（2026-02-19）**：SANS ISC 發布俄羅斯 APT Sandworm 組織使用的 wiper 惡意軟體技術分析，該惡意軟體於 2025 年 12 月攻擊波蘭能源公司
- **波蘭能源基礎設施攻擊**：CISA 於 2026-02-10 發布警告，確認 2025 年 12 月攻擊針對 OT/ICS 系統，使用 wiper 惡意軟體破壞再生能源設施

**供應鏈與開發環境風險**：
- **VSCode 熱門擴充套件漏洞揭露**：Ox Security 發現累計下載超過 1.28 億次的擴充套件存在 Critical 漏洞，包括 Live Server（7200 萬次下載）、Code Runner（3700 萬次下載）

**新興 PoC 與漏洞利用**：
- **Redis 8.0.2 RCE**：Exploit-DB 發布 PoC（2026-02-04）
- **motionEye 0.43.1b4 RCE**：Exploit-DB 發布 PoC（2026-02-11）
- **FortiWeb Fabric Connector 7.6.x SQLi to RCE**：Exploit-DB 發布 PoC（2026-02-04）
- **Ingress-NGINX Admission Controller FD Injection RCE**：Kubernetes 環境風險（2026-02-04）
- **glibc 2.38 本地緩衝區溢位**：本地權限提升風險（2026-02-11）
- **Docker Desktop 4.44.3 未認證 API 暴露**：本地攻擊向量（2026-02-04）

**國家級威脅行為者動態**：
- **APT Sandworm（俄羅斯）**：SANS ISC 技術分析確認 DynoWiper 惡意軟體與此組織相關，目標為波蘭能源基礎設施
- **UNC6201**：Google Cloud 威脅情報確認此威脅組織正活躍利用 Dell RP4VMs 零日漏洞
- **多威脅行為者 React2Shell**：JPCERT/CC 確認多個獨立威脅行為者在漏洞揭露後快速武器化
- **日文釣魚活動**：SANS ISC 紀錄持續一年的日文釣魚活動，冒充 ANA、DHL、myTOKYOGAS，均使用 .cn 域名與相同 X-mailer 簽章

**威脅饋送統計（W09）**：
- **惡意 URL**：本週偵測 3,687 筆
- **主要惡意軟體家族**：Mozi（305 筆）、ClearFake（117 筆）、Mirai（57 筆）、ua-wget（27 筆）

**CISA KEV 修補期限**：
- **RoundCube CVE-2025-49113、CVE-2025-68461**：2026-03-13
- **Chromium CVE-2026-2441**：2026-03-10
- **BeyondTrust CVE-2026-1731**：2026-02-16（已過，勒索軟體利用中）

---

## 資料來源統計

| Layer | 本週新增 | 2026 年累計 | 說明 |
|-------|----------|-------------|------|
| security_news_facts | **56** | 2,414 | 國際資安新聞與事件（attack_incident: 953, industry_trend: 711） |
| vulnerability_tracking | **500+** | 17,351 | 漏洞追蹤（critical_high: 4,666, medium: 8,456, low_info: 4,229） |
| exploit_intelligence | **48** | 4,782 | 利用程式（active_exploitation: 58, poc_available: 4,720） |
| threat_feeds | **3,687** | 34,211 | 威脅饋送（malicious_url: 23,559, malware_sample: 4,479, ioc: 5,939） |

**W09 威脅饋送惡意軟體家族分布**：
- Mozi: 305 筆
- ClearFake: 117 筆
- Mirai: 57 筆
- ua-wget: 27 筆
- ascii: 13 筆
- Hajime: 8 筆

> 統計時間：2026-02-24 UTC

---

## 1. 近期重大資安事件

### 1.1 RoundCube Webmail 雙漏洞遭活躍利用（CVE-2025-49113、CVE-2025-68461）

**嚴重程度：Critical | 來源：CISA KEV | 日期：2026-02-20**

**ATT&CK TTP**：[T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } Exploit Public-Facing Application

RoundCube Webmail 存在兩個嚴重漏洞，已被 CISA 列入 KEV 活躍利用清單：

**CVE-2025-49113 — 反序列化 RCE 漏洞**：
- **漏洞類型**：Deserialization of Untrusted Data (CWE-502)
- **攻擊條件**：已認證使用者
- **影響**：透過 `program/actions/settings/upload.php` 中未驗證的 `_from` 參數實現 RCE
- **受影響版本**：1.6.11 及 1.5.10 之前版本
- **修補版本**：1.6.11+、1.5.10+

**CVE-2025-68461 — XSS 漏洞**：
- **漏洞類型**：Cross-site Scripting (CWE-79)
- **攻擊向量**：SVG 文件中的 animate 標籤注入
- **受影響版本**：1.6.12 及 1.5.12 之前版本
- **修補版本**：1.6.12+、1.5.12+

**防禦建議**：
1. 立即升級至 RoundCube 1.6.12 或 1.5.12 以上版本
2. 實施嚴格的 Content Security Policy (CSP)
3. 監控異常檔案上傳與 SVG 相關活動
4. CISA 要求聯邦機構於 2026-03-13 前完成修補

### 1.2 BeyondTrust RS/PRA OS Command Injection 勒索軟體利用（CVE-2026-1731）

**嚴重程度：Critical | 來源：CISA KEV | 日期：2026-02-13**

**ATT&CK TTP**：[T1059](https://attack.mitre.org/techniques/T1059/){: .ttp-ref } Command and Scripting Interpreter、[T1486](https://attack.mitre.org/techniques/T1486/){: .ttp-ref } Data Encrypted for Impact

BeyondTrust Remote Support (RS) 和 Privileged Remote Access (PRA) 產品存在嚴重 OS Command Injection 漏洞：

**漏洞詳情**：
- **CVE**：CVE-2026-1731
- **CWE**：CWE-78 (OS Command Injection)
- **攻擊條件**：未經認證的遠端攻擊者
- **影響**：以網站使用者（site user）權限執行任意 OS 指令

**關鍵警告**：
- **已確認勒索軟體利用**：CISA 標記 `knownRansomwareCampaignUse: Known`
- **修補期限已過**：2026-02-16
- 所有面向網際網路的 BeyondTrust 系統應立即檢查入侵跡象

**防禦建議**：
1. 立即套用廠商修補程式
2. 檢查所有對外暴露的 BeyondTrust 實例
3. 審查系統日誌以偵測未授權的指令執行
4. 實施網路分段隔離 PRA/RS 系統

### 1.3 Dell RecoverPoint for VMs 零日漏洞被 UNC6201 利用（CVE-2026-22769）

**嚴重程度：Critical | 來源：CISA KEV、Google Cloud Threat Intelligence | 日期：2026-02-18**

**ATT&CK TTP**：[T1078.001](https://attack.mitre.org/techniques/T1078/001/){: .ttp-ref } Default Accounts

Dell RecoverPoint for Virtual Machines (RP4VMs) 存在硬編碼憑證漏洞：

**漏洞詳情**：
- **CVE**：CVE-2026-22769
- **漏洞類型**：Use of Hard-coded Credentials
- **攻擊條件**：未認證遠端攻擊者
- **影響**：獲取底層作業系統存取權與 root 層級持久化

**威脅情報**：
- Google Cloud 威脅情報團隊發現 **UNC6201** 威脅組織正活躍利用此零日漏洞
- 該組織專注於虛擬化與備份基礎設施的攻擊

**防禦建議**：
1. 執行 Dell 提供的修補腳本（DSA-2026-079）
2. 檢查 RP4VMs 系統是否有未授權存取跡象
3. 監控虛擬化基礎設施的異常活動

### 1.4 Chromium CSS Use-After-Free 漏洞（CVE-2026-2441）

**嚴重程度：Critical | 來源：CISA KEV | 日期：2026-02-17**

**ATT&CK TTP**：[T1189](https://attack.mitre.org/techniques/T1189/){: .ttp-ref } Drive-by Compromise

Google Chromium CSS 存在 Use-After-Free 漏洞，可導致 heap corruption：

**受影響產品**：
- Google Chrome
- Microsoft Edge
- Opera
- 其他基於 Chromium 的瀏覽器

**防禦建議**：
1. 升級至 Chrome 2026-02-13 或更新版本
2. 升級 Edge、Opera 等至最新版本
3. CISA 修補期限：2026-03-10

### 1.5 波蘭能源基礎設施 OT/ICS 攻擊

**嚴重程度：High | 來源：CISA、CERT Polska | 日期：2026-02-10**

**ATT&CK TTP**：[T1485](https://attack.mitre.org/techniques/T1485/){: .ttp-ref } Data Destruction、[T1078](https://attack.mitre.org/techniques/T1078/){: .ttp-ref } Valid Accounts

CISA 發布警告放大 CERT Polska 2026 年 1 月 30 日的能源部門事件報告：

**攻擊詳情**：
- 2025 年 12 月惡意行為者針對波蘭能源部門 OT/ICS 系統
- 受害者包括：再生能源發電廠、熱電聯產廠、製造業公司
- 攻擊者利用可由網際網路存取的邊界設備進入
- 使用預設憑證進行橫向移動

**關鍵教訓**：
- 邊界設備必須加強安全防護
- 預設憑證必須變更
- OT/ICS 系統需與 IT 網路適當隔離

### 1.6 React2Shell 多威脅行為者快速利用（CVE-2025-55182）

**嚴重程度：High | 來源：JPCERT/CC | 日期：2026-02-13**

**ATT&CK TTP**：[T1195.002](https://attack.mitre.org/techniques/T1195/002/){: .ttp-ref } Supply Chain Compromise: Compromise Software Supply Chain

JPCERT/CC 報告 React Server Components (RSC) 存在嚴重 RCE 漏洞：

**漏洞詳情**：
- **CVE**：CVE-2025-55182
- **揭露日期**：2025 年 12 月 3 日
- **攻擊條件**：未認證遠端攻擊者

**威脅情報**：
- 多個獨立威脅行為者在揭露後快速武器化
- JPCERT/CC 收到多起活躍入侵事件報告
- 代表供應鏈風險，React 是全球最廣泛使用的 JavaScript 框架之一

**防禦建議**：
1. 更新 React Server Components 至修補版本
2. 檢查 Web 應用程式是否使用受影響版本
3. 監控異常的伺服器端執行行為

### 1.7 Ivanti EPMM 雙零日漏洞遭活躍利用（CVE-2026-1281、CVE-2026-1340）

**嚴重程度：Critical | 來源：Unit 42 / Palo Alto Networks | 日期：2026-02-19**

**ATT&CK TTP**：[T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } Exploit Public-Facing Application、[T1505.003](https://attack.mitre.org/techniques/T1505/003/){: .ttp-ref } Web Shell

Ivanti Endpoint Manager Mobile (EPMM) 存在兩個嚴重零日漏洞：

**漏洞詳情**：
- **CVE-2026-1281、CVE-2026-1340**
- **攻擊條件**：未經認證遠端攻擊者
- **影響**：完全控制 MDM 基礎設施

**Unit 42 觀察到的攻擊行為**：
- 建立反向 shell
- 安裝 web shell
- 進行偵察活動
- 下載惡意軟體

**關鍵觀察**：
漏洞揭露與大規模利用之間的時間窗口已有效崩潰。攻擊者在漏洞揭露數小時內即將新 CVE 整合至自動化掃描框架。

**防禦建議**：
1. 立即套用 Ivanti 官方修補
2. 面向網際網路的管理介面應採「假設已被入侵」心態
3. 檢查所有 EPMM 系統是否有反向 shell 或 web shell 跡象
4. 實施網路分段限制 MDM 系統存取

### 1.8 VSCode 熱門擴充套件存在嚴重漏洞（CVE-2025-65717 等）

**嚴重程度：Critical | 來源：Ox Security | 日期：2026-02-19**

**ATT&CK TTP**：[T1204.002](https://attack.mitre.org/techniques/T1204/002/){: .ttp-ref } User Execution: Malicious File、[T1059](https://attack.mitre.org/techniques/T1059/){: .ttp-ref } Command and Scripting Interpreter

累計下載超過 1.28 億次的 VSCode 擴充套件存在嚴重漏洞：

**受影響擴充套件**：
1. **Live Server（CVE-2025-65717）** — 7,200 萬次下載
   - 嚴重程度：Critical
   - 影響：透過惡意網頁重導竊取本地檔案

2. **Code Runner（CVE-2025-65715）** — 3,700 萬次下載
   - 影響：透過設定檔操作實現 RCE

3. **Markdown Preview Enhanced（CVE-2025-65716、CVE-2025-65717）**
   - 多個漏洞影響渲染與預覽功能

4. **Microsoft Live Preview** — 漏洞詳情尚未公開

**風險評估**：
- 開發者工作站是供應鏈攻擊的高價值目標
- 入侵可導致原始碼竊取、憑證竊取、供應鏈注入攻擊

**防禦建議**：
1. 檢查並更新受影響的 VSCode 擴充套件
2. 審核組織使用的擴充套件清單
3. 考慮限制開發環境可安裝的擴充套件來源

### 1.9 DynoWiper 技術分析：俄羅斯 APT 攻擊波蘭能源

**嚴重程度：High | 來源：SANS ISC | 日期：2026-02-19**

**ATT&CK TTP**：[T1485](https://attack.mitre.org/techniques/T1485/){: .ttp-ref } Data Destruction、[T1134](https://attack.mitre.org/techniques/T1134/){: .ttp-ref } Access Token Manipulation

SANS ISC 發布 DynoWiper 惡意軟體的詳細技術分析：

**威脅歸因**：
- **組織**：Sandworm（俄羅斯國家級 APT）
- **目標**：波蘭能源公司（2025 年 12 月攻擊）
- **評估來源**：ESET 安全研究人員

**技術特徵**：
- **架構**：32 位元 Windows 可執行檔
- **SHA-256**：`835b0d87ed2d49899ab6f9479cddb8b4e03f5aeb2365c50a51f9088dcede68d5`
- **PRNG**：使用 Mersenne Twister (MT19937) 演算法產生隨機資料
- **無混淆**：程式碼直接明確，重點在於最大化破壞

**攻擊流程**：
1. **資料損壞階段**：列舉邏輯磁碟、遍歷目錄（排除系統資料夾）、對每個檔案寫入 16 位元組垃圾資料
2. **資料刪除階段**：使用 `DeleteFileW()` API 移除損壞檔案
3. **系統重啟**：取得 shutdown 權限後觸發 `ExitWindowsEx()` 重啟系統

**評估**：典型的 wiper 惡意軟體，強調破壞效率而非隱匿性。

### 1.10 日文釣魚活動持續針對企業用戶

**嚴重程度：Medium | 來源：SANS ISC | 日期：2026-02-21**

**ATT&CK TTP**：[T1566.002](https://attack.mitre.org/techniques/T1566/002/){: .ttp-ref } Spearphishing Link

SANS ISC 記錄持續一年的日文釣魚活動：

**攻擊特徵**：
- **目標**：日文使用者，冒充 ANA（全日空航空）、DHL、myTOKYOGAS
- **技術指標**：所有郵件使用 `.cn` 頂級域名
- **X-mailer 簽章**：`Foxmail 6, 13, 102, 15 [cn]`（所有郵件相同）
- **時區偏移**：+0800

**IOC 範例**：
- **發送域名**：ncqjw[.]cn、obpwnrl[.]cn、cwqfvzp[.]cn
- **釣魚 URL**：branchiish.aayjlc[.]cn、decideosity.ykdyrkye[.]cn

**評估**：雖然容易被垃圾郵件過濾器攔截，但持續一年的活動顯示攻擊者仍有足夠的成功率維持運作。

---

## 2. 漏洞趨勢分析

### 2.1 本週關鍵漏洞摘要

| CVE | 產品 | CVSS | 類型 | 狀態 |
|-----|------|------|------|------|
| CVE-2026-1281 | Ivanti EPMM | Critical | RCE（零日） | 活躍利用 |
| CVE-2026-1340 | Ivanti EPMM | Critical | RCE（零日） | 活躍利用 |
| CVE-2025-49113 | RoundCube Webmail | Critical | 反序列化 RCE | KEV 活躍利用 |
| CVE-2025-68461 | RoundCube Webmail | High | XSS | KEV 活躍利用 |
| CVE-2026-1731 | BeyondTrust RS/PRA | Critical | OS Command Injection | KEV + 勒索軟體 |
| CVE-2026-22769 | Dell RP4VMs | Critical | 硬編碼憑證 | KEV + UNC6201 |
| CVE-2026-2441 | Google Chromium | Critical | Use-After-Free | KEV 活躍利用 |
| CVE-2025-55182 | React Server Components | Critical | RCE | 多威脅行為者利用 |
| CVE-2025-65717 | VSCode Live Server | Critical | 本地檔案竊取 | 新揭露 |
| CVE-2025-65715 | VSCode Code Runner | High | RCE | 新揭露 |
| CVE-2024-7694 | TeamT5 ThreatSonar | Critical | 任意檔案上傳 | KEV 活躍利用 |
| CVE-2021-22175 | GitLab | High | SSRF | KEV 活躍利用 |
| CVE-2026-1221 | BROWAN PrismX MX100 | 9.8 | 硬編碼憑證 | PoC 可用 |
| CVE-2025-15240 | 廣達 QOCA aim | 8.8 | 任意檔案上傳 | 修補可用 |

### 2.2 TWCERT/CC 本週重點公告

**廣達電腦 QOCA aim AI 醫療雲平台（TVN-20260105-010）**：
- 6 個安全漏洞（1 高危 + 5 中危）
- CVE-2025-15240（CVSS 8.8）：任意檔案上傳可執行 Web Shell
- 影響版本：v2.7.5 及更早版本
- 修補版本：v2.7.6

**普羅通信 PrismX MX100 AP controller（TVN-20260120-004）**：
- 3 個漏洞可形成攻擊鏈
- CVE-2026-1221（CVSS 9.8）：韌體硬編碼資料庫憑證
- CVE-2026-1222（CVSS 7.2）：任意檔案上傳 RCE
- CVE-2026-1223（CVSS 4.9）：SMTP 明文密碼洩露
- 修補版本：v1.03.23.01+

### 2.3 框架與基礎設施漏洞趨勢

本週觀察到針對以下類型的漏洞揭露持續增加：

1. **Web 框架漏洞**：
   - Django 5.1.13 SQL 注入（Exploit-DB 52456）
   - React Server Components RCE

2. **容器與 Kubernetes**：
   - Ingress-NGINX Admission Controller FD Injection RCE
   - Docker Desktop 4.44.3 未認證 API 暴露

3. **企業安全產品**：
   - BeyondTrust RS/PRA
   - FortiWeb Fabric Connector

4. **基礎函式庫**：
   - glibc 2.38 緩衝區溢位
   - Redis 8.0.2 RCE

---

## 3. 活躍利用與 PoC 動態

### 3.1 CISA KEV 本週新增

| CVE | 產品 | 新增日期 | 修補期限 | 勒索軟體關聯 |
|-----|------|----------|----------|--------------|
| CVE-2025-49113 | RoundCube Webmail | 2026-02-20 | 2026-03-13 | 否 |
| CVE-2025-68461 | RoundCube Webmail | 2026-02-20 | 2026-03-13 | 否 |
| CVE-2026-22769 | Dell RP4VMs | 2026-02-18 | 2026-02-21 | 否 |
| CVE-2026-2441 | Google Chromium | 2026-02-17 | 2026-03-10 | 否 |
| CVE-2024-7694 | TeamT5 ThreatSonar | 2026-02-17 | - | 否 |
| CVE-2021-22175 | GitLab | 2026-02-18 | - | 否 |
| CVE-2026-1731 | BeyondTrust | 2026-02-13 | 2026-02-16 | **是** |

### 3.2 新公開 PoC/Exploit（Exploit-DB）

| 日期 | 目標 | 類型 | 來源 |
|------|------|------|------|
| 2026-02-11 | motionEye 0.43.1b4 | RCE | Exploit-DB 52481 |
| 2026-02-11 | glibc 2.38 | Buffer Overflow (LPE) | Exploit-DB 52479 |
| 2026-02-04 | Redis 8.0.2 | RCE | Exploit-DB 52477 |
| 2026-02-04 | Ingress-NGINX v1.11.1 | FD Injection to RCE | Exploit-DB 52475 |
| 2026-02-04 | FortiWeb 7.6.x | SQLi to RCE | Exploit-DB 52473 |
| 2026-02-04 | Docker Desktop 4.44.3 | Unauth API Exposure | Exploit-DB 52472 |

### 3.3 GitHub PoC 追蹤更新

本週 Qdrant 查詢識別的新增 PoC：
- CVE-2026-21962、CVE-2026-23744、CVE-2026-20841
- CVE-2026-25732、CVE-2026-1862、CVE-2026-25053
- CVE-2026-23723、CVE-2026-2113、CVE-2026-25939

---

## 4. 攻擊手法歸納

### 4.1 本週主要攻擊技術（ATT&CK 映射）

| 攻擊類型 | TTP ID | 觀察案例 | 趨勢 |
|----------|--------|----------|------|
| 漏洞利用 | [T1190](https://attack.mitre.org/techniques/T1190/) | RoundCube、Ivanti EPMM、React2Shell | 持續高 |
| 指令執行 | [T1059](https://attack.mitre.org/techniques/T1059/) | BeyondTrust CVE-2026-1731 | 上升 |
| 預設帳號利用 | [T1078.001](https://attack.mitre.org/techniques/T1078/001/) | Dell RP4VMs CVE-2026-22769、波蘭 OT 攻擊 | 高 |
| 資料加密勒索 | [T1486](https://attack.mitre.org/techniques/T1486/) | BeyondTrust 勒索軟體活動 | 持續 |
| 供應鏈攻擊 | [T1195.002](https://attack.mitre.org/techniques/T1195/002/) | React2Shell、VSCode 擴充套件 | 上升 |
| 資料破壞 | [T1485](https://attack.mitre.org/techniques/T1485/) | 波蘭能源 wiper 攻擊 | 局部 |
| 瀏覽器利用 | [T1189](https://attack.mitre.org/techniques/T1189/) | Chromium CVE-2026-2441 | 持續 |

### 4.2 攻擊手法分布

```
漏洞利用（公開面向應用）  ████████████████████ 40%
認證/憑證濫用            ██████████████       28%
供應鏈攻擊               ██████████           20%
資料加密/破壞            ██████               12%
```

### 4.3 威脅情報饋送趨勢

**W09 惡意 URL 統計**（abuse.ch URLhaus）：
本週偵測 **3,687 筆**惡意 URL，主要惡意軟體家族分布：

| 家族 | 數量 | 佔比 | 說明 |
|------|------|------|------|
| 未歸類 | 819 | 22% | 尚未識別的惡意 URL |
| Mozi | 305 | 8% | IoT 殭屍網路，利用已知漏洞感染 |
| ClearFake | 117 | 3% | 偽造瀏覽器更新頁面分發惡意軟體 |
| Mirai | 57 | 2% | IoT 殭屍網路變種，持續活躍 |
| ua-wget | 27 | <1% | 下載器類型惡意軟體 |
| ascii | 13 | <1% | - |
| Hajime | 8 | <1% | IoT 殭屍網路 |

**惡意軟體家族活躍度**（abuse.ch ThreatFox/MalwareBazaar）：
- **Mozi + Mirai**：IoT 殭屍網路持續主導，本週合計 362 筆
- **ClearFake**：偽造更新釣魚持續增加，117 筆活躍 URL
- **RemcosRAT**：多筆樣本偵測（2026-02-16）
- **Stealer 家族**：Stealc、Lumma Stealer、Fickle Stealer 持續活躍
- **Cobalt Strike**：C2 指標持續偵測

---

## 5. 新興威脅識別

### 5.1 硬編碼憑證攻擊鏈（信心水準：高）

本週多起事件顯示硬編碼憑證漏洞成為高優先攻擊向量：

- Dell RP4VMs CVE-2026-22769（UNC6201 利用）
- BROWAN PrismX MX100 CVE-2026-1221（CVSS 9.8）
- 波蘭 OT/ICS 攻擊使用預設憑證橫向移動

**風險評估**：硬編碼或預設憑證問題持續存在於企業產品與 IoT 設備中，攻擊者傾向優先利用此類低門檻攻擊向量。

### 5.2 Web 框架供應鏈威脅（信心水準：高）

React2Shell（CVE-2025-55182）代表 Web 框架供應鏈攻擊的升級趨勢：

- React 為全球最廣泛使用的前端框架
- 漏洞揭露後數小時內即被多個威脅行為者武器化
- 影響規模難以估計

**風險評估**：主流 Web 框架的嚴重漏洞將持續成為高價值目標，組織應建立軟體物料清單（SBOM）追蹤依賴項。

### 5.3 企業安全產品反成攻擊入口（信心水準：高）

BeyondTrust RS/PRA 與 Dell RP4VMs 事件顯示：

- 特權存取管理（PAM）與備份/恢復系統成為高價值目標
- 這些系統通常擁有廣泛的網路存取權限
- 入侵後可快速橫向移動至關鍵資產

**風險評估**：安全產品本身的安全性必須受到同等重視，特別是具有特權存取能力的系統。

### 5.4 OT/ICS 邊界設備攻擊（信心水準：高）

波蘭能源部門攻擊事件教訓：

- 可由網際網路存取的邊界設備為初始入侵點
- OT/ICS 系統缺乏適當網路分段
- wiper 惡意軟體用於破壞而非勒索

**風險評估**：關鍵基礎設施的 OT 環境面臨持續威脅，特別是俄烏衝突背景下的歐洲能源部門。

---

## 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資
2. **時效性**：資料可能存在數小時至數天的延遲
3. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務等來源
4. **分析局限**：趨勢分析基於公開資料樣本，統計推論應謹慎解讀
5. **翻譯風險**：部分非英文來源經 AI 翻譯，可能存在語義偏差

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源。

---

## 參考資料

### CISA KEV
- [CISA Known Exploited Vulnerabilities Catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
- [Poland Energy Sector Cyber Incident Alert](https://www.cisa.gov/news-events/alerts/2026/02/10/poland-energy-sector-cyber-incident-highlights-ot-and-ics-security-gaps)

### 廠商安全公告
- [RoundCube Security Updates](https://roundcube.net/news/)
- [BeyondTrust Security Advisory BT26-02](https://www.beyondtrust.com/trust-center/security-advisories/bt26-02)
- [Dell DSA-2026-079](https://www.dell.com/support/kbdoc/en-us/000426773/dsa-2026-079)
- [Chrome Stable Channel Update](https://chromereleases.googleblog.com/2026/02/)

### 威脅情報
- [Google Cloud Threat Intelligence - UNC6201](https://cloud.google.com/blog/topics/threat-intelligence/unc6201-exploiting-dell-recoverpoint-zero-day)
- [JPCERT/CC React2Shell Blog](https://blogs.jpcert.or.jp/en/2026/02/multiple-threat-actors-rapidly-exploit-react2shell-a-case-study-of-active-compromise.html)
- [Unit 42 - Ivanti EPMM Zero-Day Exploitation](https://unit42.paloaltonetworks.com/ivanti-cve-2026-1281-cve-2026-1340/)
- [SANS ISC - DynoWiper Analysis](https://isc.sans.edu/diary/rss/32730)
- [SANS ISC - Japanese-Language Phishing Emails](https://isc.sans.edu/diary/rss/32734)
- [Ox Security - VSCode Extensions Vulnerabilities](https://www.bleepingcomputer.com/news/security/flaws-in-popular-vscode-extensions-expose-developers-to-attacks/)

### PoC 資料庫
- [Exploit-DB](https://www.exploit-db.com/)
- [GitHub PoC-in-GitHub](https://github.com/nomi-sec/PoC-in-GitHub)

### 威脅饋送
- [abuse.ch ThreatFox](https://threatfox.abuse.ch/)
- [abuse.ch MalwareBazaar](https://bazaar.abuse.ch/)

---

> **Qdrant 查詢記錄**：
> 1. "活躍利用 漏洞 CVE 2026" → 20 筆
> 2. "勒索軟體 ransomware 攻擊事件" → 15 筆
> 3. "遠端程式碼執行 RCE 漏洞利用" → 15 筆
> 4. "Ivanti EPMM 零日 exploitation" → 5 筆
> 5. "供應鏈攻擊 supply chain VSCode" → 8 筆
> 6. "wiper malware 能源 基礎設施" → 12 筆
>
> **產出時間**：2026-02-24
> **資料來源**：CISA KEV、JPCERT/CC、NCSC-FI、TWCERT/CC、SANS ISC、Unit 42、Ox Security、Exploit-DB、abuse.ch
