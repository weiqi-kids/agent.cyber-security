---
title: "Notepad++自動更新機制遭攻陷，請儘速手動更新"
published: 2026-02-24
source_url: "https://www.twcert.org.tw/tw/cp-104-10725-feaeb-1.html"
category: "attack_incident"
source_layer: "security_news_facts"
source_feed: "rss-104"
severity: "高"
confidence: "高"
cve_ids: []
---

## 摘要

知名開源文字編輯器Notepad++遭受複雜供應鏈攻擊，中國APT組織Lotus Blossom於2025年6-12月期間攻陷其代管主機服務商，劫持自動更新機制散布惡意後門Chrysalis。官方緊急呼籲停用自動更新，手動下載v8.9.2版本。

## 詳細內容

資安研究團隊Rapid7 Labs與Rapid7 MDR於2026年2月揭露針對Notepad++的複雜供應鏈攻擊，此攻擊由中國APT組織Lotus Blossom（亦追蹤為Violet Typhoon或Billbug）發起。

### 攻擊時間軸

- **2025年6月**：攻擊者首次入侵代管主機服務商基礎設施
- **2025年6月-12月**：持續劫持自動更新機制
- **2026年2月**：Rapid7公開揭露攻擊細節
- **緊急應變**：Notepad++官方釋出v8.9.2並呼籲手動更新

### 攻擊手法

#### 供應鏈入侵策略

與傳統竄改軟體原始碼的手法不同，攻擊者採用更隱蔽的方式：

1. **攻陷代管服務商**：成功入侵Notepad++使用的主機服務商基礎設施
2. **控制內部憑證**：掌握服務商的內部服務憑證與簽章金鑰
3. **劫持更新流量**：當使用者執行內建更新程式（WinGUp）時，流量被導向惡意伺服器
4. **散布偽造安裝套件**：使用者下載到經過惡意修改的update.exe

**關鍵特徵**：
- 原始碼未被篡改（GitHub Repository乾淨）
- 官方簽章機制被繞過或濫用
- 攻擊目標為更新機制而非開發流程

### 攻擊鏈技術分析

Rapid7與卡巴斯基研究團隊識別出3種攻擊模式，顯示攻擊者持續演進其技術。

#### 第一個攻擊鏈（2025年7-8月）

| 項目 | 內容 |
|------|------|
| **惡意資源位置** | http://45.76.155[.]202/update/update.exe |
| **主要行為** | - 建立 %appdata%\ProShow 資料夾<br>- 收集系統資訊（whoami、tasklist）並上傳<br>- 放置多個執行檔並執行惡意程式 |
| **特色** | 視為較早期的惡意活動樣本，使用舊有漏洞載入payload |

#### 第二個攻擊鏈（2025年9月）

| 項目 | 內容 |
|------|------|
| **惡意資源位置** | http://45.76.155[.]202/update/update.exe |
| **主要行為** | - 下載update.exe<br>- 收集更多系統資訊（加上systeminfo、netstat）並上傳<br>- 在 %APPDATA%\Adobe\Scripts 放置多個檔案並執行惡意程式 |
| **特色** | 資料蒐集指令更完整，範圍擴大，目標資料位置更新 |

#### 第三個攻擊鏈（2025年10月）— Chrysalis後門

| 項目 | 內容 |
|------|------|
| **惡意資源位置** | http://45.32.144[.]255/update/update.exe |
| **主要行為** | - 置放三個檔案到 %appdata%\Bluetooth\：<br>  • BluetoothService.exe（合法可執行檔）<br>  • log.dll（惡意DLL）<br>  • BluetoothService（加密shellcode）<br>- 利用DLL Hijacking載入log.dll<br>- 執行後門程式Chrysalis |
| **特色** | 典型DLL Hijacking技術，最終植入後門程式 |

### 惡意NSIS安裝檔執行流程

```
update.exe (惡意NSIS安裝檔)
    │
    ├─► 解壓縮至 %appdata%\Bluetooth\
    │
    ├─► BluetoothService.exe (合法的Bitdefender執行檔)
    │   │
    │   └─► 載入 log.dll (DLL Side-Loading)
    │       │
    │       └─► 解密並執行 BluetoothService (Shellcode)
    │           │
    │           └─► 注入 Chrysalis 後門
```

### Chrysalis後門技術特徵

Chrysalis是一個高度客製化的隱匿後門，採用多層次防禦技術規避偵測。

#### 1. C2通訊偽裝

**HTTPS加密通訊**：
- URL結構：`/a/chat/s/{GUID}`
- 刻意模仿Deepseek API端點格式
- 使用合法的Chrome User Agent
- RC4內容加密

**偽裝目的**：
- 視覺上類似正常的AI應用流量
- 內容層混淆於網頁瀏覽流量中
- 難以透過流量分析識別

**C2伺服器**：
- api[.]skycloudcenter[.]com
- api[.]wiresguard[.]com

#### 2. API Hashing（雙層防禦）

**載入器階段**：
- 結合FNV-1a與MurmurHash演算法
- 動態解析Windows API函數

**主模組階段**：
- 進階採用自定義的多階段算術混合運算
- 大幅提升靜態分析與特徵碼偵測的難度

#### 3. 濫用Microsoft Warbird

**Warbird程式碼保護框架**：
- 微軟未公開的程式碼保護技術
- 通常用於保護Windows核心元件

**濫用手法**：
- 透過 `NtQuerySystemInformation` 系統調用
- 使用 `SystemCodeFlowTransition (0xB9)` 類別
- 在合法的微軟簽章檔（clipc.dll）記憶體空間內執行惡意Shellcode
- 繞過EDR的記憶體掃描

## 入侵指標（IoCs）

### 惡意IP和網域

```
95[.]179[.]213[.]0
61[.]4[.]102[.]97
59[.]110[.]7[.]32
124[.]222[.]137[.]114
api[.]skycloudcenter[.]com
api[.]wiresguard[.]com
```

### 惡意檔案

| 檔名 | SHA-256 Hash |
|------|--------------|
| update.exe | a511be5164dc1122fb5a7daa3eef9467e43d8458425b15a640235796006590c9 |
| NSIS.nsi | 8ea8b83645fba6e23d48075a0d3fc73ad2ba515b4536710cda4f1f232718f53e |
| BluetoothService.exe | 2da00de67720f5f13b17e9d985fe70f10f153da60c9ab1086fe58f069a156924 |
| BluetoothService | 77bfea78def679aa1117f569a35e8fd1542df21f7e00e27f192c907e61d63a2e |
| log.dll | 3bdc4c0637591533f1d4198a72a33426c01f69bd2e15ceee547866f65e26b7ad |
| u.bat | 9276594e73cda1c69b7d265b3f08dc8fa84bf2d6599086b9acc0bb3745146600 |
| conf.c | f4d829739f2d6ba7e3ede83dad428a0ced1a703ec582fc73a4eee3df3704629a |
| libtcc.dll | 4a52570eeaf9d27722377865df312e295a7a23c3b6eb991944c2ecd707cc9906 |
| admin | 831e1ea13a1bd405f5bda2b9d8f2265f7b1db6c668dd2165ccc8a9c4c15ea7dd |
| loader1 | 0a9b8df968df41920b6ff07785cbfebe8bda29e6b512c94a3b2a83d10014d2fd |
| uffhxpSy | 4c2ea8193f4a5db63b897a2d3ce127cc5d89687f380b97a1d91e0c8db542e4f8 |
| loader2 | e7cd605568c38bd6e0aba31045e1633205d0598c607a855e2e1bca4cca1c6eda |
| 3yzr31vk | 078a9e5c6c787e5532a7e728720cbafee9021bfec4a30e3c2be110748d7c43c5 |
| ConsoleApplication2.exe | b4169a831292e245ebdffedd5820584d73b129411546e7d3eccf4663d5fc5be3 |
| system | 7add554a98d3a99b319f2127688356c1283ed073a084805f14e33b4f6a6126fd |
| s047t5g.exe | fcc2765305bcd213b7558025b2039df2265c3e0b6401e4833123c461df2de51a |

## 安全性建議

### 立即行動（緊急）

1. **停用自動更新**
   - 開啟Notepad++
   - Settings → Preferences → Update
   - 取消勾選「Enable Notepad++ auto-updater」

2. **手動更新至v8.9.2**
   - 前往官方網站：https://notepad-plus-plus.org/
   - 下載最新版本v8.9.2
   - 驗證下載檔案的SHA-256雜湊值
   - 解除安裝舊版本並安裝新版本

3. **執行IoC檢查**
   - 使用下方的PowerShell腳本掃描系統

### IoC檢查腳本

```powershell
# 檢查可疑檔案
$suspicious_paths = @(
    "$env:APPDATA\ProShow",
    "$env:APPDATA\Adobe\Scripts",
    "$env:APPDATA\Bluetooth\BluetoothService.exe",
    "$env:APPDATA\Bluetooth\log.dll"
)

foreach ($path in $suspicious_paths) {
    if (Test-Path $path) {
        Write-Host "⚠️ 發現可疑檔案: $path" -ForegroundColor Red
    }
}

# 檢查網路連線
$malicious_ips = @("95.179.213.0", "61.4.102.97", "59.110.7.32", "124.222.137.114")
$connections = Get-NetTCPConnection | Where-Object {$_.State -eq "Established"}

foreach ($conn in $connections) {
    if ($malicious_ips -contains $conn.RemoteAddress) {
        Write-Host "⚠️ 偵測到可疑連線: $($conn.RemoteAddress)" -ForegroundColor Red
    }
}
```

### 企業防禦策略

1. **GPO或MDM派送原則**
   - 暫時禁用Notepad++自動更新功能
   - 集中管理軟體更新流程

2. **網路層防護**
   - 封鎖IoC中列出的惡意IP與網域
   - 監控異常的HTTPS流量（特別是模仿API端點的模式）

3. **端點防護**
   - 更新EDR規則，偵測DLL Side-Loading行為
   - 監控 %appdata% 下的異常檔案建立
   - 啟用記憶體掃描，偵測Warbird濫用

4. **威脅狩獵**
   - 搜尋環境中是否有IoC檔案或網路連線
   - 檢查Notepad++執行檔的簽章與雜湊值
   - 分析近期的檔案建立與網路連線日誌

### 確認受害檢查清單

若發現以下情況，應立即啟動事件應變程序：

- [ ] 在 %appdata% 發現IoC中列出的檔案或目錄
- [ ] 網路日誌顯示與惡意IP/網域的連線
- [ ] EDR警報顯示DLL Side-Loading或記憶體注入
- [ ] Notepad++執行檔雜湊值與官方不符
- [ ] 系統出現異常的BluetoothService.exe執行

### 事件應變步驟

若確認受害：

1. **隔離受感染系統**：中斷網路連線，防止橫向移動
2. **保存證據**：擷取記憶體映像與磁碟映像
3. **根除威脅**：移除惡意檔案，重建受害系統
4. **變更憑證**：重設所有敏感帳戶密碼
5. **深度調查**：分析攻擊者的存取範圍與資料外洩情況
6. **通報**：依法規要求通報主管機關

## 相關指標

- **攻擊者**：Lotus Blossom (Violet Typhoon / Billbug)
- **攻擊類型**：供應鏈攻擊、DLL Side-Loading
- **後門名稱**：Chrysalis
- **攻擊期間**：2025年6月至12月
- **受影響軟體**：Notepad++ (v8.9.2之前的版本)
- **修復版本**：v8.9.2
- **揭露者**：Rapid7 Labs、Rapid7 MDR、卡巴斯基

## 附註

- **資料來源**：台灣TWCERT/CC、Rapid7、卡巴斯基
- **Lotus Blossom背景**：
  - 中國APT組織，活躍於東南亞與南亞地區
  - 曾針對政府機關、軍事單位、智庫進行間諜活動
  - 擅長供應鏈攻擊與水坑攻擊（watering hole）
- **供應鏈攻擊趨勢**：
  - 類似案例：SolarWinds（2020）、Kaseya（2021）、3CX（2023）
  - 攻擊者傾向攻擊信任鏈中的弱點，而非直接攻擊最終目標
  - 代管服務商、CI/CD管線、更新機制均為高價值目標
- **DLL Side-Loading**：
  - 利用合法執行檔載入惡意DLL
  - 繞過應用程式白名單與簽章驗證
  - 常見於APT攻擊中
