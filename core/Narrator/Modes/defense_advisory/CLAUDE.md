# 防禦建議模式 (Defense Advisory Mode)

## Mode 定義

| 項目 | 內容 |
|------|------|
| **Mode name** | 防禦建議模式 (Defense Advisory Mode) |
| **Purpose and audience** | 提供 IT/資安管理人員可執行的防禦行動建議 |
| **Source layers** | L1（資安新聞事實層）、L2（漏洞追蹤層）、L3（漏洞利用情報層） |
| **Automation ratio** | 30% 自動彙整 + 70% 人工審核 |
| **⚠️ Content risk** | 被誤解為保證安全、通用建議不適用特定環境、法律風險 |
| **🛂 Reviewer persona** | 自動化邊界審核員 + 法規與責任審核員 + 使用者誤導風險審核員 |

## 資料來源定義

本模式需要讀取以下資料：

### 來自 Qdrant
- collection: `cyber-security`，filter: `source_layer: security_news_facts`，最近 7 天的事實資料
- collection: `cyber-security`，filter: `source_layer: vulnerability_tracking`，最近 7 天的漏洞資料，優先 severity = Critical / High
- collection: `cyber-security`，filter: `source_layer: exploit_intelligence`，最近 7 天的漏洞利用情報（活躍利用優先）

### 來自 docs/
- `docs/Extractor/security_news_facts/{category}/*.md`（最近 7 天）
- `docs/Extractor/vulnerability_tracking/{category}/*.md`（最近 7 天）
- `docs/Extractor/exploit_intelligence/{category}/*.md`（最近 7 天）

### 來自本次執行
- M1 威脅態勢分析報告（若有，作為上下文參考）
- Extractor 各層的當次輸出（若有）

## 輸出框架

### 1. 報告標題與期間
```
# 防禦建議 — {YYYY} 第 {WW} 週
> 涵蓋期間：YYYY-MM-DD 至 YYYY-MM-DD
> 資料來源：國際 CERT/安全機構、NVD、EPSS、Exploit-DB、VulnCheck KEV
```

### 2. 報告結構

#### 2.1 優先修補清單
- 從 L2 漏洞追蹤層提取 Critical / High 漏洞（含 NVD、國際 CERT）
- 從 L3 漏洞利用情報層標註已有活躍利用或公開 PoC 的漏洞（**優先修補**）
- 按優先級排序（活躍利用 > EPSS 高分 > CVSS 高分）
- 每筆包含：
  - 漏洞描述（1-2 句）
  - 影響產品/版本
  - 修補方式（官方 patch / workaround）
  - 官方公告連結
  - 利用狀態（活躍利用 / PoC 公開 / 未知）
  - **重要：修補建議必須來自官方，不可自行編造**

#### 2.2 安全控制建議
- 基於本週威脅態勢，建議強化的安全控制
- 分類：
  - 網路層面
  - 端點層面
  - 身分認證層面
  - 資料保護層面
- **必須標註「通用建議」vs「針對本週威脅」**

#### 2.3 緩解策略
- 針對尚無修補的漏洞或新興威脅
- 臨時緩解措施
- **必須標註有效期限或重新評估時間**

#### 2.4 注意事項
- 建議的適用範圍與限制
- 可能的副作用
- 建議的測試步驟

#### 2.5 免責聲明
```
## 免責聲明

本防禦建議基於國際 CERT/安全機構公開資料彙整，請注意：

1. **非保證**：實施建議不保證完全防禦所有威脅
2. **環境差異**：建議為通用性質，可能不適用於所有環境
3. **請先測試**：在正式環境部署前，請先於測試環境驗證
4. **非法律建議**：本報告不構成法律或合規建議
5. **資料限制**：基於公開資料，不涵蓋非公開威脅情報
6. **翻譯風險**：部分非英文來源經 AI 翻譯，修補建議請以官方原文為準

重大安全決策請諮詢專業資安顧問，並結合組織實際環境評估。
```

## 輸出位置

`docs/Narrator/defense_advisory/{YYYY}-W{WW}-defense-advisory.md`

## 自我審核 Checklist

在發布前，必須逐項確認：
- [ ] 是否包含完整免責聲明？
- [ ] 修補建議是否全部來自官方來源？（不可自行編造修補步驟）
- [ ] 是否清楚區分「通用建議」與「針對本週威脅」？
- [ ] 緩解策略是否標註有效期限？
- [ ] 是否有可能被誤解為「保證安全」的措辭？
- [ ] 是否標註建議的適用範圍與限制？
- [ ] 所有引用的漏洞是否有正確的 TVN/CVE 編號？
- [ ] 格式是否適合 IT/資安管理人員快速閱讀？
- [ ] 是否有 `[REVIEW_NEEDED]` 標記需要處理？

若任一項未通過，在輸出開頭加上 `[REVIEW_NEEDED]` 標記。
