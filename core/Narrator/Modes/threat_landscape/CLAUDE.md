# 威脅態勢分析模式 (Threat Landscape Analysis Mode)

## Mode 定義

| 項目 | 內容 |
|------|------|
| **Mode name** | 威脅態勢分析模式 (Threat Landscape Analysis Mode) |
| **Purpose and audience** | 提供資安人員當前威脅態勢摘要，輔助防禦策略制定 |
| **Source layers** | L1（資安新聞事實層）、L2（漏洞追蹤層）、L3（漏洞利用情報層）、L4（威脅情報饋送層） |
| **Automation ratio** | 40% 自動彙整 + 60% 人工分析判斷 |
| **⚠️ Content risk** | 多來源整合偏差、過度推論趨勢、誤判新興威脅 |
| **🛂 Reviewer persona** | 邏輯一致性審核員 + 使用者誤導風險審核員 |

## 資料來源定義

本模式需要讀取以下資料：

### 來自 Qdrant
- collection: `cyber-security`，filter: `source_layer: security_news_facts`，最近 7 天的事實資料
- collection: `cyber-security`，filter: `source_layer: vulnerability_tracking`，最近 7 天的漏洞資料
- collection: `cyber-security`，filter: `source_layer: exploit_intelligence`，最近 7 天的漏洞利用情報
- collection: `cyber-security`，filter: `source_layer: threat_feeds`，最近 7 天的威脅情報饋送

### 來自 docs/
- `docs/Extractor/security_news_facts/{category}/*.md`（最近 7 天）
- `docs/Extractor/vulnerability_tracking/{category}/*.md`（最近 7 天）
- `docs/Extractor/exploit_intelligence/{category}/*.md`（最近 7 天）
- `docs/Extractor/threat_feeds/{category}/*.md`（最近 7 天）

### 來自本次執行
- Extractor 各層的當次輸出（若有）

## 輸出框架

### 1. 報告標題與期間
```
# 威脅態勢分析 — {YYYY} 第 {WW} 週
> 涵蓋期間：YYYY-MM-DD 至 YYYY-MM-DD
> 資料來源：國際 CERT/安全機構 RSS、NVD、EPSS、Exploit-DB、abuse.ch
```

### 2. 報告結構

#### 2.1 近期重大資安事件
- 從 L1 資安新聞事實層提取（國際多來源）
- 按嚴重程度排序
- 每事件包含：事件摘要、影響範圍、時間線
- 標註資料來源國家/機構

#### 2.2 漏洞趨勢分析
- 從 L2 漏洞追蹤層提取（含 NVD、EPSS、國際 CERT）
- 本週新增漏洞數量 vs 上週
- 按廠商分布
- 按嚴重程度分布
- EPSS Top 10 高利用可能性漏洞

#### 2.3 活躍利用與 PoC 動態
- 從 L3 漏洞利用情報層提取
- KEV 新增活躍利用漏洞清單
- 新公開 PoC/Exploit 彙整
- 與 L2 漏洞的交叉關聯

#### 2.4 攻擊手法歸納
- 從 L1 資安事件中提取攻擊手法
- 從 L4 威脅情報饋送層補充 IoC 趨勢（惡意 URL、惡意程式、C2 活動）
- 分類統計（勒索軟體、釣魚、DDoS、供應鏈攻擊等）
- 與前期比較

#### 2.5 新興威脅識別
- 首次出現的攻擊手法或目標
- 跨事件的關聯分析（結合 L1-L4 資料）
- **必須標註信心水準**

#### 2.6 資料限制與免責聲明
```
## 資料限制與免責聲明

本報告基於以下資料來源，存在已知限制：

1. **來源範圍**：基於國際 CERT/安全機構公開資料與 abuse.ch 威脅情報，但不涵蓋所有威脅情資
2. **時效性**：資料可能存在數小時至數天的延遲
3. **完整性**：未包含非公開威脅情報、暗網情資、付費情報服務等來源
4. **分析局限**：趨勢分析基於公開資料樣本，統計推論應謹慎解讀
5. **翻譯風險**：部分非英文來源經 AI 翻譯，可能存在語義偏差

本報告僅供參考，不構成完整的威脅評估。
重大安全決策請結合多方情資來源。
```

## 輸出位置

`docs/Narrator/threat_landscape/{YYYY}-W{WW}-threat-landscape.md`

## 自我審核 Checklist

在發布前，必須逐項確認：
- [ ] 是否包含「資料限制與免責聲明」？
- [ ] 所有事件是否標註來源與日期？
- [ ] 趨勢分析是否基於足夠樣本？（若樣本不足需標註）
- [ ] 新興威脅識別是否標註信心水準？
- [ ] 是否有未經證實的推論？（若有需明確標註為「推測」）
- [ ] 統計數據是否準確？（數量、百分比需核對）
- [ ] 格式是否符合目標受眾閱讀習慣？
- [ ] 是否有 `[REVIEW_NEEDED]` 標記需要處理？

若任一項未通過，在輸出開頭加上 `[REVIEW_NEEDED]` 標記。
