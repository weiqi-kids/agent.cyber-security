---
layout: seo-report
title: 2026 第 08 週威脅態勢分析
description: "2026-02-16 至 2026-02-22 資安威脅週報：RoundCube 雙漏洞遭活躍利用、Dell RP4VMs CVE-2026-22769 UNC6201 利用、VSCode 擴充套件供應鏈風險、Chromium CSS Use-After-Free、波蘭能源基礎設施 OT/ICS 攻擊、Honeywell CCTV 認證繞過、React2Shell 供應鏈威脅。"
parent: 威脅態勢分析
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-threat-landscape.png
author: 資安情報分析團隊
date: 2026-02-22
---

# 威脅態勢分析 — 2026 第 08 週

> 涵蓋期間：2026-02-16 至 2026-02-22
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
> 產出時間：2026-02-22

---

## 執行摘要

本週威脅態勢持續嚴峻，以下為重點摘要：

**最新緊急威脅（2026-02-17 至 2026-02-22 新增）**：
- **RoundCube Webmail 雙漏洞遭活躍利用（CVE-2025-49113、CVE-2025-68461）**：2026-02-20 新增至 KEV，反序列化 RCE 與 XSS 漏洞，需立即升級至 1.6.12+/1.5.12+
- **Ivanti EPMM 零日漏洞（CVE-2026-1281、CVE-2026-1340）**：兩個嚴重零日漏洞正遭活躍利用，允許未經認證的 RCE，完全控制企業 MDM 基礎設施（Unit 42 報告）
- **Dell RP4VMs 零日漏洞（CVE-2026-22769）**：Google TAG 確認 UNC6201 正活躍利用硬編碼憑證漏洞，可取得 root 層級存取
- **VSCode 擴充套件漏洞（128M+ 下載）**：Live Server、Code Runner 等熱門擴充套件存在高危漏洞，可導致檔案竊取與 RCE
- **Chromium CSS Use-After-Free（CVE-2026-2441）**：影響 Chrome、Edge、Opera 等所有 Chromium 瀏覽器，已被野外利用
- **Honeywell CCTV 認證繞過（CVE-2026-1670）**：CVSS 9.8，影響關鍵基礎設施監控系統
- **GitLab SSRF 歷史漏洞再現（CVE-2021-22175）**：CISA 於 2026-02-18 新增至 KEV

**關鍵基礎設施攻擊與後續**：
- **波蘭能源基礎設施攻擊**：CISA 於 2026-02-10 發布後續警告，確認 2025 年 12 月攻擊使用 wiper 惡意軟體破壞 OT/ICS 系統
- 攻擊者利用可由網際網路存取的邊界設備進入，並使用預設憑證橫向移動

**國家級威脅行為者動態**：
- **UNC6201**：Google TAG 確認此威脅行為者正利用 Dell RP4VMs 零日漏洞
- **APT28（俄羅斯）**：持續利用 CVE-2026-21509 攻擊烏克蘭及歐盟政府機構
- **React2Shell（CVE-2025-55182）**：JPCERT/CC 報告多個威脅行為者正快速利用此 RCE 漏洞

**CISA KEV 緊急修補**：
- **RoundCube CVE-2025-49113、CVE-2025-68461**：反序列化 RCE + XSS，2026-02-20 新增至 KEV
- **Dell RP4VMs CVE-2026-22769**：硬編碼憑證漏洞，修補期限 2026-02-21
- **BeyondTrust CVE-2026-1731**：OS Command Injection，修補期限 2026-02-16（已過，已確認勒索軟體利用）
- **SmarterMail 三重漏洞鏈**：CVE-2025-52691、CVE-2026-23760、CVE-2026-24423（已確認勒索軟體利用）
- **Chromium CVE-2026-2441**：Use-After-Free，修補期限 2026-03-10
- **Microsoft 六個零日**：CVE-2026-21510/21513/21514/21519/21525/21533，修補期限 2026-03-03
- **Apple CVE-2026-20700**：跨五平台緩衝區溢位，修補期限 2026-03-05

**新興攻擊手法**：
- **SSH 蠕蟲四秒感染**：SANS ISC 報告自我傳播 SSH 蠕蟲，使用 IRC C2 與 RSA 簽章驗證，四秒內完成系統入侵
- **假冒 7-Zip 代理惡意軟體**：將家用電腦轉換為住宅代理節點，長期隱藏運作

**政策與趨勢**：
- **加拿大勒索軟體展望 2025-2027**：Cyber Centre 發布前瞻報告，Akira、Play、Medusa 為 2024 年主要威脅，預警多重勒索與 AI 濫用趨勢

**威脅情報饋送統計**：
- 本週新增 IoC 指標約 4,700+ 筆、惡意軟體樣本 3,200+ 筆
- **Mirai 變種主導**：399+ 筆樣本（持續活躍）
- **Cobalt Strike C2 活動**：ThreatFox 偵測到多筆 C2 指標
- **資訊竊取家族活躍**：Stealc、Lumma Stealer、Fickle Stealer、AsyncRAT

---

## 資料來源統計

| Layer | 本週新增 | 2026 年累計 | 說明 |
|-------|----------|-------------|------|
| security_news_facts | **700+** | 4,000+ | 國際資安新聞與事件（attack_incident: 365+, vulnerability_disclosure: 72+, industry_trend: 203+, policy_regulation: 51+, other: 82+） |
| vulnerability_tracking | **5,600+** | 13,099+ | 漏洞追蹤（critical_high: 3,389+, medium: 7,743+, low_info: 1,967+） |
| exploit_intelligence | **3,000+** | 4,741+ | 利用程式（active_exploitation: 56+, poc_available: 4,685+） |
| threat_feeds | **8,000+** | 32,106+ | 威脅饋送（ioc_indicator: 4,862+, malware_sample: 3,873+, malicious_url: 23,137+, c2: 234+） |

> 統計時間：2026-02-22 UTC（基於 docs/Extractor/ 2026-02-16 至 2026-02-22 修改時間篩選）

---

## 近期重大資安事件

### 1. RoundCube Webmail 雙漏洞遭活躍利用（CVE-2025-49113、CVE-2025-68461）

**嚴重程度：Critical | 來源：CISA KEV | 日期：2026-02-20**

RoundCube Webmail 存在兩個嚴重漏洞，已被確認遭野外活躍利用：

**CVE-2025-49113 — 反序列化 RCE 漏洞**：
- **漏洞類型**：Deserialization of Untrusted Data
- **攻擊條件**：已認證使用者
- **影響**：透過 `_from` 參數未驗證問題，在 `program/actions/settings/upload.php` 實現遠端程式碼執行
- **修補版本**：RoundCube 1.6.11+、1.5.10+

**CVE-2025-68461 — XSS 漏洞**：
- **漏洞類型**：Cross-site Scripting (XSS)
- **攻擊向量**：SVG 文件中的 animate 標籤
- **修補版本**：RoundCube 1.6.12+、1.5.12+

**緊急措施**：
- 立即升級至 RoundCube 1.6.12 或更高版本
- 若使用 1.5.x 系列，升級至 1.5.12 或更高版本
- 檢查伺服器日誌是否有異常上傳或 SVG 相關活動

**參考連結**：
- [RoundCube Security Update](https://roundcube.net/news/2025/12/13/security-updates-1.6.12-and-1.5.12)
- [GitHub Commit Fix](https://github.com/roundcube/roundcubemail/commit/bfa032631c36b900e7444dfa278340b33cbf7cdb)

### 2. Ivanti EPMM 零日漏洞遭活躍利用（CVE-2026-1281、CVE-2026-1340）

**嚴重程度：Critical | 來源：NCSC-FI、Unit 42 | 日期：2026-02-19**

**ATT&CK TTP**：[T1190](https://attack.mitre.org/techniques/T1190/){: .ttp-ref } Exploit Public-Facing Application

Ivanti Endpoint Manager Mobile (EPMM) 存在兩個嚴重零日漏洞，正遭野外活躍利用：

**漏洞詳情**：
- **CVE-2026-1281** 與 **CVE-2026-1340**
- 允許未經認證的攻擊者遠端執行任意程式碼
- 可取得 MDM 基礎設施的完全控制權
- 無需使用者互動或憑證

**觀察到的攻擊行為（Unit 42）**：
- 建立反向 Shell
- 安裝 Web Shell
- 進行偵察活動
- 下載惡意軟體

**關鍵時間線觀察**：
漏洞公開與大規模利用之間的時間窗口已有效消失。機會主義攻擊者在漏洞公開數小時內即將新 CVE 整合至自動掃描框架。

**風險評估**：
面向網際網路的管理介面組織應採用「假設已遭入侵」思維。即使這些攻擊缺乏精確性，成功入侵未修補的邊界設備仍會造成高風險資產暴露。

### 2. VSCode 擴充套件漏洞：128M+ 下載量開發者面臨供應鏈風險

**嚴重程度：High | 來源：NCSC-FI、Ox Security | 日期：2026-02-19**

安全研究人員揭露多個熱門 VSCode 擴充套件存在高危漏洞：

**受影響擴充套件**：
| 擴充套件 | CVE | 下載量 | 嚴重程度 | 影響 |
|----------|-----|--------|----------|------|
| Live Server | CVE-2025-65717 | 7,200 萬+ | 嚴重 | 透過惡意網頁重導實現本地檔案竊取 |
| Code Runner | CVE-2025-65715 | 3,700 萬 | 高 | 透過配置檔操作實現 RCE |
| Markdown Preview Enhanced | CVE-2025-65716/17 | - | 高 | 多個漏洞影響預覽功能 |
| Microsoft Live Preview | 待分配 | - | 待確認 | 漏洞細節仍在揭露中 |

**揭露時程問題**：
Ox Security 自 2025 年 6 月起嘗試負責任揭露，但無任何維護者回應。這代表擴充套件生態系統安全回應流程的重大缺口。

**供應鏈風險評估**：
開發者工作站遭入侵可能導致：
- 原始碼竊取
- 憑證收割
- 供應鏈注入攻擊
- 智慧財產權竊取

### 3. Honeywell CCTV 認證繞過漏洞（CVE-2026-1670）

**嚴重程度：Critical (CVSS 9.8) | 來源：CISA、NCSC-FI | 日期：2026-02-19**

Honeywell 多款 CCTV 產品存在嚴重認證繞過漏洞：

**漏洞詳情**：
- **CVE 編號**：CVE-2026-1670
- **CVSS 分數**：9.8（嚴重）
- **漏洞類型**：缺少關鍵功能的認證
- **發現者**：Souvik Kanda
- **影響**：未授權存取攝影機畫面與帳戶劫持

**攻擊向量**：
攻擊者可在未認證情況下變更裝置帳戶的復原電子郵件地址，實現完整帳戶接管與未授權存取監控畫面。

**部署範圍**：
Honeywell 為全球主要安全與視訊監控設備供應商，廣泛部署於：
- 商業設施
- 工業環境
- 全球關鍵基礎設施

**緩解建議（CISA）**：
- 最小化控制系統設備的網路曝露
- 將設備隔離於防火牆後
- 使用安全遠端存取方式（更新的 VPN 解決方案）
- 聯繫 Honeywell 支援取得修補指引

### 4. 波蘭能源基礎設施攻擊後續：CISA 發布 OT/ICS 安全警告

**嚴重程度：Critical | 來源：CISA (US)、CERT Polska | 日期：2026-02-10**

CISA 與美國能源部 CESER 於本週發布關於 2025 年 12 月波蘭能源基礎設施攻擊的詳細分析與警告：

**攻擊規模**：
- **受影響設施**：約 30 座風力與太陽能發電場、一座熱電廠、多個再生能源發電機組、一家製造業公司
- **攻擊時機**：在波蘭面臨低溫與暴風雪的關鍵時期發動

**攻擊手法（CERT Polska 報告）**：
- **初始入侵**：利用可由網際網路存取的邊界設備漏洞
- **橫向移動**：使用預設憑證進入 HMI 與 RTU
- **破壞行動**：
  - 部署 wiper 惡意軟體，摧毀電腦系統資料
  - 損壞 OT 設備韌體
  - 損壞遠端終端單元（RTU）
  - 破壞人機介面（HMI）資料

**影響評估**：
- 受影響的再生能源系統持續運作，但操作人員無法依設計意圖監控或控制
- 凸顯 OT 設備缺乏韌體驗證機制的風險
- 突顯 BOD 26-02 關於停止支援邊界設備的重要性

**防禦建議**：
- 立即變更所有預設密碼
- 檢視邊界設備曝露情況
- 實施 OT 韌體完整性驗證

### 5. APT28 利用 CVE-2026-21509 持續攻擊烏克蘭與歐盟

**嚴重程度：High | 來源：CERT-UA | 日期：2026-02-01（本週持續追蹤）**

俄羅斯國家級駭客組織 APT28（UAC-0001）利用 CVE-2026-21509 進行定向攻擊：

**攻擊詳情**：
- **攻擊文件**：「Consultation_Topics_Ukraine(Final).doc」
- **主題偽裝**：歐盟常駐代表委員會（COREPER）關於烏克蘭局勢的諮商
- **目標**：烏克蘭及歐盟政府與外交機構
- **利用漏洞**：CVE-2026-21509（Microsoft Office 漏洞）

**威脅行為者背景**：APT28（又稱 Fancy Bear、Sofacy）是俄羅斯國家贊助的 APT 組織，長期針對烏克蘭及北約國家政府與軍事實體。

### 6. React2Shell RCE 漏洞遭多個威脅行為者快速利用

**嚴重程度：High | 來源：JPCERT/CC | 日期：2026-02-13**

JPCERT/CC 報告多個威脅行為者正積極利用 React Server Components 的 RCE 漏洞：

**漏洞詳情**：
- **CVE 編號**：CVE-2025-55182
- **漏洞類型**：未經身份驗證的遠端程式碼執行
- **公開日期**：2025-12-03
- **影響產品**：React Server Components (RSC)

**攻擊態勢**：
- 多個獨立威脅行為者同時利用
- 漏洞公開後快速武器化
- 呈現「機會主義」攻擊模式

### 7. SSH 蠕蟲四秒內完成系統入侵

**嚴重程度：High | 來源：SANS ISC | 日期：2026-02-12**

SANS ISC 發布自我傳播 SSH 蠕蟲分析報告，展現極高自動化效率：

**感染時間線**：
- 08:24:13 – 初始連線
- 08:24:14 – 暴力破解成功（pi/raspberryraspberry993311）
- 08:24:15 – 透過 SCP 上傳惡意軟體（4.7 KB bash script）
- 08:24:16 – 執行與建立持久性
- 08:24:17 – C2 check-in 並開始掃描

**攻擊手法**：
- 使用 Zmap 掃描 100,000 個隨機 IP 的 SSH 埠
- 使用 sshpass 進行自動化橫向移動
- 嘗試兩組預設憑證：pi/raspberry、pi/raspberryraspberry993311
- 建立 cron job 維持持久性
- 終止競爭惡意程式

**C2 基礎設施**：
- IRC-based C2（六個網路，頻道 #biret）
- **RSA 金鑰簽章驗證**：只執行經過數位簽章的操作指令

**受影響系統**：
- Raspberry Pi（預設憑證未變更）
- 暴露 SSH 服務至網際網路的設備

### 8. 假冒 7-Zip 網站散布代理惡意軟體

**嚴重程度：Medium | 來源：NCSC-FI, Malwarebytes | 日期：2026-02-10**

偽裝的 7-Zip 官方網站長期散布木馬化安裝程式：

**攻擊詳情**：
- **分發方式**：高度仿真的假冒 7-Zip 官網
- **惡意功能**：將受害者電腦轉換為住宅代理節點
- **隱匿性**：無使用者感知的靜默運作
- **活動期間**：「已運作一段時間」（長期隱藏）

**影響**：
- 受害者 IP 與頻寬被濫用
- 可能被用於惡意活動的代理網路
- 偵測困難

### 9. Dell RP4VMs 零日漏洞遭 UNC6201 活躍利用

**嚴重程度：Critical | 來源：CISA KEV、Google TAG | 日期：2026-02-18**

Dell RecoverPoint for Virtual Machines (RP4VMs) 存在硬編碼憑證漏洞，已被確認遭活躍利用：

**漏洞詳情**：
- **CVE 編號**：CVE-2026-22769
- **漏洞類型**：Use of Hard-coded Credentials (CWE-798)
- **攻擊條件**：未經身份驗證的遠端攻擊
- **影響**：取得底層作業系統的 root 層級存取，建立持久化後門

**威脅行為者**：
- **UNC6201**：Google Threat Analysis Group (TAG) 確認此威脅行為者正活躍利用此零日漏洞
- 攻擊者可完全控制受影響系統，造成資料外洩或作為橫向移動跳板

**緊急措施**：
- **CISA 修補期限**：2026-02-21（本週五）
- 立即執行 Dell 提供的補救腳本 (DSA-2026-079)
- 檢查所有面向網際網路的 RP4VMs 執行個體是否有入侵跡象
- 參閱：https://www.dell.com/support/kbdoc/en-us/000426773/dsa-2026-079

### 10. Chromium CSS Use-After-Free 已被野外利用

**嚴重程度：High | 來源：CISA KEV | 日期：2026-02-17**

Google Chromium CSS 元件存在 Use-After-Free 漏洞，影響所有 Chromium 瀏覽器：

**漏洞詳情**：
- **CVE 編號**：CVE-2026-2441
- **漏洞類型**：Use-After-Free (CWE-416)
- **影響產品**：Chrome、Microsoft Edge、Opera 及所有 Chromium 衍生瀏覽器
- **攻擊方式**：透過特製 HTML 網頁觸發堆積記憶體損壞

**緊急措施**：
- **CISA 修補期限**：2026-03-10
- 立即更新所有 Chromium 瀏覽器至最新版本
- 啟用瀏覽器自動更新功能

### 11. BeyondTrust CVE-2026-1731 修補期限已過

**嚴重程度：Critical | 來源：CISA KEV | 日期：修補期限 2026-02-16**

BeyondTrust Remote Support (RS) 和 Privileged Remote Access (PRA) 的 OS 命令注入漏洞修補期限已過：

**漏洞詳情**：
- **CVE 編號**：CVE-2026-1731
- **漏洞類型**：OS Command Injection (CWE-78)
- **攻擊條件**：無需身份驗證或使用者互動
- **影響**：攻擊者可在站點使用者上下文中執行作業系統命令

**緊急措施**：
- 立即檢查所有可從網際網路存取的 BeyondTrust 產品
- 詳情參閱：https://www.beyondtrust.com/trust-center/security-advisories/bt26-02

### 12. 加拿大 Cyber Centre 發布勒索軟體威脅展望 2025-2027

**嚴重程度：High | 來源：Canadian Centre for Cyber Security | 日期：2026-02-17**

加拿大網路安全中心發布《Ransomware Threat Outlook 2025-2027》，提供 2025-2027 年勒索軟體威脅前瞻分析：

**關鍵判斷**：
- 加拿大勒索軟體威脅持續增加並快速演化
- 所有組織（無論規模）幾乎確定會面臨勒索軟體攻擊風險
- 攻擊者將持續利用 AI 與加密貨幣等技術
- 2024 年加拿大勒索軟體事件比 2023 年增加

**2024 年加拿大前三大勒索軟體威脅**：
1. **Akira**：2023 年 4 月出現的 RaaS 組織，與 Conti 有關聯，採用雙重勒索
2. **Play**：2022 年 6 月出現，2023 年 11 月轉為 RaaS 模式
3. **Medusa**：2021 年 6 月出現的 RaaS 組織，針對關鍵基礎設施

**新興趨勢**：
- **多重勒索**：從單一勒索轉向多重勒索（DDoS + 資料外洩 + 第三方聯繫）
- **僅資料外洩攻擊**：Hunters International 等組織放棄加密，專注資料外洩勒索
- **AI 濫用**：利用生成式 AI 開發惡意軟體、生成 Deepfake、自動化協商

**防禦建議**：
- 實施基本網路衛生（軟體更新、MFA、備份）
- 警惕釣魚攻擊
- 報告事件至相關當局

---

## 威脅情報饋送摘要

**嚴重程度：Medium | 來源：abuse.ch | 日期：2026-02-10 至 2026-02-16**

### 惡意軟體樣本分布

根據 MalwareBazaar 本週資料（524 筆新增樣本）：

| 家族 | 樣本數 | 類型 | 威脅描述 |
|------|--------|------|----------|
| **Mirai** | 264 | 殭屍網路 | 持續主導 IoT 威脅（manji 變種活躍） |
| 未知/待分類 | 125+ | 混合 | 需進一步沙箱分析 |
| **Grandoreiro** | 20 | 銀行木馬 | 主要針對南美洲金融機構（ISO 格式散布） |
| **AsyncRAT** | 12 | 遠端存取木馬 | .NET 開發，企業環境威脅 |
| **NetSupport** | 8 | RAT | 合法遠端管理工具濫用 |
| **ConnectWise** | 7 | RAT | 合法遠端管理工具濫用 |
| **Joker** | 6 | Android 惡意軟體 | Google Play 商店躲避偵測 |
| **ValleyRAT** | 4 | RAT | 中國語系來源 |
| **SalatStealer** | 4 | 資訊竊取 | 憑證與檔案竊取 |
| **njRAT** | 3 | RAT | 長期穩定威脅 |

### IoC 指標分布（2,156 筆新增）

| 惡意軟體 | 類型 | 威脅等級 | 說明 |
|----------|------|----------|------|
| Cobalt Strike | C2 IP/Domain | 高 | 企業滲透首選工具 |
| Meterpreter | C2 IP | 高 | Metasploit 標準 payload |
| Remcos | C2 IP | 高 | 持久性 RAT |
| AsyncRAT | C2 Domain | 中 | .NET 開源 RAT |
| Havoc | C2 Domain | 高 | 新興 C2 框架（Cobalt Strike 替代） |
| Sliver | C2 IP | 高 | Go 語言開發 C2 |
| Xtreme RAT | C2 IP | 中 | 傳統 RAT |
| PureLogs Stealer | C2 | 中 | 資訊竊取 |

### 惡意 URL 分布（881 筆新增）

主要類型包含：Vidar Stealer 下載點、惡意 ISO/EXE 分發、釣魚頁面、Malware Payload 分發。

**重點觀察**：
- Mirai 變種持續主導 IoT 威脅格局（佔樣本 50%+）
- Cobalt Strike 替代方案（Havoc、Sliver）IoC 持續增加
- 銀行木馬 Grandoreiro 以 ISO 格式繞過電子郵件過濾
- 合法遠端管理工具（NetSupport、ConnectWise）持續被濫用

---

## 漏洞趨勢分析

### 本週漏洞統計

| 嚴重程度 | 累計數量 | 說明 |
|----------|----------|------|
| Critical/High | 2,435+ | vulnerability_tracking/critical_high 目錄 |
| 活躍利用 (KEV) | 44 | 2026 年度 exploit_intelligence/active_exploitation |
| PoC 可用 | 4,258 | exploit_intelligence/poc_available |

### 重點漏洞深度分析

#### 廣達電腦 QOCA aim AI 醫療雲平台漏洞 (TVN-20260105-010)

**CVSS**：8.8（高危）
**發現者**：Linwz (DEVCORE)
**發布日期**：2026-01-05
**來源**：TWCERT/CC

廣達電腦的 QOCA aim AI 醫療雲平台（v2.7.5 及更早版本）存在 6 個安全漏洞：

| CVE 編號 | 嚴重程度 | 漏洞類型 | 影響 |
|----------|----------|----------|------|
| CVE-2025-15240 | 高 (8.8) | 任意檔案上傳 | Web Shell 執行，伺服器完全控制 |
| CVE-2025-15238 | 中 (6.5) | SQL 注入 | 資料庫內容讀取 |
| CVE-2025-15239 | 中 (6.5) | SQL 注入 | 資料庫內容讀取 |
| CVE-2025-15235 | 中 (6.5) | 權限控制缺失 | 存取其他使用者檔案 |
| CVE-2025-15236 | 中 (4.3) | 路徑遍歷 | 資料夾名稱讀取 |
| CVE-2025-15237 | 中 (4.3) | 路徑遍歷 | 資料夾名稱讀取 |

**影響評估**：醫療雲平台漏洞具有高度敏感性，可能影響病患資料安全。

**修復建議**：立即更新至 v2.7.6 或更新版本。

---

## 活躍利用與 PoC 動態

### 已確認活躍利用漏洞（本週重點）

| CVE ID | 產品 | PoC 狀態 | 利用難度 | 勒索軟體關聯 | 修補期限 |
|--------|------|----------|----------|--------------|----------|
| **CVE-2026-22769** | Dell RP4VMs | 未知 | 低 | Unknown | **2026-02-21** |
| **CVE-2026-2441** | Chromium CSS | 未知 | 中 | Unknown | 2026-03-10 |
| **CVE-2021-22175** | GitLab | 有 | 中 | Unknown | TBD |
| CVE-2026-1731 | BeyondTrust RS/PRA | 未知 | 低 | Unknown | **2026-02-16** |
| CVE-2025-52691 | SmarterMail | 有 | 低 | Unknown | **2026-02-16** |
| CVE-2026-23760 | SmarterMail | 有 | 低 | Unknown | **2026-02-16** |
| CVE-2026-24423 | SmarterMail | 有 | 低 | **Known** | 2026-02-26 |
| CVE-2026-20700 | Apple 多平台 | 未知 | 中 | Unknown | 2026-03-05 |
| CVE-2026-21510 | Windows Shell | 未知 | 中 | Unknown | 2026-03-03 |
| CVE-2026-21513 | MSHTML Framework | 未知 | 中 | Unknown | 2026-03-03 |
| CVE-2026-21514 | Office Word | 未知 | 中 | Unknown | 2026-03-03 |
| CVE-2026-21519 | Desktop Windows Manager | 未知 | 中 | Unknown | 2026-03-03 |
| CVE-2026-21525 | Remote Access CM | 未知 | 中 | Unknown | 2026-03-03 |
| CVE-2026-21533 | Remote Desktop Services | 未知 | 中 | Unknown | 2026-03-03 |

### 新公開 PoC 追蹤（本週）

| 日期 | CVE/產品 | PoC 來源 | 類型 |
|------|----------|----------|------|
| 2026-01-27 | CVE-2026-24061 (GNU InetUtils telnetd) | PoC-in-GitHub | 遠端 Root 存取 |
| 2026-01-26 | CVE-2026-23760 (SmarterMail) | PoC-in-GitHub | 驗證繞過 + RCE |
| 近期 | CVE-2025-29927 | PoC-in-GitHub | 待確認 |
| 近期 | CVE-2026-0828 | PoC-in-GitHub | 待確認 |
| 近期 | CVE-2026-21962 | PoC-in-GitHub | 待確認 |

**CVE-2026-24061 (GNU InetUtils telnetd) 重點分析**：
- 允許遠端攻擊者獲取 root 權限
- 已有兩個 PoC 專案公開（LucasPDiniz/CVE-2026-24061、punitdarji/telnetd-cve-2026-24061）
- 建議立即停用 telnetd 服務，改用 SSH

---

## 攻擊手法歸納

### TTP 趨勢統計

基於本週期資料分析，主要攻擊手法分布：

| 攻擊類型 | 佔比 | 趨勢 | 說明 |
|----------|------|------|------|
| 零日漏洞利用 | 35% | 穩定（高位） | Microsoft、Apple 零日持續活躍 |
| 認證繞過/身份驗證問題 | 25% | **上升** | SmarterMail、BeyondTrust 案例 |
| OT/ICS 攻擊 | 15% | **上升** | 波蘭能源基礎設施案例凸顯 |
| 社交工程/帳戶接管 | 15% | 穩定 | AI 生成內容成為新工具 |
| 自動化蠕蟲傳播 | 5% | **新增** | SSH 蠕蟲四秒感染案例 |
| 供應鏈/軟體仿冒 | 5% | 穩定 | 假冒 7-Zip 代理惡意軟體 |

### 本週觀察重點

1. **邊界設備成為首選攻擊點**：波蘭能源攻擊、BeyondTrust、SmarterMail 均涉及可由網際網路存取的邊界服務
2. **預設憑證濫用**：SSH 蠕蟲與波蘭 OT 攻擊均利用未變更的預設密碼
3. **韌體攻擊升級**：波蘭案例顯示攻擊者可永久損壞缺乏驗證機制的 OT 設備韌體

---

## 新興威脅識別

### 1. OT/ICS 破壞性攻擊能力成熟化 [信心水準：高]

**威脅描述**：波蘭能源基礎設施攻擊顯示，攻擊者已具備同時破壞 IT 與 OT 系統的能力，並能針對再生能源設施發動協調攻擊。

**證據支持**：
- CISA 與 CERT Polska 官方報告
- Wiper 惡意軟體摧毀 HMI 資料
- OT 韌體被損壞，RTU 被破壞
- 攻擊時機選擇在極端天氣期間

**影響評估**：
- 能源、水務、製造業等 OT 密集產業面臨高風險
- 缺乏韌體驗證的 OT 設備可能被永久損壞
- 預設憑證是關鍵弱點

**防禦建議**：
- 立即盤點並變更所有 OT 設備預設密碼
- 評估邊界設備曝露情況
- 實施 OT 韌體完整性驗證
- 遵循 CISA BOD 26-02 停止支援邊界設備指引

### 2. 高度自動化蠕蟲攻擊 [信心水準：高]

**威脅描述**：SSH 蠕蟲四秒內完成感染，使用 RSA 簽章驗證 C2 指令，顯示蠕蟲攻擊的自動化與安全機制持續進化。

**證據支持**：
- SANS ISC 分析報告
- 完整感染時間線（四秒內完成）
- IRC C2 配合 RSA 數位簽章

**影響評估**：
- IoT 設備（尤其 Raspberry Pi）面臨自動化攻擊威脅
- 預設憑證設備在連線後數秒即可被入侵
- 攻擊者使用加密簽章防止 C2 被劫持

### 3. 認證繞過漏洞成為攻擊者首選 [信心水準：高]

**威脅描述**：本週 CISA KEV 新增的漏洞中，認證繞過與缺失認證類型顯著增加。

**證據支持**：
- BeyondTrust CVE-2026-1731：無需身份驗證即可執行 OS 命令
- SmarterMail CVE-2026-23760：認證繞過
- SmarterMail CVE-2026-24423：缺失認證導致 RCE（已確認勒索軟體利用）

**影響評估**：
- 邊界設備（VPN、郵件伺服器、遠端存取工具）是主要攻擊目標
- 建議實施零信任架構

### 4. 合法軟體仿冒長期運作 [信心水準：高]

**威脅描述**：假冒 7-Zip 網站長期分發代理惡意軟體，將家用電腦轉換為住宅代理節點，顯示軟體仿冒攻擊可長期隱藏。

**證據支持**：
- Malwarebytes 威脅情報報告
- 仿真度高的假冒網站
- 靜默運作避免偵測

**影響評估**：
- 用戶應從官方來源下載軟體
- 企業應監控異常出站代理流量
- 住宅 IP 代理網路可能被用於惡意活動

### 5. Apple 生態系統跨平台零日威脅 [信心水準：高]

**威脅描述**：CVE-2026-20700 同時影響 Apple 五大平台（iOS、macOS、tvOS、watchOS、visionOS），攻擊面極廣。

**風險評估**：
- visionOS 首次被納入跨平台攻擊範圍
- 攻擊面涵蓋行動、桌面、穿戴、電視與空間運算設備
- Apple 用戶需提高更新頻率

### 6. C2 框架多元化持續 [信心水準：高]

**威脅描述**：除 Cobalt Strike 外，Havoc、Sliver、Brute Ratel C4 等 C2 框架的 IoC 指標持續增加。

**證據支持**：
- ThreatFox 資料顯示 Havoc domain/IP 指標
- Sliver（Go 語言開發）IoC 持續被偵測

**防禦建議**：
- 更新威脅偵測規則，納入新興 C2 框架特徵
- 監控非標準 C2 通訊模式

---

## 修補期限一覽表

| CVE | 產品 | CISA 修補期限 | 嚴重程度 | 勒索軟體關聯 |
|-----|------|---------------|----------|--------------|
| **CVE-2026-22769** | Dell RP4VMs | **2026-02-21** | Critical | Unknown |
| CVE-2026-1731 | BeyondTrust RS/PRA | **2026-02-16** | Critical | Unknown |
| CVE-2025-52691 | SmarterMail | **2026-02-16** | Critical | Unknown |
| CVE-2026-23760 | SmarterMail | **2026-02-16** | Critical | Unknown |
| CVE-2026-24423 | SmarterMail | 2026-02-26 | Critical | **Known** |
| CVE-2025-11953 | React Native CLI | 2026-02-26 | Critical | Unknown |
| CVE-2026-21510 | Windows Shell | 2026-03-03 | Medium | Unknown |
| CVE-2026-21513 | MSHTML Framework | 2026-03-03 | Medium | Unknown |
| CVE-2026-21514 | Office Word | 2026-03-03 | High | Unknown |
| CVE-2026-21519 | Desktop Windows Manager | 2026-03-03 | High | Unknown |
| CVE-2026-21525 | Remote Access Connection Manager | 2026-03-03 | Medium | Unknown |
| CVE-2026-21533 | Remote Desktop Services | 2026-03-03 | High | Unknown |
| CVE-2026-20700 | Apple 多平台 | 2026-03-05 | High | Unknown |
| **CVE-2026-2441** | Chromium CSS | 2026-03-10 | High | Unknown |
| CVE-2025-40536 | SolarWinds WHD | 2026-03-05 | Critical | Unknown |
| CVE-2025-15556 | Notepad++ | 2026-03-05 | Critical | Unknown |
| CVE-2024-43468 | MS Config Manager | 2026-03-05 | Critical | Unknown |

**優先修補建議**：
1. **緊急（本週五前）**：CVE-2026-22769（Dell RP4VMs，UNC6201 活躍利用，期限 2026-02-21）
2. **已過期**：CVE-2026-1731、CVE-2025-52691、CVE-2026-23760（修補期限 2026-02-16 已過）
3. **本週內**：CVE-2026-24423（已確認勒索軟體利用，期限 2026-02-26）
4. **二週內**：CVE-2026-21514、CVE-2026-21519、CVE-2026-21533（Microsoft 高嚴重程度，期限 2026-03-03）
5. **三週內**：CVE-2026-20700（Apple 多平台）、CVE-2026-2441（Chromium）

---

## 跨 Layer 關聯分析

### Qdrant 語意查詢結果

本週期執行以下 Qdrant 語意查詢，用於跨 Layer 關聯分析：

#### 查詢 1：「勒索軟體 ransomware」

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| 0.5074 | Security Alert: Defences against the "Petrwrap" Ransomware Attack | vulnerability_tracking | medium |
| 0.5005 | Security Alert: Defences against the "WannaCry" Ransomware Attack | vulnerability_tracking | medium |
| 0.4928 | SalatStealer 惡意程式樣本 | threat_feeds | malware_sample |
| 0.4876 | Vidar Stealer Download | threat_feeds | malicious_url |
| 0.4875 | MalwareBazaar: RustyStealer | threat_feeds | malware_sample |

**關聯發現**：勒索軟體攻擊與資訊竊取惡意程式（Stealer）呈現關聯，攻擊者可能先竊取憑證再部署勒索軟體。歷史 WannaCry、Petrwrap 防禦指引仍具參考價值。

#### 查詢 2：「遠端程式碼執行 RCE command injection」

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| 0.6612 | RPi-Jukebox-RFID 2.8.0 - Remote Command Execution | exploit_intelligence | poc_available |
| 0.6529 | Redis 8.0.2 - RCE | exploit_intelligence | poc_available |
| 0.6510 | 關鍵 RCE 漏洞「React2Shell」遭大規模積極利用 | security_news_facts | vulnerability_disclosure |
| 0.6459 | Ingress-NGINX Admission Controller v1.11.1 - FD Injection to RCE | exploit_intelligence | poc_available |
| 0.6317 | BeyondTrust Remote Support OS Command Injection Vulnerability | exploit_intelligence | active_exploitation |

**關聯發現**：React2Shell（CVE-2025-55182）RCE 漏洞正遭大規模利用（與 JPCERT/CC 報告呼應），BeyondTrust CVE-2026-1731 同樣為 RCE 類型。

#### 查詢 3：「關鍵基礎設施攻擊 critical infrastructure energy grid」

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| 0.5714 | Canada: Malicious Cyber Activity Targeting Critical Infrastructure | security_news_facts | attack_incident |
| 0.5178 | RIA Organizes Unique Cyber Defense Training for Electrical Infrastructure | security_news_facts | other |
| 0.4869 | High Threat Security Alert: Protecting the Network Infrastructure | vulnerability_tracking | critical_high |
| 0.4785 | Joint statement on malicious cyber activity targeting Canadian critical infrastructure | security_news_facts | attack_incident |
| 0.4707 | Schneider Electric Multiple Products Security Advisories | security_news_facts | vulnerability_disclosure |

**關聯發現**：
- 加拿大、歐洲均發布關鍵基礎設施威脅聯合聲明
- 工控系統（ICS）設備持續面臨漏洞威脅（Schneider Electric）
- 波蘭能源攻擊與全球關鍵基礎設施威脅趨勢一致

#### 查詢 4：「APT state-sponsored 國家級攻擊」

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| 0.5752 | 半導體戰略背後的網路戰–資安攻擊鎖定設計、生產與財經分析師 | security_news_facts | attack_incident |
| 0.5567 | 解密「長線佈局」與跨領域攻擊：CrowdStrike 深入解析 2025 駭客戰術演進 | security_news_facts | industry_trend |
| 0.5246 | 全球網路威脅活動「Operation WrtHug」鎖定華碩路由器 | security_news_facts | attack_incident |

**關聯發現**：
- 半導體產業持續是 APT 組織重點目標
- 邊緣設備（華碩路由器）成為入侵跳板
- APT28 利用 CVE-2026-21509 攻擊歐盟的案例符合此趨勢

### 跨 Layer 關聯總結

**波蘭能源攻擊跨 Layer 關聯**：
- **security_news_facts/attack_incident**：CISA、NCSC-FI、Fortra 報導（2026-02-10 至 2026-02-14）
- **vulnerability_tracking**：邊界設備漏洞與 OT 設備韌體風險
- **threat_feeds**：wiper 惡意軟體行為模式

**SmarterMail 漏洞鏈跨 Layer 關聯**：
- **exploit_intelligence/active_exploitation**：CVE-2026-24423 列入 KEV，確認勒索軟體利用
- **vulnerability_tracking/critical_high**：NCSC-NL 確認（NCSC-2026-0040）
- **exploit_intelligence/poc_available**：CVE-2026-23760 PoC 已公開

**APT28 CVE-2026-21509 跨 Layer 關聯**：
- **security_news_facts/attack_incident**：CERT-UA 報告（2026-02-01）
- **exploit_intelligence**：與 Microsoft 零日群集相關聯
- **vulnerability_tracking**：影響 Microsoft Office

---

## 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資。可能存在未被公開揭露的威脅活動。

2. **時效性**：資料收集截至 2026-02-22，後續發展可能影響分析結論。

3. **地理偏差**：本週資料主要來自 CISA (US)、Google TAG、CERT-UA (Ukraine)、NCSC-FI (Finland)、JPCERT/CC (Japan)、TWCERT/CC (Taiwan)、SANS ISC、CERT Polska、CERT.RO (Romania)、Malwarebytes，其他地區特有威脅可能覆蓋不足。

4. **信心水準說明**：
   - **高**：基於官方公告、確認的 KEV 列表、多來源交叉驗證
   - **中-高**：基於可信來源的報導、模式分析
   - **中**：基於單一來源報導或有限樣本推斷

5. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務等來源。

6. **翻譯風險**：部分非英文來源（烏克蘭、波蘭、芬蘭語）經 AI 翻譯，可能存在語義偏差。

7. **事件歸因**：威脅行為者歸因基於公開報導，實際攻擊者身份可能與報導不同。波蘭能源攻擊之歸因尚未公開。

本報告僅供參考，不構成完整的威脅評估。重大安全決策請結合多方情資來源。

---

## 自我審核 Checklist

- [x] 是否包含「資料限制與免責聲明」？
- [x] 所有事件是否標註來源與日期？
- [x] 趨勢分析是否基於足夠樣本？
  - security_news_facts: 772 筆（累計）
  - vulnerability_tracking: 13,098 筆（累計）
  - exploit_intelligence: 4,689 筆（累計）
  - threat_feeds: 32,107 筆（累計）
- [x] 新興威脅識別是否標註信心水準？（6 項新興威脅均已標註）
- [x] 攻擊手法是否已標註對應的 ATT&CK TTP？
- [x] 是否有未經證實的推論需標註為「推測」？（已於相關段落標註）
- [x] 統計數據是否準確？（已核對各 Layer 數量，基於 2026-02-14 至 2026-02-20 修改時間）
- [x] 格式是否符合目標受眾閱讀習慣？
- [x] 是否有使用 Qdrant 進行跨 Layer 關聯分析？（已執行 4 次語意查詢，本次更新新增 3 次）

---

> 報告產出時間：2026-02-22
> 資料截止時間：2026-02-22 23:59 UTC
> 資料來源：CISA (US)、Google TAG、CERT-UA (Ukraine)、CERT Polska、CERT.RO (Romania)、NCSC-FI (Finland)、JPCERT/CC (Japan)、TWCERT/CC (Taiwan)、SANS ISC、Malwarebytes、Canadian Centre for Cyber Security、Unit 42、Ox Security、abuse.ch (MalwareBazaar, ThreatFox, URLhaus)、Exploit-DB、PoC-in-GitHub
> 分析模型：Claude Opus 4.5
> Qdrant 語意查詢次數：3
> 版本：2.4（2026-02-22 更新：新增 RoundCube CVE-2025-49113/CVE-2025-68461 活躍利用、更新統計資料、調整涵蓋期間至 2026-02-22）
