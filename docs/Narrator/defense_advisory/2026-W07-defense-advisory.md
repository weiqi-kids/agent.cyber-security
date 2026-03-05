---
layout: seo-report
last_modified_at: 2026-02-16T00:18:54+08:00
title: 2026 第 07 週防禦建議
description: "2026-02-08 至 2026-02-15 資安防禦建議：BeyondTrust CVE-2026-1731 緊急修補（今日到期）、SmarterMail 勒索軟體漏洞、Microsoft 6 項零日漏洞修補指南。"
parent: 防禦建議
nav_order: 1
nav_exclude: false
seo_json: true
image: /assets/images/og-defense-advisory.png
author: 資安情報分析團隊
date: 2026-02-16
---

# 防禦建議 — 2026 第 07 週

> 涵蓋期間：2026-02-08 至 2026-02-15
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV
> 產出時間：2026-02-16

---

## 執行摘要

本週 CISA KEV 目錄持續大幅更新，累計新增多項活躍利用漏洞，關鍵威脅包括：

1. **BeyondTrust 遠端支援平台 RCE（2026-02-13 新增，極緊急）** — CVE-2026-1731 未經驗證命令注入，CISA 修補期限 **2026-02-16（今日到期）**
2. **SmarterMail 郵件系統漏洞（最高優先級）** — CVE-2026-24423 **已確認與勒索軟體活動相關**，CISA 修補期限 2026-02-26
3. **Microsoft Windows/Office 多重零日漏洞（6 項）** — 2026-02-10 大規模新增，涵蓋 Windows Shell、MSHTML、Office Word、DWM、RAS、RDS，修補期限 2026-03-03
4. **Apple 多平台緩衝區溢位漏洞（本週新增）** — CVE-2026-20700 影響 iOS/macOS/tvOS/watchOS/visionOS，修補期限 2026-03-05
5. **2026-02-12 KEV 新增** — SolarWinds Web Help Desk、Notepad++ 更新劫持、Microsoft Configuration Manager SQL 注入
6. **Ivanti EPMM 零日漏洞攻擊歐洲政府** — 荷蘭、芬蘭、歐盟執委會遭入侵
7. **APT 威脅行為者活動** — APT28 利用 CVE-2026-21509 攻擊烏克蘭/歐盟，UNC1069 首次使用 AI 生成影片進行社交工程

---

## 優先修補清單

按優先級排序：活躍利用 + 勒索軟體 > 活躍利用 > EPSS 高分 > CVSS 高分

### P0 - 立即處置（極緊急 - 今日到期）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| **CVE-2026-1731** | BeyondTrust Remote Support / PRA | 未經驗證命令注入 RCE (CWE-78) | **2026-02-16** | [BeyondTrust BT26-02](https://www.beyondtrust.com/trust-center/security-advisories/bt26-02) |
| **CVE-2026-24423** | SmarterMail | 缺失認證 RCE (CWE-306) | **2026-02-26** | [SmarterTools Release Notes](https://www.smartertools.com/smartermail/release-notes/current) |

> **警告 - CVE-2026-1731**：BeyondTrust Remote Support 和 Privileged Remote Access 存在未經驗證的 OS 命令注入漏洞。攻擊者無需身份驗證即可在站點使用者上下文中執行命令，可能導致系統完全控制、資料外洩。**請立即檢查所有暴露於網際網路的 BeyondTrust 產品是否有入侵跡象。**
>
> **警告 - CVE-2026-24423**：已確認被勒索軟體利用。攻擊者可透過 ConnectToHub API 將 SmarterMail 指向惡意伺服器執行命令。

### P1 - 緊急（活躍利用 - 2026-02-12 KEV 新增）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| CVE-2026-20700 | Apple iOS/macOS/tvOS/watchOS/visionOS | 緩衝區溢位 RCE (CWE-119) | 2026-03-05 | [iOS](https://support.apple.com/en-us/126346), [macOS](https://support.apple.com/en-us/126348), [tvOS](https://support.apple.com/en-us/126351), [watchOS](https://support.apple.com/en-us/126352), [visionOS](https://support.apple.com/en-us/126353) |
| CVE-2025-40536 | SolarWinds Web Help Desk | 安全控制繞過 | 2026-03-05 | [WHD 2026.1 Release Notes](https://documentation.solarwinds.com/en/success_center/whd/content/release_notes/whd_2026-1_release_notes.htm) |
| CVE-2025-15556 | Notepad++ (WinGUp) | 下載缺乏完整性檢查 RCE | 2026-03-05 | [v8.8.9 漏洞修復](https://community.notepad-plus-plus.org/topic/27298/notepad-v8-8-9-vulnerability-fix) |
| CVE-2024-43468 | Microsoft Configuration Manager | SQL 注入 | 2026-03-05 | [MSRC CVE-2024-43468](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2024-43468) |

### P2 - 緊急（活躍利用 - Microsoft 零日群集 2026-02-10）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| CVE-2026-21514 | Microsoft Office Word | 本地提權 (CWE-807) | 2026-03-03 | [MSRC CVE-2026-21514](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21514) |
| CVE-2026-21519 | Windows Desktop Window Manager | 類型混淆提權 (CWE-843) | 2026-03-03 | [MSRC CVE-2026-21519](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21519) |
| CVE-2026-21533 | Windows Remote Desktop Services | 權限管理不當提權 (CWE-269) | 2026-03-03 | [MSRC CVE-2026-21533](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21533) |
| CVE-2026-21510 | Windows Shell | 保護機制失效 (CWE-693) | 2026-03-03 | [MSRC CVE-2026-21510](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21510) |
| CVE-2026-21513 | MSHTML Framework | 保護機制失效 (CWE-693) | 2026-03-03 | [MSRC CVE-2026-21513](https://msrc.microsoft.com/update-guide/advisory/CVE-2026-21513) |
| CVE-2026-21525 | Windows Remote Access Connection Manager | NULL 指標 DoS (CWE-476) | 2026-03-03 | [MSRC CVE-2026-21525](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21525) |

### P3 - 高優先（SmarterMail 漏洞鏈 - 期限將至）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| CVE-2025-52691 | SmarterMail | 任意檔案上傳 RCE (CWE-434) | **2026-02-16** | [SmarterTools Release Notes](https://www.smartertools.com/smartermail/release-notes/current) |
| CVE-2026-23760 | SmarterMail | 認證繞過 (CWE-288) | **2026-02-16** | [SmarterTools Release Notes](https://www.smartertools.com/smartermail/release-notes/current) |
| CVE-2026-21509 | Microsoft Office | 安全功能繞過 (CWE-807) | **2026-02-16** | [MSRC CVE-2026-21509](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21509) |

> **警告**：SmarterMail 漏洞鏈（CVE-2025-52691 + CVE-2026-23760 + CVE-2026-24423）可形成完整攻擊路徑。CVE-2026-21509 已被 APT28 利用攻擊烏克蘭及歐盟政府機構。

### P4 - 本週關注（其他活躍利用）

| CVE | 產品 | 漏洞類型 | 修補期限 | 修補建議 |
|-----|------|----------|----------|----------|
| CVE-2025-40551 | SolarWinds Web Help Desk | 反序列化 RCE | **已過期** | [SolarWinds 安全公告](https://www.solarwinds.com/trust-center/security-advisories/cve-2025-40551) |
| CVE-2025-11953 | React Native CLI | 命令注入 RCE | 2026-02-26 | [GitHub PR #2735](https://github.com/react-native-community/cli/pull/2735) |
| CVE-2025-64328 | Sangoma FreePBX | 命令注入 | 2026-02-24 | [GitHub GHSA-vm9p-46mv-5xvw](https://github.com/FreePBX/security-reporting/security/advisories/GHSA-vm9p-46mv-5xvw) |
| CVE-2019-19006 | Sangoma FreePBX | 認證不當 | 2026-02-24 | [FreePBX Wiki](https://wiki.freepbx.org/display/FOP/2019-11-20%2BRemote%2BAdmin%2BAuthentication%2BBypass) |
| CVE-2021-39935 | GitLab CE/EE | SSRF | 2026-02-24 | [GitLab 14.5.2](https://about.gitlab.com/releases/2021/12/06/security-release-gitlab-14-5-2-released/) |

---

## 安全控制建議

### 網路層面

#### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **BeyondTrust RCE（極緊急）** | **立即**盤點所有暴露於網際網路的 BeyondTrust 產品；修補前限制僅允許內部存取；檢查入侵跡象 |
| **SmarterMail 勒索軟體漏洞** | 立即升級；隔離 SmarterMail 伺服器；封鎖 ConnectToHub API 的外部存取；監控異常外連 HTTP 請求 |
| **Ivanti EPMM 零日漏洞** | 限制 MDM 管理介面網路存取（僅允許受信任 IP）；部署 WAF；監控異常登入與 API 呼叫 |
| **Microsoft 零日群集** | 優先處理 RDP 暴露的系統；限制 RDP 至受信任 IP 範圍；監控異常權限提升 |
| **電信基礎設施 APT 攻擊** | 加強周邊防火牆監控；審查 VPN 日誌；對網路設備進行完整性檢查 |

#### 通用建議

- 實施網路分段，限制橫向移動
- 確保邊界設備（防火牆、VPN、負載平衡器）已更新
- 啟用 IDS/IPS 並更新特徵碼
- 部署 DNS 過濾封鎖已知惡意網域

### 端點層面

#### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **Windows 6 項零日漏洞** | 立即部署 2026 年 2 月份安全更新；特別關注使用 RDS 的系統；啟用 Attack Surface Reduction (ASR) 規則 |
| **Apple CVE-2026-20700** | 確保所有 Apple 設備啟用自動更新；透過 MDM 強制部署安全更新；暫時限制不受信任應用程式 |
| **Notepad++ CVE-2025-15556** | 從[官方網站](https://notepad-plus-plus.org/)手動下載更新至 v8.8.9；驗證下載檔案數位簽章 |
| **假冒 7-Zip 網站** | 實施軟體白名單；驗證所有軟體下載來源；教育使用者辨識假冒網站 |

#### 通用建議

- 確保 EDR 解決方案已部署並保持最新
- 實施應用程式白名單
- 定期備份關鍵資料並測試還原程序
- 監控端點異常程式執行行為

### 身分認證層面

#### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **AI 社交工程攻擊（UNC1069）** | 更新安全意識培訓，納入 AI 生成內容（深偽）識別；對視訊會議敏感請求要求二次確認 |
| **APT28 魚叉式釣魚** | 警惕偽裝為政府或外交文件的 Office 附件；加強郵件附件過濾 |
| **WhatsApp 帳戶接管詐騙** | 啟用所有應用程式雙因素認證；教育員工識別「已知聯絡人」的異常請求 |

#### 通用建議

- 對所有關鍵系統實施多因素認證 (MFA)
- 定期審核特權帳戶與存取權限
- 實施 Privileged Access Management (PAM) 解決方案
- 定期輪替服務帳號密碼

---

## 緩解策略

針對尚無修補或無法立即更新的情況：

### 1. BeyondTrust Remote Support / PRA（極緊急）

| 措施 | 說明 |
|------|------|
| 立即評估暴露 | 盤點所有可從網際網路存取的 BeyondTrust 產品 |
| 入侵檢查 | 檢查是否有異常命令執行、未授權存取跡象 |
| 網路隔離 | 在修補前將管理介面限制為僅允許內部存取 |
| 依廠商指引修補 | 參閱 [BeyondTrust BT26-02](https://www.beyondtrust.com/trust-center/security-advisories/bt26-02) |

> **有效期限**：直到完成修補 | **CISA 修補期限**：**2026-02-16（今日到期！）**

### 2. SmarterMail（若無法立即更新）

| 措施 | 說明 |
|------|------|
| 網路隔離 | 限制 SmarterMail 伺服器僅接受內部網路連線 |
| API 封鎖 | 在防火牆層級阻斷對 ConnectToHub API 端點的存取 |
| 備份隔離 | 立即備份郵件資料，存放於隔離環境 |
| 加強監控 | 監控異常檔案上傳、外連請求、命令執行 |

> **有效期限**：直到完成升級 | **CISA 修補期限**：2026-02-26

### 3. Ivanti EPMM（MDM）

| 措施 | 說明 |
|------|------|
| 管理介面限制 | 將管理介面限制為僅允許 VPN 連線 |
| 存取日誌審計 | 審查過去 30 天的存取日誌，尋找異常登入 |
| 用戶資料審核 | 確認是否有未授權的配置變更或用戶資料存取 |

> **有效期限**：直到 Ivanti 發布修補 | **重新評估日期**：2026-02-21

### 4. Notepad++（若無法立即更新）

| 措施 | 說明 |
|------|------|
| 停用自動更新 | 暫時停用 WinGUp 自動更新功能 |
| 手動更新 | 從官方網站手動下載並驗證數位簽章 |
| 網路監控 | 監控異常的更新流量 |

> **有效期限**：直到完成更新 | **CISA 修補期限**：2026-03-05

### 5. Microsoft Office 2016/2019（CVE-2026-21509）

| 措施 | 說明 |
|------|------|
| 套用臨時緩解 | 依 Microsoft 提供的臨時緩解措施設定 |
| 巨集限制 | 僅允許數位簽章的巨集執行 |
| 附件過濾 | 在郵件閘道加強可疑 .doc/.docx 附件過濾 |
| Protected View | 確保 Office Protected View 已啟用 |

> **有效期限**：直到最終修補發布 | **CISA 修補期限**：2026-02-16

### 6. n8n 自動化平台（若使用）

| 措施 | 說明 |
|------|------|
| 版本升級 | 升級至 1.121.0 或更新版本 |
| 功能停用 | 設定 `N8N_PYTHON_ENABLED=false`；透過 `NODES_EXCLUDE` 停用 Code/Git Node |
| 網路隔離 | 避免將 n8n 直接暴露於網際網路 |

> **有效期限**：直到升級至安全版本 | **重新評估日期**：2026-02-16

---

## 注意事項

### 適用範圍與限制

1. **環境差異**：本建議為通用性質，實際實施需依據組織環境調整
2. **時效性**：基於 2026-02-08 至 2026-02-15 期間的公開資訊
3. **完整性**：不包含非公開威脅情報
4. **供應商確認**：第三方產品可能使用受影響元件，請向供應商確認

### 可能的副作用

| 建議措施 | 可能副作用 | 替代方案 |
|----------|------------|----------|
| Microsoft 2 月份更新 | 可能影響應用程式相容性 | 先於測試環境驗證 |
| Apple 更新 | 可能影響部分 App 相容性 | 先於測試設備驗證 |
| 暫停 SmarterMail 服務 | 郵件服務中斷 | 套用修補後重新啟用 |
| 停用 Notepad++ 自動更新 | 無法自動獲得修補 | 手動更新至 v8.8.9 |
| 隔離 Ivanti EPMM | 行動裝置管理功能受限 | 修補後恢復 |

### 本週特別警示

1. **BeyondTrust 極緊急**：CVE-2026-1731 修補期限**今日到期**（2026-02-16），未經驗證即可 RCE，**立即處置**
2. **勒索軟體威脅**：SmarterMail CVE-2026-24423 已確認被勒索軟體利用，最高優先級處理
3. **AI 社交工程**：UNC1069 首次使用 AI 生成影片進行攻擊，傳統安全培訓可能不足以應對
4. **假冒軟體網站**：假冒 7-Zip 網站長期散布惡意軟體，下載軟體請驗證官方來源
5. **APT 活動**：APT28 利用 CVE-2026-21509 針對政府機構，UNC3886 攻擊電信基礎設施

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

## 自我審核結果

- [x] 是否包含完整免責聲明？
- [x] 修補建議是否全部來自官方來源？
- [x] 是否清楚區分「通用建議」與「針對本週威脅」？
- [x] 緩解策略是否標註有效期限？
- [x] 是否有可能被誤解為「保證安全」的措辭？（無）
- [x] 是否標註建議的適用範圍與限制？
- [x] 所有引用的漏洞是否有正確的 CVE 編號？
- [x] 格式是否適合 IT/資安管理人員快速閱讀？

---

> 產出時間：2026-02-16
> 資料截止時間：2026-02-15 UTC
> 資料來源：CISA KEV、Microsoft MSRC、Apple Security、BeyondTrust、SmarterTools、SolarWinds、Notepad++、NCSC-FI、CERT-UA、Singapore CSA、Mandiant
> 分析模型：Claude Opus 4.5
> 版本：1.1（2026-02-16 更新：更新 BeyondTrust 修補期限警示）
