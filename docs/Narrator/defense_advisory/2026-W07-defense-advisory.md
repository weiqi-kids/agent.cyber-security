---
layout: default
title: 2026 第 07 週
parent: 防禦建議
nav_order: 1
nav_exclude: false
---

# 防禦建議 — 2026 第 07 週
> 涵蓋期間：2026-02-04 至 2026-02-11
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV
> 產出時間：2026-02-11

---

## 執行摘要

本週 CISA 大規模更新 KEV 目錄，新增 **6 項 Microsoft Windows/Office 相關漏洞**，這是繼上週後第二波 Microsoft 產品活躍利用漏洞警報。本週共有 **23 項活躍利用漏洞**需優先修補，關鍵威脅包括：

1. **Microsoft 2 月修補週二（6 項活躍利用）** — 包含 MSHTML Framework、Windows Shell、Remote Desktop Services、Desktop Windows Manager 及 Office Word 等元件漏洞，攻擊者可繞過安全機制、提升權限或造成服務中斷
2. **SmarterMail 郵件系統漏洞（持續追蹤）** — CVE-2026-24423 仍為本週最高優先級，**已確認與勒索軟體活動相關**，全球逾 6,000 台伺服器暴露
3. **n8n 自動化平台重大漏洞（4 項 CVSS 9.9-10.0）** — CVE-2026-21858、CVE-2026-21877 等漏洞允許未經授權的遠端程式碼執行
4. **MongoDB MongoBleed 記憶體洩漏**（CVE-2025-14847）— 全球 8.7 萬台伺服器面臨敏感資料外洩風險，已被納入 CISA KEV
5. **TP-Link VIGI 系列 IP 攝影機認證繞過**（CVE-2026-0629）— 影響 30+ 型號，CVSS 8.8

台灣地區方面，TWCERT/CC 通報 **葳橋資訊單一簽入系統** 存在多重 OS Command Injection 漏洞（CVE-2026-1427/1428/1429），CVSS 8.8。

---

## 優先修補清單

按優先級排序：活躍利用 > EPSS 高分 > CVSS 高分

### P0 - 立即處置（活躍利用中，與勒索軟體相關或修補期限已過）

#### 1. CVE-2026-24423 — SmarterMail 關鍵功能缺失認證漏洞（與勒索軟體相關）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | SmarterMail 的 ConnectToHub API 方法存在關鍵功能缺失認證漏洞，攻擊者可將 SmarterMail 實例指向惡意 HTTP 伺服器，該伺服器提供惡意作業系統命令，導致命令執行 |
| **影響產品** | SmarterTools SmarterMail |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新，若無可用緩解措施則停止使用 |
| **官方連結** | https://www.smartertools.com/smartermail/release-notes/current |
| **利用狀態** | 活躍利用中（CISA KEV），**已確認與勒索軟體活動相關**，全球逾 6,000 台伺服器暴露 |
| **CISA 修補期限** | **2026-02-26** |

#### 2. CVE-2026-21513 — Microsoft MSHTML Framework 保護機制失效漏洞（本週新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft MSHTML Framework 存在保護機制失效漏洞（CWE-693），允許未授權攻擊者透過網路繞過安全功能 |
| **影響產品** | Microsoft Windows |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2026-21513 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 依 BOD 22-01 指引 |

#### 3. CVE-2026-21510 — Microsoft Windows Shell 保護機制失效漏洞（本週新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Windows Shell 存在保護機制失效漏洞（CWE-693），允許未授權攻擊者透過網路繞過安全功能 |
| **影響產品** | Microsoft Windows |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21510 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 依 BOD 22-01 指引 |

#### 4. CVE-2026-21533 — Microsoft Windows Remote Desktop Services 權限管理不當漏洞（本週新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Windows Remote Desktop Services 存在權限管理不當漏洞（CWE-269），允許已授權攻擊者本地提升權限 |
| **影響產品** | Microsoft Windows |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21533 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 依 BOD 22-01 指引 |

#### 5. CVE-2026-21519 — Microsoft Desktop Windows Manager 類型混淆漏洞（本週新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Desktop Windows Manager 存在類型混淆漏洞（CWE-843），允許已授權攻擊者本地提升權限 |
| **影響產品** | Microsoft Windows |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21519 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 依 BOD 22-01 指引 |

#### 6. CVE-2026-21514 — Microsoft Office Word 安全決策依賴不受信任輸入漏洞（本週新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Office Word 存在安全決策依賴不受信任輸入漏洞（CWE-807），允許已授權攻擊者本地提升權限 |
| **影響產品** | Microsoft Office |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21514 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 依 BOD 22-01 指引 |

#### 7. CVE-2026-21525 — Microsoft Windows Remote Access Connection Manager NULL 指標解引用漏洞（本週新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Windows Remote Access Connection Manager 存在 NULL 指標解引用漏洞（CWE-476），允許未授權攻擊者造成本地服務中斷 |
| **影響產品** | Microsoft Windows |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 套用 Microsoft 2 月份安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21525 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 依 BOD 22-01 指引 |

### P1 - 緊急（活躍利用中，本週內完成修補）

#### 8. CVE-2026-21858 — n8n 自動化平台「Ni8mare」未授權 RCE 漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | n8n 平台 Webhook 處理過程中存在 Content-Type 混淆缺陷，未經身分驗證的攻擊者可繞過檔案上傳解析器，讀取伺服器任意檔案，竊取加密金鑰後偽造管理員 Session Cookie，最終執行任意程式碼（RCE） |
| **影響產品** | n8n >= 1.65.0 <1.121.0 |
| **CVSS/嚴重程度** | 10.0 (Critical) |
| **修補方式** | 升級至 n8n 1.121.0 或更新版本 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-104-10688-91d6d-1.html |
| **利用狀態** | 高風險，PoC 可能已公開 |

#### 9. CVE-2026-21877 — n8n Git 節點路徑驗證漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | n8n Git 節點功能對儲存庫路徑缺乏足夠驗證，經過身分驗證的攻擊者可藉由惡意路徑操控檔案系統並執行惡意程式碼，影響範圍涵蓋自託管及雲端版本 |
| **影響產品** | n8n >= 0.121.2 |
| **CVSS/嚴重程度** | 10.0 (Critical) |
| **修補方式** | 升級至安全版本 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-104-10688-91d6d-1.html |
| **利用狀態** | 高風險 |

#### 10. CVE-2025-14847 — MongoDB MongoBleed 記憶體資料外洩漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | MongoDB Server 處理 zlib 壓縮訊息時，對解壓後資料長度處理出現錯誤，導致回應中可能夾帶未初始化的堆（heap）記憶體殘留資料，攻擊者可累積取得敏感資訊（如憑證、金鑰或 Token） |
| **影響產品** | MongoDB Server 多個版本 |
| **CVSS/嚴重程度** | 8.7 (High - CVSS 4.x) |
| **修補方式** | 更新至 8.2.3、8.0.17、7.0.28、6.0.27、5.0.32 或 4.4.30 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-104-10656-84f7e-1.html |
| **利用狀態** | 活躍利用中（CISA KEV），全球逾 8.7 萬台伺服器暴露 |
| **CISA 修補期限** | 依 BOD 22-01 指引 |

#### 11. CVE-2025-40551 — SolarWinds Web Help Desk 反序列化漏洞（持續追蹤）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | SolarWinds Web Help Desk 存在不受信任資料的反序列化漏洞，可導致遠端程式碼執行。攻擊者無需身份驗證即可在主機上執行命令 |
| **影響產品** | SolarWinds Web Help Desk |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新，若無可用緩解措施則停止使用 |
| **官方連結** | https://www.solarwinds.com/trust-center/security-advisories/cve-2025-40551 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-02-06**（已過期，需立即處理） |

#### 12. CVE-2025-11953 — React Native CLI 命令注入漏洞（持續追蹤）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | React Native Community CLI 存在作業系統命令注入漏洞，未經驗證的網路攻擊者可透過 Metro Development Server 的易受攻擊端點傳送 POST 請求執行任意執行檔 |
| **影響產品** | React Native Community CLI |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新 |
| **官方連結** | https://github.com/react-native-community/cli/pull/2735 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-02-26** |

#### 13. CVE-2025-64328 — Sangoma FreePBX 命令注入漏洞（持續追蹤）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Sangoma FreePBX Endpoint Manager 存在作業系統命令注入漏洞，已認證使用者可透過 testconnection -> check_ssh_connect() 函數執行後驗證命令注入 |
| **影響產品** | Sangoma FreePBX |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新 |
| **官方連結** | https://github.com/FreePBX/security-reporting/security/advisories/GHSA-vm9p-46mv-5xvw |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-24 |

#### 14. CVE-2019-19006 — Sangoma FreePBX 認證不當漏洞（持續追蹤）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Sangoma FreePBX 存在認證不當漏洞，可能允許未授權使用者繞過密碼驗證 |
| **影響產品** | Sangoma FreePBX |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新 |
| **官方連結** | https://wiki.freepbx.org/display/FOP/2019-11-20%2BRemote%2BAdmin%2BAuthentication%2BBypass |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-24 |

#### 15. CVE-2021-39935 — GitLab SSRF 漏洞（持續追蹤）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | GitLab Community 及 Enterprise Editions 存在伺服器端請求偽造（SSRF）漏洞，可允許未授權外部使用者透過 CI Lint API 執行伺服器端請求 |
| **影響產品** | GitLab Community 及 Enterprise Editions |
| **CVSS/嚴重程度** | High |
| **修補方式** | 升級至 GitLab 14.5.2 或更新版本 |
| **官方連結** | https://about.gitlab.com/releases/2021/12/06/security-release-gitlab-14-5-2-released/ |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-24 |

### P2 - 高優先（Critical/High CVSS，需本週內完成修補）

#### 16. CVE-2026-25505 — Bambuddy 硬編碼 JWT 金鑰與缺失認證漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Bambuddy 使用硬編碼的 JWT 簽名金鑰（"bambuddy-secret-key-change-in-production"），且大多數 API 端點未實作認證檢查，攻擊者可偽造任意使用者的 JWT Token 並取得完整管理權限 |
| **影響產品** | Bambuddy < 0.1.7 |
| **CVSS/嚴重程度** | 9.8 (Critical) |
| **修補方式** | 升級至 0.1.7 或更新版本，並更換 JWT 簽名金鑰 |
| **官方連結** | https://github.com/advisories/GHSA-gc24-px2r-5qmf |
| **利用狀態** | PoC 已公開 |

#### 17. CVE-2026-1427/1428/1429 — 葳橋資訊單一簽入系統多重漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | 葳橋資訊單一簽入暨電子目錄服務系統（V4）存在 2 個 OS Command Injection 漏洞（CVE-2026-1427、CVE-2026-1428）及 1 個 Reflected XSS 漏洞（CVE-2026-1429），已通過身分鑑別的遠端攻擊者可注入任意作業系統指令 |
| **影響產品** | 葳橋資訊單一簽入暨電子目錄服務系統（V4）IFTOP_P4_181 之前版本 |
| **CVSS/嚴重程度** | 8.8 (High) |
| **修補方式** | 更新至 IFTOP_P4_181 或更新版本 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-132-10654-23f40-1.html |
| **利用狀態** | 無已知活躍利用 |

#### 18. CVE-2025-68668 — n8n「N8scape」Python 沙箱逃逸漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | n8n Python 節點中 Pyodide 環境與 JavaScript 之間的互操作機制存在沙箱逃逸漏洞，經過身分驗證的攻擊者可呼叫未授權限制的 Node.js 內部 API（如 child_process）執行任意作業系統指令 |
| **影響產品** | n8n >= 1.0.0 <2.0.0 |
| **CVSS/嚴重程度** | 9.9 (Critical) |
| **修補方式** | 升級至安全版本，或設定 N8N_PYTHON_ENABLED=false 暫時停用 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-104-10688-91d6d-1.html |
| **利用狀態** | 高風險 |

#### 19. CVE-2025-68613 — n8n 表達式注入漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | n8n 允許經過身分驗證的攻擊者透過表達式注入惡意遠端程式碼，攻擊者可透過「全域 this」上下文存取 process.mainModule.require 載入系統模組執行指令 |
| **影響產品** | n8n >= 0.211.0 <1.120.4 |
| **CVSS/嚴重程度** | 9.9 (Critical) |
| **修補方式** | 升級至 1.120.4 或更新版本 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-104-10688-91d6d-1.html |
| **利用狀態** | 高風險 |

### P3 - 關注（ICS/OT 環境或本週新增漏洞）

#### 20. CVE-2026-0629 — TP-Link VIGI 系列 IP 攝影機認證繞過漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | TP-Link VIGI 系列 IP 攝影機的密碼恢復功能存在認證繞過漏洞，區域網路攻擊者可透過操縱客戶端狀態重設管理員密碼，取得完整管理權限 |
| **影響產品** | TP-Link VIGI Cx45/Cx55/Cx85/C340S/C540S/C540V/C250 等 30+ 型號 |
| **CVSS/嚴重程度** | 8.8 (High) |
| **修補方式** | 更新至最新韌體版本 |
| **官方連結** | https://www.tp-link.com/us/support/faq/4906/ |
| **利用狀態** | 無已知活躍利用（僅限區域網路攻擊） |

#### 21. CVE-2026-0975 — Delta Electronics DIAView 命令注入漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Delta Electronics DIAView 函數可在專案腳本中執行 shell 命令，若攻擊者誘騙受害者執行含有惡意腳本的專案，則可在專案啟動時執行任意程式碼 |
| **影響產品** | Delta Electronics DIAView 4.2.0 |
| **CVSS/嚴重程度** | 7.8 (High) |
| **修補方式** | 更新至 DIAView v4.4 或更新版本 |
| **官方連結** | https://www.cisa.gov/news-events/ics-advisories/icsa-26-022-07 |
| **利用狀態** | 無已知活躍利用（無法遠端利用） |
| **重要提示** | 台灣廠商產品，影響關鍵基礎設施（化學、商業、製造、能源、運輸、水務） |

#### 22. Siemens 工業產品多項漏洞公告
| 項目 | 內容 |
|------|------|
| **漏洞描述** | 本週 CISA 發布多項 Siemens 工業產品安全公告，包含 SINEC Security Monitor、Industrial Edge Devices、RUGGEDCOM APE1808、RUGGEDCOM ROS 等 |
| **影響產品** | Siemens 多項工業自動化產品 |
| **CVSS/嚴重程度** | 多項（請參閱各公告） |
| **修補方式** | 依據各產品公告指示套用更新 |
| **官方連結** | https://www.cisa.gov/news-events/ics-advisories |
| **利用狀態** | 無已知活躍利用 |

#### 23. Schneider Electric 產品多項漏洞公告
| 項目 | 內容 |
|------|------|
| **漏洞描述** | 本週 CISA 發布多項 Schneider Electric 產品安全公告，包含 EcoStruxure Process Expert、EcoStruxure Foxboro DCS、使用 CODESYS Runtime 的設備等 |
| **影響產品** | Schneider Electric 多項工業自動化產品 |
| **CVSS/嚴重程度** | 多項（請參閱各公告） |
| **修補方式** | 依據各產品公告指示套用更新 |
| **官方連結** | https://www.cisa.gov/news-events/ics-advisories |
| **利用狀態** | 無已知活躍利用 |

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
| **Microsoft Windows/Office 6 項活躍利用漏洞** | 立即套用 2 月份安全更新；優先處理暴露於網路的系統；監控異常的權限提升活動；檢查 MSHTML 相關的可疑網路流量 |
| **SmarterMail 多重漏洞（勒索軟體相關）** | 立即升級至最新版本；限制外部存取；審查管理帳號與密碼重設日誌；加強勒索軟體防禦與備份 |
| **n8n 自動化平台漏洞** | 升級至安全版本；限制平台網路存取；暫時停用 Code Node、Git Node 或 Python 執行功能（透過環境變數）；監控工作流程日誌 |
| **MongoDB MongoBleed 漏洞** | 更新至修補版本；暫時停用 zlib 壓縮；部署 IPS/WAF 攔截異常 zlib 封包；限制 MongoDB 直接暴露於網路 |
| **Bambuddy 認證漏洞** | 升級至 0.1.7+；更換 JWT 簽名金鑰；限制平台網路存取 |
| **葳橋資訊系統漏洞** | 更新至 IFTOP_P4_181+；限制系統存取來源；審查使用者帳號權限 |
| **TP-Link VIGI IP 攝影機漏洞** | 更新韌體；將攝影機置於獨立 VLAN；限制區域網路存取 |
| **Delta Electronics DIAView 漏洞** | 更新至 v4.4+；勿開啟不受信任的專案檔案；隔離 OT 網路 |

---

## 緩解策略

以下針對尚無修補方案或需要額外緩解的威脅提供策略。

### 1. Microsoft Windows/Office 多項活躍利用漏洞

**緩解措施：**
- 立即套用 2026 年 2 月份 Patch Tuesday 安全更新
- 優先處理 Remote Desktop Services、Windows Shell、MSHTML Framework 相關系統
- 監控 Windows 事件日誌中的異常權限提升活動
- 限制 RDP 存取至受信任 IP 範圍
- 啟用 Windows Defender Credential Guard

> **有效期限**：直到完成修補
> **下次評估日期**：2026-02-18

### 2. n8n 自動化平台漏洞（CVE-2026-21858、CVE-2026-21877 等）

**緩解措施：**
- 升級至官方安全版本
- 若無法立即更新：
  - 透過 `NODES_EXCLUDE` 環境變數暫時停用 Code Node 或 Git Node
  - 設定 `N8N_PYTHON_ENABLED=false` 關閉 Python 執行功能
- 避免將 n8n 直接暴露於網際網路
- 強制啟用身分驗證與 MFA
- 監控工作流程日誌中的異常 child_process 建立或檔案系統寫入

> **有效期限**：直到升級至安全版本
> **下次評估日期**：2026-02-14

### 3. MongoDB MongoBleed 漏洞（CVE-2025-14847）

**緩解措施：**
- 優先更新至已修補版本（8.2.3、8.0.17、7.0.28、6.0.27、5.0.32 或 4.4.30）
- 若無法立即修補：
  - 暫時停用 zlib 壓縮或改用其他壓縮機制
  - 部署 IPS/WAF 攔截異常或畸形 zlib 封包
- 限制 MongoDB 直接暴露於網路（啟用認證與網路隔離）
- 監控異常的資料查詢行為
- 定期備份重要資料

> **有效期限**：直到完成修補
> **下次評估日期**：2026-02-14

### 4. SolarWinds Web Help Desk 漏洞（CVE-2025-40551）— 修補期限已過

**緩解措施：**
- 立即套用修補或停止服務
- 隔離 Web Help Desk 伺服器
- 審查系統日誌以確認是否遭入侵
- 若發現入侵跡象，啟動事件回應程序

> **有效期限**：立即處理
> **狀態**：緊急

### 5. TP-Link VIGI IP 攝影機認證繞過（CVE-2026-0629）

**緩解措施：**
- 更新至最新韌體版本
- 將 IP 攝影機置於獨立的 VLAN，限制區域網路存取
- 定期檢查是否有異常的密碼重設活動
- 停用不必要的遠端管理功能

> **有效期限**：直到韌體更新完成
> **下次評估日期**：2026-02-18

### 6. eslint-config-prettier 供應鏈攻擊（CVE-2025-54313）— 持續追蹤

受汙染的 npm 套件版本可能已被安裝在開發環境中。

**緩解措施：**
- 盤點所有專案的 package-lock.json / yarn.lock，確認 eslint-config-prettier 版本
- 移除受汙染版本並重新安裝已知安全版本
- 在 Windows 開發環境中檢查是否存在 node-gyp.dll 惡意檔案
- 強化 CI/CD 管線中的依賴掃描機制

> **有效期限**：一次性清理後持續監控
> **完成目標日期**：2026-02-14

---

## 注意事項

### 適用範圍與限制

1. **環境差異**：本報告所列建議為通用性質，實際實施前請評估組織特定環境、業務需求和風險承受度

2. **時效性**：報告基於 2026-02-04 至 2026-02-11 期間的公開資訊，新漏洞可能在報告發布後出現

3. **完整性**：報告涵蓋主要公開來源（CISA KEV、CISA ICS-CERT、TWCERT/CC、GovCERT.HK、GitHub Security Advisories），不包含非公開威脅情報

4. **供應商確認**：第三方產品可能使用受影響的開源元件，建議向供應商確認是否受影響

5. **翻譯風險**：部分非英文來源經 AI 處理，修補建議請以官方原文為準

### 可能的副作用

| 建議措施 | 可能副作用 | 替代方案 |
|----------|------------|----------|
| 套用 Microsoft 2 月份更新 | 可能影響部分應用程式相容性 | 先於測試環境驗證 |
| 停用 n8n Python/Git Node | 依賴這些功能的工作流程將失效 | 升級至安全版本後恢復 |
| 停用 MongoDB zlib 壓縮 | 網路傳輸效能下降 | 儘速升級至修補版本 |
| 暫停 SmarterMail 服務 | 郵件服務中斷 | 套用修補後重新啟用 |
| 隔離 TP-Link VIGI 攝影機 | 遠端監控功能受限 | 更新韌體後恢復 |
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

> 報告產出時間：2026-02-11
> 資料來源：CISA KEV、CISA ICS-CERT、TWCERT/CC、GovCERT.HK、GitHub Security Advisories、NVD
> 本報告使用 Qdrant 向量資料庫進行關聯分析
