#!/bin/bash
# threat_feeds 資料更新腳本
# 用法：update.sh [--all | file1.md file2.md ...]
# 接收萃取產出的 .md 檔案路徑，批次寫入 Qdrant 並檢查 REVIEW_NEEDED

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"

source "$PROJECT_ROOT/lib/args.sh"
source "$PROJECT_ROOT/lib/core.sh"
source "$PROJECT_ROOT/lib/update_common.sh"

LAYER_NAME="threat_feeds"
DOCS_DIR="$PROJECT_ROOT/docs/Extractor/$LAYER_NAME"
COLLECTION="${QDRANT_COLLECTION:-cyber-security}"
CATEGORIES=(malicious_url malware_sample ioc_indicator c2_infrastructure)

# 確保輸出目錄及分類子目錄存在
for category in "${CATEGORIES[@]}"; do
  mkdir -p "$DOCS_DIR/$category"
done

# 收集檔案
update_collect_files "$LAYER_NAME" "$DOCS_DIR" "$@"

########################################
# Layer-specific: embed text 萃取
########################################
extract_embed_text() {
  local md_file="$1"
  local content
  content="$(cat "$md_file")"
  local title
  title="$(echo "$content" | head -1 | sed 's/^# //')"

  # 萃取純文字（標題 + 威脅描述 + IoC 指標）
  echo "$title $(echo "$content" | awk '
    /^## (威脅描述|IoC 指標|關聯分析)/ { cap=1; next }
    /^## / { cap=0; next }
    /^---/ { cap=0; next }
    cap && /^\| / { next }
    cap { print }
  ' | sed -E 's/\*\*([^*]*)\*\*/\1/g; s/\[([^]]*)\]\([^)]*\)/\1/g; s/^- //; s/^> //' | tr '\n' ' ')"
}

########################################
# Layer-specific: payload 建構
########################################
build_payload() {
  local md_file="$1"
  local content
  content="$(cat "$md_file")"
  local title
  title="$(echo "$content" | head -1 | sed 's/^# //')"
  local category
  category="$(basename "$(dirname "$md_file")")"

  jq -nc \
    --arg source_url "$(echo "$content" | grep -oE 'https?://[^)]+' | head -1)" \
    --arg fetched_at "$(date -u '+%Y-%m-%dT%H:%M:%SZ')" \
    --arg original_content "$content" \
    --arg source_layer "$LAYER_NAME" \
    --arg title "$title" \
    --arg date "$(echo "$content" | grep '| \*\*日期\*\*' | sed -E 's/.*\| *\*\*日期\*\* *\| *//;s/ *\|$//' | head -1)" \
    --arg category "$category" \
    --arg severity "$(echo "$content" | grep '| \*\*威脅等級\*\*' | sed -E 's/.*\| *\*\*威脅等級\*\* *\| *//;s/ *\|$//' | head -1)" \
    '{source_url:$source_url, fetched_at:$fetched_at, original_content:$original_content, source_layer:$source_layer, title:$title, date:$date, category:$category, severity:$severity}'
}

########################################
# 主邏輯
########################################

echo "🔄 [$LAYER_NAME] 開始更新..."
echo "========================================"

# === 1. Qdrant 批次索引 ===
echo "🔗 Qdrant 更新..."
if [[ -n "${QDRANT_URL:-}" && -n "${OPENAI_API_KEY:-}" && ${UPDATE_N_FILES:-0} -gt 0 ]]; then
  qdrant_init_env || echo "⚠️ Qdrant 連線失敗" >&2
  chatgpt_init_env || echo "⚠️ OpenAI 連線失敗" >&2
  qdrant_create_collection "$COLLECTION" "${EMBEDDING_DIMENSION:-1536}" || true

  update_run_batch_pipeline "$COLLECTION" "$LAYER_NAME" extract_embed_text build_payload
else
  echo "ℹ️ 缺少 QDRANT_URL/OPENAI_API_KEY 或未傳入檔案，跳過 Qdrant 更新"
fi

# === 2. 檢查 REVIEW_NEEDED ===
update_check_review_needed "$LAYER_NAME"

echo "========================================"
echo "✅ Update completed: $LAYER_NAME"
