# 未分類與其他惡意程式 IoC 彙總（2026-02-21/22）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-22 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | malware |
| **惡意程式家族** | 未分類 / Deimos C2 / SmokeLoader / 其他小量家族 |
| **狀態** | online |
| **威脅等級** | Medium |
| **信心水準** | 中 |

## 威脅描述

本彙總涵蓋未能歸類到主要惡意程式家族的 IoC，包含標記為 "unknown" 的惡意活動 (32)、unknown_loader (8)，以及 Deimos C2 (5)、SmokeLoader (3)、Supper (3)、Smaug (3)、LODA (3)、Attor (3)、EyePyramid (1) 等小量家族。

## IoC 統計

| 類別 | Domain | IP:Port | URL | Hash | 總計 |
|------|--------|---------|-----|------|------|
| **Unknown** | 9 | 18 | 5 | 0 | 32 |
| **Unknown Loader** | 0 | 0 | 8 | 0 | 8 |
| **Deimos C2** | 0 | 5 | 0 | 0 | 5 |
| **SmokeLoader** | 0 | 0 | 0 | 3 | 3 |
| **Supper** | 0 | 0 | 0 | 3 | 3 |
| **Smaug** | 0 | 0 | 0 | 3 | 3 |
| **LODA** | 0 | 0 | 0 | 3 | 3 |
| **Attor** | 0 | 0 | 0 | 3 | 3 |
| **EyePyramid** | 0 | 1 | 0 | 0 | 1 |
| **總計** | 9 | 24 | 13 | 18 | 64 |

## Unknown（未分類惡意活動）

### 統計

- **網域**: 9 筆
- **IP:Port**: 18 筆
- **URL**: 5 筆

### 分析

這些 IoC 由 ThreatFox 貢獻者回報為惡意，但未能歸類到已知惡意程式家族。可能原因：

1. **新興威脅**: 新型惡意程式尚未被命名
2. **客製化工具**: APT 團體客製化惡意程式
3. **多用途基礎設施**: 同一 C2 伺服器被多個惡意程式共用
4. **分析不足**: 樣本尚未完成深度分析

### 建議處理

雖然無法明確歸類，仍應：
- 將這些 IoC 列入監控清單
- 若偵測到相關活動，進行深度調查
- 提交樣本到 VirusTotal 等平台進行群體分析

## Unknown Loader（未分類載入器）

### 統計

- **惡意 URL**: 8 筆

### 分析

這些 URL 被標記為 Loader/Dropper 的載荷下載位置，但尚未識別具體家族。

## Deimos C2

Deimos 為開源 C2 框架，類似 Sliver 和 Havoc。

### 技術特徵

- **類型**: 開源 C2 框架
- **用途**: 紅隊演練、APT 活動
- **功能**: 遠端控制、權限提升、橫向移動

### IoC 統計

- **C2 IP:Port**: 5 筆

## SmokeLoader

SmokeLoader 為 Loader/Dropper 惡意程式，常用於投遞次階段載荷（如 RAT、Stealer、勒索軟體）。

### 技術特徵

- **功能**: 下載並執行次階段惡意程式
- **常見載荷**: Trickbot、Emotet、勒索軟體
- **持久化**: 註冊表、服務安裝
- **反分析**: 虛擬機偵測、沙箱規避

### IoC 統計

- **樣本雜湊**: 3 筆（1 組樣本，含 SHA256/SHA1/MD5）

## Supper

Supper 為變種惡意程式，細節有限。

### IoC 統計

- **樣本雜湊**: 3 筆（1 組樣本，含 SHA256/SHA1/MD5）

## Smaug

Smaug 為變種惡意程式，細節有限。

### IoC 統計

- **樣本雜湊**: 3 筆（1 組樣本，含 SHA256/SHA1/MD5）

## LODA

LODA 為 AutoIt 腳本惡意程式，常見於釣魚攻擊。

### 技術特徵

- **開發語言**: AutoIt 腳本
- **功能**: 鍵盤記錄、資訊竊取
- **傳播**: 釣魚郵件夾帶 .exe（編譯後的 AutoIt 腳本）

### IoC 統計

- **樣本雜湊**: 3 筆（1 組樣本，含 SHA256/SHA1/MD5）

## Attor

Attor 為 APT 惡意程式，疑似與俄羅斯 APT 團體有關。

### 技術特徵

- **關聯**: 俄羅斯 APT28（Fancy Bear）
- **目標**: 外交機構、政府單位
- **功能**: 間諜軟體、資料竊取
- **持久化**: UEFI rootkit、bootkit

### IoC 統計

- **樣本雜湊**: 3 筆（1 組樣本，含 SHA256/SHA1/MD5）

### 威脅等級提升

⚠️ **若偵測到 Attor 相關 IoC，應立即提升至 Critical 等級並啟動事件應變**

## EyePyramid

EyePyramid 為義大利 APT 攻擊活動使用的惡意程式，歷史上曾針對義大利政治人物與企業。

### 技術特徵

- **首次發現**: 2016 年
- **關聯**: 義大利網路間諜活動
- **功能**: Email 竊取、資料外洩
- **目標**: 政治人物、銀行、電信業

### IoC 統計

- **C2 IP:Port**: 1 筆

### 歷史威脅

雖然 EyePyramid 為歷史威脅，但相關基礎設施重新活躍值得關注。

## 關聯分析

### 未分類 IoC 的價值

即使無法歸類到已知家族，這些 IoC 仍具防禦價值：

1. **早期預警**: 新興威脅的首次發現
2. **APT 追蹤**: 客製化工具通常無法歸類
3. **基礎設施關聯**: 同一 IP 可能託管多個惡意程式

### SmokeLoader 產業鏈

SmokeLoader 常見於多階段攻擊：

```
初始感染（釣魚郵件、漏洞利用）
    ↓
SmokeLoader 下載
    ↓
投遞次階段載荷（RAT、Stealer、勒索軟體）
    ↓
長期駐留與資料竊取
```

### Attor APT 警告

Attor 與俄羅斯 APT28 有關，若偵測到相關活動：

- 假設攻擊者已取得網域控制權限
- 檢查 UEFI/BIOS 是否被植入 rootkit
- 進行完整的網路基礎設施審計

## 建議措施

1. **Unknown IoC 處理**:
   - 加入監控清單
   - 若觸發警報，進行完整事件調查
   - 提交樣本到多個沙箱平台分析

2. **SmokeLoader 防禦**:
   - 監控異常的下載行為（從可疑 IP 下載可執行檔）
   - EDR 偵測記憶體注入行為
   - 網路封鎖已知 C2 伺服器

3. **Attor / EyePyramid APT 防禦**:
   - 威脅獵捕：搜尋長期潛伏的異常活動
   - UEFI 完整性檢查
   - 啟用進階日誌記錄（PowerShell、Sysmon）

4. **定期更新**:
   - 訂閱 ThreatFox 威脅情報
   - 定期更新 IoC 黑名單

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/)

---
> 萃取時間：2026-02-22 08:00 UTC
> 資料來源：abuse.ch ThreatFox (threatfox-recent)
> IoC 時效性：本彙總僅反映 2026-02-20 至 2026-02-21 的回報資料
> 
> ⚠️ **未分類不等於低風險**：Unknown IoC 可能為新興威脅或 APT 客製化工具
