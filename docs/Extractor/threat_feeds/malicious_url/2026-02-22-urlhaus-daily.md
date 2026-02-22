---
title: "URLhaus 每日威脅彙整 (2026-02-22)"
source: "URLhaus Recent URLs"
source_url: "https://urlhaus.abuse.ch/"
category: "malicious_url"
extracted_at: "2026-02-22T08:00:21+08:00"
total_threats: 772
confidence: "高"
tags:
  - URLhaus
  - malware_download
  - botnet
  - threat_feed
---

# URLhaus 每日威脅彙整 (2026-02-22)

## 執行摘要

本報告彙整 URLhaus 於 2026-02-21 至 2026-02-22 期間收錄的 **772 筆惡意 URL**，全部歸類為惡意軟體下載（malware_download）威脅。

**關鍵發現：**

- **410 個 URL 仍在線上活躍**（53.1%），具有立即威脅性
- **Mozi 殭屍網路**為主要威脅（382 筆，佔 49.5%），主要針對 IoT 設備
- **ClearFake** 為第二大威脅家族（63 筆），用於投放假瀏覽器更新詐騙
- **372 個不重複網域/IP**，前 10 個網域佔 197 筆（25.5%）

---

## 威脅類型分布

| 威脅類型 | 數量 | 佔比 |
|---------|------|------|
| malware_download | 772 | 100.0% |

---

## URL 狀態統計

| 狀態 | 數量 | 佔比 | 說明 |
|------|------|------|------|
| online | 410 | 53.1% | 仍在線上，具立即威脅 |
| offline | 362 | 46.9% | 已離線，威脅降低 |

**建議行動：**
- 立即封鎖下方列出的 410 個在線 IP/網域
- 檢查網路流量是否有連線至這些惡意端點

---

## Top 10 惡意網域/IP（脫敏）

| 排名 | 網域/IP | 出現次數 | 狀態概況 |
|------|---------|----------|----------|
| 1 | `180[.]93[.]52[.]81` | 34 | 30/34 在線 |
| 2 | `cnc[.]mu-minhvuong[.]com` | 31 | 29/31 在線 |
| 3 | `103[.]125[.]219[.]204` | 29 | 13/29 在線 |
| 4 | `209[.]97[.]163[.]167` | 17 | 16/17 在線 |
| 5 | `arilprivate[.]storexyz[.]web[.]id` | 16 | 12/16 在線 |
| 6 | `192[.]109[.]200[.]42` | 16 | 全部離線 |
| 7 | `130[.]12[.]180[.]43` | 15 | 8/15 在線 |
| 8 | `206[.]123[.]145[.]26` | 14 | 12/14 在線 |
| 9 | `185[.]242[.]3[.]231` | 13 | 5/13 在線 |
| 10 | `87[.]121[.]84[.]49` | 12 | 全部離線 |

---

## Top 10 惡意軟體家族

| 排名 | 家族名稱 | 數量 | 佔比 | 威脅說明 |
|------|----------|------|------|----------|
| 1 | Mozi | 382 | 49.5% | IoT 殭屍網路，針對 MIPS/ARM 路由器與攝影機 |
| 2 | ClearFake | 63 | 8.2% | 假瀏覽器更新詐騙，投放 Infostealer |
| 3 | WsgiDAV | 13 | 1.7% | WebDAV 惡意檔案共享 |
| 4 | Vidar | 4 | 0.5% | 資訊竊取木馬 |
| 5 | CobaltStrike | 3 | 0.4% | 滲透測試工具（被濫用於 APT 攻擊） |
| 6 | CoinMiner | 2 | 0.3% | 加密貨幣挖礦程式 |
| 7 | GuLoader | 2 | 0.3% | 惡意軟體載入器 |
| 8 | Password: lunex | 2 | 0.3% | 未知威脅 |
| 9 | PureCrypter | 2 | 0.3% | 加密載入器 |
| 10 | AsyncRAT | 1 | 0.1% | 遠端存取木馬 |

---

## 技術標籤分析

| 標籤 | 數量 | 說明 |
|------|------|------|
| `elf` | 592 | Linux ELF 可執行檔 |
| `32-bit` | 387 | 32 位元架構 |
| `Mozi` | 382 |  |
| `mips` | 345 | MIPS 處理器（常見於路由器） |
| `mirai` | 229 | Mirai 殭屍網路變種 |
| `ua-wget` | 216 | 使用 wget User-Agent（自動化下載） |
| `botnetdomain` | 69 | 殭屍網路指揮控制網域 |
| `ClearFake` | 63 |  |
| `opendir` | 62 | 開放目錄（未保護的網頁目錄） |
| `arm` | 41 | ARM 處理器（IoT 設備） |

**IoT 設備威脅：** 大量針對 MIPS（345）和 ARM（41）架構的惡意程式，顯示 IoT 設備仍是主要攻擊目標。

---

## 高風險 URL 樣本（前 20 筆，脫敏）

僅列出**仍在線上**的高風險 URL：

| # | URL（脫敏） | 威脅類型 | 惡意軟體 | URLhaus 連結 |
|---|-------------|----------|----------|--------------|
| 1 | `hxxp://123.9.101.216:33713/i` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782461/) |
| 2 | `hxxp://117.209.82.48:47745/i` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782460/) |
| 3 | `hxxp://182.117.10.132:41586/bin.sh` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782459/) |
| 4 | `hxxp://110.37.28.220:57433/i` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782458/) |
| 5 | `hxxp://117.209.82.48:47745/bin.sh` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782457/) |
| 6 | `hxxp://110.37.71.20:38413/i` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782456/) |
| 7 | `hxxp://125.47.84.164:44860/bin.sh` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782455/) |
| 8 | `hxxp://110.37.71.20:38413/bin.sh` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782454/) |
| 9 | `hxxp://182.114.253.226:41369/bin.sh` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782453/) |
| 10 | `hxxp://182.123.196.107:44635/i` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782452/) |
| 11 | `hxxp://42.224.254.29:36920/i` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782451/) |
| 12 | `hxxp://42.224.254.29:36920/bin.sh` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782450/) |
| 13 | `hxxp://219.155.209.87:36272/bin.sh` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782449/) |
| 14 | `hxxp://39.79.12.197:35835/i` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782448/) |
| 15 | `hxxp://123.9.197.5:49612/i` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782447/) |
| 16 | `hxxp://130.12.180.43/files/7774414118/kiHxlYB.exe` | malware_download | unknown | [詳情](https://urlhaus.abuse.ch/url/3782446/) |
| 17 | `hxxp://222.141.12.89:34883/i` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782445/) |
| 18 | `hxxp://39.79.12.197:35835/bin.sh` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782443/) |
| 19 | `hxxp://219.155.209.87:36272/i` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782444/) |
| 20 | `hxxp://219.155.70.161:40029/i` | malware_download | Mozi | [詳情](https://urlhaus.abuse.ch/url/3782442/) |

---

## 回報者統計

| 回報者 | 提交數量 |
|--------|----------|
| geenensp | 389 |
| NDA0E | 84 |
| DaveLikesMalwre | 83 |
| anonymous | 63 |
| abuse_ch | 58 |

---

## 防禦建議

### 立即行動

1. **網路層防護：**
   - 封鎖上述 Top 10 惡意 IP/網域（尤其是 410 個在線端點）
   - 監控出站連線，偵測是否有設備嘗試連線至這些端點

2. **IoT 設備保護：**
   - 592 筆為 Linux ELF 惡意程式，主要針對 IoT 設備
   - 確認路由器、攝影機、NAS 等設備韌體為最新版本
   - 停用不必要的遠端管理介面
   - 變更預設密碼

3. **瀏覽器安全（ClearFake 防範）：**
   - ClearFake 有 63 筆，會偽裝成瀏覽器更新
   - 教育使用者：**瀏覽器更新不會透過網頁彈窗要求下載**
   - 部署端點防護偵測假更新行為

### 長期策略

- 整合 URLhaus Threat Feed 至 SIEM/防火牆
- 定期檢視此類威脅情報，更新防護規則
- 建立 IoT 設備清單與風險評估機制

---

## 資料來源

- **來源：** URLhaus (abuse.ch)
- **資料時間：** 2026-02-21 至 2026-02-22
- **萃取時間：** 2026-02-22 08:00:21 UTC+8
- **總筆數：** 772
- **信心度：** 高（URLhaus 為業界權威威脅情報來源）

---

## 附註

- 所有 URL 已脫敏處理（`http://` → `hxxp://`, `https://` → `hxxps://`, `.` → `[.]`）
- 狀態為「online」表示 URLhaus 最後檢查時該 URL 仍可存取
- 部分 URL 可能在報告產出時已離線
- 建議搭配其他威脅情報來源交叉驗證