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

# 已處理 ID 追蹤目錄
PROCESSED_DIR="$RAW_DIR/.processed"
mkdir -p "$PROCESSED_DIR"

########################################
# 主邏輯
########################################

echo "📡 [$LAYER_NAME] 開始擷取資料..."
echo "========================================"

TOTAL_ITEMS=0
NEW_ITEMS=0
SKIP_ITEMS=0
SUCCESS_COUNT=0
FAIL_COUNT=0

# --- URLhaus — 最近惡意 URL ---
echo "📥 擷取 URLhaus（最近惡意 URL）..."
if api_fetch_json \
  "https://urlhaus.abuse.ch/downloads/json_recent/" \
  "$RAW_DIR/urlhaus-recent.json"; then
  # URLhaus JSON 結構: { "ID": [{ ... }], "ID2": [{ ... }] }
  # 需要展開成 JSONL（每個 ID 的第一個元素，ID 作為 key）
  if jq -c 'to_entries[] | .value[0] + {"id": .key}' \
    "$RAW_DIR/urlhaus-recent.json" > "$RAW_DIR/urlhaus-recent-full.jsonl" 2>/dev/null; then
    UH_FULL="$(wc -l < "$RAW_DIR/urlhaus-recent-full.jsonl" | tr -d ' ')"

    # 客戶端去重：過濾已處理的 ID
    UH_NEW=$(api_dedup_jsonl \
      "$RAW_DIR/urlhaus-recent-full.jsonl" \
      "id" \
      "$PROCESSED_DIR/urlhaus-ids.txt" \
      "$RAW_DIR/urlhaus-recent.jsonl")

    UH_SKIP=$((UH_FULL - UH_NEW))
    TOTAL_ITEMS=$((TOTAL_ITEMS + UH_FULL))
    NEW_ITEMS=$((NEW_ITEMS + UH_NEW))
    SKIP_ITEMS=$((SKIP_ITEMS + UH_SKIP))
    ((SUCCESS_COUNT++))
    echo "✅ 成功: 總計 $UH_FULL, 新增 $UH_NEW, 略過 $UH_SKIP"
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
  }' "$RAW_DIR/malwarebazaar-recent.csv" > "$RAW_DIR/malwarebazaar-recent-full.jsonl" 2>/dev/null; then
    MB_FULL="$(wc -l < "$RAW_DIR/malwarebazaar-recent-full.jsonl" | tr -d ' ')"

    # 客戶端去重：使用 sha256 作為 ID
    MB_NEW=$(api_dedup_jsonl \
      "$RAW_DIR/malwarebazaar-recent-full.jsonl" \
      "sha256" \
      "$PROCESSED_DIR/malwarebazaar-ids.txt" \
      "$RAW_DIR/malwarebazaar-recent.jsonl")

    MB_SKIP=$((MB_FULL - MB_NEW))
    TOTAL_ITEMS=$((TOTAL_ITEMS + MB_FULL))
    NEW_ITEMS=$((NEW_ITEMS + MB_NEW))
    SKIP_ITEMS=$((SKIP_ITEMS + MB_SKIP))
    ((SUCCESS_COUNT++))
    echo "✅ 成功: 總計 $MB_FULL, 新增 $MB_NEW, 略過 $MB_SKIP"
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
  # ThreatFox JSON 結構: { "ID": [{ ... }], ... }，key 是 ID
  if jq -c 'to_entries[] | .value[0] + {"id": .key}' \
    "$RAW_DIR/threatfox-recent.json" > "$RAW_DIR/threatfox-recent-full.jsonl" 2>/dev/null; then
    TF_FULL="$(wc -l < "$RAW_DIR/threatfox-recent-full.jsonl" | tr -d ' ')"

    # 客戶端去重：使用 id 欄位
    TF_NEW=$(api_dedup_jsonl \
      "$RAW_DIR/threatfox-recent-full.jsonl" \
      "id" \
      "$PROCESSED_DIR/threatfox-ids.txt" \
      "$RAW_DIR/threatfox-recent.jsonl")

    TF_SKIP=$((TF_FULL - TF_NEW))
    TOTAL_ITEMS=$((TOTAL_ITEMS + TF_FULL))
    NEW_ITEMS=$((NEW_ITEMS + TF_NEW))
    SKIP_ITEMS=$((SKIP_ITEMS + TF_SKIP))
    ((SUCCESS_COUNT++))
    echo "✅ 成功: 總計 $TF_FULL, 新增 $TF_NEW, 略過 $TF_SKIP"
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
  # 為每筆資料生成唯一 ID（ip:port 組合）
  if jq -c '.[] | . + {"_id": "\(.ip_address):\(.port)"}' \
    "$RAW_DIR/feodo-c2.json" > "$RAW_DIR/feodo-c2-full.jsonl" 2>/dev/null; then
    FT_FULL="$(wc -l < "$RAW_DIR/feodo-c2-full.jsonl" | tr -d ' ')"

    # 客戶端去重：使用 ip:port 作為 ID
    FT_NEW=$(api_dedup_jsonl \
      "$RAW_DIR/feodo-c2-full.jsonl" \
      "_id" \
      "$PROCESSED_DIR/feodo-ids.txt" \
      "$RAW_DIR/feodo-c2.jsonl")

    FT_SKIP=$((FT_FULL - FT_NEW))
    TOTAL_ITEMS=$((TOTAL_ITEMS + FT_FULL))
    NEW_ITEMS=$((NEW_ITEMS + FT_NEW))
    SKIP_ITEMS=$((SKIP_ITEMS + FT_SKIP))
    ((SUCCESS_COUNT++))
    echo "✅ 成功: 總計 $FT_FULL, 新增 $FT_NEW, 略過 $FT_SKIP"
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

# 去重統計
echo "📊 去重統計："
echo "   🆕 新增項目: $NEW_ITEMS"
echo "   ⏭️  略過項目: $SKIP_ITEMS (已處理)"
if [[ $TOTAL_ITEMS -gt 0 ]]; then
  DEDUP_RATE=$((SKIP_ITEMS * 100 / TOTAL_ITEMS))
  echo "   📉 去重率: ${DEDUP_RATE}%"
fi
echo ""

# 產出的 JSONL 檔案清單（僅顯示待處理檔案）
echo "📁 待萃取的 JSONL 檔案："
for f in "$RAW_DIR"/*.jsonl; do
  if [[ -f "$f" ]] && [[ "$(basename "$f")" != *"-full.jsonl" ]]; then
    COUNT="$(wc -l < "$f" | tr -d ' ')"
    echo "   - $(basename "$f") ($COUNT 行)"
  fi
done
echo ""

# 已處理 ID 統計
echo "📋 已處理 ID 累計："
for f in "$PROCESSED_DIR"/*.txt; do
  if [[ -f "$f" ]]; then
    COUNT="$(wc -l < "$f" | tr -d ' ')"
    echo "   - $(basename "$f"): $COUNT 筆"
  fi
done
echo ""

echo "💡 下一步：執行 Claude 萃取"
echo "   claude \"請依照 CLAUDE.md 進行萃取\""
