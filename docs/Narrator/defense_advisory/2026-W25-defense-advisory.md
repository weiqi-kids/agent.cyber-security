---
title: "防禦建議 — 2026 第 25 週"
layout: default
date: 2026-06-18
category: defense_advisory
week: 2026-W25
---

# 防禦建議 — 2026 第 25 週

> 涵蓋期間：2026-06-11 至 2026-06-18
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、CISA KEV、abuse.ch（ThreatFox / URLhaus）
> 受眾：IT/資安管理人員（可執行的防禦行動建議）
> 自動化比例：30% 自動彙整 + 70% 人工審核

---

## 本週摘要（給趕時間的人）

本週共有 **5 個漏洞被 CISA 列入「已知被利用漏洞（KEV）」清單**，其中 **1 個（Oracle PeopleSoft CVE-2026-35273）已確認與勒索軟體活動關聯**，必須最優先處理。多個 KEV 的 CISA BOD 26-04 修補到期日已在本週內或即將到期，請立即排程修補。

威脅情報端，本週 abuse.ch 持續觀測到大量 **Mirai 變種 IoT 殭屍網路載入器**、**ClearFake / SmartApeSG「假更新」社交工程**派送基礎設施，以及 **Vidar 資訊竊取程式**與 **Cobalt Strike C2**。同時觀察到攻擊者濫用合法 **ScreenConnect** 遠端工具進行投遞，IT 部門應將下方 IoC 清單匯入防火牆 / Proxy / EDR 進行封鎖。

**最優先三件事**：
1. 修補 Oracle PeopleSoft PeopleTools（CVE-2026-35273，勒索軟體關聯，到期日 2026-06-15）。
2. 修補 Ivanti Sentry（CVE-2026-10520 + CVE-2026-10523，RCE，到期日 2026-06-14）。
3. 封鎖下方 IoC 清單（ClearFake / Vidar / Mirai / 被濫用的 ScreenConnect 投遞點）。

---

## 1. 優先修補清單

> 排序原則：**活躍利用（KEV） > 勒索軟體關聯 > CVSS 高分 + 對外暴露**。
> ⚠️ 所有修補步驟均引用官方公告，請以官方原文為最終依據（見各筆「官方公告」連結）。

### 1.1 第一優先 — CISA KEV「已確認在野外被利用」（必修）

下列 5 個漏洞已被 CISA 列入 KEV 清單，代表**已確認遭實際攻擊利用**，並受 BOD 26-04 強制修補期限約束（適用美國聯邦機構，其他組織亦強烈建議比照）。

| 優先級 | CVE | 產品 | 類型 | 嚴重度 | 利用狀態 | BOD 26-04 到期日 |
|--------|-----|------|------|--------|----------|------------------|
| 🔴 P0 | CVE-2026-35273 | Oracle PeopleSoft Enterprise PeopleTools | 缺少身分驗證（CWE-306） | Critical (CVSS 9.8) | 活躍利用 + **勒索軟體關聯** | 2026-06-15（已逾期） |
| 🔴 P0 | CVE-2026-10520 | Ivanti Sentry（前 MobileIron Sentry） | OS 命令注入 → RCE（CWE-78） | Critical | 活躍利用 | 2026-06-14（已逾期） |
| 🟠 P1 | CVE-2026-48907 | Widget Factory Joomla Content Editor (JCE) | 存取控制不當 → PHP RCE（CWE-284） | Critical | 活躍利用 | 2026-06-19 |
| 🟠 P1 | CVE-2026-54420 | LiteSpeed cPanel Plugin | Symlink 跟隨 → 沙盒逃逸（CWE-61） | High | 活躍利用 | 2026-06-18 |
| 🟠 P1 | CVE-2026-20262 | Cisco Catalyst SD-WAN Manager | 路徑遍歷 → 任意檔案寫入（CWE-22） | High | 活躍利用 | 2026-06-29 |

---

#### 🔴 CVE-2026-35273 — Oracle PeopleSoft Enterprise PeopleTools（最高優先）

- **漏洞描述**：PeopleSoft Enterprise PeopleTools 存在「關鍵功能缺少身分驗證」漏洞（CWE-306），未經身分驗證的攻擊者可**完全接管**系統。已確認與勒索軟體活動關聯（`knownRansomwareCampaignUse: Known`）。
- **影響產品**：Oracle PeopleSoft Enterprise PeopleTools。
- **官方修補方式**：套用 Oracle 安全警報中針對 CVE-2026-35273 的修補程式。
- **利用狀態**：✅ 活躍利用 + 勒索軟體關聯。
- **建議補強動作**：檢查 PeopleSoft 是否對外暴露（HR、財務系統優先），若有則立即隔離或加上存取控制；強化備份並測試還原流程；監控異常登入與未授權管理員操作。
- **官方公告**：<https://www.oracle.com/security-alerts/alert-cve-2026-35273.html> ｜ NVD：<https://nvd.nist.gov/vuln/detail/CVE-2026-35273>

#### 🔴 CVE-2026-10520 — Ivanti Sentry（OS 命令注入 RCE）

- **漏洞描述**：Ivanti Sentry 存在 OS 命令注入（CWE-78），遠端**未經身分驗證**者可以 root 權限執行任意命令（RCE）。當 Sentry 處於非管理狀態且端點可從外部存取時可被利用。
- **影響產品**：Ivanti Sentry（前身 MobileIron Sentry）。
- **官方修補方式**：套用 Ivanti 安全公告（同時涵蓋 **CVE-2026-10523** 驗證繞過，CVSS 9.9）的修補。
- **利用狀態**：✅ 活躍利用。
- **建議補強動作**：將 Sentry 管理介面從公開網路移除；部署 mTLS 搭配 EPMM，或透過 Neurons for MDM 限制 HTTPS 存取以縮小攻擊面；審查 Sentry 日誌尋找異常命令執行。
- **官方公告**：<https://hub.ivanti.com/s/article/Security-Advisory-Ivanti-Sentry-CVE-2026-10520-CVE-2026-10523?language=en_US> ｜ NVD：<https://nvd.nist.gov/vuln/detail/CVE-2026-10520>

> **關聯提醒**：Ivanti EPMM 本週另有 **CVE-2026-10727**（OS 命令注入，CVSS 7.2）。若您同時部署 Sentry 與 EPMM，請一併評估 EPMM 修補。

#### 🟠 CVE-2026-48907 — Joomla Content Editor (JCE)（PHP RCE）

- **漏洞描述**：JCE 存取控制不當（CWE-284），未經身分驗證者可建立新編輯器設定檔，上傳並執行 PHP 程式碼造成 RCE。
- **影響產品**：Widget Factory Joomla Content Editor。
- **官方修補方式**：套用 Widget Factory 提供的 JCE 安全更新；舊站可使用官方提供的免費 patch。
- **利用狀態**：✅ 活躍利用。
- **建議補強動作**：若無法立即更新，暫時停用 JCE 或限制僅受信任使用者使用；審查 Joomla 使用者角色與檔案上傳權限。
- **官方公告**：<https://www.joomlacontenteditor.net/news/jce-security-update-and-a-free-patch-for-older-sites> ｜ NVD：<https://nvd.nist.gov/vuln/detail/CVE-2026-48907>

#### 🟠 CVE-2026-54420 — LiteSpeed cPanel Plugin（沙盒逃逸 / LPE）

- **漏洞描述**：UNIX 符號連結跟隨漏洞（CWE-61），共用主機（CloudLinux/CageFS）上具 FTP 或 Web Shell 權限者可突破 CageFS 隔離，存取或修改其他使用者檔案。
- **影響產品**：LiteSpeed cPanel Plugin。
- **官方修補方式**：套用 LiteSpeed 官方安全更新。
- **利用狀態**：✅ 活躍利用。
- **建議補強動作**：若使用共用主機，確認服務商已更新；審查 CloudLinux/CageFS 符號連結限制設定。
- **官方公告**：<https://blog.litespeedtech.com/2026/06/01/security-update-for-litespeed-cpanel-plugin-2/> ｜ NVD：<https://nvd.nist.gov/vuln/detail/CVE-2026-54420>

#### 🟠 CVE-2026-20262 — Cisco Catalyst SD-WAN Manager（任意檔案寫入）

- **漏洞描述**：路徑遍歷漏洞（CWE-22），已通過身分驗證的遠端攻擊者可建立或覆寫任意檔案，可能導致組態被篡改或服務中斷。
- **影響產品**：Cisco Catalyst SD-WAN Manager。
- **官方修補方式**：依 Cisco 安全公告 `cisco-sa-sdwan-arbfw-c2rZvQ` 套用修補。
- **利用狀態**：✅ 活躍利用。
- **建議補強動作**：限制 SD-WAN Manager 管理介面存取範圍，避免不必要的暴露；監控檔案系統的非預期建立 / 修改。
- **官方公告**：<https://sec.cloudapps.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-sdwan-arbfw-c2rZvQ> ｜ NVD：<https://nvd.nist.gov/vuln/detail/CVE-2026-20262>

### 1.2 第二優先 — 高 CVSS 漏洞（尚未列入 KEV，但對外暴露風險高）

下列為本週新登錄、CVSS 偏高且常見於企業環境的漏洞。**目前無公開「在野利用」證據**，但因 CVSS 高且部分為未經身分驗證即可觸發，建議納入本週修補排程。請以官方公告為準。

| CVE | 產品 / 元件 | 類型 | CVSS | 修補來源 |
|-----|-------------|------|------|----------|
| CVE-2026-10523 | Ivanti Sentry | 驗證繞過（CWE-288） | 9.9 | Ivanti 安全公告（與 CVE-2026-10520 同公告） |
| CVE-2026-27671 | SAP Kernel（Application Server ABAP） | RFC 協定驗證不當 | 9.8 | SAP 安全公告 / Patch Day |
| CVE-2026-34691 | Adobe Experience Manager Forms JEE | 高風險漏洞 | 9.3 | Adobe 安全公告 |
| CVE-2026-12027 | Google Chrome（Headless） | 不當實作 | 9.6 | 更新至 Chrome 149.0.7827.115（含多個 8.x UAF 修補） |
| CVE-2026-20251 | Splunk Enterprise | （見官方公告） | 8.8 | 升級至 10.2.4 / 10.0.7 / 9.4.12 / 9.3.13 以上 |
| CVE-2026-30120 | remotion-dev remotion v4.0.409 | RCE | 9.8 | 升級官方版本 |
| CVE-2026-34901 | iControlWP ≤ 5.5.3 | 未驗證權限提升 | 9.8 | 升級官方版本 |
| CVE-2026-36537 | ThingsBoard v4.3.0.1 | OAuth 驗證繞過 | 9.8 | 升級官方版本 |

> **建議排序**：先處理可從網際網路存取的元件（Ivanti、SAP、Adobe AEM、Splunk、ThingsBoard），瀏覽器類（Chrome）以集中部署的方式於本週內完成更新。
> **官方公告查證**：上述各筆請以對應廠商安全公告與 NVD（`https://nvd.nist.gov/vuln/detail/<CVE>`）為準。

---

## 2. 安全控制建議

> 以下明確區分 **【針對本週威脅】** 與 **【通用建議】**。

### 2.1 網路層面

- **【針對本週威脅】** 將第 3 節的 **C2 / 惡意 URL / 惡意網域** 匯入防火牆、Web Proxy、DNS Sinkhole 與 EDR 進行封鎖。本週重點為 Mirai 載入器、ClearFake / SmartApeSG 投遞網域與 Vidar C2。
- **【針對本週威脅】** 對外部可存取的管理介面（Ivanti Sentry、Cisco SD-WAN Manager、PeopleSoft）實施網路隔離 / IP 允許清單，縮小 KEV 漏洞的攻擊面。
- **【通用建議】** 出向（egress）流量過濾，封鎖伺服器主機向非預期外部 IP/Port 的連線（Mirai 與 Cobalt Strike 常用非標準埠，如 `:40004`、`:57280` 等）。

### 2.2 端點層面

- **【針對本週威脅】** 在 EDR 建立偵測規則，針對 **被濫用的 ScreenConnect 安裝**（`ScreenConnect.ClientSetup.exe` / `support.client.exe` 由非預期主機下載）告警，本週觀測到多個 IP 投遞此類檔案。
- **【針對本週威脅】** 偵測 **「假更新（Fake Update）」社交工程**：使用者瀏覽器被導向後手動執行貼上的指令（ClearFake / SmartApeSG 常見手法），對剪貼簿觸發的 `mshta` / `powershell` / `curl` 執行加強監控。
- **【通用建議】** 維持應用程式允許清單（Application Allowlisting）、限制使用者本機管理員權限、啟用受攻擊面縮減（ASR）規則。

### 2.3 身分認證層面

- **【針對本週威脅】** 因 CVE-2026-35273（PeopleSoft 缺少驗證）與 CVE-2026-36537（ThingsBoard OAuth 繞過），請審查關鍵應用的驗證設定與管理員帳號活動。
- **【通用建議】** 對所有對外服務與特權帳號強制 MFA；輪換並檢查長期未變更的服務帳號憑證；監控異常登入地理位置與時間。

### 2.4 資料保護層面

- **【針對本週威脅】** 由於 CVE-2026-35273 與勒索軟體關聯，請確保關鍵系統具備**離線 / 不可變備份**並近期完成過還原演練。
- **【通用建議】** 落實 3-2-1 備份策略、加密靜態與傳輸中的敏感資料、定期驗證備份可還原性。

---

## 3. IoC 封鎖清單（防火牆 / Proxy / EDR 匯入）

> 資料來源：abuse.ch ThreatFox 與 URLhaus，萃取時間 2026-06-17。
> ⚠️ 下方指標皆已 **defang（去毒化）** 處理（`hxxp` / `[.]`），匯入封鎖設備前請還原為正常格式。
> ⚠️ 威脅情報具時效性，**部分指標可能已下線或為短期基礎設施**；封鎖前建議結合自身環境誤報評估，本清單**有效期至 2026-06-25**，屆時請重新評估。

### 3.1 殭屍網路 / C2（Cobalt Strike、Vidar）

| 惡意程式 | 類型 | 指標（defanged） |
|----------|------|------------------|
| Cobalt Strike | C2 IP:Port | `103[.]230[.]15[.]159:443` |
| Cobalt Strike | C2 IP:Port | `103[.]230[.]15[.]159:80` |
| Vidar（資訊竊取） | C2 網域 | `zab[.]hanyasm188[.]top` |
| Vidar（資訊竊取） | C2 網域 | `zab[.]rzrrent[.]com` |

### 3.2 「假更新」社交工程派送（ClearFake / SmartApeSG）

| 惡意程式 | 類型 | 指標（defanged） |
|----------|------|------------------|
| SmartApeSG | 派送 URL | `hxxps://granitequill[.]top/token/permission-css[.]js` |
| SmartApeSG | 派送 URL | `hxxps://granitequill[.]top/token/signin-schema[.]js` |
| SmartApeSG | 派送網域 | `granitequill[.]top` |
| ClearFake | 派送網域 | `slceo[.]rocketbet[.]pro` |
| ClearFake | 派送網域 | `vslaa[.]melbetkade[.]com` |
| ClearFake | 派送網域 | `wrlunpmj[.]masaelmohandesi[.]xyz` |
| ClearFake | 派送網域 | `emjkevxm[.]jam-jahani[.]com` |
| ClearFake | 派送網域 | `jgyqxldn[.]leaguejazire[.]com` |
| ClearFake | 派送網域 | `gidptxnf[.]shartbandi[.]games` |
| ClearFake | 派送網域 | `xlyvz7lr[.]motuntakhasosi[.]store` |
| ClearFake | 派送網域 | `lkkcicvs[.]tasisathosseini[.]shop` |
| ClearFake | 派送網域 | `riyaziatumumi[.]xyz` |
| ClearFake | 派送網域 | `riyazinikokar[.]xyz` |

### 3.3 Mirai / IoT 殭屍網路載入器（malware_download，online）

| 標籤 | 類型 | 指標（defanged） |
|------|------|------------------|
| elf / mirai | 下載 URL | `hxxp://62[.]60[.]159[.]184/dlr[.]arm7` |
| elf / mirai | 下載 URL | `hxxp://62[.]60[.]159[.]184/bins/kla[.]sh` |
| elf / mirai | 下載 URL | `hxxp://104[.]251[.]181[.]69/bins[.]sh` |
| elf / mirai | 下載 URL | `hxxp://104[.]251[.]181[.]69/sshd` |
| elf / mirai | 下載 URL | `hxxp://209[.]99[.]184[.]114/hiddenbin/Space[.]arm7` |
| elf / mirai | 下載 URL | `hxxp://110[.]36[.]1[.]200:40004/bin[.]sh` |
| elf / mirai | 下載 URL | `hxxp://110[.]36[.]25[.]33:57280/bin[.]sh` |
| elf / mirai | 下載 URL | `hxxp://115[.]192[.]229[.]9:47601/bin[.]sh` |

### 3.4 被濫用的合法工具 / 其他惡意投遞（online）

| 說明 | 類型 | 指標（defanged） |
|------|------|------------------|
| 濫用 ScreenConnect 投遞 | 下載 URL | `hxxps://141[.]140[.]0[.]116/Bin/ScreenConnect[.]ClientSetup[.]exe` |
| 濫用 ScreenConnect 投遞 | 下載 URL | `hxxps://141[.]140[.]0[.]188/bin/support[.]client[.]exe` |
| 濫用 ScreenConnect 投遞 | 下載 URL | `hxxps://162[.]251[.]60[.]214/Bin/ScreenConnect[.]ClientSetup[.]exe` |
| Quasar RAT | 下載 URL | `hxxp://170[.]168[.]103[.]160/quasar[.]exe` |
| Windows 可執行檔投遞 | 下載 URL | `hxxp://62[.]60[.]156[.]183/client[.]exe` |
| Android APK 投遞 | 下載 URL | `hxxp://217[.]60[.]195[.]155/Loader[.]apk` |

> **使用提醒**：IP 類指標（尤其雲端 / 共享主機）可能伴隨誤報。建議先以「告警」模式觀察，確認無正常業務流量後再轉為「封鎖」。Google Drive 等合法雲端被濫用的派送連結，**請勿整站封鎖**，改以檔案層偵測處理。

---

## 4. 緩解策略（針對尚無修補或需要臨時防護的情況）

> 每項緩解措施標註**有效期限 / 重新評估時間**。緩解非永久解法，**修補可用後應立即套用官方修補並移除臨時措施**。

| 威脅 | 臨時緩解措施 | 有效期 / 重新評估 |
|------|--------------|-------------------|
| KEV 漏洞對外暴露元件（Ivanti Sentry、Cisco SD-WAN Manager、PeopleSoft） | 在完成官方修補前，將管理介面下架 / 限制至內網或 VPN + IP 允許清單 | 至完成修補為止；最遲 2026-06-25 重新評估 |
| JCE RCE（CVE-2026-48907） | 暫時停用 JCE 編輯器或限制僅受信任使用者，移除匿名 / 訪客的上傳能力 | 至套用官方 patch 為止 |
| ClearFake / SmartApeSG「假更新」 | 部署封鎖清單 + 對使用者宣導「勿手動貼上執行不明指令」；限制一般使用者執行 `mshta` / 直接 PowerShell | 重新評估：2026-06-25（IoC 具時效） |
| Mirai IoT 殭屍網路 | 變更 IoT / 路由器預設帳密、關閉對外的 Telnet/SSH 管理、egress 過濾非標準埠 | 持續性控制，季度檢視 |

---

## 5. 注意事項（適用範圍與限制）

- **適用範圍**：本建議為通用性質，需結合貴組織的資產清單、業務影響與變更管理流程後再執行。並非所有組織都部署上述受影響產品。
- **可能副作用**：
  - 封鎖 IP/網域可能造成誤封正常業務流量（特別是共享主機與雲端服務 IP），建議先以告警模式觀察。
  - 限制管理介面存取、停用 JCE 編輯器等措施可能影響日常維運，請先評估營運衝擊。
  - 套用修補可能造成相依服務中斷，**務必先在測試環境驗證**。
- **建議測試步驟**：
  1. 在非生產環境套用修補 / 緩解，驗證核心功能正常。
  2. 以小範圍（金絲雀）部署觀察 24–48 小時。
  3. 確認 EDR/防火牆封鎖規則無大量誤報後，再全面推送。
  4. 修補後保留回滾方案與備份。

---

## 6. 資料來源宣告

| 區塊 | 主要來源 | 本週筆數（this week） |
|------|----------|------------------------|
| 優先修補（KEV 活躍利用） | CISA KEV（exploit_intelligence / active_exploitation） | 5 |
| 高 CVSS 漏洞 | NVD（vulnerability_tracking / critical_high，2026 新登錄） | 數十筆（節錄 CVSS ≥ 9.0 與常見企業產品） |
| IoC 封鎖清單 | abuse.ch ThreatFox / URLhaus（threat_feeds） | 大量（節錄活躍 / 高信心指標） |

**Qdrant 語意關聯查詢（跨 Layer）本週執行 3 次**：
1. 「actively exploited remote code execution vulnerability requiring immediate patch」（filter: active_exploitation）→ 10 筆，確認 KEV 與歷史 RCE 利用模式關聯。
2. 「infostealer command and control malware delivery domains ClearFake fake update social engineering」→ 10 筆，比對 ClearFake 派送基礎設施跨週延續性。
3. 「ransomware campaign exploited vulnerability enterprise application authentication bypass」→ 10 筆，佐證驗證繞過 / 缺少驗證類漏洞的勒索軟體利用趨勢。

---

## 免責聲明

本防禦建議基於國際 CERT/安全機構公開資料彙整，請注意：

1. **非保證**：實施建議不保證完全防禦所有威脅。
2. **環境差異**：建議為通用性質，可能不適用於所有環境。
3. **請先測試**：在正式環境部署前，請先於測試環境驗證。
4. **非法律建議**：本報告不構成法律或合規建議。
5. **資料限制**：基於公開資料，不涵蓋非公開威脅情報。
6. **翻譯風險**：部分非英文來源經 AI 翻譯，修補建議請以官方原文為準。

重大安全決策請諮詢專業資安顧問，並結合組織實際環境評估。

---

> 報告產出：2026-06-18（2026-W25）｜ Mode：防禦建議模式（Defense Advisory Mode）｜ 模型：opus
> 來源 Layers：security_news_facts（L1）、vulnerability_tracking（L2）、exploit_intelligence（L3）、threat_feeds
