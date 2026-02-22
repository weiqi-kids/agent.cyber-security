# 資訊安全產業智慧分析系統 — 執行指令

> 本檔案為 Claude CLI 啟動時自動載入的執行入口。
> 系統維護（新增/修改/刪除 Layer 或 Mode）請在 `core/` 目錄下操作，會載入 `core/CLAUDE.md`。

---

## 執行流程

使用者說「執行完整流程」或「更新資料」時，依照以下步驟執行。

> **⚠️ 強制規則**：本流程採用「Executor + Reviewer 雙角色模式」，每個主要步驟完成後必須啟動獨立的 Reviewer 子代理進行審核，審核通過才能進入下一步驟。詳見「Reviewer 審核機制」章節。

---

### 步驟一：動態發現所有 Layer

掃描 `core/Extractor/Layers/*/`，排除含有 `.disabled` 檔案的目錄。
每個有效 Layer 目錄應包含 `fetch.sh`、`update.sh`、`CLAUDE.md`。

#### 步驟一必須執行的動作

```bash
# 1. 列出所有 Layer 目錄
ls -la core/Extractor/Layers/*/

# 2. 檢查每個 Layer 的完整性
for d in core/Extractor/Layers/*/; do
  layer=$(basename "$d")
  [ -f "$d/.disabled" ] && echo "DISABLED: $layer" && continue
  [ -f "$d/fetch.sh" ] || echo "MISSING fetch.sh: $layer"
  [ -f "$d/update.sh" ] || echo "MISSING update.sh: $layer"
  [ -f "$d/CLAUDE.md" ] || echo "MISSING CLAUDE.md: $layer"
  echo "VALID: $layer"
done
```

#### 步驟一必須輸出（CHECKPOINT-1）

```
[CHECKPOINT-1] Layer 發現完成
- 有效 Layer: {列出所有有效 Layer}
- 排除 Layer: {列出 .disabled 的 Layer，若無則為「無」}
- 缺失檔案: {列出缺失的檔案，若無則為「無」}
- 狀態: PASS / FAIL
```

> **⛔ 審核點**：步驟一完成後，必須啟動 **Reviewer 子代理**審核 CHECKPOINT-1。若 Reviewer 回報 FAIL，必須修正後重新執行步驟一。

---

### 步驟二：逐一執行 Layer

對每個 Layer 依序執行：

1. **fetch** — 執行 `core/Extractor/Layers/{layer_name}/fetch.sh` 下載原始資料
2. **萃取（混合策略：受控平行 + 失敗重試）** — 讀取該 Layer 的 `CLAUDE.md` 和 `core/Extractor/CLAUDE.md`，再對 `docs/Extractor/{layer_name}/raw/` 目錄中的 JSONL 處理：
   1. 用 `wc -l < {jsonl_file}` 取得總行數，計算批次數量
   2. 用 `sed -n '{start},{end}p' {jsonl_file}` 批次讀取（每批 10-20 行）
   3. **受控平行執行**（詳見「背景執行模式」）：
      - 維持最多 5 個背景 Task 同時執行
      - Task 完成後立即啟動下一個填補空位
      - 每 30 秒輪詢檢查狀態並回報進度
   4. **失敗重試**：所有背景 Task 完成後，主執行緒同步處理失敗的批次
   5. 萃取 Task 依各 Layer CLAUDE.md 的網頁內容補充規則，決定是否用 MCP fetch_url 抓取原始公告頁面補充資料
   6. 每個 Task 產出 `.md` 檔到 `docs/Extractor/{layer_name}/` 對應的 category 子目錄
   > **⛔ 禁止**：不可使用 Read 工具直接讀取 `.jsonl` 檔案（檔案過大會超出 token 上限）。JSONL 檔案一律透過 Bash `sed` 批次讀取。
   > **⚡ 並行規則**：最多 5 個背景 Task，失敗項目由主執行緒同步重試。
3. **update** — 將步驟 2 產出的 `.md` 檔案路徑作為參數，執行 `core/Extractor/Layers/{layer_name}/update.sh {md_files...}` 寫入 Qdrant 並檢查 REVIEW_NEEDED

#### 步驟二必須輸出（CHECKPOINT-2A/2B/2C）

對每個 Layer 完成後，必須輸出三個 CHECKPOINT：

**CHECKPOINT-2A（Fetch）**：
```
[CHECKPOINT-2A] {layer_name} Fetch 完成
- 執行指令: cd ... && bash fetch.sh
- Exit code: {0 或錯誤碼}
- 產出 JSONL: {列出檔案名稱}
- 各檔案行數: {jsonl_file}: {N} 行
- 狀態: PASS / FAIL
```

**CHECKPOINT-2B（萃取）**：
```
[CHECKPOINT-2B] {layer_name} 萃取完成
- 讀取 CLAUDE.md: ✓
- 總行數: {N}
- 批次數量: {N}（每批約 15 行）
- 並行 Task 數: {≤5}
- 狀態追蹤:
  - pending: {N}
  - running: {N}
  - completed: {N}
  - failed: {N}
- 失敗重試: {N} 筆
- 最終失敗: {N} 筆
- 產出檔案統計:
  - {category_1}: {N} 個
  - {category_2}: {N} 個
  - ...
- 狀態: PASS / PARTIAL / FAIL
```

**CHECKPOINT-2C（Update）**：
```
[CHECKPOINT-2C] {layer_name} Update 完成
- 執行指令: cd ... && bash update.sh
- Exit code: {0 或錯誤碼}
- Qdrant 寫入: {N} 筆
- REVIEW_NEEDED 檔案: {列出，若無則為 0}
- 狀態: PASS / FAIL
```

> **⛔ 審核點**：每個 Layer 的三個 CHECKPOINT 完成後，必須啟動 **Reviewer 子代理**審核。特別注意：
> - 若 Executor 未執行 `update.sh` → **FAIL**
> - 若 Executor 使用 `grep` 替代 `update.sh` 檢查 REVIEW_NEEDED → **FAIL**
> - 若批次大小不在 10-20 行範圍 → **FAIL**
> - 若並行 Task > 5 → **FAIL**

---

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
| **B. TWCERT TVN/CVSS 缺失** | rss-132、rss-139；缺 TVN 編號、CVSS、CVE | **MCP fetch_url 補充**：抓取 TWCERT 網頁取得完整 TVN、CVSS、CVE，更新後移除標記 |
| **C. 歷史資料缺乏細節** | 2019 年以前的 GovCERT.HK 等老舊公告 | **直接移除標記**：歷史資料不影響當週報告，或設定 confidence 為「低」 |
| **D. 漏洞揭露缺乏技術細節** | 有 CVE 但缺 CVSS；來自加拿大 CERT 等僅提供摘要的來源 | **視情況處理**：若有 CVE 可查 NVD 補充；若為結構性限制則移除標記並在 notes 說明 |

**處理原則**：
- 結構性限制（來源本身不提供完整資料）→ 移除標記，在 confidence 和 notes 反映
- 可補充的資訊缺失（TWCERT、NVD 可查）→ MCP fetch_url 補充後移除標記
- 補充後若分類需調整（如 CVSS ≥ 7.0）→ 移動檔案到正確的 category 目錄

#### 步驟三必須輸出（CHECKPOINT-3）

```
[CHECKPOINT-3] REVIEW_NEEDED 檢查完成
- 資料來源: update.sh 輸出（非 grep 掃描）
- 初始 REVIEW_NEEDED: {N} 個
- 已處理: {N} 個
- 處理明細:
  - {檔案路徑}: {處理方式}（MCP fetch_url 補充 / 移除標記 / 其他）
  - ...
- 剩餘: {N} 個
- 使用者確認: ✓ / ✗
- 狀態: PASS / FAIL
```

> **⛔ 審核點**：步驟三完成後，必須啟動 **Reviewer 子代理**審核 CHECKPOINT-3。特別注意：
> - REVIEW_NEEDED 清單必須來自 update.sh 輸出，不可用 grep 替代
> - 若有 REVIEW_NEEDED 但未暫停詢問使用者 → **FAIL**
> - 若剩餘 > 0 但繼續執行 → **FAIL**
> - 若未獲使用者確認就繼續 → **FAIL**

---

### 步驟四：動態發現所有 Mode

掃描 `core/Narrator/Modes/*/`，排除含有 `.disabled` 檔案的目錄。
每個有效 Mode 目錄應包含 `CLAUDE.md`。

#### 步驟四必須執行的動作

```bash
# 1. 列出所有 Mode 目錄
ls -la core/Narrator/Modes/*/

# 2. 檢查每個 Mode 的完整性
for d in core/Narrator/Modes/*/; do
  mode=$(basename "$d")
  [ -f "$d/.disabled" ] && echo "DISABLED: $mode" && continue
  [ -f "$d/CLAUDE.md" ] || echo "MISSING CLAUDE.md: $mode"
  echo "VALID: $mode"
done
```

#### 步驟四必須輸出（CHECKPOINT-4）

```
[CHECKPOINT-4] Mode 發現完成
- 有效 Mode: {列出所有有效 Mode}
- 排除 Mode: {列出 .disabled 的 Mode，若無則為「無」}
- 缺失檔案: {列出缺失的檔案，若無則為「無」}
- 狀態: PASS / FAIL
```

> **⛔ 審核點**：步驟四完成後，必須啟動 **Reviewer 子代理**審核 CHECKPOINT-4。

---

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

#### 步驟五必須輸出（CHECKPOINT-5）

對每個 Mode 完成後，必須輸出：

```
[CHECKPOINT-5] {mode_name} 報告產出完成
- 讀取 CLAUDE.md: ✓
- 使用模型: opus
- Qdrant 查詢次數: {N}（必須 ≥ 3）
- Qdrant 查詢內容:
  1. "{查詢 1}" → {結果筆數} 筆
  2. "{查詢 2}" → {結果筆數} 筆
  3. "{查詢 3}" → {結果筆數} 筆
- 報告檔案: {完整路徑}
- 檔案大小: {N} bytes
- 修改時間: {YYYY-MM-DD HH:MM:SS}
- 自我審核 Checklist: PASS / FAIL
- 狀態: PASS / FAIL
```

> **⛔ 審核點**：每個 Mode 完成後，必須啟動 **Reviewer 子代理**審核 CHECKPOINT-5。特別注意：
> - 若 Qdrant 查詢 < 3 次 → **FAIL**
> - 若未使用 opus 模型 → **FAIL**
> - 若報告檔案修改時間不是今天 → **FAIL**（表示子代理可能未實際寫入）
> - 若檔案大小 < 10KB → **FAIL**（報告內容可能不完整）

---

### 步驟六：SEO 優化（可選）

Narrator 報告產出後，可選擇性執行 SEO 優化流程。

#### 觸發條件

- 使用者說「執行 SEO 優化」或「SEO {報告路徑}」
- 使用者說「執行完整流程含 SEO」
- **不自動執行**：完整流程預設不含 SEO，需明確要求

#### 執行流程

1. **SEO Writer**：讀取 `seo/CLAUDE.md` 規則庫，分析指定報告，產出 SEO 優化建議
   - 產出 JSON-LD Schema（必填 7 種 + 條件式）
   - 產出 SGE/AEO 標記建議
   - 產出 Meta 標籤建議

2. **SEO Reviewer**：讀取 `seo/review/CLAUDE.md`，檢查 Writer 輸出
   - 執行 7 大檢查清單
   - 回報 pass/fail
   - 若 fail，Writer 修正後重新檢查

3. **迭代直到 pass**：Reviewer 說 "pass" 後，SEO 優化完成

#### SEO 輸出位置

```
docs/Narrator/{mode_name}/
├── {報告}.md                    # 原始報告
└── {報告}.seo.json              # SEO 優化結果（JSON-LD + Meta + 建議）
```

#### SEO 優化結果格式

```json
{
  "generated_at": "2026-02-15T10:00:00+08:00",
  "source_file": "docs/Narrator/threat_landscape/2026-W07-threat-landscape.md",
  "json_ld": { "@context": "https://schema.org", "@graph": [...] },
  "meta_tags": { "title": "...", "description": "...", "og": {...}, "twitter": {...} },
  "sge_recommendations": [...],
  "reviewer_status": "pass"
}
```

### 步驟七：完成品質關卡檢查（必要）

**在回報「完成」前，必須通過品質關卡檢查。**

執行「完成品質關卡」段落中定義的所有檢查項目：
1. 連結檢查
2. SEO + AEO 標籤檢查（僅當執行 SEO 流程時）
3. 內容更新確認
4. Git 狀態檢查
5. SOP 完成度檢查

> **⛔ 強制規則**：品質關卡未通過，不得回報完成。必須修正所有問題後重新檢查。

詳細檢查項目與報告格式請見下方「完成品質關卡」段落。

---

## 模型與子代理指派規則

執行任務時，必須依照以下規則分派子任務（使用 Task tool 的 `model` 與 `subagent_type` 參數）：

### Executor 子代理

| 步驟 | 任務類型 | 指定模型 | 子代理類型 | 背景執行 | 原因 |
|------|----------|----------|------------|----------|------|
| 步驟一 | 動態發現所有 Layer | `sonnet` | `Bash` | 否 | 純目錄掃描，無需推理 |
| 步驟二 | fetch.sh 執行 | `sonnet` | `Bash` | 否 | 純腳本執行 |
| 步驟二 | Layer 萃取（首次） | `sonnet` | `general-purpose` | **是** | 最多 5 個並行，受控執行 |
| 步驟二 | Layer 萃取（失敗重試） | `sonnet` | `general-purpose` | **否** | 主執行緒同步處理，確保穩定 |
| 步驟二 | update.sh 執行 | `sonnet` | `Bash` | 否 | 純腳本執行 |
| 步驟三 | REVIEW_NEEDED 檢查 | — | — | — | 與使用者互動，無需子代理 |
| 步驟四 | 動態發現所有 Mode | `sonnet` | `Bash` | 否 | 純目錄掃描，無需推理 |
| 步驟五 | Mode 報告產出 | `opus` | `general-purpose` | 否 | 需要跨來源綜合分析、趨勢判斷 |
| 步驟六 | SEO Writer | `sonnet` | `general-purpose` | 否 | 依規則庫產出，無需高階推理 |
| 步驟六 | SEO Reviewer | `sonnet` | `general-purpose` | 否 | 依 checklist 檢查，無需高階推理 |

### Reviewer 子代理（獨立審核）

| 審核點 | 指定模型 | 子代理類型 | 背景執行 | 說明 |
|--------|----------|------------|----------|------|
| CHECKPOINT-1 Reviewer | `sonnet` | `general-purpose` | 否 | 審核 Layer 發現結果 |
| CHECKPOINT-2 Reviewer | `sonnet` | `general-purpose` | 否 | 審核 Fetch + 萃取 + Update |
| CHECKPOINT-3 Reviewer | `sonnet` | `general-purpose` | 否 | 審核 REVIEW_NEEDED 處理 |
| CHECKPOINT-4 Reviewer | `sonnet` | `general-purpose` | 否 | 審核 Mode 發現結果 |
| CHECKPOINT-5 Reviewer | `sonnet` | `general-purpose` | 否 | 審核 Mode 報告產出 |
| CHECKPOINT-7 Reviewer | `sonnet` | `general-purpose` | 否 | 最終品質關卡審核 |

> **強制規則**：
> - 只有步驟五（Mode 報告產出）使用 `opus`，其餘所有步驟一律使用 `sonnet`
> - **每個 CHECKPOINT 完成後，必須啟動獨立的 Reviewer 子代理進行審核**
> - Reviewer 與 Executor 是不同的子代理，Reviewer 負責「挑錯」
> - Reviewer 回報 FAIL 時，必須列出具體問題，Executor 必須修正後重新執行
> - **禁止跳過 Reviewer 審核**：即使 Executor 自認完成，也必須經過 Reviewer 確認

> **子代理規則**：需要寫入檔案的 Task 必須使用 `general-purpose`（透過 Write 工具寫檔），純腳本執行使用 `Bash`。
> **重試規則**：背景 Task 失敗後，主執行緒同步重試（不使用 `run_in_background`），確保穩定性。

### 背景執行模式（混合策略）

萃取步驟採用**受控平行背景執行 + 失敗重試**，兼顧效能與穩定性：

```
主執行緒                     背景 Task Pool (最多 5 個)
    │
    ├─► 啟動 Task 1-5 ─────────► [Pool] 處理批次 1-5
    │
    ├─► 輪詢檢查（每 30 秒）
    │   ├─► 若有完成 → 記錄結果，啟動下一個 Task 填補空位
    │   ├─► 若有失敗 → 加入失敗清單，啟動下一個 Task
    │   └─► 回報進度給使用者
    │
    ├─► 重複直到所有批次處理完畢
    │
    ├─► 檢查失敗清單
    │   └─► 若有失敗項目 → 主執行緒同步重試（不用背景）
    │
    └─► 全部完成 → 進入 update 步驟
```

#### 並行控制規則

| 規則 | 說明 |
|------|------|
| **最大並行數** | 同時最多 5 個背景 Task |
| **批次大小** | 每個 Task 處理 10-20 行 JSONL |
| **輪詢間隔** | 每 30 秒檢查一次 Task 狀態 |
| **填補機制** | Task 完成後立即啟動下一個，維持 Pool 滿載 |

#### 失敗重試規則

| 情況 | 處理方式 |
|------|----------|
| **背景 Task 失敗** | 記錄失敗的批次範圍，繼續處理其他批次 |
| **所有背景 Task 完成後** | 主執行緒同步處理失敗清單（無 `run_in_background`） |
| **重試仍失敗** | 標記為 `[REVIEW_NEEDED]`，由人工處理 |

#### 狀態追蹤

主執行緒需維護以下狀態：

```
pending_batches: [(start, end), ...]     # 待處理批次
running_tasks: {task_id: (start, end)}   # 執行中的 Task
completed_batches: [(start, end), ...]   # 已完成批次
failed_batches: [(start, end), ...]      # 失敗批次（待重試）
```

**關鍵參數**：
- `run_in_background: true` — 背景 Task（首次嘗試）
- `run_in_background: false` 或省略 — 同步 Task（失敗重試）
- `model: "sonnet"` — 使用 Sonnet 模型

---

## 指定執行

使用者也可以指定執行特定 Layer 或 Mode：

- 「執行 security_news_facts」→ 只跑該 Layer 的 fetch → 萃取 → update
- 「執行 threat_landscape」→ 只跑該 Mode 的報告產出
- 「只跑 fetch」→ 只執行所有 Layer 的 fetch.sh，不萃取
- 「只跑萃取」→ 假設 `docs/Extractor/{layer_name}/raw/` 已有 JSONL 資料，只做萃取 + update

### SEO 指定執行

- 「執行 SEO 優化」→ 對所有最新 Mode 報告執行 SEO Writer → Reviewer 流程
- 「SEO {報告路徑}」→ 對指定報告執行 SEO 優化（如 `SEO docs/Narrator/threat_landscape/2026-W07-threat-landscape.md`）
- 「執行完整流程含 SEO」→ 步驟一至六全部執行

> 指定執行時，模型指派規則仍然生效。Layer 相關任務使用 `sonnet`，Mode 相關任務使用 `opus`，SEO 任務使用 `sonnet`。
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

## 狀態更新與首頁觸發

執行完成後，**必須**完成以下步驟：

### 1. 更新 `_data/status.yml`

```yaml
# 更新以下欄位
last_execution: "YYYY-MM-DDTHH:MM:SS+08:00"
last_execution_display: "YYYY-MM-DD HH:MM (UTC+8)"

layers:
  exploit_intelligence:
    last_fetch: "YYYY-MM-DDTHH:MM:SSZ"
    items_count: N
  # ... 其他 Layer
```

更新方式：使用 Edit 工具修改 `_data/status.yml`，填入實際執行時間與各 Layer 的筆數。

### 2. 觸發首頁更新（必要）

首頁由 Jekyll 動態生成，需要 push 到 GitHub 才會重建。**更新 `_data/status.yml` 後必須執行：**

```bash
git add _data/status.yml docs/Narrator/
git commit -m "chore: 更新執行狀態與報告 $(date +%Y-%m-%d)"
git push origin main
```

> **⚠️ 重要**：若不執行 git push，首頁不會更新！GitHub Pages 由 `.github/workflows/pages.yml` 自動觸發部署。

---

## Git 提交規則

### 必須提交的變更
- `_data/status.yml` — 執行狀態更新
- `CLAUDE.md`、`lib/`、`core/` — 系統邏輯變更
- `docs/Narrator/` — Mode 報告（每週產出）

### 不需立即提交的變更
- `docs/Extractor/` 萃取結果 — 增量更新，下次完整執行時再一併提交
  - 理由：每次執行會重新產生，提交數百個檔案會讓 git 歷史雜亂
  - 例外：若使用者明確要求，或完成完整流程後統一提交

---

## Reviewer 審核機制

本流程採用「Executor + Reviewer 雙角色模式」，確保每個步驟都被實際執行，不被跳過或簡化。

### 審核流程

```
Executor 完成步驟 N
         │
         ▼
    輸出 CHECKPOINT-N
         │
         ▼
主執行緒啟動 Reviewer 子代理
         │
         ├─► Reviewer 讀取 CHECKPOINT-N 內容
         ├─► Reviewer 執行對應的檢查清單
         ├─► Reviewer 回報 PASS / FAIL
         │
         ▼
    ┌─────────────────┐
    │ PASS → 進入下一步驟 │
    │ FAIL → 重做步驟 N   │
    └─────────────────┘
```

### Reviewer 子代理啟動方式

每個 CHECKPOINT 完成後，主執行緒必須啟動 Reviewer 子代理：

```
Task tool 參數：
- description: "Reviewer: 審核 CHECKPOINT-{N}"
- model: "sonnet"
- subagent_type: "general-purpose"
- prompt: （見下方各 CHECKPOINT 的 Reviewer Prompt）
```

### CHECKPOINT-1 Reviewer（Layer 發現）

**Reviewer Prompt**：
```
你是 Reviewer，負責審核 CHECKPOINT-1（Layer 發現）。

請檢查以下項目，逐一回報結果：

| # | 檢查項目 | 驗證方式 | 結果 |
|---|----------|----------|------|
| 1 | 是否執行 ls core/Extractor/Layers/*/ | 檢查上方對話是否有此 Bash 呼叫 | ✅/❌ |
| 2 | 是否檢查 .disabled 檔案 | 檢查是否有 for 迴圈或 [ -f .disabled ] | ✅/❌ |
| 3 | 是否驗證 fetch.sh 存在 | 檢查輸出是否列出 | ✅/❌ |
| 4 | 是否驗證 update.sh 存在 | 檢查輸出是否列出 | ✅/❌ |
| 5 | 是否驗證 CLAUDE.md 存在 | 檢查輸出是否列出 | ✅/❌ |
| 6 | 是否輸出 CHECKPOINT-1 格式 | 檢查是否有 [CHECKPOINT-1] 標記 | ✅/❌ |

**判定規則**：
- 全部 ✅ → 回報 "CHECKPOINT-1 Reviewer: PASS"
- 任一 ❌ → 回報 "CHECKPOINT-1 Reviewer: FAIL"，並列出失敗項目

請仔細檢查上方對話中的工具呼叫記錄，不要只看文字描述。
```

### CHECKPOINT-2 Reviewer（Fetch + 萃取 + Update）

**Reviewer Prompt**：
```
你是 Reviewer，負責審核 CHECKPOINT-2（Fetch + 萃取 + Update）。

對每個 Layer，請檢查以下項目：

**2A Fetch 檢查**：
| # | 檢查項目 | 驗證方式 | 結果 |
|---|----------|----------|------|
| 1 | 是否執行 cd ... && bash fetch.sh | 檢查 Bash 工具呼叫 | ✅/❌ |
| 2 | 是否檢查 exit code | 檢查輸出是否有 exit code 或 $? | ✅/❌ |
| 3 | 是否列出產出的 JSONL | 檢查輸出內容 | ✅/❌ |

**2B 萃取檢查**：
| # | 檢查項目 | 驗證方式 | 結果 |
|---|----------|----------|------|
| 1 | 是否執行 wc -l 取得行數 | 檢查 Bash 工具呼叫 | ✅/❌ |
| 2 | 是否使用 sed -n 批次讀取 | 檢查 Bash 工具呼叫 | ✅/❌ |
| 3 | 批次大小是否 10-20 行 | 檢查 sed 參數 | ✅/❌ |
| 4 | 背景 Task ≤ 5 個 | 計算 run_in_background: true 的 Task 數 | ✅/❌ |
| 5 | 是否有狀態追蹤輸出 | 檢查 pending/running/completed/failed | ✅/❌ |

**2C Update 檢查**：
| # | 檢查項目 | 驗證方式 | 結果 |
|---|----------|----------|------|
| 1 | 是否執行 bash update.sh | 檢查 Bash 工具呼叫 | ✅/❌ |
| 2 | 是否捕獲 Qdrant 寫入結果 | 檢查輸出內容 | ✅/❌ |

**嚴重違規（直接 FAIL）**：
- ❌ 未執行 update.sh（用 grep 替代）
- ❌ 批次大小 > 100 行
- ❌ 並行 Task > 5 個
- ❌ 使用 Read 工具讀取 .jsonl 檔案

**判定規則**：
- 全部 Layer 的 2A/2B/2C 都 ✅ → 回報 "CHECKPOINT-2 Reviewer: PASS"
- 任一 ❌ → 回報 "CHECKPOINT-2 Reviewer: FAIL"，並列出失敗項目
```

### CHECKPOINT-3 Reviewer（REVIEW_NEEDED 處理）

**Reviewer Prompt**：
```
你是 Reviewer，負責審核 CHECKPOINT-3（REVIEW_NEEDED 處理）。

| # | 檢查項目 | 驗證方式 | 結果 |
|---|----------|----------|------|
| 1 | REVIEW_NEEDED 清單來源 | 必須是 update.sh 輸出，不可是 grep 掃描 | ✅/❌ |
| 2 | 若有 REVIEW_NEEDED，是否暫停詢問使用者 | 檢查是否有 AskUserQuestion 或等待使用者回應 | ✅/❌ |
| 3 | 每個 REVIEW_NEEDED 是否有處理記錄 | 檢查是否列出處理方式 | ✅/❌ |
| 4 | 是否獲得使用者確認 | 檢查對話記錄 | ✅/❌ |
| 5 | 剩餘 REVIEW_NEEDED 是否為 0 | 檢查 CHECKPOINT-3 輸出 | ✅/❌ |

**嚴重違規（直接 FAIL）**：
- ❌ 使用 grep 掃描替代 update.sh 輸出
- ❌ 有 REVIEW_NEEDED 但未暫停詢問使用者
- ❌ 未獲使用者確認就繼續下一步驟

**判定規則**：
- 全部 ✅ → 回報 "CHECKPOINT-3 Reviewer: PASS"
- 任一 ❌ → 回報 "CHECKPOINT-3 Reviewer: FAIL"，並列出失敗項目
```

### CHECKPOINT-4 Reviewer（Mode 發現）

**Reviewer Prompt**：
```
你是 Reviewer，負責審核 CHECKPOINT-4（Mode 發現）。

| # | 檢查項目 | 驗證方式 | 結果 |
|---|----------|----------|------|
| 1 | 是否執行 ls core/Narrator/Modes/*/ | 檢查 Bash 工具呼叫 | ✅/❌ |
| 2 | 是否檢查 .disabled 檔案 | 檢查輸出內容 | ✅/❌ |
| 3 | 是否驗證 CLAUDE.md 存在 | 檢查輸出內容 | ✅/❌ |
| 4 | 是否輸出 CHECKPOINT-4 格式 | 檢查是否有 [CHECKPOINT-4] 標記 | ✅/❌ |

**判定規則**：
- 全部 ✅ → 回報 "CHECKPOINT-4 Reviewer: PASS"
- 任一 ❌ → 回報 "CHECKPOINT-4 Reviewer: FAIL"，並列出失敗項目
```

### CHECKPOINT-5 Reviewer（Mode 報告產出）

**Reviewer Prompt**：
```
你是 Reviewer，負責審核 CHECKPOINT-5（Mode 報告產出）。

對每個 Mode，請檢查以下項目：

| # | 檢查項目 | 驗證方式 | 結果 |
|---|----------|----------|------|
| 1 | 是否讀取 Mode 的 CLAUDE.md | 檢查 Read 工具呼叫 | ✅/❌ |
| 2 | 是否使用 opus 模型 | 檢查 Task 工具參數 model: "opus" | ✅/❌ |
| 3 | Qdrant 查詢 ≥ 3 次 | 檢查 CHECKPOINT-5 中的 Qdrant 查詢次數 | ✅/❌ |
| 4 | 是否列出 Qdrant 查詢內容 | 檢查 CHECKPOINT-5 輸出 | ✅/❌ |
| 5 | 報告檔案是否存在 | 執行 ls -la 驗證 | ✅/❌ |
| 6 | 檔案修改時間是否為今天 | 執行 stat 或 ls -la 驗證 | ✅/❌ |
| 7 | 檔案大小 > 10KB | 檢查 ls -la 輸出 | ✅/❌ |

**嚴重違規（直接 FAIL）**：
- ❌ 未使用 opus 模型
- ❌ Qdrant 查詢 < 3 次
- ❌ 報告檔案修改時間不是今天（可能未實際寫入）
- ❌ 檔案大小 < 10KB（報告可能不完整）

**判定規則**：
- 全部 Mode 的所有項目都 ✅ → 回報 "CHECKPOINT-5 Reviewer: PASS"
- 任一 ❌ → 回報 "CHECKPOINT-5 Reviewer: FAIL"，並列出失敗項目
```

### CHECKPOINT-7 Reviewer（最終品質關卡）

**Reviewer Prompt**：
```
你是 Reviewer，負責審核 CHECKPOINT-7（最終品質關卡）。

**7.1 連結檢查**：
| # | 檢查項目 | 驗證方式 | 結果 |
|---|----------|----------|------|
| 1 | 是否實際執行 curl 驗證連結 | 檢查 Bash 工具呼叫 | ✅/❌ |
| 2 | 抽查連結 ≥ 10 個 | 計算 curl 呼叫次數 | ✅/❌ |
| 3 | 是否列出 HTTP 狀態碼 | 檢查輸出內容 | ✅/❌ |

**7.2 內容更新確認**：
| # | 檢查項目 | 驗證方式 | 結果 |
|---|----------|----------|------|
| 1 | 是否列出所有修改檔案 | 檢查輸出內容 | ✅/❌ |
| 2 | 是否逐一確認 | 檢查 Read 工具呼叫或 ls 驗證 | ✅/❌ |

**7.3 Git 狀態檢查**：
| # | 檢查項目 | 驗證方式 | 結果 |
|---|----------|----------|------|
| 1 | 是否執行 git status | 檢查 Bash 工具呼叫 | ✅/❌ |
| 2 | 是否執行 git commit | 檢查 Bash 工具呼叫 | ✅/❌ |
| 3 | 是否執行 git push | 檢查 Bash 工具呼叫 | ✅/❌ |
| 4 | push 是否成功 | 檢查輸出無 error | ✅/❌ |

**7.4 SOP 完成度檢查**：
| # | 檢查項目 | 驗證方式 | 結果 |
|---|----------|----------|------|
| 1 | CHECKPOINT-1 是否 PASS | 檢查前面的 Reviewer 報告 | ✅/❌ |
| 2 | CHECKPOINT-2 是否 PASS | 檢查前面的 Reviewer 報告 | ✅/❌ |
| 3 | CHECKPOINT-3 是否 PASS | 檢查前面的 Reviewer 報告 | ✅/❌ |
| 4 | CHECKPOINT-4 是否 PASS | 檢查前面的 Reviewer 報告 | ✅/❌ |
| 5 | CHECKPOINT-5 是否 PASS | 檢查前面的 Reviewer 報告 | ✅/❌ |

**判定規則**：
- 全部 ✅ → 回報 "CHECKPOINT-7 Reviewer: PASS - 可以回報完成"
- 任一 ❌ → 回報 "CHECKPOINT-7 Reviewer: FAIL - 不得回報完成"，並列出失敗項目
```

### Reviewer 回報格式

每個 Reviewer 必須按以下格式回報：

```
## CHECKPOINT-{N} Reviewer 審核報告

### 檢查結果

| # | 檢查項目 | 結果 | 說明 |
|---|----------|------|------|
| 1 | ... | ✅/❌ | ... |
| 2 | ... | ✅/❌ | ... |
| ... | ... | ... | ... |

### 判定結果

**CHECKPOINT-{N} Reviewer: PASS / FAIL**

（若 FAIL）需要修正的問題：
1. ...
2. ...
```

### FAIL 處理流程

當 Reviewer 回報 FAIL 時：

1. **主執行緒不得繼續下一步驟**
2. **列出 Reviewer 指出的問題**
3. **重新執行該步驟**，確保：
   - 執行 Reviewer 指出缺少的動作
   - 修正 Reviewer 指出的錯誤
4. **重新輸出 CHECKPOINT**
5. **再次啟動 Reviewer 審核**
6. **重複直到 PASS**

> **⛔ 強制規則**：禁止在 Reviewer 回報 FAIL 後跳過重做，直接進入下一步驟。這會導致最終的 CHECKPOINT-7 Reviewer 也回報 FAIL。

---

## 已知問題與解法

執行流程中曾遇到的問題及標準解法，避免重複犯錯：

### 1. fetch.sh / update.sh 路徑執行

**問題**：使用相對路徑 `bash core/.../fetch.sh` 執行失敗（No such file or directory）

**解法**：一律使用絕對路徑或 `cd` 切換後執行：
```bash
# 正確做法
cd /Users/lightman/weiqi.kids/agent.cyber-security && bash core/Extractor/Layers/{layer}/fetch.sh

# 錯誤做法
bash core/Extractor/Layers/{layer}/fetch.sh
```

### 2. 子代理寫入權限問題

**問題**：
- 背景 Task（`run_in_background: true`）的 Edit/Write 工具可能被 auto-denied
- **即使同步執行的子代理（如 Mode 報告產出）也可能無法寫檔**

**解法**：
- 背景 Task 失敗後，主執行緒以同步模式重試
- 確保使用 `subagent_type: "general-purpose"`（非 Bash）
- **重要**：Mode 報告產出後，主執行緒需**驗證檔案修改時間**是否更新
- 若子代理報告「權限限制」或「檔案已存在」但未實際更新，主執行緒應直接執行 Edit 更新

### 3. 檔名重複覆蓋

**問題**：同標題不同日期的公告（如 CISA KEV 更新）產生相同 slug，後者覆蓋前者

**解法**：萃取時檔名必須包含唯一識別：
```
# 優先順序
1. CVE 編號：2026-CVE-2026-24423.md
2. 公告編號：2026-NCSC-2026-0040.md
3. 日期 + slug：2026-02-08-cisa-adds-one-kev.md
4. 日期 + 序號：2026-02-08-kev-update-1.md
```

> **強制規則**：若偵測到檔案已存在且內容不同，應加上日期或序號區分，不可直接覆蓋。

### 4. 已存在檔案的處理

**問題**：多批次處理時，同一 CVE 可能出現在不同 commit（如 Nuclei Templates）

**解法**：這是預期行為，非錯誤
- 若檔案已存在且內容相同 → 跳過（正確）
- 若檔案已存在但內容不同 → 依上述「檔名重複覆蓋」規則處理

---

## 完成品質關卡

**每當說「完成」時，必須先執行以下檢查，全部通過才能回報完成。**

> **⚠️ 重要**：完成品質關卡即 CHECKPOINT-7，必須輸出標準格式並經過 Reviewer 審核。

### 步驟七必須輸出（CHECKPOINT-7）

```
[CHECKPOINT-7] 完成品質關卡
- 連結檢查:
  - 抽查連結數: {N}
  - 正常連結: {N}
  - 異常連結: {N}（若有，列出）
- 內容更新:
  - 修改檔案數: {N}
  - 檔案清單: {列出}
  - 逐一驗證: ✓
- Git 狀態:
  - git status: ✓
  - git commit: ✓（{commit hash}）
  - git push: ✓
- SOP 完成度:
  - CHECKPOINT-1: PASS
  - CHECKPOINT-2: PASS
  - CHECKPOINT-3: PASS
  - CHECKPOINT-4: PASS
  - CHECKPOINT-5: PASS
- 狀態: PASS / FAIL
```

> **⛔ 審核點**：CHECKPOINT-7 完成後，必須啟動 **Reviewer 子代理**審核。只有 Reviewer 回報 PASS，才能回報「完成」。

### 檢查項目

#### 1. 連結檢查

- [ ] 所有新增/修改的內部連結正常，無 404
- [ ] 所有新增/修改的外部連結正常
- [ ] 無死連結或斷裂連結

#### 2. SEO + AEO 標籤檢查（僅當執行 SEO 流程時）

##### 2.1 Meta 標籤

- [ ] `<title>` 存在且 ≤ 60 字，含核心關鍵字
- [ ] `<meta name="description">` 存在且 ≤ 155 字
- [ ] `og:title`, `og:description`, `og:image`, `og:url` 存在
- [ ] `og:type` = "article"
- [ ] `article:published_time`, `article:modified_time` 存在（ISO 8601 格式）
- [ ] `twitter:card` = "summary_large_image"

##### 2.2 JSON-LD Schema（7 種必填）

| Schema | 必填欄位 |
|--------|----------|
| WebPage | speakable（至少 7 個 cssSelector） |
| Article | isAccessibleForFree, isPartOf（含 SearchAction）, significantLink |
| Person | knowsAbout（≥2）, hasCredential（≥1）, sameAs（≥1） |
| Organization | contactPoint, logo（含 width/height） |
| BreadcrumbList | position 從 1 開始連續編號 |
| FAQPage | 3-5 個 Question + Answer |
| ImageObject | license, creditText |

##### 2.3 條件式 Schema（依內容判斷）

| Schema | 觸發條件 | 必填欄位 |
|--------|----------|----------|
| HowTo | 有步驟教學 | step, totalTime |
| VideoObject | 有嵌入影片 | duration, thumbnailUrl |
| ItemList | 有排序清單（「N 大」「TOP」） | itemListElement |

##### 2.4 SGE/AEO 標記（AI 引擎優化）

| 標記 | 要求 |
|------|------|
| `.key-answer` | 每個 H2 必須有，含 `data-question` 屬性 |
| `.key-takeaway` | 文章重點摘要（2-3 個） |
| `.expert-quote` | 專家引言（至少 1 個） |
| `.actionable-steps` | 行動步驟清單 |
| `.comparison-table` | 比較表格（若有） |

##### 2.5 E-E-A-T 信號

- [ ] Person Schema 有專業認證（hasCredential）
- [ ] 至少 2 個高權威外部連結（.gov、學術期刊、專業協會、CERT/CC）

#### 3. 內容更新確認

- [ ] 列出本次預計修改的所有檔案
- [ ] 逐一確認每個檔案都已正確更新
- [ ] 修改內容與任務要求一致
- [ ] 無遺漏項目

#### 4. Git 狀態檢查

- [ ] 所有變更已 commit
- [ ] commit message 清楚描述本次變更
- [ ] 已 push 到 Github（除非另有指示）
- [ ] 遠端分支已更新

#### 5. SOP 完成度檢查

- [ ] 回顧原始任務需求
- [ ] 原訂 SOP 每個步驟都已執行
- [ ] 無遺漏的待辦項目
- [ ] 無「之後再處理」的項目

### 檢查報告格式

完成檢查後，輸出以下格式：

```
## 完成檢查報告

| 類別 | 狀態 | 問題（如有） |
|------|------|-------------|
| 連結檢查 | ✅/❌ | |
| Meta 標籤 | ✅/❌/N/A | |
| Schema（必填） | ✅/❌/N/A | |
| Schema（條件式） | ✅/❌/N/A | |
| SGE/AEO 標記 | ✅/❌/N/A | |
| E-E-A-T 信號 | ✅/❌/N/A | |
| 內容更新 | ✅/❌ | |
| Git 狀態 | ✅/❌ | |
| SOP 完成度 | ✅/❌ | |

**總結**：X/Y 項通過，狀態：通過/未通過
```

> **N/A 說明**：SEO 相關項目（Meta 標籤、Schema、SGE/AEO、E-E-A-T）僅在執行 SEO 流程時檢查，否則標記為 N/A。

### 檢查未通過時

1. **不回報完成**
2. 列出所有未通過項目
3. 立即修正問題
4. 重新執行檢查
5. 全部通過才能說「完成」

### 任務開始時

接到新任務時，先建立本次檢查清單：

```
## 本次任務檢查清單

- 任務目標：[描述]
- 預計修改檔案：
  - [ ] 檔案1
  - [ ] 檔案2
- 預計新增內容：
  - [ ] 內容1
  - [ ] 內容2
- 是否執行 SEO 流程：是/否
```

---

## 互動規則

完成執行後，**必須先通過「完成品質關卡」**，然後簡要回報：

1. 各 Layer 擷取與萃取結果（筆數、有無 REVIEW_NEEDED）
2. 各 Mode 報告產出狀態
3. 是否有錯誤或需要人工介入的項目
4. **更新 `_data/status.yml` 的執行時間**
5. **完成檢查報告**（依上述格式）

---

## 網站改版流程

> **獨立流程**：本流程獨立於 Layer/Mode 的資訊萃取流程，專門用於持續優化本專案的 GitHub Pages 網站。

### 觸發條件

使用者說以下任一指令時，執行此流程：

- 「執行網站改版」
- 「優化網站」
- 「執行 revamp」
- 「revamp」

### 流程總覽

```
0-Positioning → 1-Discovery → 2-Competitive → 3-Analysis → 4-Strategy → 5-Content-Spec → 執行 → Final-Review
     ↓              ↓             ↓              ↓            ↓              ↓                       ↓
  Review ✓      Review ✓      Review ✓      Review ✓     Review ✓       Review ✓                Review ✓
```

### 階段說明

| 階段 | 目的 | 輸出位置 |
|------|------|----------|
| **0-positioning** | 釐清品牌定位、核心價值 | `docs/Revamp/0-positioning.md` |
| **1-discovery** | 盤點現有內容 + 技術健檢 | `docs/Revamp/1-discovery.md` |
| **2-competitive** | 分析競爭對手 | `docs/Revamp/2-competitive.md` |
| **3-analysis** | 受眾分析 + 內容差距 | `docs/Revamp/3-analysis.md` |
| **4-strategy** | 改版計劃 + 優先級排序 | `docs/Revamp/4-strategy.md` |
| **5-content-spec** | 每頁內容規格 | `docs/Revamp/5-content-spec.md` |
| **final-review** | 驗收執行結果 | `docs/Revamp/final-review.md` |

### 執行方式（Writer → Reviewer 雙角色）

每個階段採用 **Writer → Reviewer** 雙角色模式：

1. **Writer 執行**：
   - 讀取 `revamp/{階段}/CLAUDE.md` 的指令
   - 讀取前一階段的輸出（作為輸入）
   - 產出該階段文件到 `docs/Revamp/`

2. **Reviewer 檢查**：
   - 讀取 `revamp/{階段}/review/CLAUDE.md` 的檢查清單
   - 逐項檢查 Writer 輸出
   - 回報 `✅ 通過` / `⚠️ 需修改` / `❌ 重做`

3. **迭代修正**：
   - 若 Reviewer 說「需修改」，Writer 根據問題清單修正
   - 修正後重新送審
   - 重複直到 Reviewer 說「通過」

4. **進入下一階段**：Reviewer 通過後，自動進入下一階段

### 模型指派規則

| 階段 | 角色 | 指定模型 | 子代理類型 | 原因 |
|------|------|----------|------------|------|
| 所有階段 | Writer | `sonnet` | `general-purpose` | 依規則產出，無需高階推理 |
| 所有階段 | Reviewer | `sonnet` | `general-purpose` | 依 checklist 檢查 |
| 工具執行 | site-audit.sh | `sonnet` | `Bash` | 純腳本執行 |

### 自動化工具

位於 `revamp/tools/` 目錄，用於 1-discovery 和 2-competitive 階段：

| 工具 | 用途 | 用法 |
|------|------|------|
| `site-audit.sh` | 網站技術健檢（Lighthouse、安全性、SEO） | `bash revamp/tools/site-audit.sh URL` |
| `competitive-audit.sh` | 競品比較分析 | `bash revamp/tools/competitive-audit.sh URL1 URL2 URL3` |

**工具執行方式**：
```bash
cd /Users/lightman/weiqi.kids/agent.cyber-security && bash revamp/tools/site-audit.sh https://security.weiqi.kids/
```

### 指定執行

可以指定執行特定階段（跳過前面階段，假設前階段輸出已存在）：

| 指令 | 執行內容 |
|------|----------|
| 「執行 positioning」 | 只跑 0-positioning 的 Writer + Reviewer |
| 「執行 discovery」 | 只跑 1-discovery 的 Writer + Reviewer |
| 「執行 competitive」 | 只跑 2-competitive 的 Writer + Reviewer |
| 「執行 analysis」 | 只跑 3-analysis 的 Writer + Reviewer |
| 「執行 strategy」 | 只跑 4-strategy 的 Writer + Reviewer |
| 「執行 content-spec」 | 只跑 5-content-spec 的 Writer + Reviewer |
| 「執行 final-review」 | 只跑最終驗收 |

> **注意**：指定執行時，必須確保前階段輸出已存在於 `docs/Revamp/` 目錄。

### 輸出位置

所有改版文件輸出到 `docs/Revamp/` 目錄：

```
docs/Revamp/
├── 0-positioning.md      # 品牌定位文件
├── 1-discovery.md        # 網站現況盤點報告
├── 2-competitive.md      # 競品分析報告
├── 3-analysis.md         # 受眾與內容差距分析
├── 4-strategy.md         # 改版策略計劃書
├── 5-content-spec.md     # 內容規格書
└── final-review.md       # 驗收報告
```

### 與主流程的關係

| 流程 | 觸發指令 | 目的 |
|------|----------|------|
| **資訊萃取流程** | 「執行完整流程」、「更新資料」 | 萃取資安情報、產出報告 |
| **網站改版流程** | 「執行網站改版」、「revamp」 | 優化 GitHub Pages 網站 |

兩個流程**完全獨立**，可分別執行。

### 完成時

網站改版流程完成後，回報：

1. 各階段通過狀態
2. Final Review 驗收結果
3. 待執行的改版項目（若有）
4. 建議的下一步行動
