---
layout: default
title: 2026 第 07 週
parent: 防禦建議
nav_order: 1
nav_exclude: false
---

# 防禦建議 — 2026 第 07 週
> 涵蓋期間：2026-02-07 至 2026-02-13
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV
> 產出時間：2026-02-13（更新）

---

## 執行摘要

本週 CISA 持續更新 KEV 目錄，累計 **24 項活躍利用漏洞**需優先修補。關鍵威脅包括：

1. **SmarterMail 郵件系統漏洞（最高優先級）** — CVE-2026-24423 **已確認與勒索軟體活動相關**，CISA 修補期限 2026-02-26，全球逾 6,000 台伺服器暴露
2. **Microsoft Windows/Office 多重漏洞（6 項活躍利用）** — 包含 Windows Shell、MSHTML Framework、Remote Desktop Services、Desktop Windows Manager 及 Office Word 等元件漏洞，CISA 修補期限 2026-03-03
3. **Apple 多平台緩衝區溢位漏洞（本週新增）** — CVE-2026-20700 影響 iOS、macOS、tvOS、watchOS、visionOS，已被活躍利用，CISA 修補期限 2026-03-05
4. **n8n 自動化平台重大漏洞（4 項 CVSS 9.9-10.0）** — CVE-2026-21858、CVE-2026-21877 等漏洞允許未經授權的遠端程式碼執行
5. **MongoDB MongoBleed 記憶體洩漏**（CVE-2025-14847）— 全球 8.7 萬台伺服器面臨敏感資料外洩風險

**本週威脅態勢重點：**
- Ivanti 零日漏洞攻擊歐洲政府機構
- APT UNC3886 攻擊新加坡電信業
- 假冒 7-Zip 網站散布惡意軟體

---

## 優先修補清單

按優先級排序：活躍利用 + 勒索軟體 > 活躍利用 > EPSS 高分 > CVSS 高分

### P0 - 立即處置（活躍利用中 + 與勒索軟體相關）

#### 1. CVE-2026-24423 — SmarterMail 關鍵功能缺失認證漏洞（與勒索軟體相關）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | SmarterMail 的 ConnectToHub API 方法存在關鍵功能缺失認證漏洞（CWE-306），攻擊者可將 SmarterMail 實例指向惡意 HTTP 伺服器，該伺服器提供惡意作業系統命令，導致遠端程式碼執行（RCE） |
| **影響產品** | SmarterTools SmarterMail |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 參閱 SmarterTools 官方發布說明，套用最新安全更新 |
| **官方連結** | https://www.smartertools.com/smartermail/release-notes/current |
| **利用狀態** | 活躍利用中（CISA KEV），**已確認與勒索軟體活動相關**，全球逾 6,000 台伺服器暴露 |
| **CISA 修補期限** | **2026-02-26** |

### P1 - 緊急（活躍利用中 - Microsoft Windows）

#### 2. CVE-2026-21510 — Microsoft Windows Shell 保護機制失效漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Windows Shell 存在保護機制失效漏洞（CWE-693），允許未授權攻擊者透過網路繞過安全功能 |
| **影響產品** | Microsoft Windows（多個版本） |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21510 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

#### 3. CVE-2026-21514 — Microsoft Office Word 安全決策依賴不受信任輸入漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Office Word 存在安全決策依賴不受信任輸入漏洞（CWE-807），允許已授權攻擊者本地提升權限 |
| **影響產品** | Microsoft Office（多個版本） |
| **CVSS/嚴重程度** | High |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21514 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

#### 4. CVE-2026-21519 — Microsoft Desktop Windows Manager 類型混淆漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Desktop Windows Manager 存在類型混淆漏洞（CWE-843），允許已授權攻擊者本地提升權限 |
| **影響產品** | Microsoft Windows（多個版本） |
| **CVSS/嚴重程度** | High |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21519 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

#### 5. CVE-2026-21533 — Microsoft Windows Remote Desktop Services 權限管理不當漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Windows Remote Desktop Services 存在權限管理不當漏洞（CWE-269），允許已授權攻擊者本地提升權限 |
| **影響產品** | Microsoft Windows（多個版本） |
| **CVSS/嚴重程度** | High |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21533 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

#### 6. CVE-2026-21513 — Microsoft MSHTML Framework 保護機制失效漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft MSHTML Framework 存在保護機制失效漏洞（CWE-693），允許未授權攻擊者透過網路繞過安全功能 |
| **影響產品** | Microsoft Windows（多個版本） |
| **CVSS/嚴重程度** | Medium |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/advisory/CVE-2026-21513 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

#### 7. CVE-2026-21525 — Microsoft Windows Remote Access Connection Manager NULL 指標解引用漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Windows Remote Access Connection Manager 存在 NULL 指標解引用漏洞（CWE-476），允許未授權攻擊者造成本地服務中斷 |
| **影響產品** | Microsoft Windows（多個版本） |
| **CVSS/嚴重程度** | Medium |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21525 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

### P2 - 高優先（活躍利用中 - Apple 設備）

#### 8. CVE-2026-20700 — Apple 多平台緩衝區溢位漏洞（本週新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Apple iOS、macOS、tvOS、watchOS 及 visionOS 存在記憶體緩衝區操作限制不當漏洞（CWE-119），具有記憶體寫入能力的攻擊者可執行任意程式碼 |
| **影響產品** | Apple iOS、macOS、tvOS、watchOS、visionOS（多個版本） |
| **CVSS/嚴重程度** | High |
| **修補方式** | 套用 Apple 最新安全更新 |
| **官方連結** | https://support.apple.com/en-us/126346 / https://support.apple.com/en-us/126348 / https://support.apple.com/en-us/126351 / https://support.apple.com/en-us/126352 / https://support.apple.com/en-us/126353 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-05** |

### P3 - 緊急（活躍利用中，本週內完成修補）

#### 9. CVE-2026-21858 — n8n 自動化平台「Ni8mare」未授權 RCE 漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | n8n 平台 Webhook 處理過程中存在 Content-Type 混淆缺陷，未經身分驗證的攻擊者可繞過檔案上傳解析器，讀取伺服器任意檔案，竊取加密金鑰後偽造管理員 Session Cookie，最終執行任意程式碼（RCE） |
| **影響產品** | n8n >= 1.65.0 <1.121.0 |
| **CVSS/嚴重程度** | 10.0 (Critical) |
| **修補方式** | 升級至 n8n 1.121.0 或更新版本 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-104-10688-91d6d-1.html |
| **利用狀態** | 高風險，PoC 可能已公開 |

#### 10. CVE-2026-21877 — n8n Git 節點路徑驗證漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | n8n Git 節點功能對儲存庫路徑缺乏足夠驗證，經過身分驗證的攻擊者可藉由惡意路徑操控檔案系統並執行惡意程式碼 |
| **影響產品** | n8n >= 0.121.2 |
| **CVSS/嚴重程度** | 10.0 (Critical) |
| **修補方式** | 升級至安全版本 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-104-10688-91d6d-1.html |
| **利用狀態** | 高風險 |

#### 11. CVE-2025-14847 — MongoDB MongoBleed 記憶體資料外洩漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | MongoDB Server 處理 zlib 壓縮訊息時，對解壓後資料長度處理出現錯誤，導致回應中可能夾帶未初始化的堆（heap）記憶體殘留資料 |
| **影響產品** | MongoDB Server 多個版本 |
| **CVSS/嚴重程度** | 8.7 (High - CVSS 4.x) |
| **修補方式** | 更新至 8.2.3、8.0.17、7.0.28、6.0.27、5.0.32 或 4.4.30 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-104-10656-84f7e-1.html |
| **利用狀態** | 活躍利用中（CISA KEV），全球逾 8.7 萬台伺服器暴露 |

#### 12. CVE-2025-40551 — SolarWinds Web Help Desk 反序列化漏洞（修補期限已過）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | SolarWinds Web Help Desk 存在不受信任資料的反序列化漏洞，可導致遠端程式碼執行 |
| **影響產品** | SolarWinds Web Help Desk |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新，若無可用緩解措施則停止使用 |
| **官方連結** | https://www.solarwinds.com/trust-center/security-advisories/cve-2025-40551 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-02-06**（已過期，需立即處理） |

#### 13. CVE-2025-11953 — React Native CLI 命令注入漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | React Native Community CLI 存在作業系統命令注入漏洞，未經驗證的網路攻擊者可透過 Metro Development Server 執行任意執行檔 |
| **影響產品** | React Native Community CLI |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新 |
| **官方連結** | https://github.com/react-native-community/cli/pull/2735 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-02-26** |

#### 14. CVE-2025-64328 — Sangoma FreePBX 命令注入漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Sangoma FreePBX Endpoint Manager 存在作業系統命令注入漏洞 |
| **影響產品** | Sangoma FreePBX |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新 |
| **官方連結** | https://github.com/FreePBX/security-reporting/security/advisories/GHSA-vm9p-46mv-5xvw |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-24 |

#### 15. CVE-2019-19006 — Sangoma FreePBX 認證不當漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Sangoma FreePBX 存在認證不當漏洞，可能允許未授權使用者繞過密碼驗證 |
| **影響產品** | Sangoma FreePBX |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新 |
| **官方連結** | https://wiki.freepbx.org/display/FOP/2019-11-20%2BRemote%2BAdmin%2BAuthentication%2BBypass |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-24 |

#### 16. CVE-2021-39935 — GitLab SSRF 漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | GitLab Community 及 Enterprise Editions 存在伺服器端請求偽造（SSRF）漏洞 |
| **影響產品** | GitLab Community 及 Enterprise Editions |
| **CVSS/嚴重程度** | High |
| **修補方式** | 升級至 GitLab 14.5.2 或更新版本 |
| **官方連結** | https://about.gitlab.com/releases/2021/12/06/security-release-gitlab-14-5-2-released/ |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-24 |

### P4 - 關注（Critical/High CVSS）

#### 17. CVE-2025-68668 — n8n「N8scape」Python 沙箱逃逸漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | n8n Python 節點中 Pyodide 環境與 JavaScript 之間的互操作機制存在沙箱逃逸漏洞 |
| **影響產品** | n8n >= 1.0.0 <2.0.0 |
| **CVSS/嚴重程度** | 9.9 (Critical) |
| **修補方式** | 升級至安全版本，或設定 N8N_PYTHON_ENABLED=false 暫時停用 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-104-10688-91d6d-1.html |
| **利用狀態** | 高風險 |

#### 18. CVE-2025-68613 — n8n 表達式注入漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | n8n 允許經過身分驗證的攻擊者透過表達式注入惡意遠端程式碼 |
| **影響產品** | n8n >= 0.211.0 <1.120.4 |
| **CVSS/嚴重程度** | 9.9 (Critical) |
| **修補方式** | 升級至 1.120.4 或更新版本 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-104-10688-91d6d-1.html |
| **利用狀態** | 高風險 |

#### 19. CVE-2026-1427/1428/1429 — 葳橋資訊單一簽入系統多重漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | 葳橋資訊單一簽入系統存在 OS Command Injection 及 Reflected XSS 漏洞 |
| **影響產品** | 葳橋資訊單一簽入暨電子目錄服務系統（V4）IFTOP_P4_181 之前版本 |
| **CVSS/嚴重程度** | 8.8 (High) |
| **修補方式** | 更新至 IFTOP_P4_181 或更新版本 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-132-10654-23f40-1.html |
| **利用狀態** | 無已知活躍利用 |

#### 20. CVE-2026-0629 — TP-Link VIGI 系列 IP 攝影機認證繞過漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | TP-Link VIGI 系列 IP 攝影機的密碼恢復功能存在認證繞過漏洞 |
| **影響產品** | TP-Link VIGI Cx45/Cx55/Cx85/C340S/C540S/C540V/C250 等 30+ 型號 |
| **CVSS/嚴重程度** | 8.8 (High) |
| **修補方式** | 更新至最新韌體版本 |
| **官方連結** | https://www.tp-link.com/us/support/faq/4906/ |
| **利用狀態** | 無已知活躍利用（僅限區域網路攻擊） |

---

## 安全控制建議

### 通用建議

| 層面 | 控制措施 |
|------|----------|
| **網路層** | 實施網路分段、部署 IDS/IPS、限制管理介面的網路存取 |
| **端點層** | 確保所有端點安裝 EDR、啟用作業系統自動更新、實施應用程式白名單 |
| **身分認證層** | 對所有管理介面啟用多因素認證（MFA）、定期輪替服務帳號密碼 |
| **資料保護層** | 加密敏感資料（傳輸中與靜態）、定期備份並驗證還原程序 |
| **供應鏈層** | 強化 CI/CD 管線中的依賴掃描機制、鎖定套件版本 |

### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **SmarterMail 勒索軟體相關漏洞（CVE-2026-24423）** | 立即升級至最新版本；隔離備份郵件資料；審查管理帳號；監控異常檔案上傳或命令執行 |
| **Microsoft Windows/Office 6 項活躍利用漏洞** | 立即套用 2 月份安全更新；優先處理暴露於網路的系統；監控異常的權限提升活動 |
| **Apple 多平台漏洞（CVE-2026-20700）** | 立即套用 Apple 最新安全更新；確保所有 iOS、macOS、tvOS、watchOS、visionOS 設備已更新 |
| **Ivanti 零日漏洞攻擊** | 檢查 Ivanti EPMM 是否已修補；限制管理介面網路存取；監控異常 API 呼叫 |
| **APT UNC3886 電信業攻擊** | 加強電信業相關系統監控；審查 VPN 及遠端存取日誌；實施網路分段 |
| **假冒 7-Zip 網站惡意軟體** | 驗證軟體下載來源；使用官方網站或信任的軟體倉庫；實施應用程式白名單 |
| **n8n 自動化平台漏洞** | 升級至安全版本；限制平台網路存取；暫時停用 Code Node、Git Node 或 Python 執行功能 |
| **MongoDB MongoBleed 漏洞** | 更新至修補版本；暫時停用 zlib 壓縮；限制 MongoDB 直接暴露於網路 |

---

## 緩解策略

以下針對尚無修補方案或需要額外緩解的威脅提供策略。

### 1. SmarterMail 勒索軟體相關漏洞（CVE-2026-24423）

由於此漏洞已確認與勒索軟體活動相關，需採取最高優先級措施。

**緩解措施：**
- 立即備份所有郵件資料（隔離備份，避免連線至生產環境）
- 限制 SmarterMail 伺服器的網路存取（僅允許必要的 SMTP/IMAP/POP3 流量）
- 封鎖對 ConnectToHub API 的外部存取
- 審查並移除所有可疑的管理帳號
- 監控系統是否有異常檔案上傳或命令執行
- 若無法立即修補，考慮暫時停止服務

> **有效期限**：直到完成升級
> **CISA 修補期限**：2026-02-26

### 2. Microsoft Windows/Office 多項活躍利用漏洞

**緩解措施：**
- 立即套用 2026 年 2 月份 Patch Tuesday 安全更新
- 優先處理 Remote Desktop Services、Windows Shell、MSHTML Framework 相關系統
- 監控 Windows 事件日誌中的異常權限提升活動
- 限制 RDP 存取至受信任 IP 範圍
- 啟用 Windows Defender Credential Guard
- 對 Office 文件啟用 Protected View 並限制巨集執行

> **有效期限**：直到完成修補
> **CISA 修補期限**：2026-03-03

### 3. Apple 多平台漏洞（CVE-2026-20700）

**緩解措施：**
- 立即透過系統偏好設定/設定 App 套用最新系統更新
- 確保所有受管理的 iOS、macOS、tvOS、watchOS、visionOS 設備已更新
- 透過 MDM 強制推送更新至企業設備
- 監控異常的記憶體存取或程式碼執行行為

> **有效期限**：直到完成更新
> **CISA 修補期限**：2026-03-05

### 4. Ivanti EPMM 零日漏洞（針對本週威脅態勢）

**緩解措施：**
- 檢查 Ivanti EPMM 是否為最新修補版本
- 限制管理介面的網路存取（僅允許受信任 IP）
- 審查存取日誌是否有異常活動
- 監控異常的 API 呼叫行為
- 若尚未修補，考慮暫時將 EPMM 從網際網路隔離

> **有效期限**：直到確認已修補
> **重新評估日期**：2026-02-16

### 5. n8n 自動化平台漏洞（CVE-2026-21858、CVE-2026-21877 等）

**緩解措施：**
- 升級至官方安全版本
- 若無法立即更新：
  - 透過 `NODES_EXCLUDE` 環境變數暫時停用 Code Node 或 Git Node
  - 設定 `N8N_PYTHON_ENABLED=false` 關閉 Python 執行功能
- 避免將 n8n 直接暴露於網際網路
- 強制啟用身分驗證與 MFA
- 監控工作流程日誌中的異常 child_process 建立或檔案系統寫入

> **有效期限**：直到升級至安全版本
> **重新評估日期**：2026-02-16

### 6. SolarWinds Web Help Desk 漏洞（CVE-2025-40551）— 修補期限已過

**緩解措施：**
- 立即套用修補或停止服務
- 隔離 Web Help Desk 伺服器
- 審查系統日誌以確認是否遭入侵
- 若發現入侵跡象，啟動事件回應程序

> **有效期限**：立即處理
> **狀態**：緊急（修補期限已過）

### 7. 假冒軟體下載網站防範

針對本週發現的假冒 7-Zip 網站惡意軟體散布活動。

**緩解措施：**
- 實施軟體白名單，僅允許從官方來源安裝軟體
- 使用 DNS 過濾封鎖已知惡意網域
- 教育使用者辨識假冒網站
- 監控端點的異常程式執行行為
- 在下載軟體前驗證數位簽章

> **有效期限**：持續執行
> **重新評估日期**：每週

---

## 注意事項

### 適用範圍與限制

1. **環境差異**：本報告所列建議為通用性質，實際實施前請評估組織特定環境、業務需求和風險承受度

2. **時效性**：報告基於 2026-02-07 至 2026-02-13 期間的公開資訊，新漏洞可能在報告發布後出現

3. **完整性**：報告涵蓋主要公開來源（CISA KEV、CISA ICS-CERT、TWCERT/CC、GovCERT.HK、GitHub Security Advisories），不包含非公開威脅情報

4. **供應商確認**：第三方產品可能使用受影響的開源元件，建議向供應商確認是否受影響

5. **翻譯風險**：部分非英文來源經 AI 處理，修補建議請以官方原文為準

### 可能的副作用

| 建議措施 | 可能副作用 | 替代方案 |
|----------|------------|----------|
| 套用 Microsoft 2 月份更新 | 可能影響部分應用程式相容性 | 先於測試環境驗證 |
| 套用 Apple 更新 | 可能影響部分 App 相容性 | 先於測試設備驗證 |
| 暫停 SmarterMail 服務 | 郵件服務中斷 | 套用修補後重新啟用 |
| 停用 n8n Python/Git Node | 依賴這些功能的工作流程將失效 | 升級至安全版本後恢復 |
| 停用 MongoDB zlib 壓縮 | 網路傳輸效能下降 | 儘速升級至修補版本 |
| 隔離 Ivanti EPMM | 行動裝置管理功能受限 | 修補後恢復 |
| 重設管理憑證 | 短暫中斷管理存取 | 安排維護時段執行 |

### 測試建議

1. **修補前測試**：在測試環境中套用安全更新，確認不影響系統正常運作
2. **修補後驗證**：使用漏洞掃描工具確認漏洞已被修補
3. **回滾計畫**：為每項修補準備回滾方案
4. **功能驗證**：修補後驗證關鍵業務流程是否正常運作
5. **監控期間**：修補後至少監控 48 小時

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

> 報告產出時間：2026-02-13（更新）
> 資料來源：CISA KEV、CISA ICS-CERT、TWCERT/CC、GovCERT.HK、GitHub Security Advisories、NVD
> 本報告使用 Qdrant 向量資料庫進行關聯分析
