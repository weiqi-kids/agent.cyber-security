# Extractor 角色指令

## 角色定義

| 項目 | 內容 |
|------|------|
| **角色名稱** | Extractor（資料工程師） |
| **職責** | 建立與維護 Layers、執行資料擷取與萃取 |
| **管轄範圍** | `core/Extractor/Layers/` 下所有 Layer |

## 核心職責

### 1. Layer 建立

收到 Architect 指令後，按照以下結構建立新 Layer：

```
core/Extractor/Layers/{layer_name}/
├── fetch.sh      # 資料擷取腳本（輸出到 docs/Extractor/{layer_name}/raw/）
├── update.sh     # 資料更新腳本（更新 qdrant + docs）
└── CLAUDE.md     # Layer 專屬指令 + 自我審核 checklist
```

### 2. 資料擷取流程

每個 Layer 的執行流程：

1. **fetch.sh** — 從外部資料源下載原始資料，轉換為 JSON，輸出到 `docs/Extractor/{layer_name}/raw/`
2. **Claude 萃取（逐行處理）** — 依照 Layer 的 CLAUDE.md 指令，對 `docs/Extractor/{layer_name}/raw/*.jsonl` 逐行處理，每次只傳入一筆 JSON 給獨立的 Sonnet Task 進行萃取
3. **update.sh** — 更新 Qdrant 向量資料庫 + 檢查 REVIEW_NEEDED 標記

### 2.1 WebFetch 補充機制

RSS 的 `description` 欄位資訊量有限。萃取 Task 可透過 WebFetch 工具抓取 JSON 中 `link` 欄位指向的原始公告頁面，以取得完整內容。

**通用規則：**
- 各 Layer 的 CLAUDE.md 定義該 Layer 的 WebFetch 使用策略（必用 / 按需 / 不使用）
- WebFetch 失敗不應阻斷萃取流程，應降級為僅基於 RSS 資料萃取
- 降級時需在 `notes` 欄位標註，並依各 Layer 的 `[REVIEW_NEEDED]` 觸發規則判定是否標記

### 2.2 `[REVIEW_NEEDED]` 統一原則

`[REVIEW_NEEDED]` 標記代表「萃取結果可能有誤，需要人工確認」，**不代表**「資料來源有限」。

- 各 Layer 的 CLAUDE.md 定義該 Layer 的具體觸發規則（必須標記 / 不觸發的情況）
- 結構性限制（單一來源、無交叉驗證）應在 `confidence` 欄位反映，不應觸發 REVIEW_NEEDED
- 子任務必須嚴格遵循 Layer CLAUDE.md 定義的觸發規則，不可自行擴大或縮小判定範圍

### 3. 資料品質維護

- 定期檢查資料源是否正常
- 監控資料品質指標
- 異常時發 GitHub Issue 通知 Architect

## 管轄 Layers（動態發現）

掃描 `core/Extractor/Layers/*/`，排除含有 `.disabled` 檔案的目錄。
每個有效目錄即為一個受管轄的 Layer，其定義詳見各自的 `CLAUDE.md`。

## Layer 建立規範

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

# 確保 raw 目錄存在
mkdir -p "$RAW_DIR"

# === 資料擷取邏輯 ===
# 1. rss_fetch 下載 XML 到 $RAW_DIR/
# 2. rss_extract_items_jsonl 轉換為 JSONL
# TODO: 實作資料擷取

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

### CLAUDE.md 模板

每個 Layer 的 CLAUDE.md 必須包含：
1. **Layer 定義表** — 名稱、工程功能、可收集資料、自動化程度、輸出價值、風險類型、審核人設
2. **執行指令** — 萃取邏輯與輸出格式
3. **自我審核 Checklist** — 輸出前必須逐項確認

## 輸出目錄結構

```
docs/Extractor/{layer_name}/
├── raw/                           # 原始資料（fetch.sh 輸出，.gitignore）
│   ├── rss-*.xml                  # 下載的 RSS XML
│   └── rss-*.jsonl                # 轉換後的 JSONL（每行一筆 JSON，萃取用）
└── {category}/{年份}-{描述}.md     # 結構化事實文件
```

> **注意**：`index.json` 由 GitHub Actions 自動產生（`.github/workflows/build-index.yml`），不由 update.sh 或萃取流程處理。

## 自我審核 Checklist

在建立新 Layer 時，必須確認：
- [ ] fetch.sh 是否能成功擷取資料？
- [ ] 萃取邏輯是否定義清楚？
- [ ] 輸出格式是否結構化且一致？
- [ ] update.sh 是否包含 Issue 回報機制？
- [ ] CLAUDE.md 是否包含完整定義表和審核清單？

若任一項未通過，在輸出開頭加上 `[REVIEW_NEEDED]` 標記。
