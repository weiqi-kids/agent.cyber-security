# RAT 惡意程式家族 IoC 彙總（2026-02-21/22）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-22 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | malware |
| **惡意程式家族** | AsyncRAT / Remcos / njRAT / XWorm / QuasarRAT / NanoCore |
| **狀態** | online |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

本彙總涵蓋常見 RAT（Remote Access Trojan，遠端存取木馬）家族的 C2 基礎設施與惡意樣本雜湊，包含 AsyncRAT (25)、Remcos (18)、XWorm (11)、njRAT (10)、QuasarRAT (3)、NetWire (3) 等商品化 RAT 工具。

## IoC 統計

| 惡意程式家族 | Domain | IP:Port | Hash | 總計 |
|--------------|--------|---------|------|------|
| **AsyncRAT** | 12 | 7 | 6 | 25 |
| **Remcos** | 0 | 6 | 12 | 18 |
| **XWorm** | 7 | 1 | 3 | 11 |
| **njRAT** | 1 | 0 | 9 | 10 |
| **QuasarRAT** | 2 | 2 | 3 | 7 |
| **NetWire** | 0 | 0 | 3 | 3 |
| **總計** | 22 | 16 | 36 | 74 |

## AsyncRAT C2 基礎設施

AsyncRAT 為開源 .NET RAT，提供遠端桌面、檔案管理、鍵盤記錄等功能。

### C2 網域範例（已脫敏）

| IoC 值 |
|--------|
| `banktools.in[.]net` |
| `facades.br[.]com` |
| `xn--20t33u11srlm.jp[.]net` |

### C2 IP:Port 範例

| IP:Port |
|---------|
| `185.157.46.212:8808` |

### 惡意樣本雜湊

| 類型 | 雜湊值 |
|------|--------|
| SHA256 | `ca642c042b5443af22a42afab35b4c24faf7b9b51b05110ed32942b7990500a3` |
| SHA256 | `794790e9f8d17da9a50e9387b76c0d78d8a7d2af33ea75e9159089917ab697c2` |
| SHA1 | `a66c0984c6c4e31193e40b7ccbfdadcfe3976f94` |
| SHA1 | `535d737481f30895c874271c3584156fb6e9431a` |
| MD5 | `2f86086d7a256b924844580602fe5e6b` |
| MD5 | `51ce62f62ba5e2f424e8954893e6d815` |

## Remcos RAT C2 基礎設施

Remcos 為商業化 RAT，常見於釣魚攻擊與有針對性攻擊。

### 統計

- **C2 IP:Port**: 6 筆
- **樣本雜湊**: 12 筆（SHA256/SHA1/MD5 各 4 筆）

## XWorm RAT C2 基礎設施

XWorm 為新興 .NET RAT，介面與功能類似 AsyncRAT。

### 統計

- **C2 網域**: 7 筆
- **C2 IP:Port**: 1 筆
- **樣本雜湊**: 3 筆

## njRAT C2 基礎設施

njRAT 為中東地區常見的 RAT，功能簡單但廣泛流通。

### 統計

- **C2 網域**: 1 筆
- **樣本雜湊**: 9 筆（SHA256/SHA1/MD5 各 3 筆）

## QuasarRAT C2 基礎設施

QuasarRAT 為開源 .NET RAT，常被修改後用於攻擊活動。

### 統計

- **C2 網域**: 2 筆
- **C2 IP:Port**: 2 筆
- **樣本雜湊**: 3 筆

## NetWire RAT

NetWire 為老牌商業化 RAT，支援跨平台（Windows/macOS/Linux）。

### 統計

- **樣本雜湊**: 3 筆（SHA256/SHA1/MD5 各 1 筆）

## 關聯分析

### 共通特徵

1. **開源氾濫**：AsyncRAT、XWorm、QuasarRAT 為開源專案，被廣泛修改濫用
2. **商業化工具**：Remcos、NetWire 為商業產品但破解版流通
3. **低門檻**：這些 RAT 提供圖形化介面，降低攻擊者技術門檻
4. **持續活躍**：持續出現在釣魚攻擊、勒索軟體初始存取階段

### 攻擊鏈

```
釣魚郵件夾帶惡意附件
    ↓
執行 RAT 樣本（通常為 .exe 或經混淆的 .NET 組件）
    ↓
建立與 C2 伺服器的連線（TCP/HTTP）
    ↓
攻擊者遠端控制受害主機
    ↓
橫向移動、資料竊取、部署勒索軟體
```

### 產業分布

- **中小企業**：缺乏進階防護，成為主要受害對象
- **個人使用者**：透過釣魚郵件大規模散播
- **特定目標**：APT 團體使用客製化版本進行針對性攻擊

## 建議措施

1. **網路封鎖**：將上述 C2 網域與 IP:Port 列入黑名單
2. **雜湊偵測**：使用上述樣本雜湊掃描端點
3. **行為偵測**：
   - 監控異常網路連線（非標準端口）
   - 偵測 .NET 程式異常行為（反射載入、記憶體注入）
   - 監控自啟動機制（註冊表、計劃任務）
4. **郵件過濾**：
   - 封鎖可執行附件（.exe、.scr、.com、.pif）
   - 掃描壓縮檔與 Office 文件巨集
5. **使用者教育**：訓練員工識別釣魚郵件

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/)

---
> 萃取時間：2026-02-22 08:00 UTC
> 資料來源：abuse.ch ThreatFox (threatfox-recent)
> IoC 時效性：本彙總僅反映 2026-02-20 至 2026-02-21 的回報資料，實際 C2 狀態可能已變化
