# iClickFix 惡意程式 IoC 彙總（2026-02-21/22）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-22 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | malware |
| **惡意程式家族** | iClickFix |
| **狀態** | online |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

iClickFix 是一種 JavaScript 惡意程式，透過誘騙使用者點擊假冒的系統通知或錯誤訊息，誘導執行惡意腳本。本彙總涵蓋 ThreatFox 於 2026-02-20 至 2026-02-21 回報的 171 筆 iClickFix C2 網域。

## IoC 統計

| 類別 | 數量 |
|------|------|
| **總計** | 171 筆 |
| Domain | 171 |

### 威脅類型分布

| 威脅類型 | 數量 |
|----------|------|
| botnet_cc (C2 伺服器) | 171 |

## 主要 C2 網域範例（已脫敏）

> ⚠️ 以下網域已確認與 iClickFix C2 通訊，請勿嘗試連線。

| IoC 值 |
|--------|
| `v2.petrnesterov[.]com` |
| `xpekt.aurovine[.]com` |
| `relativeplanning[.]com` |
| `lingering-verify-cloud.pages[.]dev` |
| `btexee3dc53f6dc453f6a9f461a5hfamd.pages[.]dev` |
| `vair.xcreative[.]cz` |
| `renovation-create[.]com` |
| `createsouken[.]com` |
| `panoramarevue.sitecreation[.]ma` |
| `create-seibu[.]com` |

## 關聯分析

iClickFix 攻擊活動近期持續活躍，攻擊者濫用 Cloudflare Pages (`pages.dev`) 等免費雲端服務託管惡意內容。觀察到大量網域名稱包含 "create"、"verify"、"cloud" 等關鍵字，試圖偽裝成合法服務誘導點擊。

### 技術特徵

- **傳播途徑**：受感染網站嵌入惡意 JavaScript、惡意廣告
- **社交工程**：偽造「驗證失敗」、「瀏覽器更新」等提示
- **執行方式**：誘導使用者執行 PowerShell 指令或下載惡意載荷
- **基礎設施**：濫用 Cloudflare Pages、免費域名註冊服務

## 建議措施

1. **Web 過濾**：將上述網域列入 DNS/Web 過濾黑名單
2. **使用者教育**：訓練員工識別假冒系統通知
3. **腳本防護**：限制瀏覽器執行未信任來源的 JavaScript
4. **監控異常**：偵測員工執行異常 PowerShell 指令

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/)

---
> 萃取時間：2026-02-22 08:00 UTC
> 資料來源：abuse.ch ThreatFox (threatfox-recent)
> IoC 時效性：本彙總僅反映 2026-02-20 至 2026-02-21 的回報資料，實際 C2 狀態可能已變化
