# Stealer 竊密軟體家族 IoC 彙總（2026-02-21/22）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-22 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | malware |
| **惡意程式家族** | Luca Stealer / Agent Tesla / Kraken / MassLogger / RedLine / TroyStealer / VIPKeylogger |
| **狀態** | online |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

本彙總涵蓋資訊竊取軟體（Stealer）家族的惡意樣本雜湊，包含 Luca Stealer (12)、Agent Tesla (9)、Kraken Keylogger (9)、MassLogger (6)、RedLine Stealer (3)、TroyStealer (3)、VIPKeylogger (3) 等專注於竊取憑證、加密貨幣錢包、瀏覽器資料的惡意程式。

## IoC 統計

| 惡意程式家族 | SHA256 | SHA1 | MD5 | 總計 |
|--------------|--------|------|-----|------|
| **Luca Stealer** | 4 | 4 | 4 | 12 |
| **Agent Tesla** | 3 | 3 | 3 | 9 |
| **Kraken Keylogger** | 3 | 3 | 3 | 9 |
| **MassLogger** | 2 | 2 | 2 | 6 |
| **RedLine Stealer** | 1 | 1 | 1 | 3 |
| **TroyStealer** | 1 | 1 | 1 | 3 |
| **VIPKeylogger** | 1 | 1 | 1 | 3 |
| **總計** | 15 | 15 | 15 | 45 |

## Luca Stealer 惡意樣本雜湊

Luca Stealer 為新興資訊竊取軟體，專注於竊取瀏覽器憑證與加密貨幣錢包。

### 樣本雜湊範例

| 類型 | 雜湊值 |
|------|--------|
| SHA256 | `93e63f9bb54caf081c04ae3815211eb30571593aa6f7d79fc7411ba848413b14` |
| SHA256 | `43b98cb9944f3551d4c20fcd0d736af5639304ed197e37f862524223f2096c52` |
| SHA1 | `a2718015284481a1fd87d1d9d0624524ce1b30c4` |
| SHA1 | `f14a1344365c835123d6abebc2846371979e6887` |
| MD5 | `f8753cb17f99f1091a81e01dc1569dae` |

> 完整 12 筆雜湊值（4 組樣本，各含 SHA256/SHA1/MD5）

## Agent Tesla 惡意樣本雜湊

Agent Tesla 為老牌鍵盤記錄器與竊密軟體，常透過釣魚郵件傳播。

### 統計

- **樣本雜湊**: 9 筆（3 組樣本，各含 SHA256/SHA1/MD5）

## Kraken Keylogger 惡意樣本雜湊

Kraken Keylogger 為新興鍵盤記錄器，支援擷取螢幕截圖與剪貼簿內容。

### 統計

- **樣本雜湊**: 9 筆（3 組樣本，各含 SHA256/SHA1/MD5）

## MassLogger 惡意樣本雜湊

MassLogger 為 .NET 鍵盤記錄器，常見於釣魚攻擊。

### 統計

- **樣本雜湊**: 6 筆（2 組樣本，各含 SHA256/SHA1/MD5）

## RedLine Stealer 惡意樣本雜湊

RedLine Stealer 為俄羅斯地下市場熱門的 MaaS 竊密軟體，專注於竊取瀏覽器、FTP、VPN 憑證。

### 統計

- **樣本雜湊**: 3 筆（1 組樣本，含 SHA256/SHA1/MD5）

## TroyStealer 惡意樣本雜湊

TroyStealer 為新興竊密軟體變種。

### 統計

- **樣本雜湊**: 3 筆（1 組樣本，含 SHA256/SHA1/MD5）

## VIPKeylogger 惡意樣本雜湊

VIPKeylogger 為變種鍵盤記錄器。

### 統計

- **樣本雜湊**: 3 筆（1 組樣本，含 SHA256/SHA1/MD5）

## 關聯分析

### Stealer 生態系統

1. **MaaS 商業模式**：RedLine、Luca 等竊密軟體採用訂閱制販售
2. **傳播途徑**：
   - 釣魚郵件夾帶 Office 文件巨集
   - 假冒軟體破解工具
   - 惡意廣告與 SEO 投毒
3. **竊取目標**：
   - 瀏覽器儲存的帳密（Chrome、Edge、Firefox）
   - FTP 客戶端憑證（FileZilla）
   - Email 客戶端憑證（Outlook、Thunderbird）
   - 加密貨幣錢包（MetaMask、Exodus、Electrum）
   - VPN 憑證
   - 2FA 恢復碼

### 技術特徵

| 惡意程式 | 開發語言 | 主要竊取目標 | 傳輸方式 |
|----------|----------|--------------|----------|
| Luca Stealer | .NET | 瀏覽器、加密錢包 | HTTP POST |
| Agent Tesla | .NET | 鍵盤記錄、螢幕截圖 | SMTP/FTP/HTTP |
| Kraken | .NET | 鍵盤記錄、剪貼簿 | Telegram Bot API |
| MassLogger | .NET | 鍵盤記錄 | SMTP |
| RedLine | C/C++ | 瀏覽器、FTP、VPN | C2 HTTP |

### 資料轉售鏈

```
受害者感染 Stealer
    ↓
竊取的憑證上傳至 C2
    ↓
攻擊者打包成「Logs」販售
    ↓
地下市場交易（Genesis Market、Russian Market）
    ↓
購買者使用竊取的憑證進行：
- 銀行詐欺
- 加密貨幣盜竊
- 企業入侵
- 勒索攻擊
```

## 建議措施

1. **雜湊偵測**：
   - 使用上述樣本雜湊掃描端點
   - 部署 YARA 規則偵測 Stealer 變種
2. **行為偵測**：
   - 監控異常瀏覽器資料存取（讀取 Login Data、Cookies 資料庫）
   - 偵測異常網路連線（上傳大量資料到未知伺服器）
   - 監控加密貨幣錢包檔案存取
3. **憑證防護**：
   - 啟用瀏覽器主密碼保護
   - 使用硬體金鑰（YubiKey）取代軟體 2FA
   - 定期變更密碼
4. **使用者教育**：
   - 不下載來路不明的軟體破解工具
   - 不開啟未知郵件附件
   - 檢查下載檔案的數位簽章
5. **事件應變**：
   - 若偵測到感染，假設所有儲存的憑證已洩漏
   - 立即變更所有密碼、撤銷 API 金鑰
   - 監控銀行與加密貨幣帳戶異常活動

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/)

---
> 萃取時間：2026-02-22 08:00 UTC
> 資料來源：abuse.ch ThreatFox (threatfox-recent)
> IoC 時效性：本彙總僅反映 2026-02-20 至 2026-02-21 的回報資料
> 
> ⚠️ **憑證洩漏風險**：Stealer 感染可能導致大量憑證洩漏至地下市場
