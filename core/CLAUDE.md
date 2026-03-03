# 系統維護指令

> 本檔案供維護時使用。使用者在 `core/` 目錄下啟動 Claude CLI 時自動載入。
> 日常執行請使用根目錄的 `./CLAUDE.md`。

---

## 維護操作

使用者可以用自然語言下達以下指令，Claude 應依照對應流程執行。

### Layer 管理

#### 新增 Layer

使用者說：「新增一個 {名稱} Layer，資料來源是 {URL}，類型是 {RSS/API/...}」

執行流程：
1. 與使用者確認 Layer 定義表（見下方模板）
2. 確認 category enum 清單（嚴格限定，不可開放式）
3. 建立目錄 `core/Extractor/Layers/{layer_name}/`
4. 產生 `fetch.sh`、`update.sh`、`CLAUDE.md`（依模板）
5. 建立 `docs/Extractor/{layer_name}/` 及 category 子目錄
6. **為每個 category 子目錄建立 `index.md`**（含 Liquid 模板列出該分類下的資料）
   - front matter 必須包含 `render_with_liquid: true`（覆蓋 `_config.yml` 的全域 `render_with_liquid: false`）
   - 參考 `docs/Extractor/exploit_intelligence/active_exploitation/index.md` 格式
7. 更新 `docs/explored.md`「已採用」表格
8. 告知使用者需要在 `.env` 補充的設定（若有）

#### 修改 Layer

使用者說：「修改 {layer_name} 的 {fetch 來源/萃取邏輯/category/...}」

執行流程：
1. 讀取 `core/Extractor/Layers/{layer_name}/CLAUDE.md` 確認現況
2. 與使用者確認修改內容
3. 修改對應檔案
4. 若 category enum 有變動，確認不會影響既有 docs 分類
5. 列出影響範圍（哪些 Mode 會受影響）

#### 刪除 Layer

使用者說：「刪除 {layer_name} Layer」

執行流程：
1. 列出依賴此 Layer 的所有 Mode
2. 警告使用者影響範圍，請求確認
3. 確認後刪除 `core/Extractor/Layers/{layer_name}/`
4. 更新 `docs/explored.md`，將對應資料源移到「已排除」
5. **不自動刪除** `docs/Extractor/{layer_name}/`（保留歷史資料，由使用者決定）

#### 暫停/排除 Layer

使用者說：「暫停 {layer_name}」或「排除 {layer_name}」

執行流程：
1. 在 `core/Extractor/Layers/{layer_name}/` 建立 `.disabled` 標記檔
2. 更新 `docs/explored.md`
3. 執行流程會自動跳過帶有 `.disabled` 的 Layer

### Mode 管理

#### 新增 Mode

使用者說：「新增一個 {名稱} Mode，讀取 {Layer 清單}，給 {受眾} 看」

執行流程：
1. 與使用者確認 Mode 定義表（見下方模板）
2. 確認來源 Layer 都存在
3. 建立目錄 `core/Narrator/Modes/{mode_name}/`
4. 產生 `CLAUDE.md`（依模板）
5. 建立 `docs/Narrator/{mode_name}/`

#### 修改 Mode

使用者說：「修改 {mode_name} 的 {來源 Layer/輸出框架/...}」

執行流程：
1. 讀取 `core/Narrator/Modes/{mode_name}/CLAUDE.md` 確認現況
2. 與使用者確認修改內容
3. 修改對應檔案

#### 刪除 / 暫停 Mode

與 Layer 刪除/暫停邏輯相同，使用 `.disabled` 標記。

### 資料源管理

#### 新增資料源

使用者說：「我找到一個新的資料源 {URL}」

執行流程：
1. 測試連線（curl 確認可達）
2. 若為 RSS，驗證格式並顯示前 5 筆標題
3. 更新 `docs/explored.md`「評估中」表格
4. 詢問使用者要建立新 Layer 還是加入現有 Layer

#### 排除資料源

使用者說：「排除 {資料源名稱}，原因是 {原因}」

執行流程：
1. 更新 `docs/explored.md`，從「已採用」或「評估中」移到「已排除」
2. 設定重新評估時間（預設 6 個月後）

---

## 建立模板

### Layer 定義表

新增 Layer 時必須確認以下每一欄：

| 項目 | 說明 |
|------|------|
| **Layer name** | 中英文名稱 |
| **Engineering function** | 這個 Layer 的工程職責 |
| **Collectable data** | 可收集的資料類型與來源 |
| **Automation level** | 自動化程度百分比 + 說明 |
| **Output value** | 產出的價值 |
| **Risk type** | 主要風險 |
| **Reviewer persona** | 從審核人設池中選擇 |
| **Category enum** | 固定分類清單（英文 key + 中文 + 判定條件） |

### fetch.sh 模板

```bash
#!/bin/bash
# {layer_name} 資料擷取腳本

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"

source "$PROJECT_ROOT/lib/args.sh"
source "$PROJECT_ROOT/lib/core.sh"
source "$PROJECT_ROOT/lib/rss.sh"

LAYER_NAME="{layer_name}"
RAW_DIR="$PROJECT_ROOT/docs/Extractor/$LAYER_NAME/raw"

mkdir -p "$RAW_DIR"

# === 資料擷取邏輯 ===
# 1. rss_fetch 下載 XML
# 2. rss_extract_items_jsonl 轉換為 JSONL
# {描述具體的擷取方式}

echo "Fetch completed: $LAYER_NAME"
```

### update.sh 模板

```bash
#!/bin/bash
# {layer_name} 資料更新腳本
# 職責：Qdrant 更新 + REVIEW_NEEDED 檢查
# 注意：不處理 index.json（由 GitHub Actions 產生）

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"

source "$PROJECT_ROOT/lib/args.sh"
source "$PROJECT_ROOT/lib/core.sh"
source "$PROJECT_ROOT/lib/qdrant.sh"

LAYER_NAME="{layer_name}"
DOCS_DIR="$PROJECT_ROOT/docs/Extractor/$LAYER_NAME"

# 確保分類子目錄存在
for category in {category_enum_values}; do
  mkdir -p "$DOCS_DIR/$category"
done

# === Qdrant 更新 ===
if [[ -n "${QDRANT_URL:-}" ]]; then
  qdrant_init_env || echo "Qdrant 連線失敗" >&2
fi

# === REVIEW_NEEDED 檢查 ===
REVIEW_FILES=""
for f in $(find "$DOCS_DIR" -name "*.md" -type f 2>/dev/null); do
  if grep -q "\[REVIEW_NEEDED\]" "$f" 2>/dev/null; then
    REVIEW_FILES+="  - $f\n"
  fi
done

if [[ -n "$REVIEW_FILES" ]]; then
  echo "需要審核：" && echo -e "$REVIEW_FILES"
  command -v gh >/dev/null 2>&1 && gh issue create \
    --title "[Extractor] $LAYER_NAME - 需要人工審核" \
    --label "review-needed" \
    --body "偵測到 [REVIEW_NEEDED] 標記" 2>/dev/null || true
fi

echo "Update completed: $LAYER_NAME"
```

### Layer CLAUDE.md 模板

每個 Layer 的 CLAUDE.md 必須包含：
1. Layer 定義表
2. 萃取邏輯（JSON schema + 分類規則 enum）
3. 輸出格式（Markdown 模板）
4. 自我審核 Checklist

### Mode CLAUDE.md 模板

每個 Mode 的 CLAUDE.md 必須包含：
1. Mode 定義表
2. 資料來源定義（讀取哪些 docs/Extractor/ 目錄）
3. 輸出框架（報告結構）
4. 免責聲明
5. 自我審核 Checklist

---

## 系統規範

### 審核人設池

| 審核人設 | 關注重點 |
|----------|----------|
| 資料可信度審核員 | 來源是否一手、是否可驗證 |
| 幻覺風險審核員 | AI 是否產生無中生有的內容 |
| 領域保守審核員 | 是否符合該領域的專業標準 |
| 邏輯一致性審核員 | 前後陳述是否矛盾 |
| 法規與責任審核員 | 是否有法律風險 |
| 使用者誤導風險審核員 | 是否可能造成誤解 |
| 自動化邊界審核員 | 是否超出適合自動化的範圍 |

### Qdrant 設定

- Collection：`cyber-security`
- 向量維度：1536（text-embedding-3-small）
- 距離：Cosine
- Payload 必要欄位：`source_url`、`fetched_at`、`original_content`、`source_layer`、`title`、`date`、`category`、`severity`

### 禁止行為

1. 不可產出無法驗證的「專業外觀」聲明 — 所有聲明必須有來源
2. 不可跳過審核層 — 每個輸出必須經過自我審核 checklist
3. 不可混淆推測與事實 — 推測必須明確標註
4. 不可將高風險領域標記為全自動 — 涉及法律、財務建議等必須有人工介入
5. 不可自行新增 category enum 值 — 必須與使用者確認後寫入 CLAUDE.md

### GitHub Actions

- `build-index.yml`：docs/ 下的 .md 變動時自動重建 index.json
- index.json 不由 update.sh 產生

---

## 目錄結構參考

```
core/
├── CLAUDE.md                              # 本檔案（維護指令）
├── Extractor/
│   ├── CLAUDE.md                          # Extractor 角色說明
│   └── Layers/
│       └── {layer_name}/
│           ├── CLAUDE.md                  # Layer 定義 + 萃取邏輯
│           ├── fetch.sh                   # 資料擷取（輸出到 docs/Extractor/{layer_name}/raw/）
│           ├── update.sh                  # Qdrant + 檢查
│           └── .disabled                  # 存在時跳過此 Layer
└── Narrator/
    ├── CLAUDE.md                          # Narrator 角色說明
    └── Modes/
        └── {mode_name}/
            ├── CLAUDE.md                  # Mode 定義 + 輸出框架
            └── .disabled                  # 存在時跳過此 Mode

docs/Extractor/{layer_name}/
├── raw/                                   # 原始資料（.gitignore）
│   ├── rss-*.xml                          # 下載的 RSS XML
│   └── rss-*.jsonl                        # 轉換後的 JSONL（每行一筆 JSON，萃取用）
└── {category}/                            # 萃取結果
```
