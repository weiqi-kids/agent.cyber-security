---
layout: seo-report
title: 2026 第 08 週防禦建議
description: "2026-02-14 至 2026-02-20 資安防禦建議：Ivanti EPMM 零日 RCE CVE-2026-1281/1340 活躍利用、Dell RP4VMs CVE-2026-22769 UNC6201 利用（緊急 2026-02-21）、Chromium CSS Use-After-Free、VSCode 擴充套件供應鏈漏洞、Honeywell CCTV CVE-2026-1670 CVSS 9.8、波蘭能源基礎設施 OT/ICS 防禦、SmarterMail 勒索軟體漏洞鏈。"
parent: 防禦建議
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-defense-advisory.png
author: 資安情報分析團隊
date: 2026-02-20
---

# 防禦建議 — 2026 第 08 週

> 涵蓋期間：2026-02-14 至 2026-02-20
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV
> 產出時間：2026-02-20

---

## 執行摘要

本週威脅態勢持續嚴峻，**多個零日漏洞活躍利用**、**供應鏈風險**與**關鍵基礎設施攻擊**為主要威脅：

1. **Ivanti EPMM 零日漏洞 CVE-2026-1281、CVE-2026-1340（新增！極嚴重）** — Unit 42 報告兩個零日漏洞正遭活躍利用，允許未經認證的 RCE，可完全控制企業 MDM 基礎設施
2. **Dell RP4VMs 零日漏洞 CVE-2026-22769（極緊急！修補期限 2026-02-21）** — Google TAG 確認 UNC6201 正活躍利用硬編碼憑證漏洞，可取得 root 層級存取
3. **VSCode 擴充套件漏洞（新增！供應鏈風險）** — Live Server、Code Runner 等 128M+ 下載量擴充套件存在高危漏洞（CVE-2025-65717、CVE-2025-65715）
4. **Honeywell CCTV 認證繞過 CVE-2026-1670（新增！CVSS 9.8）** — 關鍵基礎設施監控系統認證繞過漏洞
5. **Chromium CSS Use-After-Free CVE-2026-2441（Critical）** — 影響 Chrome、Edge、Opera 等所有 Chromium 瀏覽器，已被野外利用
6. **GitLab SSRF 歷史漏洞 CVE-2021-22175（新增 KEV）** — CISA 於 2026-02-18 新增至 KEV，webhook SSRF 漏洞再現
7. **波蘭能源基礎設施攻擊後續（Critical）** — CISA 與 CERT Polska 發布詳細分析，wiper 惡意軟體破壞 OT/ICS 系統
8. **SmarterMail 三重漏洞鏈** — CVE-2026-24423 已確認勒索軟體利用，修補期限 2026-02-26
9. **SSH 蠕蟲四秒感染（新興威脅）** — 使用 RSA 簽章驗證 C2 指令，自動化程度極高
10. **Microsoft 六個零日漏洞** — 修補期限 2026-03-03
11. **Apple 跨平台零日（首次含 visionOS）** — CVE-2026-20700，修補期限 2026-03-05

**本週關鍵行動**：
- **極緊急（本週五前）**：執行 Dell RP4VMs 補救腳本（DSA-2026-079），修補期限 2026-02-21
- **極緊急（立即）**：檢查 Ivanti EPMM 是否暴露於網際網路，假設已遭入侵
- **立即**：更新所有 Chromium 瀏覽器、審查 VSCode 擴充套件、檢查 GitLab webhook 設定
- **24 小時內**：盤點 OT/ICS 設備預設密碼，變更為強密碼；檢查 Honeywell CCTV 系統暴露
- **本週內**：部署 Microsoft 2 月安全更新

---

## 優先修補清單

依照優先級排序：活躍利用 + 勒索軟體 > 活躍利用 > EPSS 高分 > CVSS 高分

### P0 - 極緊急（本週五前必須處置）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| **CVE-2026-1281, CVE-2026-1340** | Ivanti EPMM | 未經認證 RCE | **立即（零日活躍利用）** | [Ivanti 安全公告](https://forums.ivanti.com/s/article/Security-Advisory-Ivanti-Endpoint-Manager-Mobile-EPMM) |
| **CVE-2026-22769** | Dell RP4VMs | 硬編碼憑證 root RCE (CWE-798) | **2026-02-21（本週五！）** | [Dell DSA-2026-079](https://www.dell.com/support/kbdoc/en-us/000426773/dsa-2026-079) |

> **極緊急警告 - CVE-2026-1281、CVE-2026-1340**：Ivanti Endpoint Manager Mobile (EPMM) 存在兩個嚴重零日漏洞，**正遭野外活躍利用**（Unit 42 報告）。攻擊者可在**未經認證**的情況下遠端執行任意程式碼，取得企業 MDM 基礎設施的**完全控制權**。觀察到的攻擊行為包括：建立反向 Shell、安裝 Web Shell、進行偵察活動、下載惡意軟體。**面向網際網路的 EPMM 管理介面組織應採用「假設已遭入侵」思維。**

> **極緊急警告 - CVE-2026-22769**：Dell RecoverPoint for Virtual Machines 存在硬編碼憑證漏洞，Google TAG 確認威脅行為者 **UNC6201** 正活躍利用此零日漏洞。未經身份驗證的攻擊者可取得 **root 層級存取**，建立持久化後門。**CISA 修補期限 2026-02-21（本週五），請立即執行 Dell 提供的補救腳本。**

### P0.5 - 立即處置（修補期限已過期）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| **CVE-2026-1731** | BeyondTrust RS/PRA | 未經驗證命令注入 RCE (CWE-78) | **2026-02-16（已過期）** | [BeyondTrust BT26-02](https://www.beyondtrust.com/trust-center/security-advisories/bt26-02) |
| **CVE-2025-52691** | SmarterMail | 任意檔案上傳 RCE (CWE-434) | **2026-02-16（已過期）** | [SmarterTools Release Notes](https://www.smartertools.com/smartermail/release-notes/current) |
| **CVE-2026-23760** | SmarterMail | 認證繞過 (CWE-288) | **2026-02-16（已過期）** | [SmarterTools Release Notes](https://www.smartertools.com/smartermail/release-notes/current) |
| **CVE-2025-40536** | SolarWinds WHD | 安全控制繞過 (CWE-693) | **2026-02-15（已過期）** | [WHD 2026.1 Release Notes](https://documentation.solarwinds.com/en/success_center/whd/content/release_notes/whd_2026-1_release_notes.htm) |

> **警告 - CVE-2026-1731**：BeyondTrust Remote Support 和 Privileged Remote Access 存在未經驗證的 OS 命令注入漏洞。攻擊者無需身份驗證即可在站點使用者上下文中執行命令，可能導致系統完全控制、資料外洩。**請立即檢查所有暴露於網際網路的 BeyondTrust 產品是否有入侵跡象。**

### P1 - 緊急（已確認活躍利用或 CVSS 9.0+）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| **CVE-2026-1670** | Honeywell CCTV | 認證繞過 (CWE-306) CVSS 9.8 | **立即** | [CISA ICS Advisory](https://www.cisa.gov/news-events/ics-advisories) |
| **CVE-2026-2441** | Chromium CSS | Use-After-Free (CWE-416) | **2026-03-10** | [Chrome Stable Channel Update](https://chromereleases.googleblog.com/2026/02/stable-channel-update-for-desktop_13.html) |
| **CVE-2021-22175** | GitLab CE/EE | SSRF (CWE-918) | **2026-03-11** | [GitLab CVE-2021-22175](https://gitlab.com/gitlab-org/cves/-/blob/master/2021/CVE-2021-22175.json) |
| **CVE-2026-24423** | SmarterMail | 缺失認證 RCE (CWE-306) | **2026-02-26** | [SmarterTools Release Notes](https://www.smartertools.com/smartermail/release-notes/current) |

> **警告 - CVE-2026-1670（CVSS 9.8）**：Honeywell 多款 CCTV 產品存在嚴重認證繞過漏洞。攻擊者可在**未認證**情況下變更裝置帳戶的復原電子郵件地址，實現**完整帳戶接管**與未授權存取監控畫面。Honeywell 廣泛部署於商業設施、工業環境與關鍵基礎設施。**CISA 建議**：最小化控制系統設備的網路曝露、將設備隔離於防火牆後、使用安全遠端存取方式、聯繫 Honeywell 支援取得修補指引。

> **警告 - CVE-2026-2441**：Google Chromium CSS 元件存在 Use-After-Free 漏洞，**已被野外利用**。影響所有 Chromium 瀏覽器（Chrome、Edge、Opera 等），透過特製 HTML 網頁可觸發堆積記憶體損壞。**請立即更新所有瀏覽器。**

> **警告 - CVE-2021-22175**：GitLab 的 webhook SSRF 漏洞被 CISA 於 2026-02-18 新增至 KEV，表示有活躍利用。攻擊者可偽造伺服器端請求存取內部網路資源。**請停用或限制 webhook 對內部網路的存取權限。**

> **警告 - CVE-2026-24423**：**已確認被勒索軟體利用**。攻擊者可透過 ConnectToHub API 將 SmarterMail 指向惡意伺服器執行命令。此漏洞與 CVE-2025-52691、CVE-2026-23760 可形成完整攻擊鏈，應最優先處理。

### P2 - 緊急（Microsoft 零日群集 2026-02-10）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| CVE-2026-21514 | Microsoft Office Word | 本地提權 (CWE-807) | 2026-03-03 | [MSRC CVE-2026-21514](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21514) |
| CVE-2026-21519 | Windows Desktop Window Manager | 類型混淆提權 (CWE-843) | 2026-03-03 | [MSRC CVE-2026-21519](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21519) |
| CVE-2026-21533 | Windows Remote Desktop Services | 權限管理不當提權 (CWE-269) | 2026-03-03 | [MSRC CVE-2026-21533](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21533) |
| CVE-2026-21510 | Windows Shell | 保護機制失效 (CWE-693) | 2026-03-03 | [MSRC CVE-2026-21510](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21510) |
| CVE-2026-21513 | MSHTML Framework | 保護機制失效 (CWE-693) | 2026-03-03 | [MSRC CVE-2026-21513](https://msrc.microsoft.com/update-guide/advisory/CVE-2026-21513) |
| CVE-2026-21525 | Windows Remote Access Connection Manager | NULL 指標 DoS (CWE-476) | 2026-03-03 | [MSRC CVE-2026-21525](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21525) |
| CVE-2026-21509 | Microsoft Office | 安全功能繞過 (CWE-807) | **2026-02-16（已過期）** | [MSRC CVE-2026-21509](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21509) |

> **警告**：CVE-2026-21509 已被 APT28（俄羅斯）利用攻擊烏克蘭及歐盟政府機構，攻擊文件偽裝為歐盟 COREPER 諮商文件。

### P3 - 高優先（2026-03-05 修補期限）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| CVE-2026-20700 | Apple iOS/macOS/tvOS/watchOS/visionOS | 緩衝區溢位 RCE (CWE-119) | 2026-03-05 | [iOS](https://support.apple.com/en-us/126346), [macOS](https://support.apple.com/en-us/126348), [tvOS](https://support.apple.com/en-us/126351), [watchOS](https://support.apple.com/en-us/126352), [visionOS](https://support.apple.com/en-us/126353) |
| CVE-2025-15556 | Notepad++ (WinGUp) | 下載缺乏完整性檢查 RCE | 2026-03-05 | [v8.8.9 漏洞修復](https://community.notepad-plus-plus.org/topic/27298/notepad-v8-8-9-vulnerability-fix) |
| CVE-2024-43468 | Microsoft Configuration Manager | SQL 注入 | 2026-03-05 | [MSRC CVE-2024-43468](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2024-43468) |

### P4 - 本週關注（供應鏈風險與其他活躍利用）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| **CVE-2025-65717** | VSCode Live Server | 檔案竊取 RCE | **建議立即停用** | [Ox Security 研究報告](https://www.ox.security/) |
| **CVE-2025-65715** | VSCode Code Runner | 配置操作 RCE | **建議立即停用** | [Ox Security 研究報告](https://www.ox.security/) |
| **CVE-2025-65716/17** | VSCode Markdown Preview Enhanced | 多個漏洞 | **建議立即停用** | [Ox Security 研究報告](https://www.ox.security/) |
| CVE-2025-11953 | React Native CLI | 命令注入 RCE | 2026-02-26 | [GitHub PR #2735](https://github.com/react-native-community/cli/pull/2735) |
| CVE-2025-64328 | Sangoma FreePBX | 命令注入 | 2026-02-24 | [GitHub GHSA-vm9p-46mv-5xvw](https://github.com/FreePBX/security-reporting/security/advisories/GHSA-vm9p-46mv-5xvw) |

> **供應鏈警告 - VSCode 擴充套件漏洞（128M+ 下載量）**：Ox Security 揭露多個熱門 VSCode 擴充套件存在高危漏洞：
> - **Live Server（7,200 萬+下載）**：CVE-2025-65717，透過惡意網頁重導實現本地檔案竊取
> - **Code Runner（3,700 萬下載）**：CVE-2025-65715，透過配置檔操作實現 RCE
> - **Markdown Preview Enhanced**：CVE-2025-65716/17，多個漏洞影響預覽功能
>
> **嚴重問題**：Ox Security 自 2025 年 6 月起嘗試負責任揭露，但**無任何維護者回應**。開發者工作站遭入侵可能導致原始碼竊取、憑證收割、供應鏈注入攻擊。**建議暫時停用受影響擴充套件或改用替代方案。**

---

## 安全控制建議

### 網路層面

#### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **Ivanti EPMM 零日（極緊急！新增）** | **立即**檢查 EPMM 是否暴露於網際網路；採用「假設已遭入侵」思維；檢查反向 Shell、Web Shell、異常偵察活動；聯繫 Ivanti 取得修補指引 |
| **Dell RP4VMs 零日（極緊急）** | **立即**執行 Dell 補救腳本（DSA-2026-079）；檢查所有面向網際網路的 RP4VMs 執行個體是否有入侵跡象；實施網路隔離 |
| **Honeywell CCTV（新增 CVSS 9.8）** | 最小化控制系統設備的網路曝露；將設備隔離於防火牆後；使用安全遠端存取方式（更新的 VPN）；聯繫 Honeywell 支援取得修補指引 |
| **Chromium 瀏覽器（已被利用）** | **立即**更新所有 Chromium 瀏覽器（Chrome、Edge、Opera）至最新版本；啟用自動更新；實施瀏覽器隔離技術 |
| **GitLab SSRF（KEV 新增）** | 停用或限制 webhook 對內部網路的存取權限；實施網路隔離限制 GitLab 對敏感內部資源的存取；監控異常內部連線 |
| **波蘭能源攻擊（OT/ICS）** | 立即盤點可由網際網路存取的邊界設備；變更所有 OT 設備預設密碼；實施 OT 韌體完整性驗證；遵循 CISA BOD 26-02 |
| **BeyondTrust RCE（已過期）** | **立即**盤點所有暴露於網際網路的 BeyondTrust 產品；修補前限制僅允許內部存取；檢查入侵跡象 |
| **SmarterMail 勒索軟體漏洞** | 立即升級；隔離 SmarterMail 伺服器；封鎖 ConnectToHub API 的外部存取；監控異常外連 HTTP 請求 |
| **SSH 蠕蟲四秒感染** | 變更所有 SSH 設備預設密碼（尤其 Raspberry Pi）；限制 SSH 服務僅允許受信任 IP；監控異常 SSH 登入與 Zmap 掃描活動 |
| **Microsoft 零日群集** | 優先處理 RDP 暴露的系統；限制 RDP 至受信任 IP 範圍；監控異常權限提升 |

#### 通用建議

- 實施網路分段，限制橫向移動
- 確保邊界設備（防火牆、VPN、負載平衡器）已更新
- 啟用 IDS/IPS 並更新特徵碼
- 部署 DNS 過濾封鎖已知惡意網域
- 監控 IRC 流量（SSH 蠕蟲使用 IRC-based C2）

### 端點層面

#### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **VSCode 擴充套件漏洞（新增！供應鏈風險）** | **審查已安裝的擴充套件**；暫時停用 Live Server、Code Runner、Markdown Preview Enhanced 等受影響擴充套件；改用替代方案；監控開發者工作站異常活動 |
| **Windows 6 項零日漏洞** | 立即部署 2026 年 2 月份安全更新；特別關注使用 RDS 的系統；啟用 Attack Surface Reduction (ASR) 規則 |
| **Apple CVE-2026-20700** | 確保所有 Apple 設備啟用自動更新；透過 MDM 強制部署安全更新；**visionOS 用戶首次遭受跨平台零日攻擊** |
| **Notepad++ CVE-2025-15556** | 從[官方網站](https://notepad-plus-plus.org/)手動下載更新至 v8.8.9；驗證下載檔案數位簽章 |
| **假冒 7-Zip 網站** | 實施軟體白名單；驗證所有軟體下載來源；教育使用者辨識假冒網站；監控異常代理出站流量 |
| **OT/ICS 設備** | 盤點所有 RTU/HMI 設備；實施韌體完整性驗證；備份 OT 設備配置 |

#### 通用建議

- 確保 EDR 解決方案已部署並保持最新
- 實施應用程式白名單
- 定期備份關鍵資料並測試還原程序
- 監控端點異常程式執行行為

### 身分認證層面

#### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **APT28 魚叉式釣魚** | 警惕偽裝為政府或外交文件的 Office 附件（「Consultation_Topics_Ukraine(Final).doc」）；加強郵件附件過濾 |
| **預設密碼濫用** | **立即**變更所有設備預設密碼（波蘭能源攻擊與 SSH 蠕蟲均利用預設憑證） |
| **SmarterMail 密碼重設繞過** | 審查管理員帳戶密碼重設日誌；實施 IP 白名單存取管理介面 |

#### 通用建議

- 對所有關鍵系統實施多因素認證 (MFA)
- 定期審核特權帳戶與存取權限
- 實施 Privileged Access Management (PAM) 解決方案
- 定期輪替服務帳號密碼

### 資料保護層面

#### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **勒索軟體（CVE-2026-24423）** | 驗證備份完整性與可復原性；實施 3-2-1 備份策略；測試災難復原計畫 |
| **OT 資料破壞** | 備份 HMI/RTU 配置；實施 OT 資料離線備份；準備 OT 系統復原程序 |

#### 通用建議

- 實施資料分類與標籤
- 加密敏感資料
- 監控異常資料外傳

---

## 緩解策略

針對尚無修補或無法立即更新的情況：

### 0. Ivanti EPMM 零日漏洞（極緊急 - 活躍利用中）

| 措施 | 說明 |
|------|------|
| **假設已遭入侵** | 面向網際網路的 EPMM 管理介面組織應採用「假設已遭入侵」思維 |
| **入侵跡象檢查** | 檢查是否有反向 Shell、Web Shell、異常偵察活動、惡意軟體下載 |
| **網路隔離** | 立即限制 EPMM 對外部網路的暴露；僅允許必要的管理存取 |
| **漏洞公開與利用時間窗口** | 漏洞公開後數小時內即被整合至自動掃描框架，須立即回應 |
| **聯繫廠商** | 聯繫 Ivanti 支援取得最新修補指引 |
| **MDM 安全審查** | 檢視 MDM 管理的設備是否有異常配置變更或政策修改 |

> **有效期限**：**立即（零日活躍利用中）** | **來源**：NCSC-FI、Unit 42（2026-02-19）
> **漏洞**：CVE-2026-1281、CVE-2026-1340（未經認證 RCE）

### 0.1. Dell RP4VMs 零日漏洞（極緊急 - 2026-02-21）

| 措施 | 說明 |
|------|------|
| **立即執行補救腳本** | 依 [Dell DSA-2026-079](https://www.dell.com/support/kbdoc/en-us/000426773/dsa-2026-079) 指引執行補救腳本 |
| **入侵跡象檢查** | 檢查系統日誌是否有異常的 root 層級活動或未授權存取 |
| **網路隔離** | 立即限制 RP4VMs 對外部網路的暴露；僅允許必要的管理存取 |
| **憑證變更** | 變更所有相關系統的預設憑證 |
| **橫向移動監控** | 監控異常的管理者活動與橫向移動行為 |
| **停用建議** | 若無法修補，應立即停止使用受影響產品（遵循 BOD 22-01） |

> **有效期限**：**2026-02-21（本週五！）** | **來源**：CISA KEV、Google TAG（2026-02-18）
> **威脅行為者**：UNC6201（Google TAG 確認）

### 0.5. Chromium 瀏覽器 Use-After-Free（極緊急）

| 措施 | 說明 |
|------|------|
| **立即更新** | 更新所有 Chromium 基礎瀏覽器（Chrome、Edge、Opera）至最新版本 |
| **自動更新** | 確保所有瀏覽器已啟用自動更新功能 |
| **瀏覽器隔離** | 考慮部署瀏覽器隔離技術（Browser Isolation） |
| **安全瀏覽政策** | 實施安全瀏覽政策，限制造訪不受信任網站 |

> **有效期限**：直到完成更新 | **CISA 修補期限**：2026-03-10
> **來源**：CISA KEV、Chrome Stable Channel Update（2026-02-13）

### 0.6. GitLab SSRF 漏洞（新增 KEV）

| 措施 | 說明 |
|------|------|
| **套用更新** | 立即檢查 GitLab 版本並套用安全更新 |
| **Webhook 限制** | 停用或限制 webhook 對內部網路的存取權限 |
| **網路隔離** | 限制 GitLab 伺服器對敏感內部資源的存取 |
| **監控** | 監控異常的內部網路連線請求 |
| **Webhook 審查** | 檢視 webhook 設定與使用記錄，識別可疑活動 |

> **有效期限**：直到完成更新 | **CISA 修補期限**：2026-03-11
> **來源**：CISA KEV（2026-02-18 新增）

### 1. 波蘭能源攻擊緩解（OT/ICS 環境）

| 措施 | 說明 |
|------|------|
| **預設密碼變更** | 立即變更所有 HMI、RTU、OT 設備的預設密碼 |
| **邊界設備盤點** | 檢視所有可由網際網路存取的邊界設備 |
| **韌體完整性** | 實施 OT 韌體完整性驗證機制（若設備支援） |
| **網路隔離** | 將 OT 網路與 IT 網路隔離，限制存取路徑 |
| **遵循 BOD 26-02** | 依 CISA BOD 26-02 指引處理停止支援的邊界設備 |

> **有效期限**：持續執行 | **來源**：CISA、CERT Polska（2026-02-10）

### 2. BeyondTrust Remote Support / PRA（極緊急）

| 措施 | 說明 |
|------|------|
| 立即評估暴露 | 盤點所有可從網際網路存取的 BeyondTrust 產品 |
| 入侵檢查 | 檢查是否有異常命令執行、未授權存取跡象 |
| 網路隔離 | 在修補前將管理介面限制為僅允許內部存取 |
| 依廠商指引修補 | 參閱 [BeyondTrust BT26-02](https://www.beyondtrust.com/trust-center/security-advisories/bt26-02) |

> **有效期限**：直到完成修補 | **CISA 修補期限**：**2026-02-16（已過期！）**

### 3. SmarterMail（若無法立即更新）

| 措施 | 說明 |
|------|------|
| 網路隔離 | 限制 SmarterMail 伺服器僅接受內部網路連線 |
| API 封鎖 | 在防火牆層級阻斷對 ConnectToHub API 與 force-reset-password 端點的存取 |
| 備份隔離 | 立即備份郵件資料，存放於隔離環境 |
| 加強監控 | 監控異常檔案上傳、外連請求、命令執行、密碼重設活動 |

> **有效期限**：直到完成升級 | **CISA 修補期限**：2026-02-26

### 4. SSH 蠕蟲防護（IoT 設備）

| 措施 | 說明 |
|------|------|
| 密碼變更 | 立即變更所有 SSH 設備密碼（尤其 Raspberry Pi 預設密碼 pi/raspberry） |
| SSH 存取限制 | 限制 SSH 服務僅允許受信任 IP 存取 |
| 金鑰認證 | 停用密碼認證，改用 SSH 金鑰認證 |
| 監控 | 監控異常 SSH 登入、Zmap 掃描、IRC 流量 |

> **有效期限**：持續執行 | **來源**：SANS ISC（2026-02-12）

### 5. Microsoft Office 2016/2019（CVE-2026-21509）

| 措施 | 說明 |
|------|------|
| 套用臨時緩解 | 依 Microsoft 提供的臨時緩解措施設定 |
| 巨集限制 | 僅允許數位簽章的巨集執行 |
| 附件過濾 | 在郵件閘道加強可疑 .doc/.docx 附件過濾 |
| Protected View | 確保 Office Protected View 已啟用 |

> **有效期限**：直到最終修補發布 | **CISA 修補期限**：2026-02-16（已過期）

### 6. 假冒 7-Zip 代理惡意軟體

| 措施 | 說明 |
|------|------|
| 軟體來源驗證 | 僅從官方網站下載軟體，驗證數位簽章 |
| 代理流量監控 | 監控異常的出站代理流量，識別住宅代理節點行為 |
| 軟體清查 | 檢查系統是否安裝來源不明的 7-Zip 版本 |

> **有效期限**：持續執行 | **來源**：NCSC-FI、Malwarebytes（2026-02-10）

### 7. VSCode 擴充套件供應鏈風險

| 措施 | 說明 |
|------|------|
| **擴充套件審查** | 檢視組織開發者環境安裝的所有 VSCode 擴充套件 |
| **暫時停用** | 停用 Live Server、Code Runner、Markdown Preview Enhanced 等受影響擴充套件 |
| **替代方案** | 改用其他具有活躍維護的替代擴充套件 |
| **開發者工作站監控** | 監控開發者工作站是否有異常檔案存取、憑證竊取行為 |
| **安全瀏覽** | 避免在使用受影響擴充套件的 VSCode 中開啟不受信任的專案 |

> **有效期限**：直到擴充套件維護者回應並修補 | **來源**：NCSC-FI、Ox Security（2026-02-19）
> **影響範圍**：128M+ 下載量，開發者供應鏈風險

### 8. Honeywell CCTV 認證繞過（關鍵基礎設施）

| 措施 | 說明 |
|------|------|
| **網路隔離** | 將 Honeywell CCTV 設備隔離於防火牆後，最小化網路曝露 |
| **VPN 存取** | 使用安全遠端存取方式（更新的 VPN 解決方案）存取設備 |
| **帳戶審查** | 檢查裝置帳戶的復原電子郵件地址是否遭到變更 |
| **聯繫廠商** | 聯繫 Honeywell 支援取得修補指引 |
| **監控** | 監控異常的帳戶設定變更與未授權存取嘗試 |

> **有效期限**：直到廠商提供修補 | **來源**：CISA ICS Advisory（2026-02-19）
> **CVSS**：9.8（嚴重）| **影響**：商業設施、工業環境、關鍵基礎設施監控系統

---

## 注意事項

### 適用範圍與限制

1. **環境差異**：本建議為通用性質，實際實施需依據組織環境調整
2. **時效性**：基於 2026-02-14 至 2026-02-20 期間的公開資訊
3. **完整性**：不包含非公開威脅情報
4. **供應商確認**：第三方產品可能使用受影響元件，請向供應商確認
5. **OT/ICS 特別注意**：OT 環境修補需經過完整測試，避免影響生產

### 可能的副作用

| 建議措施 | 可能副作用 | 替代方案 |
|----------|------------|----------|
| Microsoft 2 月份更新 | 可能影響應用程式相容性 | 先於測試環境驗證 |
| Apple 更新 | 可能影響部分 App 相容性 | 先於測試設備驗證 |
| 暫停 SmarterMail 服務 | 郵件服務中斷 | 套用修補後重新啟用 |
| 停用 Notepad++ 自動更新 | 無法自動獲得修補 | 手動更新至 v8.8.9 |
| OT 設備密碼變更 | 可能影響自動化腳本 | 更新相關腳本配置 |

### 本週特別警示

1. **Ivanti EPMM 零日（新增！極緊急）**：CVE-2026-1281、CVE-2026-1340 正遭活躍利用，未經認證即可 RCE 控制企業 MDM 基礎設施，**假設已遭入侵**
2. **Dell RP4VMs 極緊急**：CVE-2026-22769 修補期限 **2026-02-21（本週五）**，UNC6201 正活躍利用，可取得 root 存取，**最高優先級處置**
3. **VSCode 擴充套件供應鏈風險（新增！）**：Live Server、Code Runner 等 128M+ 下載量擴充套件存在高危漏洞，維護者無回應，**建議暫時停用**
4. **Honeywell CCTV（新增！CVSS 9.8）**：CVE-2026-1670 認證繞過影響關鍵基礎設施監控系統，可實現完整帳戶接管
5. **Chromium 瀏覽器已被利用**：CVE-2026-2441 Use-After-Free 已被野外利用，影響所有 Chromium 瀏覽器，**立即更新**
6. **GitLab SSRF 歷史漏洞再現**：CVE-2021-22175 於 2026-02-18 新增至 KEV，webhook SSRF 可存取內部資源
7. **BeyondTrust 極緊急**：CVE-2026-1731 修補期限**已過期**（2026-02-16），未經驗證即可 RCE，**立即處置**
8. **勒索軟體威脅**：SmarterMail CVE-2026-24423 已確認被勒索軟體利用，最高優先級處理
9. **OT/ICS 攻擊**：波蘭能源基礎設施攻擊顯示攻擊者具備同時破壞 IT 與 OT 系統的能力，預設密碼是關鍵弱點
10. **SSH 蠕蟲**：四秒內完成感染，IoT 設備（尤其 Raspberry Pi）應立即變更預設密碼
11. **假冒軟體網站**：假冒 7-Zip 網站長期散布代理惡意軟體，下載軟體請驗證官方來源
12. **APT 活動**：APT28 利用 CVE-2026-21509 針對政府機構，攻擊文件偽裝為歐盟文件

### 建議的測試步驟

建議在正式環境部署前，於測試環境執行以下步驟：

1. **備份**：建立系統快照或完整備份
2. **更新測試**：在非生產環境測試更新
3. **功能驗證**：確認業務關鍵功能正常運作
4. **回滾計畫**：準備更新失敗時的回滾程序

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
- [x] 修補建議是否全部來自官方來源？
- [x] 是否清楚區分「通用建議」與「針對本週威脅」？
- [x] 緩解策略是否標註有效期限？
- [x] 是否有可能被誤解為「保證安全」的措辭？（已檢查，無此類措辭）
- [x] 是否標註建議的適用範圍與限制？
- [x] 所有引用的漏洞是否有正確的 CVE/TVN 編號？
- [x] 格式是否適合 IT/資安管理人員快速閱讀？

---

## 跨 Layer 關聯分析（Qdrant 語意查詢）

本週執行以下 Qdrant 語意查詢，用於跨 Layer 關聯分析：

### 查詢 1：「修補緩解措施 patch mitigation remediation」

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| 0.5630 | Tanium Patch 不當存取控制漏洞 CVE-2025-15326 | vulnerability_tracking | medium |
| 0.5516 | CVE-2025-15319 | vulnerability_tracking | critical_high |
| 0.5445 | 銘祥科技實業 IAQS 與 I6 系統嚴重身份驗證漏洞 | vulnerability_tracking | critical_high |

**關聯發現**：修補管理系統本身也存在漏洞風險（Tanium Patch），組織需確保修補工具本身已更新。身份驗證漏洞持續是高優先處理項目。

### 查詢 2：「硬編碼憑證 hardcoded credentials default password」

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| 0.5476 | FARA 軟體漏洞（硬編碼憑證）| vulnerability_tracking | critical_high |
| 0.5346 | SUR-FBD CMMS 軟體漏洞 | vulnerability_tracking | critical_high |
| 0.5305 | CVE-2026-2103: Infor SyteLine ERP 硬編碼靜態加密金鑰 | vulnerability_tracking | critical_high |
| 0.5210 | KAON CG3000T/CG3000TC 路由器韌體漏洞 | vulnerability_tracking | critical_high |

**關聯發現**：硬編碼憑證漏洞在多種產品中持續出現（Dell RP4VMs、ERP 系統、路由器韌體）。此類漏洞攻擊門檻極低，應優先修補。波蘭能源攻擊與 SSH 蠕蟲均利用預設憑證。

### 查詢 3：「零日漏洞利用 zero-day exploitation APT」

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| 0.6147 | CVE-2023-38817 PoC 追蹤更新 | exploit_intelligence | poc_available |
| 0.5980 | CVE-2026-21962 PoC 追蹤更新 | exploit_intelligence | poc_available |
| 0.5851 | CVE-2019-9978 PoC 追蹤更新 | exploit_intelligence | poc_available |
| 0.5791 | Pluck 4.7.7-dev2 PHP Code Execution | exploit_intelligence | poc_available |

**關聯發現**：PoC 公開後快速被整合至掃描框架的模式持續。Ivanti EPMM 漏洞公開後數小時內即被利用，符合此趨勢。

### 查詢 4：「防禦建議 defense security control network segmentation」

| 相似度 | 標題 | Layer | 分類 |
|--------|------|-------|------|
| 0.4405 | 高威脅安全警報 (A18-04-06): 保護網路基礎設施 | vulnerability_tracking | critical_high |
| 0.4253 | NCSC-2026-0019: Fortinet FortiSIEM 漏洞修復 | vulnerability_tracking | critical_high |
| 0.4166 | 高威脅安全警報 (A22-09-16): Sophos 防火牆漏洞 | vulnerability_tracking | critical_high |
| 0.4162 | [Control systems] CISA ICS 安全警告 (AV26-036) | vulnerability_tracking | medium |

**關聯發現**：
- 網路基礎設施防護警報與本週波蘭能源攻擊呼應
- 防火牆與 ICS 控制系統持續是攻擊目標
- 網路分段與設備隔離是關鍵防禦措施

---

> 報告產出時間：2026-02-20
> 資料截止時間：2026-02-20 UTC
> 資料來源：CISA (US)、Google TAG、CERT Polska、CERT-UA (Ukraine)、NCSC-FI (Finland)、JPCERT/CC (Japan)、SANS ISC、Malwarebytes、Canadian Centre for Cyber Security、Microsoft MSRC、Apple Security、Dell、BeyondTrust、SmarterTools、SolarWinds、GitLab、Notepad++、Ivanti、Honeywell、Ox Security、Unit 42、NVD、Exploit-DB
> 分析模型：Claude Opus 4.5
> 版本：2.2（2026-02-20 更新：新增 Ivanti EPMM CVE-2026-1281/1340 活躍利用、VSCode 擴充套件供應鏈漏洞、Honeywell CCTV CVE-2026-1670、更新 Qdrant 跨 Layer 關聯分析）
