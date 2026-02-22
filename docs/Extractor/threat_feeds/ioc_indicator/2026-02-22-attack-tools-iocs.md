# 攻擊工具 C2 基礎設施 IoC 彙總（2026-02-21/22）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-22 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | malware |
| **惡意程式家族** | Meterpreter / Cobalt Strike / Sliver / Havoc |
| **狀態** | online |
| **威脅等級** | Critical |
| **信心水準** | 高 |

## 威脅描述

本彙總涵蓋合法滲透測試工具被惡意濫用的 C2 基礎設施，包含 Meterpreter (32)、Cobalt Strike (16)、Sliver (13)、Havoc (8) 等工具的惡意 C2 伺服器。這些工具原為資安研究與滲透測試設計，但已被網路犯罪組織與 APT 團體廣泛濫用。

## IoC 統計

| 惡意程式家族 | IP:Port | Domain | Hash | 總計 |
|--------------|---------|--------|------|------|
| **Meterpreter** | 32 | 0 | 0 | 32 |
| **Cobalt Strike** | 10 | 0 | 6 (樣本雜湊) | 16 |
| **Sliver** | 13 | 0 | 0 | 13 |
| **Havoc** | 5 | 3 | 0 | 8 |
| **總計** | 60 | 3 | 6 | 69 |

## Meterpreter C2 伺服器（IP:Port）

Meterpreter 為 Metasploit Framework 的後滲透模組，提供遠端控制、權限提升、橫向移動等功能。

### 主要 C2 IP:Port 範例

| IP:Port | 備註 |
|---------|------|
| `51.44.165.12:6002` | 多端口 C2（同 IP 開放多個端口） |
| `51.44.165.12:19952` | 同上 |
| `51.44.165.12:49502` | 同上 |
| `31.25.135.74:446` | |
| `193.181.213.253:4444` | 預設 Metasploit 端口 |
| `56.155.101.105:28080` | |
| `128.199.110.246:8088` | |
| `15.160.149.198:50001` | |
| `196.75.37.117:2222` | |
| `103.177.46.3:3790` | |

## Cobalt Strike C2 伺服器

Cobalt Strike 為商業化紅隊工具，提供 Beacon 後門、權限提升、橫向移動等進階功能。

### C2 IP:Port 範例（10 筆）

- 攻擊者使用 Cobalt Strike 團隊伺服器建立 C2 通訊

### 惡意樣本雜湊

| 類型 | 雜湊值 | 備註 |
|------|--------|------|
| SHA256 | (2 筆) | Cobalt Strike Beacon 樣本 |
| SHA1 | (2 筆) | |
| MD5 | (2 筆) | |

## Sliver C2 伺服器

Sliver 為開源 C2 框架，提供類似 Cobalt Strike 的功能但完全免費，近年被 APT 團體廣泛採用。

### 主要 C2 IP:Port（13 筆）

- 觀察到攻擊者使用 Sliver 的 mTLS、HTTP(S)、DNS 等多種 C2 通訊協定

## Havoc C2 基礎設施

Havoc 為新興開源 C2 框架，介面與功能類似 Cobalt Strike。

### C2 網域與 IP:Port

- Domain: 3 筆
- IP:Port: 5 筆

## 關聯分析

### 濫用趨勢

1. **商業工具洩漏**：Cobalt Strike 破解版本在地下論壇流通
2. **開源替代品**：Sliver、Havoc 等免費工具降低攻擊門檻
3. **APT 偏好**：中國、北韓、俄羅斯 APT 團體大量使用這些工具
4. **勒索軟體關聯**：許多勒索軟體組織使用 Cobalt Strike 進行橫向移動

### 技術特徵

| 工具 | 通訊協定 | 典型用途 |
|------|----------|----------|
| Meterpreter | HTTP(S), TCP | 初始存取、後滲透 |
| Cobalt Strike | HTTP(S), DNS, SMB | 橫向移動、權限提升、資料竊取 |
| Sliver | mTLS, HTTP(S), DNS, WireGuard | 長期駐留、多平台攻擊 |
| Havoc | HTTP(S), SMB | 紅隊演練、APT 活動 |

### 防禦挑戰

- **合法性模糊**：這些工具本身為合法滲透測試工具，難以單純依靠簽章偵測
- **高度客製化**：攻擊者可修改 Beacon 設定、加密方式、C2 協定
- **基礎設施輪替**：C2 伺服器快速變換 IP 與網域

## 建議措施

1. **網路封鎖**：將上述 IP:Port 列入防火牆黑名單
2. **流量監控**：偵測 Cobalt Strike Beacon 的特徵（如 Malleable C2 Profile）
3. **端點防護**：
   - 啟用 EDR 偵測記憶體注入、Beacon 植入行為
   - 監控異常的 PowerShell、WMI、PsExec 執行
4. **威脅獵捕**：
   - 搜尋 Cobalt Strike 預設憑證（MD5: `950098276A495286EB2A2556FBAB6D83`）
   - 偵測 Sliver 預設 mTLS 證書
5. **事件應變**：
   - 若偵測到這些工具，假設攻擊者已取得網域控制權限
   - 立即隔離受感染主機並進行完整調查

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/)

---
> 萃取時間：2026-02-22 08:00 UTC
> 資料來源：abuse.ch ThreatFox (threatfox-recent)
> IoC 時效性：本彙總僅反映 2026-02-20 至 2026-02-21 的回報資料，實際 C2 狀態可能已變化
> 
> ⚠️ **高風險警告**：偵測到這些工具表示攻擊者具備進階能力，需立即啟動事件應變程序
