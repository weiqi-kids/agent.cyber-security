# ClearFake 惡意程式 IoC 彙總（2026-02-21/22）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-22 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | malware |
| **惡意程式家族** | ClearFake |
| **狀態** | online |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

ClearFake 是一種 JavaScript 惡意程式，透過偽造瀏覽器錯誤訊息誘導使用者執行惡意 PowerShell 指令，通常用於投遞遠端存取木馬（RAT）或竊密軟體。本彙總涵蓋 ThreatFox 於 2026-02-20 至 2026-02-21 回報的 124 筆 ClearFake 載荷投遞網域。

## IoC 統計

| 類別 | 數量 |
|------|------|
| **總計** | 124 筆 |
| Domain | 124 |

### 威脅類型分布

| 威脅類型 | 數量 |
|----------|------|
| payload_delivery (載荷投遞) | 124 |

## 主要載荷投遞網域範例（已脫敏）

> ⚠️ 以下網域已確認用於 ClearFake 惡意載荷投遞，請勿嘗試連線。

| IoC 值 |
|--------|
| `farmnode.breezefarm.in[.]net` |
| `greenfield.breezefarm.in[.]net` |
| `coolbreeze.breezefarm.in[.]net` |
| `servetray.servantakeaway[.]ru` |
| `taskrunner.servantakeaway[.]ru` |
| `fieldleader.placewinner[.]ru` |
| `areavictor.placewinner[.]ru` |
| `spotchamp.placewinner[.]ru` |
| `rankworker.murasubordin[.]ru` |
| `colonyorder.murasubordin[.]ru` |
| `antregime.murasubordin[.]ru` |
| `priceindex.barygameter[.]ru` |
| `marketmeter.barygameter[.]ru` |
| `tradegauge.barygameter[.]ru` |
| `blindcorner.avoidingglaz[.]ru` |

## 關聯分析

ClearFake 攻擊活動顯示高度組織化特徵，大量使用 `.ru` 和 `.in.net` TLD，且網域名稱遵循特定命名模式（二級域名 + 隨機英文單字）。觀察到攻擊者建立多個「域名叢集」（如 `breezefarm.in.net`、`servantakeaway.ru`、`placewinner.ru`），每個叢集下註冊多個變體子網域以規避封鎖。

### 技術特徵

- **傳播途徑**：受感染網站注入惡意 JavaScript
- **社交工程**：偽造「瀏覽器需要更新」或「字體載入失敗」等錯誤訊息
- **執行方式**：誘導使用者複製貼上惡意 PowerShell 指令到命令列執行
- **後續載荷**：投遞資訊竊取軟體（如 Lumma Stealer、RedLine）或遠端存取工具

### 網域命名模式

攻擊者使用「動作詞 + 主題詞」組合（如 `farmnode`、`taskrunner`、`fieldleader`），並建立域名叢集：

- `*.breezefarm.in.net`
- `*.servantakeaway.ru`
- `*.placewinner.ru`
- `*.murasubordin.ru`
- `*.barygameter.ru`
- `*.avoidingglaz.ru`

## 建議措施

1. **DNS 封鎖**：將上述網域及其父域（如 `*.breezefarm.in.net`）列入黑名單
2. **端點防護**：限制 PowerShell 執行權限，啟用 PowerShell 腳本簽章驗證
3. **使用者教育**：訓練員工辨識假冒錯誤訊息，絕不執行網站指示的指令
4. **網路監控**：偵測異常的 PowerShell 網路連線行為

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/)

---
> 萃取時間：2026-02-22 08:00 UTC
> 資料來源：abuse.ch ThreatFox (threatfox-recent)
> IoC 時效性：本彙總僅反映 2026-02-20 至 2026-02-21 的回報資料，實際載荷投遞狀態可能已變化
