# FormBook 惡意程式 IoC 彙總（2026-02-21/22）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-22 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | malware |
| **惡意程式家族** | FormBook |
| **狀態** | online |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

FormBook 是一種資訊竊取惡意程式（Infostealer），透過 C2 伺服器竊取受害者的瀏覽器憑證、擊鍵記錄及系統資訊。本彙總涵蓋 ThreatFox 於 2026-02-20 至 2026-02-21 回報的 388 筆 FormBook IoC，主要為 C2 網域與 URL。

## IoC 統計

| 類別 | 數量 |
|------|------|
| **總計** | 388 筆 |
| Domain | 191 |
| URL | 194 |
| SHA256 Hash | 1 |
| SHA1 Hash | 1 |
| MD5 Hash | 1 |

### 威脅類型分布

| 威脅類型 | 數量 |
|----------|------|
| botnet_cc (C2 伺服器) | 385 |
| payload (載荷投遞) | 3 |

## 主要 C2 網域範例（已脫敏）

> ⚠️ 以下網域已確認與 FormBook C2 通訊，請勿嘗試連線。

| IoC 值 | IoC 類型 | 威脅類型 |
|--------|----------|----------|
| `www.wzsw5[.]shop` | domain | botnet_cc |
| `www.xeoc[.]shop` | domain | botnet_cc |
| `www.xfqjrms[.]bond` | domain | botnet_cc |
| `www.xn--essncesensorial-tnb.com[.]br` | domain | botnet_cc |
| `www.xtmmm[.]top` | domain | botnet_cc |
| `www.yakutianguide[.]ru` | domain | botnet_cc |
| `www.yinmen-luxeron[.]com` | domain | botnet_cc |

### 惡意樣本雜湊

| 類型 | 雜湊值 |
|------|--------|
| SHA256 | `8c440039311d8f01c2a626dbb4f55bff11042f2f610306771d367b36adaa1b90` |
| SHA1 | `b8b1444ffb91963e527fddee6e57ff81131b49a2` |
| MD5 | `9ddd0f781a7c3e4620eb2c9846a303ec` |

## 關聯分析

FormBook 持續活躍於地下市場，採用 Malware-as-a-Service (MaaS) 商業模式，攻擊者租用服務後取得客製化樣本與 C2 面板。本次回報的 C2 網域大量使用 `.shop`、`.top`、`.bond` 等 TLD，顯示攻擊者偏好低成本、快速註冊的網域。

### 技術特徵

- **傳播途徑**：釣魚郵件夾帶惡意附件（Office 文件、壓縮檔）
- **持久化機制**：註冊表自啟動、計劃任務
- **竊取目標**：瀏覽器儲存的密碼、FTP/Email 憑證、加密貨幣錢包
- **C2 通訊**：HTTP POST 傳輸加密資料

## 建議措施

1. **防火牆封鎖**：將上述 C2 網域列入黑名單
2. **端點防護**：部署 EDR 偵測 FormBook 行為特徵（註冊表修改、記憶體注入）
3. **使用者教育**：警告員工不開啟未知來源的附件
4. **雜湊比對**：使用上述雜湊值掃描端點是否已感染

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/)

---
> 萃取時間：2026-02-22 08:00 UTC
> 資料來源：abuse.ch ThreatFox (threatfox-recent)
> IoC 時效性：本彙總僅反映 2026-02-20 至 2026-02-21 的回報資料，實際 C2 狀態可能已變化
