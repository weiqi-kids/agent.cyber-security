---
layout: seo-report
last_modified_at: 2026-02-19T23:18:07+08:00
title: 2026 第 06 週防禦建議
description: "2026-02-09 至 2026-02-15 資安防禦建議"
parent: 防禦建議
nav_order: 2
nav_exclude: false
seo_json: true
date: 2026-02-12
---

# 防禦建議 — 2026 第 06 週
> 涵蓋期間：2026-02-09 至 2026-02-15
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV
> 產出時間：2026-02-12（更新）

---

## 執行摘要

本週 CISA 大幅更新 KEV 目錄，共有 **23 項活躍利用漏洞**需優先修補（較上週新增 12 項）。其中最關鍵的威脅包括：

1. **Microsoft Windows/Office 多重漏洞**（2026-02-10 新增 6 項至 CISA KEV）：
   - **CVE-2026-21510** — Windows Shell 保護機制失效漏洞，允許網路攻擊者繞過安全功能
   - **CVE-2026-21513** — MSHTML Framework 保護機制失效漏洞
   - **CVE-2026-21514** — Office Word 不信任輸入依賴漏洞，可本地提升權限
   - **CVE-2026-21519** — Windows 桌面視窗管理員型別混淆漏洞，可本地提升權限
   - **CVE-2026-21525** — Windows 遠端存取連線管理員 NULL 指標解引用漏洞
   - **CVE-2026-21533** — Windows 遠端桌面服務權限管理不當漏洞，可本地提升權限
2. **SmarterMail 郵件系統多重漏洞**（CVE-2025-52691、CVE-2026-23760、CVE-2026-24423）—— 遭受活躍利用，攻擊者可完全控制郵件系統管理權限，**其中 CVE-2026-24423 已確認與勒索軟體相關**
3. **React Native CLI 命令注入漏洞**（CVE-2025-11953）—— 新增至 CISA KEV，攻擊者可透過 Metro Development Server 執行任意命令
4. **SolarWinds Web Help Desk 反序列化漏洞**（CVE-2025-40551）—— 新增至 CISA KEV，允許未經驗證的遠端程式碼執行
5. **Sangoma FreePBX 多重漏洞**（CVE-2019-19006、CVE-2025-64328）—— 新增至 CISA KEV，包含認證繞過與命令注入漏洞
6. **GitLab SSRF 漏洞**（CVE-2021-39935）—— 新增至 CISA KEV，允許未授權外部使用者執行伺服器端請求
7. **VMware vCenter Server 越界寫入漏洞**（CVE-2024-37079）—— CISA 修補期限 2026-02-13，可導致未經身份驗證的遠端程式碼執行
8. **Cisco Unified Communications 程式碼注入**（CVE-2026-20045）—— CISA 修補期限 2026-02-11，可取得 root 權限

台灣地區方面，TWCERT/CC 通報 **普羅通信 PrismX MX100 AP controller** 存在 CVSS 9.8 的硬編碼憑證漏洞（CVE-2026-1221），以及 **廣達 QOCA aim 醫療雲平台** 多項漏洞需優先處理。

---

## 優先修補清單

按優先級排序：活躍利用 > EPSS 高分 > CVSS 高分

### P0 - 立即處置（活躍利用中，修補期限即將到期或與勒索軟體相關）

#### 1. CVE-2026-21510 — Microsoft Windows Shell 保護機制失效漏洞（2026-02-10 新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Windows Shell 存在保護機制失效漏洞（CWE-693），未經授權的攻擊者可透過網路繞過安全功能 |
| **影響產品** | Microsoft Windows（多個版本） |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據 Microsoft 安全更新指南套用最新安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21510 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

#### 2. CVE-2026-21513 — Microsoft MSHTML Framework 保護機制失效漏洞（2026-02-10 新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft MSHTML Framework 存在保護機制失效漏洞（CWE-693），未經授權的攻擊者可透過網路繞過安全功能 |
| **影響產品** | Microsoft Windows（多個版本） |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據 Microsoft 安全更新指南套用最新安全更新 |
| **官方連結** | https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2026-21513 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

#### 3. CVE-2026-21514 — Microsoft Office Word 不信任輸入依賴漏洞（2026-02-10 新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Office Word 在安全決策中依賴不受信任的輸入（CWE-807），已授權的攻擊者可在本地提升權限 |
| **影響產品** | Microsoft Office（多個版本） |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據 Microsoft 安全更新指南套用最新安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21514 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

#### 4. CVE-2026-21519 — Microsoft Windows 桌面視窗管理員型別混淆漏洞（2026-02-10 新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Desktop Windows Manager 存在型別混淆漏洞（CWE-843），已授權的攻擊者可在本地提升權限 |
| **影響產品** | Microsoft Windows（多個版本） |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據 Microsoft 安全更新指南套用最新安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21519 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

#### 5. CVE-2026-21525 — Microsoft Windows 遠端存取連線管理員 NULL 指標解引用漏洞（2026-02-10 新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Windows Remote Access Connection Manager 存在 NULL 指標解引用漏洞（CWE-476），未經授權的攻擊者可在本地拒絕服務 |
| **影響產品** | Microsoft Windows（多個版本） |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據 Microsoft 安全更新指南套用最新安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21525 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

#### 6. CVE-2026-21533 — Microsoft Windows 遠端桌面服務權限管理不當漏洞（2026-02-10 新增）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Windows Remote Desktop Services 存在權限管理不當漏洞（CWE-269），已授權的攻擊者可在本地提升權限 |
| **影響產品** | Microsoft Windows（多個版本） |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據 Microsoft 安全更新指南套用最新安全更新 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21533 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-03-03** |

#### 7. CVE-2026-24423 — SmarterMail 關鍵功能缺失認證漏洞（與勒索軟體相關）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | SmarterMail 的 ConnectToHub API 方法存在關鍵功能缺失認證漏洞，攻擊者可將 SmarterMail 實例指向惡意 HTTP 伺服器，該伺服器提供惡意作業系統命令，導致命令執行 |
| **影響產品** | SmarterTools SmarterMail |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新，若無可用緩解措施則停止使用 |
| **官方連結** | https://www.smartertools.com/smartermail/release-notes/current |
| **利用狀態** | 活躍利用中（CISA KEV），**已確認與勒索軟體活動相關** |
| **CISA 修補期限** | **2026-02-26** |

#### 8. CVE-2026-20045 — Cisco Unified Communications 程式碼注入漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Cisco Unified CM、Unified CM SME、Unified CM IM&P、Unity Connection 及 Webex Calling Dedicated Instance 存在程式碼注入漏洞（CWE-94），攻擊者可取得使用者層級的作業系統存取權限並提升至 root |
| **影響產品** | Cisco Unified Communications Manager 及相關產品 |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 套用 Cisco Security Advisory 指示的安全更新 |
| **官方連結** | https://sec.cloudapps.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-voice-rce-mORhqY4b |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-02-11** |

#### 9. CVE-2025-40551 — SolarWinds Web Help Desk 反序列化漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | SolarWinds Web Help Desk 存在不受信任資料的反序列化漏洞，可導致遠端程式碼執行。攻擊者無需身份驗證即可在主機上執行命令 |
| **影響產品** | SolarWinds Web Help Desk |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新，若無可用緩解措施則停止使用 |
| **官方連結** | https://www.solarwinds.com/trust-center/security-advisories/cve-2025-40551 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-02-06**（已過期，需立即處理） |

#### 10. CVE-2025-11953 — React Native CLI 命令注入漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | React Native Community CLI 存在作業系統命令注入漏洞，未經驗證的網路攻擊者可透過 Metro Development Server 的易受攻擊端點傳送 POST 請求執行任意執行檔。在 Windows 上，攻擊者還可執行任意 shell 命令 |
| **影響產品** | React Native Community CLI |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新 |
| **官方連結** | https://github.com/react-native-community/cli/pull/2735 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-02-26** |

#### 11. CVE-2025-34026 — Versa Concerto 認證繞過漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Versa Concerto SD-WAN 協調平台的 Traefik 反向代理配置存在認證不當漏洞（CWE-288），攻擊者可存取管理端點與 Actuator 端點，取得 heap dumps 和 trace logs |
| **影響產品** | Versa Concerto SD-WAN |
| **CVSS/嚴重程度** | High |
| **修補方式** | 套用 Versa Networks Security Portal 指示的緩解措施 |
| **官方連結** | https://security-portal.versa-networks.com/emailbulletins/6830f94328defa375486ff2e |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-02-12** |

#### 12. CVE-2025-68645 — Zimbra Collaboration Suite PHP 遠端檔案包含漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Zimbra ZCS 的 `/h/rest` 端點存在 PHP 遠端檔案包含漏洞（CWE-98），攻擊者可發送特製請求包含 WebRoot 目錄中的任意檔案 |
| **影響產品** | Synacor Zimbra Collaboration Suite (ZCS) |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 套用 Zimbra Security Center 官方安全更新 |
| **官方連結** | https://wiki.zimbra.com/wiki/Security_Center |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-02-12** |

#### 13. CVE-2025-31125 — Vite Vitejs 存取控制不當漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Vite 開發伺服器存在存取控制漏洞（CWE-284/CWE-200），透過 `?inline&import` 或 `?raw?import` 參數可讀取未授權檔案。僅影響使用 `--host` 或 `server.host` 暴露至網路的開發伺服器 |
| **影響產品** | Vite (Vitejs) 開發伺服器 |
| **CVSS/嚴重程度** | High |
| **修補方式** | 套用官方 commit 59673137c45ac2bcfad1170d954347c1a17ab949 |
| **官方連結** | https://github.com/vitejs/vite/commit/59673137c45ac2bcfad1170d954347c1a17ab949 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-02-12** |

#### 14. CVE-2025-54313 — eslint-config-prettier 內嵌惡意程式碼（供應鏈攻擊）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | eslint-config-prettier 套件含有內嵌惡意程式碼（CWE-506），安裝時會執行 install.js 並在 Windows 系統上啟動 node-gyp.dll 惡意軟體 |
| **影響產品** | 使用受汙染版本 eslint-config-prettier 的 Node.js 專案 |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 檢查專案依賴版本，移除受汙染版本並重新安裝已知安全版本 |
| **官方連結** | https://www.npmjs.com/package/eslint-config-prettier?activeTab=versions |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | **2026-02-12** |

### P1 - 緊急（活躍利用中，本週內完成修補）

#### 15. CVE-2024-37079 — VMware vCenter Server 越界寫入漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | VMware vCenter Server 在 DCERPC 協定實作中存在越界寫入漏洞（CWE-787），具有網路存取權限的攻擊者可發送特製封包實現遠端程式碼執行（RCE），無需身份驗證 |
| **影響產品** | Broadcom VMware vCenter Server |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 套用 Broadcom Security Advisory 指示的安全更新 |
| **官方連結** | https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/SecurityAdvisories/0/24453 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-13 |

#### 16. CVE-2025-64328 — Sangoma FreePBX 命令注入漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Sangoma FreePBX Endpoint Manager 存在作業系統命令注入漏洞，已認證使用者可透過 testconnection -> check_ssh_connect() 函數執行後驗證命令注入。攻擊者可利用此漏洞以 asterisk 使用者身份取得系統遠端存取 |
| **影響產品** | Sangoma FreePBX |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新，若無可用緩解措施則停止使用 |
| **官方連結** | https://github.com/FreePBX/security-reporting/security/advisories/GHSA-vm9p-46mv-5xvw |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-24 |

#### 17. CVE-2019-19006 — Sangoma FreePBX 認證不當漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Sangoma FreePBX 存在認證不當漏洞，可能允許未授權使用者繞過密碼驗證，存取 FreePBX 管理員提供的服務 |
| **影響產品** | Sangoma FreePBX |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新，若無可用緩解措施則停止使用 |
| **官方連結** | https://wiki.freepbx.org/display/FOP/2019-11-20%2BRemote%2BAdmin%2BAuthentication%2BBypass |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-24 |

#### 18. CVE-2021-39935 — GitLab SSRF 漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | GitLab Community 及 Enterprise Editions 存在伺服器端請求偽造（SSRF）漏洞，可允許未授權外部使用者透過 CI Lint API 執行伺服器端請求 |
| **影響產品** | GitLab Community 及 Enterprise Editions |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 依據廠商指示套用安全更新，若無可用緩解措施則停止使用 |
| **官方連結** | https://about.gitlab.com/releases/2021/12/06/security-release-gitlab-14-5-2-released/ |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-24 |

#### 19. CVE-2026-23760 — SmarterMail 身份驗證繞過漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | SmarterMail 的 force-reset-password 端點允許匿名請求重設管理員密碼（CWE-288），無需驗證現有密碼或重設令牌，攻擊門檻極低，可導致管理權限完全淪陷 |
| **影響產品** | SmarterTools SmarterMail |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 升級至最新版本 |
| **官方連結** | https://www.smartertools.com/smartermail/release-notes/current |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-16 |

#### 20. CVE-2025-52691 — SmarterMail 任意檔案上傳漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | 未經身份驗證的攻擊者可利用此漏洞上傳任意檔案至郵件伺服器（CWE-434），進而實現遠端程式碼執行 |
| **影響產品** | SmarterTools SmarterMail |
| **CVSS/嚴重程度** | Critical |
| **修補方式** | 升級至最新版本 |
| **官方連結** | https://www.csa.gov.sg/alerts-and-advisories/alerts/al-2025-124/ |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 依 BOD 22-01 指引 |

#### 21. CVE-2026-21509 — Microsoft Office 安全功能繞過漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Microsoft Office 在安全決策中依賴不受信任的輸入（CWE-807），允許本地攻擊者繞過安全功能，可作為攻擊鏈的前置步驟。部分產品可能已終止支援（EoL/EoS） |
| **影響產品** | Microsoft Office 2021（有最終修補）、Office 2019/2016（有臨時緩解措施） |
| **CVSS/嚴重程度** | Medium-High |
| **修補方式** | Office 2021 套用最終修補；Office 2019/2016 套用臨時緩解措施 |
| **官方連結** | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-21509 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-16 |

#### 22. CVE-2026-24061 — GNU InetUtils telnetd 參數注入漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | GNU InetUtils 的 telnetd 元件存在參數注入漏洞（CWE-88），攻擊者可透過 USER 環境變數注入 "-f root" 值繞過遠端身份驗證 |
| **影響產品** | GNU InetUtils telnetd |
| **CVSS/嚴重程度** | High |
| **修補方式** | 套用官方修補，或停用 telnetd 服務改用 SSH |
| **官方連結** | https://codeberg.org/inetutils/inetutils/commit/ccba9f748aa8d50a38d7748e2e60362edd6a32cc |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 2026-02-16 |

#### 23. CVE-2018-14634 — Linux Kernel 整數溢位漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Linux Kernel 的 `create_elf_tables()` 函數存在整數溢位漏洞（CWE-190），允許本地使用者透過 SUID 二進位檔案提升權限。此為 2018 年漏洞，近期再度被確認遭活躍利用 |
| **影響產品** | Linux Kernel（多個發行版） |
| **CVSS/嚴重程度** | High |
| **修補方式** | 更新 Linux Kernel 至已修補版本 |
| **官方連結** | https://access.redhat.com/errata/RHSA-2018:3540 |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 依 BOD 22-01 指引 |

#### 24. CVE-2026-24858 — Fortinet 多產品認證繞過漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | FortiAnalyzer、FortiManager、FortiOS 及 FortiProxy 存在認證繞過漏洞，攻擊者可透過 FortiCloud 帳號與已註冊設備登入其他帳號的已註冊設備（當 FortiCloud SSO 認證啟用時） |
| **影響產品** | Fortinet FortiAnalyzer、FortiManager、FortiOS、FortiProxy |
| **CVSS/嚴重程度** | Medium |
| **修補方式** | 依據廠商指示套用安全更新或緩解措施 |
| **官方連結** | https://www.cisa.gov/known-exploited-vulnerabilities-catalog |
| **利用狀態** | 活躍利用中（CISA KEV） |
| **CISA 修補期限** | 依 BOD 22-01 指引 |

### P2 - 高優先（Critical/High CVSS，需本週內完成修補）

#### 25. CVE-2026-1221 — BROWAN PrismX MX100 硬編碼憑證漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | 韌體中存在硬編碼資料庫憑證，未認證遠端攻擊者可登入資料庫取得敏感資料 |
| **影響產品** | BROWAN PrismX MX100 AP controller v1.03.23.01 以前版本 |
| **CVSS/嚴重程度** | 9.8 (Critical) |
| **修補方式** | 更新韌體至 v1.03.23.01 或更新版本 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-132-10642-3b808-1.html |
| **利用狀態** | 無已知活躍利用 |

#### 26. CVE-2025-15240 — 廣達 QOCA aim 任意檔案上傳漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | QOCA aim AI 醫療雲平台存在任意檔案上傳漏洞，已認證攻擊者可上傳 Web Shell 執行任意程式碼 |
| **影響產品** | Quanta QOCA aim AI Medical Cloud Platform v2.7.5 及更早版本 |
| **CVSS/嚴重程度** | 8.8 (High) |
| **修補方式** | 更新至 v2.7.6 或更新版本 |
| **官方連結** | https://www.twcert.org.tw/tw/cp-132-10615-157a3-1.html |
| **利用狀態** | 無已知活躍利用 |

### P3 - 關注（ICS/OT 環境新增漏洞，本週公告）

#### 27. CVE-2026-1633 — Synectix LAN 232 TRIO 缺失認證漏洞（EOL 產品）
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Synectix LAN 232 TRIO 串口轉乙太網設備的網頁管理介面未要求認證，未經認證的攻擊者可修改關鍵設備設定或將設備恢復原廠設定 |
| **影響產品** | Synectix LAN 232 TRIO（所有版本） |
| **CVSS/嚴重程度** | 10.0 (Critical) |
| **修補方式** | **產品已停產**（廠商 Synectix 已不再營運），無可用韌體修補 |
| **官方連結** | https://www.cisa.gov/news-events/ics-advisories/icsa-26-034-04 |
| **利用狀態** | 無已知活躍利用 |
| **重要提示** | 建議立即隔離或淘汰此設備 |

#### 28. CVE-2026-0629 — TP-Link VIGI 系列 IP 攝影機認證繞過漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | TP-Link VIGI 系列 IP 攝影機的密碼恢復功能存在認證繞過漏洞，區域網路攻擊者可透過操縱客戶端狀態重設管理員密碼，取得完整管理權限 |
| **影響產品** | TP-Link VIGI Cx45/Cx55/Cx85/C340S/C540S/C540V/C250 等多個系列（詳見 CISA 公告） |
| **CVSS/嚴重程度** | 8.8 (High) |
| **修補方式** | 更新至最新韌體版本 |
| **官方連結** | https://www.tp-link.com/us/support/faq/4906/ |
| **利用狀態** | 無已知活躍利用（僅限區域網路攻擊） |

#### 29. CVE-2026-1341 — Avation Light Engine Pro 缺失認證漏洞
| 項目 | 內容 |
|------|------|
| **漏洞描述** | Avation Light Engine Pro 的設定與控制介面未設置任何認證或存取控制，攻擊者可完全控制設備 |
| **影響產品** | Avation Light Engine Pro（所有版本） |
| **CVSS/嚴重程度** | 9.8 (Critical) |
| **修補方式** | 廠商未回應 CISA 協調請求，建議聯繫 Avation 取得更多資訊 |
| **官方連結** | https://www.cisa.gov/news-events/ics-advisories/icsa-26-034-02 |
| **利用狀態** | 無已知活躍利用 |
| **重要提示** | 建議將設備置於防火牆後方並隔離網路 |

---

## 安全控制建議

### 通用建議

| 層面 | 控制措施 |
|------|----------|
| **網路層** | 實施網路分段、部署 IDS/IPS、限制管理介面的網路存取 |
| **端點層** | 確保所有端點安裝 EDR、啟用作業系統自動更新、實施應用程式白名單 |
| **身分認證層** | 對所有管理介面啟用多因素認證（MFA）、定期輪替服務帳號密碼 |
| **資料保護層** | 加密敏感資料（傳輸中與靜態）、定期備份並驗證還原程序 |
| **供應鏈層** | 強化 CI/CD 管線中的依賴掃描機制（npm audit、Snyk 等）、鎖定套件版本 |

### 針對本週威脅

| 威脅 | 建議措施 |
|------|----------|
| **Microsoft Windows/Office 多重漏洞（6 項新增至 CISA KEV）** | 立即套用 2026 年 2 月安全更新；啟用 Windows Defender Credential Guard；限制遠端桌面服務的網路存取；監控異常的權限提升活動與安全功能繞過嘗試；審查本地使用者權限 |
| **SmarterMail 多重漏洞（勒索軟體相關）** | 立即升級至最新版本；限制外部存取；審查管理帳號與密碼重設日誌；檢查系統中是否存在異常上傳檔案；加強勒索軟體防禦措施 |
| **React Native CLI 漏洞** | 確保 Metro Development Server 不暴露至公網；僅在開發環境中使用；更新至修補版本 |
| **SolarWinds Web Help Desk 漏洞** | 立即套用修補（修補期限已過）；若無法修補則停止使用；審查系統日誌以確認是否遭入侵 |
| **Sangoma FreePBX 漏洞** | 限制管理介面存取；更新至修補版本；審查使用者帳號權限 |
| **GitLab SSRF 漏洞** | 升級至 GitLab 14.5.2 或更新版本；限制 CI/CD 管線的網路存取；監控異常的 API 呼叫 |
| **VMware vCenter 漏洞** | 限制對 vCenter Server DCERPC 協定的外部存取；監控異常網路流量 |
| **Cisco Unified CM 漏洞** | 審查使用者帳號權限；偵測異常的權限提升活動 |
| **Vite 開發伺服器漏洞** | 確保開發伺服器不暴露至公網（移除 `--host` 參數）；開發環境與生產環境網路分離 |
| **eslint-config-prettier 供應鏈攻擊** | 盤點所有專案的 package-lock.json / yarn.lock；在 Windows 環境中檢查是否存在 node-gyp.dll 惡意檔案 |
| **telnetd 漏洞** | 封鎖 telnet 服務（TCP port 23）的外部存取；全面改用 SSH |
| **Linux Kernel 漏洞** | 更新核心至最新版本；限制 SUID 二進位檔案的使用與存取權限 |
| **Fortinet 產品漏洞** | 將 Fortinet 管理介面從公網移除；若需使用 FortiCloud SSO 則確保已套用修補 |
| **台灣本地廠商漏洞** | 普羅通信 PrismX MX100：更新韌體；廣達 QOCA aim：更新至 v2.7.6+；將 IoT 設備置於獨立 VLAN |
| **ICS/OT 設備漏洞（本週新增）** | Synectix LAN 232 TRIO：產品已停產，立即隔離或淘汰；TP-Link VIGI IP 攝影機：更新韌體並限制區域網路存取；Avation Light Engine Pro：隔離網路並聯繫廠商 |

---

## 緩解策略

以下針對尚無修補方案或需要額外緩解的威脅提供策略。

### 0. Microsoft Windows/Office 多重漏洞（CVE-2026-21510、21513、21514、21519、21525、21533）

2026-02-10 新增 6 項 Microsoft Windows/Office 漏洞至 CISA KEV，涵蓋安全功能繞過、權限提升與阻斷服務。

**緩解措施：**
- 立即透過 Windows Update 或 WSUS 套用 2026 年 2 月安全更新
- 若無法立即更新，限制遠端桌面服務（RDP）的網路存取
- 啟用 Windows Defender Credential Guard 保護憑證
- 限制本地使用者權限，遵循最小權限原則
- 監控事件日誌中的異常權限提升活動
- 對 Office 文件啟用 Protected View 並限制巨集執行

> **有效期限**：直到完成更新
> **CISA 修補期限**：2026-03-03

### 1. SmarterMail 多重漏洞（CVE-2026-24423 與勒索軟體相關）

由於 CVE-2026-24423 已確認與勒索軟體活動相關，需採取加強措施。

**緩解措施：**
- 立即備份所有郵件資料（隔離備份，避免連線至生產環境）
- 限制 SmarterMail 伺服器的網路存取（僅允許必要的 SMTP/IMAP/POP3 流量）
- 審查並移除所有可疑的管理帳號
- 監控系統是否有異常檔案上傳或命令執行
- 若無法立即修補，考慮暫時停止服務

> **有效期限**：直到完成升級
> **下次評估日期**：2026-02-16

### 2. React Native CLI 漏洞（CVE-2025-11953）

**緩解措施：**
- 確保 Metro Development Server 僅監聽 localhost
- 開發環境不應暴露於公網或不受信任網段
- 若需遠端存取，透過 VPN 連線
- 更新 React Native CLI 至已修補版本

> **有效期限**：直到升級至已修補版本
> **重新評估時間**：升級後移除緩解措施

### 3. SolarWinds Web Help Desk 漏洞（CVE-2025-40551）— 修補期限已過

**緩解措施：**
- 立即套用修補或停止服務
- 隔離 Web Help Desk 伺服器
- 審查系統日誌以確認是否遭入侵
- 若發現入侵跡象，啟動事件回應程序

> **有效期限**：立即處理
> **狀態**：緊急

### 4. Sangoma FreePBX 漏洞（CVE-2019-19006、CVE-2025-64328）

**緩解措施：**
- 將 FreePBX 管理介面從公網移除
- 限制管理介面僅能從受信任網段存取
- 審查所有管理帳號，移除可疑帳號
- 監控系統是否有異常命令執行

> **有效期限**：持續執行直至完成修補
> **下次評估日期**：2026-02-17

### 5. eslint-config-prettier 供應鏈攻擊（CVE-2025-54313）

受汙染的 npm 套件版本可能已被安裝在開發環境中。

**緩解措施：**
- 立即盤點所有專案的 package-lock.json / yarn.lock，確認 eslint-config-prettier 版本
- 移除受汙染版本並重新安裝已知安全版本
- 在 Windows 開發環境中檢查是否存在 node-gyp.dll 惡意檔案
- 強化 CI/CD 管線中的依賴掃描機制（如 npm audit、Snyk 等）

> **有效期限**：一次性清理後持續監控
> **完成目標日期**：2026-02-17

### 6. GNU InetUtils telnetd（CVE-2026-24061）

**緩解措施：**
- 在防火牆層級封鎖對 telnet 服務（port 23）的外部存取
- 使用 SSH 替代 telnet 進行遠端管理
- 部署網路層級的入侵偵測規則，監控異常的 telnet 連線行為

> **有效期限**：長期執行（建議永久淘汰 telnet 協定）
> **重新評估時間**：每季度

### 7. ICS/OT 停產設備 — Synectix LAN 232 TRIO（CVE-2026-1633）

此設備的廠商已不再營運，無法取得任何修補程式。

**緩解措施：**
- 將設備從網際網路隔離，確保無法從外部存取
- 將設備置於專用的 OT 網段，與企業網路隔離
- 使用防火牆限制存取來源
- 規劃設備汰換，替換為仍有廠商支援的產品
- 加強監控異常的管理介面存取行為

> **有效期限**：直到設備汰換完成
> **重要提示**：此為停產設備，無法獲得安全更新，應優先規劃汰換

### 8. TP-Link VIGI IP 攝影機認證繞過（CVE-2026-0629）

**緩解措施：**
- 將 IP 攝影機置於獨立的 VLAN，限制區域網路存取
- 定期檢查是否有異常的密碼重設活動
- 更新至最新韌體版本
- 停用不必要的遠端管理功能

> **有效期限**：直到韌體更新完成
> **下次評估日期**：2026-02-16

---

## 注意事項

### 適用範圍與限制

1. **環境差異**：本報告所列建議為通用性質，實際實施前請評估組織特定環境、業務需求和風險承受度

2. **時效性**：報告基於 2026-02-09 至 2026-02-15 期間的公開資訊，新漏洞可能在報告發布後出現

3. **完整性**：報告涵蓋主要公開來源（CISA KEV、CISA ICS-CERT、TWCERT/CC、GovCERT.HK、CERT.at、Exploit-DB），不包含非公開威脅情報

4. **供應商確認**：第三方產品可能使用受影響的開源元件，建議向供應商確認是否受影響

5. **翻譯風險**：部分非英文來源經 AI 處理，修補建議請以官方原文為準

### 可能的副作用

| 建議措施 | 可能副作用 | 替代方案 |
|----------|------------|----------|
| 暫停 SmarterMail 服務 | 郵件服務中斷 | 套用修補後重新啟用 |
| 封鎖 React Native Metro Server | 影響遠端開發 | 透過 VPN 存取 |
| 停用 SolarWinds Web Help Desk | IT 服務台功能受影響 | 臨時使用替代工單系統 |
| 封鎖 FreePBX 管理介面 | 遠端管理受限 | 透過 VPN 存取 |
| 停用 telnet 服務 | 依賴 telnet 的老舊系統受影響 | 規劃遷移至 SSH |
| eslint-config-prettier 版本鎖定 | 暫時影響開發環境依賴更新 | 待確認安全版本後解鎖 |
| 重設管理憑證 | 短暫中斷管理存取 | 安排維護時段執行 |
| 隔離 Synectix LAN 232 TRIO | 串口通訊功能受限 | 規劃設備汰換 |
| 隔離 TP-Link VIGI 攝影機 | 遠端監控功能受限 | 更新韌體後恢復 |

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

> 報告產出時間：2026-02-12（更新）
> 資料來源：CISA KEV、CISA ICS-CERT、TWCERT/CC、GovCERT.HK、CERT.at、Exploit-DB、NVD
> 本報告使用 Qdrant 向量資料庫進行關聯分析
