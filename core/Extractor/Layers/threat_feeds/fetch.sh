#!/bin/bash
# threat_feeds 資料擷取腳本
# 從 abuse.ch 系列 API 下載威脅情報饋送（URLhaus、MalwareBazaar、ThreatFox、Feodo Tracker）

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"

source "$PROJECT_ROOT/lib/args.sh"
source "$PROJECT_ROOT/lib/core.sh"
source "$PROJECT_ROOT/lib/api.sh"

LAYER_NAME="threat_feeds"
RAW_DIR="$PROJECT_ROOT/docs/Extractor/$LAYER_NAME/raw"

# 確保 raw 目錄存在
mkdir -p "$RAW_DIR"

########################################
# 主邏輯
########################################

echo "📡 [$LAYER_NAME] 開始擷取資料..."
echo "========================================"

TOTAL_ITEMS=0
SUCCESS_COUNT=0
FAIL_COUNT=0

# --- URLhaus — 最近惡意 URL ---
echo "📥 擷取 URLhaus（最近惡意 URL）..."
if api_fetch_json \
  "https://urlhaus.abuse.ch/downloads/json_recent/" \
  "$RAW_DIR/urlhaus-recent.json"; then
  # URLhaus JSON 結構: { "ID": [{ ... }], "ID2": [{ ... }] }
  # 需要展開成 JSONL（每個 ID 的第一個元素）
  if jq -c 'to_entries[] | .value[0] | . + {"id": .id // (input_filename | split("/")[-1] | split(".")[0])}' \
    "$RAW_DIR/urlhaus-recent.json" > "$RAW_DIR/urlhaus-recent.jsonl" 2>/dev/null; then
    UH_COUNT="$(wc -l < "$RAW_DIR/urlhaus-recent.jsonl" | tr -d ' ')"
    TOTAL_ITEMS=$((TOTAL_ITEMS + UH_COUNT))
    ((SUCCESS_COUNT++))
    echo "✅ 成功: $UH_COUNT 個 URL"
  else
    echo "⚠️  URLhaus JSONL 轉換失敗"
    ((FAIL_COUNT++))
  fi
else
  echo "⚠️  URLhaus API 擷取失敗"
  ((FAIL_COUNT++))
fi
echo ""

# --- MalwareBazaar — 最近惡意程式樣本 ---
echo "📥 擷取 MalwareBazaar（最近樣本）..."
if curl -sS -L "https://bazaar.abuse.ch/export/csv/recent/" \
  -o "$RAW_DIR/malwarebazaar-recent.csv" 2>/dev/null; then
  # CSV to JSON conversion (skip comments and header)
  if awk -F',' 'NR>10 && !/^#/ {
    gsub(/"/, "", $0);
    gsub(/^ /, "", $0);
    printf "{\"first_seen\":\"%s\",\"sha256\":\"%s\",\"md5\":\"%s\",\"sha1\":\"%s\",\"reporter\":\"%s\",\"file_name\":\"%s\",\"file_type\":\"%s\",\"mime_type\":\"%s\",\"signature\":\"%s\"}\n",
    $1,$2,$3,$4,$5,$6,$7,$8,$9
  }' "$RAW_DIR/malwarebazaar-recent.csv" > "$RAW_DIR/malwarebazaar-recent.jsonl" 2>/dev/null; then
    MB_COUNT="$(wc -l < "$RAW_DIR/malwarebazaar-recent.jsonl" | tr -d ' ')"
    TOTAL_ITEMS=$((TOTAL_ITEMS + MB_COUNT))
    ((SUCCESS_COUNT++))
    echo "✅ 成功: $MB_COUNT 個樣本"
  else
    echo "⚠️  MalwareBazaar CSV→JSONL 轉換失敗"
    ((FAIL_COUNT++))
  fi
else
  echo "⚠️  MalwareBazaar API 擷取失敗"
  ((FAIL_COUNT++))
fi
echo ""

# --- ThreatFox — 最近 IoC ---
echo "📥 擷取 ThreatFox（最近 IoC）..."
if api_fetch_json \
  "https://threatfox.abuse.ch/export/json/recent/" \
  "$RAW_DIR/threatfox-recent.json"; then
  # ThreatFox JSON 結構與 URLhaus 相同
  if jq -c 'to_entries[] | .value[0]' \
    "$RAW_DIR/threatfox-recent.json" > "$RAW_DIR/threatfox-recent.jsonl" 2>/dev/null; then
    TF_COUNT="$(wc -l < "$RAW_DIR/threatfox-recent.jsonl" | tr -d ' ')"
    TOTAL_ITEMS=$((TOTAL_ITEMS + TF_COUNT))
    ((SUCCESS_COUNT++))
    echo "✅ 成功: $TF_COUNT 個 IoC"
  else
    echo "⚠️  ThreatFox JSONL 轉換失敗"
    ((FAIL_COUNT++))
  fi
else
  echo "⚠️  ThreatFox API 擷取失敗"
  ((FAIL_COUNT++))
fi
echo ""

# --- Feodo Tracker — C2 清單 ---
echo "📥 擷取 Feodo Tracker（C2 清單）..."
if api_fetch_json \
  "https://feodotracker.abuse.ch/downloads/ipblocklist.json" \
  "$RAW_DIR/feodo-c2.json"; then
  if api_json_to_jsonl "$RAW_DIR/feodo-c2.json" '.[]' "$RAW_DIR/feodo-c2.jsonl"; then
    FT_COUNT="$(wc -l < "$RAW_DIR/feodo-c2.jsonl" | tr -d ' ')"
    TOTAL_ITEMS=$((TOTAL_ITEMS + FT_COUNT))
    ((SUCCESS_COUNT++))
    echo "✅ 成功: $FT_COUNT 個 C2"
  else
    echo "⚠️  Feodo Tracker JSONL 轉換失敗"
    ((FAIL_COUNT++))
  fi
else
  echo "⚠️  Feodo Tracker API 擷取失敗"
  ((FAIL_COUNT++))
fi
echo ""

########################################
# 摘要
########################################

echo "========================================"
if [[ $FAIL_COUNT -gt 0 ]]; then
  echo "⚠️  Fetch completed with warnings: $LAYER_NAME"
  echo "   $FAIL_COUNT 個來源擷取失敗（不影響其他來源）"
else
  echo "✅ Fetch completed: $LAYER_NAME"
fi
echo "   成功: $SUCCESS_COUNT 個來源"
echo "   總計: $TOTAL_ITEMS items"
echo ""

# 產出的 JSONL 檔案清單
echo "📁 產出的 JSONL 檔案："
find "$RAW_DIR" -name "*.jsonl" -type f -exec bash -c 'echo "   - $(basename {}) ($(wc -l < {} | tr -d " ") 行)"' \;
echo ""

echo "💡 下一步：執行 Claude 萃取"
echo "   claude \"請依照 CLAUDE.md 進行萃取\""
