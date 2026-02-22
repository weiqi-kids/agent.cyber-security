# 資安新聞事實層 (Security News Facts Layer)

## Layer 定義

| 項目 | 內容 |
|------|------|
| **Layer name** | 資安新聞事實層 (Security News Facts Layer) |
| **Engineering function** | 從國際 CERT/安全機構 RSS 擷取並萃取結構化事實 |
| **Collectable data** | 多來源 RSS/Atom：新聞標題、摘要、連結、發布日期（22 個來源） |
| **Automation level** | 65% — RSS 擷取全自動，多來源降低單一來源風險，事實萃取需 Claude + 人工校驗 |
| **Output value** | 事件時間軸、攻擊手法分類、受影響系統標記、跨國事件關聯 |
| **⚠️ Risk type** | AI 摘要可能遺漏細節、非英文來源翻譯風險、時效性風險 |
| **🛂 Reviewer persona** | 資料可信度審核員 + 幻覺風險審核員 |

## 來源對照表

| feed_id | source 名稱 | 語言 | 備註 |
|---------|-------------|------|------|
| `rss-104` | TWCERT/CC | zh-TW | 台灣資安新聞 |
| `cisa` | CISA (US) | EN | 美國 CISA 公告 |
| `ca-news` | Canadian Centre for Cyber Security | EN | 加拿大（Atom 格式） |
| `cert-at` | CERT.at (Austria) | EN | 奧地利 CERT Blog |
| `cert-lv` | CERT.LV (Latvia) | EN | 拉脫維亞 CERT |
| `jpcert-blog` | JPCERT/CC Blog | EN | 日本 JPCERT Blog（Atom 格式） |
| `ncsc-fi` | NCSC-FI (Finland) | EN | 芬蘭 NCSC |
| `ncsc-fi-news` | NCSC-FI Daily News | EN | 芬蘭 NCSC 每日新聞 |
| `ncsc-fi-secnow` | NCSC-FI Security Now! | EN | 芬蘭 NCSC Security Now |
| `sans-isc` | SANS ISC | EN | SANS 網際網路風暴中心 |
| `uk-ncsc` | UK NCSC | EN | 英國國家網路安全中心 |
| `cert-br` | CERT.br (Brazil) | pt-BR | 巴西 CERT |
| `cert-ee` | CERT-EE (Estonia) | et | 愛沙尼亞 CERT |
| `cert-fr` | CERT-FR (France) | fr | 法國 CERT |
| `cert-hr` | CERT.hr (Croatia) | hr | 克羅埃西亞 CERT |
| `cert-se` | CERT-SE (Sweden) | sv | 瑞典 CERT |
| `cert-ua` | CERT-UA (Ukraine) | uk | 烏克蘭 CERT |
| `cert-ro` | CERT.RO (Romania) | ro | 羅馬尼亞 CERT |
| `cncs-pt` | CNCS (Portugal) | pt | 葡萄牙 CNCS |
| `nsm-ncsc` | NSM NCSC (Norway) | no | 挪威 NSM NCSC |
| `nukib` | NUKIB (Czech Republic) | cs | 捷克 NUKIB |
| `sk-cert` | SK-CERT (Slovakia) | sk | 斯洛伐克 CERT |

## 執行指令

1. 執行 `./fetch.sh` 擷取原始 RSS 資料到 `docs/Extractor/security_news_facts/raw/`
2. 逐一處理 `docs/Extractor/security_news_facts/raw/*.jsonl` 中的所有 JSONL 檔案，每行一筆 JSON，每次只接收一筆 JSON 進行萃取
3. 萃取結果交由 `./update.sh` 處理

### 萃取邏輯

接收單一 JSON 項目（格式為 `{"title":"...","link":"...","description":"...","pubDate":"..."}`）以及 `feed_id` 資訊。

#### 網頁內容補充規則

RSS 的 `description` 欄位可能資訊不足（僅含摘要或 HTML 片段）。萃取時應依以下流程判斷是否需要補充：

1. **先嘗試從 `description` 萃取**：若 description 包含足夠的事實細節（攻擊手法、受影響系統、時間線等），直接萃取
2. **若 description 不足，使用 MCP fetch_url 補充**：用 JSON 中的 `link` 欄位，透過 MCP 提供的 `mcp__fetch_url__fetch_url` 工具抓取原始公告頁面，從完整內容中萃取
3. **fetch 失敗時**：僅基於 RSS 資料萃取，在 `notes` 欄位標註「原始頁面無法存取，僅基於 RSS 摘要萃取」

> **判斷標準**：若 description 內容不足 100 字，或缺少攻擊手法/受影響系統等關鍵資訊，應使用 MCP fetch_url 補充。
> **工具優先級**：優先使用 MCP 工具 `mcp__fetch_url__fetch_url`，可避免授權提示。

#### 非英文來源處理規則

來自非英文 RSS 來源的項目（見來源對照表語言欄位）：
1. **萃取時用 AI 翻譯/摘要為英文**：`title`、`summary`、事實內容以英文輸出
2. **`notes` 欄位標註原始語言**：如「Original language: French (CERT-FR)」
3. **信心水準**：非英文來源且未經網頁內容驗證時，confidence 設為「中」

萃取以下結構化資訊：

```json
{
  "id": "news-YYYYMMDD-NNN",
  "title": "新聞標題",
  "date": "YYYY-MM-DD",
  "source": "依 feed_id 對應的 source 名稱",
  "feed_id": "來源 feed_id",
  "source_url": "原始連結",
  "category": "attack_incident | vulnerability_disclosure | policy_regulation | industry_trend | other",
  "summary": "50字以內摘要",
  "attack_method": "攻擊手法分類（若適用）",
  "affected_systems": ["受影響系統/產品"],
  "severity": "高 | 中 | 低 | 未評估",
  "confidence": "高 | 中 | 低",
  "notes": "額外備註（若有不確定之處必須在此說明）"
}
```

### 分類規則（enum，僅限以下 5 個值）

| category 值 | 中文 | 判定條件 |
|-------------|------|----------|
| `attack_incident` | 攻擊事件 | 描述實際發生的資安攻擊或入侵事件 |
| `vulnerability_disclosure` | 漏洞揭露 | 揭露新發現的安全漏洞（與 L2 漏洞追蹤層互補） |
| `policy_regulation` | 政策法規 | 與資安相關的法規、政策、標準更新 |
| `industry_trend` | 產業動態 | 資安產業的商業、技術趨勢 |
| `other` | 其他 | 無法歸類到以上類別 |

> **嚴格限制：category 只能使用上述 5 個英文值，不可自行新增。**

### 輸出格式

每筆事實輸出為一個 Markdown 檔案，存放於：

```
docs/Extractor/security_news_facts/{category}/{YYYY}-{描述}.md
```

檔案格式：

```markdown
# {標題}

| 項目 | 內容 |
|------|------|
| **日期** | YYYY-MM-DD |
| **來源** | {source 名稱} |
| **分類** | {category} |
| **嚴重程度** | {severity} |
| **信心水準** | {confidence} |

## 摘要

{50字以內摘要}

## 事實內容

{結構化事實描述}

## 受影響系統

- {系統/產品 1}
- {系統/產品 2}

## 來源連結

- [{原始標題}]({source_url})

---
> 萃取時間：YYYY-MM-DD HH:MM UTC
> 資料來源：{source 名稱} {feed_id}
```

## 自我審核 Checklist

在輸出前，必須逐項確認：
- [ ] 資料來源是否為一手？（官方 CERT/安全機構 RSS）
- [ ] 時間戳記是否在預期範圍內？（不超過 7 天）
- [ ] 摘要是否忠實反映原始內容？（無添加、無遺漏關鍵資訊）
- [ ] 分類是否準確？（符合分類規則表）
- [ ] 嚴重程度判定是否有依據？（非主觀臆測）
- [ ] 不確定的部分是否有標註？（使用 notes 欄位說明）
- [ ] source 欄位是否正確對應來源對照表？

### `[REVIEW_NEEDED]` 觸發規則

以下情況**必須**標記 `[REVIEW_NEEDED]`：
1. **分類無法判定**：內容無法歸類到 5 個 category 中的任何一個
2. **摘要與原文矛盾**：萃取結果與原始 description 存在事實衝突
3. **關鍵欄位缺失**：title、date、category 任一欄位無法填入
4. **網頁抓取失敗且 description 不足**：原始頁面無法存取，且 RSS description 不足以完成萃取

以下情況**不觸發** `[REVIEW_NEEDED]`：
- ❌ 「信心水準為低」 — 結構性限制，不構成審核理由
- ❌ 「無交叉驗證」 — 應設定 `confidence: "低"` 但不標記 REVIEW_NEEDED
- ❌ 「嚴重程度為未評估」 — 部分新聞確實無法評估嚴重程度，屬正常情況
- ❌ 「非英文來源」 — 翻譯品質問題反映在 confidence 欄位，不觸發 REVIEW_NEEDED

> **原則**：`[REVIEW_NEEDED]` 代表「萃取結果可能有誤，需要人工確認」，而非「資料來源有限」。資料來源的結構性限制應在 confidence 欄位反映，不應觸發 REVIEW_NEEDED。
