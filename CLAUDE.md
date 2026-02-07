# 資訊安全產業智慧分析系統 — 執行指令

> 本檔案為 Claude CLI 啟動時自動載入的執行入口。
> 系統維護（新增/修改/刪除 Layer 或 Mode）請在 `core/` 目錄下操作，會載入 `core/CLAUDE.md`。

---

## 執行流程

使用者說「執行完整流程」或「更新資料」時，依照以下步驟執行：

### 步驟一：動態發現所有 Layer

掃描 `core/Extractor/Layers/*/`，排除含有 `.disabled` 檔案的目錄。
每個有效 Layer 目錄應包含 `fetch.sh`、`update.sh`、`CLAUDE.md`。

### 步驟二：逐一執行 Layer

對每個 Layer 依序執行：

1. **fetch** — 執行 `core/Extractor/Layers/{layer_name}/fetch.sh` 下載原始資料
2. **萃取（平行背景處理）** — 讀取該 Layer 的 `CLAUDE.md` 和 `core/Extractor/CLAUDE.md`，再對 `docs/Extractor/{layer_name}/raw/` 目錄中的 JSONL 平行處理：
   1. 用 `wc -l < {jsonl_file}` 取得總行數
   2. 用 `sed -n '{start},{end}p' {jsonl_file}` 批次讀取（每批 5-10 行）
   3. **平行啟動多個背景 Task**：在單一訊息中呼叫多個 Task tool，每個 Task 設定 `run_in_background: true`
   4. **主執行緒監控進度**：使用 `TaskOutput` 或 `Read` 檢查各 Task 的 output_file，回報整體進度
   5. 萃取 Task 依各 Layer CLAUDE.md 的 WebFetch 補充規則，決定是否用 WebFetch 抓取原始公告頁面補充資料
   6. 每個 Task 產出 `.md` 檔到 `docs/Extractor/{layer_name}/` 對應的 category 子目錄
   > **⛔ 禁止**：不可使用 Read 工具直接讀取 `.jsonl` 檔案（檔案過大會超出 token 上限）。JSONL 檔案一律透過 Bash `sed` 批次讀取。
   > **⚡ 效能規則**：同時啟動 3-5 個背景 Task 平行處理，主執行緒保持可用以監控進度與處理新任務。
3. **update** — 將步驟 2 產出的 `.md` 檔案路徑作為參數，執行 `core/Extractor/Layers/{layer_name}/update.sh {md_files...}` 寫入 Qdrant 並檢查 REVIEW_NEEDED

### 步驟三：REVIEW_NEEDED 檢查（必要）

在產出報告前，**必須先檢查是否有 REVIEW_NEEDED 標記**：

1. 檢查所有 Layer 的 update.sh 輸出，列出標記 `[REVIEW_NEEDED]` 的檔案
2. **若有任何 REVIEW_NEEDED**：
   - ⛔ **暫停流程，不產出報告**
   - 向使用者回報需要審核的檔案清單
   - 與使用者互動，逐一解決問題（修正內容或移除標記）
   - 問題全部解決後，使用者確認後再繼續步驟四
3. 若無 REVIEW_NEEDED，直接進入步驟四

> **強制規則**：有 REVIEW_NEEDED 就不產報告。報告品質優先於產出速度。

#### REVIEW_NEEDED 標準處理流程

依問題類型採取不同處理方式：

| 類型 | 來源特徵 | 處理方式 |
|------|----------|----------|
| **A. 非英文 RSS 資料不完整** | cert-ro、sk-cert 等非英文來源；缺 pubDate、description 截斷 | **直接移除標記**：這是來源結構性限制，已在 notes 標註，confidence 設為「低」已反映不確定性 |
| **B. TWCERT TVN/CVSS 缺失** | rss-132、rss-139；缺 TVN 編號、CVSS、CVE | **WebFetch 補充**：抓取 TWCERT 網頁取得完整 TVN、CVSS、CVE，更新後移除標記 |
| **C. 歷史資料缺乏細節** | 2019 年以前的 GovCERT.HK 等老舊公告 | **直接移除標記**：歷史資料不影響當週報告，或設定 confidence 為「低」 |
| **D. 漏洞揭露缺乏技術細節** | 有 CVE 但缺 CVSS；來自加拿大 CERT 等僅提供摘要的來源 | **視情況處理**：若有 CVE 可查 NVD 補充；若為結構性限制則移除標記並在 notes 說明 |

**處理原則**：
- 結構性限制（來源本身不提供完整資料）→ 移除標記，在 confidence 和 notes 反映
- 可補充的資訊缺失（TWCERT、NVD 可查）→ WebFetch 補充後移除標記
- 補充後若分類需調整（如 CVSS ≥ 7.0）→ 移動檔案到正確的 category 目錄

### 步驟四：動態發現所有 Mode

掃描 `core/Narrator/Modes/*/`，排除含有 `.disabled` 檔案的目錄。
每個有效 Mode 目錄應包含 `CLAUDE.md`。

### 步驟五：逐一執行 Mode

對每個 Mode 依序執行：

1. 讀取該 Mode 的 `CLAUDE.md` 和 `core/Narrator/CLAUDE.md`
2. **兩者並用策略**：依據查詢目的選擇適當的資料來源
3. 依照輸出框架產出報告到 `docs/Narrator/{mode_name}/`

#### 資料來源策略（兩者並用）

產出報告時，**docs/ 檔案系統**與 **Qdrant 向量資料庫**需並用：

| 查詢目的 | 使用來源 | 範例 |
|----------|----------|------|
| **列舉所有項目** | `docs/` | 列出本週所有 Critical/High 漏洞 |
| **統計數量** | `docs/` | 計算各 Layer 本週新增筆數 |
| **分類瀏覽** | `docs/` | 查看 attack_incident 目錄下所有事件 |
| **語意搜尋** | `Qdrant` | 「找出與 Log4j 類似的遠端執行漏洞」 |
| **跨 Layer 關聯** | `Qdrant` | 「這個 CVE 是否有對應的攻擊事件？」 |
| **相似案例探索** | `Qdrant` | 「過去有哪些針對半導體產業的 APT 攻擊？」 |
| **趨勢比對** | `Qdrant` | 「最近的攻擊手法與過去相比有何變化？」 |

**Qdrant 查詢方式**：
```bash
# 使用 core/scripts/qdrant_query.py 進行語意搜尋
python3 core/scripts/qdrant_query.py --query "遠端程式碼執行" --limit 10
python3 core/scripts/qdrant_query.py --query "APT 半導體" --filter source_layer=security_news_facts
python3 core/scripts/qdrant_query.py --query "勒索軟體" --filter category=active_exploitation
```

**使用原則**：
- **結構性查詢**（已知要什麼）→ 直接讀 docs/
- **探索性查詢**（找相關內容）→ 用 Qdrant 語意搜尋
- **綜合分析**：先用 docs/ 取得本週資料清單，再用 Qdrant 查詢歷史關聯

> **⚠️ 強制規則**：產出報告時，**必須**執行至少 3 次 Qdrant 語意查詢進行跨 Layer 關聯分析。若未使用 Qdrant，報告視為不完整。

---

## 模型與子代理指派規則

執行任務時，必須依照以下規則分派子任務（使用 Task tool 的 `model` 與 `subagent_type` 參數）：

| 步驟 | 任務類型 | 指定模型 | 子代理類型 | 原因 |
|------|----------|----------|------------|------|
| 步驟一 | 動態發現所有 Layer | `sonnet` | `Bash` | 純目錄掃描，無需推理 |
| 步驟二 | fetch.sh 執行 | `sonnet` | `Bash` | 純腳本執行 |
| 步驟二 | Layer 萃取（RSS → Markdown） | `sonnet` | `general-purpose` | 需用 Write 工具寫 .md 檔；**使用 `run_in_background: true` 平行執行** |
| 步驟二 | update.sh 執行 | `sonnet` | `Bash` | 純腳本執行 |
| 步驟三 | REVIEW_NEEDED 檢查 | — | — | 與使用者互動，無需子代理 |
| 步驟四 | 動態發現所有 Mode | `sonnet` | `Bash` | 純目錄掃描，無需推理 |
| 步驟五 | Mode 報告產出 | `opus` | `general-purpose` | 需要跨來源綜合分析、趨勢判斷、信心水準評估 |

> **強制規則**：只有步驟五（Mode 報告產出）使用 `opus`，其餘所有步驟一律使用 `sonnet`。
> **子代理規則**：需要寫入檔案的 Task 必須使用 `general-purpose`（透過 Write 工具寫檔），純腳本執行使用 `Bash`。

### 背景執行模式

萃取步驟採用**平行背景執行**，最大化效能：

```
主執行緒                     背景 Task (Sonnet)
    │
    ├─► 啟動 Task 1 ──────────► 處理第 1-5 行 → 產出 .md
    ├─► 啟動 Task 2 ──────────► 處理第 6-10 行 → 產出 .md
    ├─► 啟動 Task 3 ──────────► 處理第 11-15 行 → 產出 .md
    │
    ├─► 監控進度 (TaskOutput)
    ├─► 回報使用者
    ├─► 處理新任務
    │
    └─► 等待全部完成 → 進入 update 步驟
```

**關鍵參數**：
- `run_in_background: true` — Task 在背景執行
- `model: "sonnet"` — 使用 Sonnet 模型
- 單一訊息內呼叫多個 Task — 實現平行啟動

---

## 指定執行

使用者也可以指定執行特定 Layer 或 Mode：

- 「執行 security_news_facts」→ 只跑該 Layer 的 fetch → 萃取 → update
- 「執行 threat_landscape」→ 只跑該 Mode 的報告產出
- 「只跑 fetch」→ 只執行所有 Layer 的 fetch.sh，不萃取
- 「只跑萃取」→ 假設 `docs/Extractor/{layer_name}/raw/` 已有 JSONL 資料，只做萃取 + update

> 指定執行時，模型指派規則仍然生效。Layer 相關任務使用 `sonnet`，Mode 相關任務使用 `opus`。
> **注意**：即使是指定執行 Mode，若來源 Layer 有 REVIEW_NEEDED 標記，仍須先解決後才產出報告。

---

## 環境設定

執行前需確認 `.env` 包含以下設定：

```
QDRANT_URL=...
QDRANT_API_KEY=...
QDRANT_COLLECTION=cyber-security
EMBEDDING_MODEL=text-embedding-3-small
EMBEDDING_DIMENSION=1536
OPENAI_API_KEY=sk-...
```

---

## 輸出規則

- Layer 萃取的 `.md` 檔必須遵循該 Layer CLAUDE.md 定義的格式
- Mode 報告的 `.md` 檔必須遵循該 Mode CLAUDE.md 定義的框架
- 所有輸出必須通過各自的「自我審核 Checklist」
- 未通過審核的輸出必須在開頭加上 `[REVIEW_NEEDED]`
- `index.json` 由 GitHub Actions 自動產生，不在此流程中處理

---

## 互動規則

完成執行後，簡要回報：

1. 各 Layer 擷取與萃取結果（筆數、有無 REVIEW_NEEDED）
2. 各 Mode 報告產出狀態
3. 是否有錯誤或需要人工介入的項目
