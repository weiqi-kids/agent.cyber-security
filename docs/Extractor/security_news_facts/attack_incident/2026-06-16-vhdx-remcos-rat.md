# From a VHDX File to a Remcos RAT

| 項目 | 內容 |
|------|------|
| **日期** | 2026-06-16 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

惡意 ZIP 內含 VHDX 虛擬磁碟，掛載後執行 JavaScript 啟動多階段感染鏈，最終部署 Remcos RAT。

## 事實內容

一名讀者回報惡意 ZIP 壓縮檔（SHA256: a0104921a2d37ab87482ac9a9f5c3713479c118846c3e999178e75b81620c094）。解壓後包含一個 VHDX 虛擬磁碟映像，於現代 Windows 系統上自動掛載後揭露惡意 JavaScript。

**感染鏈**：Email → ZIP archive → VHDX（虛擬磁碟映像）→ JavaScript → PowerShell 解碼器 → .NET loader → shellcode → Remcos RAT 部署

**技術細節**：
- 目標語系為德語用戶（檔名：Partnerschaft_fur_neue_Angebotsanfrage.js，意為「新報價合作請求」）
- JavaScript 使用 WMI 啟動 PowerShell，繞過 EDR 對直接父子程序關係的偵測
- 使用 XOR 加密（金鑰：「Identificational」）進行混淆
- 採用「bubble」字串填充技術掩蓋 PowerShell 程式碼
- Payload 從遭入侵伺服器下載：cembusconfort.ro
- 透過 System.Reflection.Assembly.Load() 進行反射式 .NET 組件載入
- 持久化機制：Registry Run key 執行混淆 PowerShell 指令
- 注入目標程序：backgroundTaskHost.exe
- C2 伺服器：animal342.duckdns.org:53552
- 多數檔案未被防毒引擎偵測

## 受影響系統

- Windows（現代版本，自動掛載 VHDX）
- 德語系環境用戶（社交工程目標）

## 來源連結

- [From a VHDX File to a Remcos RAT](https://isc.sans.edu/diary/rss/33080)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：SANS ISC sans-isc
