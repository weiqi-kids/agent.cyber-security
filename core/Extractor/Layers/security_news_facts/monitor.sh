#!/bin/bash
# security_news_facts 資料保鮮監測腳本
# 檢查 Qdrant 中尚未標記 expires_at 的新聞事實是否已結案/解決
# 建議頻率：每 60 分鐘
#
# 用法：monitor.sh [--limit N] [--dry-run]
#
# 判定邏輯：
#   - 查原始公告連結，若頁面更新為「已解決/已緩解」→ 結案
#   - 同一事件有後續公告標示事件結束 → 結案
#   - 事件超過 90 天且無後續更新 → 自動結案（TTL 機制）

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"

source "$PROJECT_ROOT/lib/args.sh"
source "$PROJECT_ROOT/lib/core.sh"
source "$PROJECT_ROOT/lib/api.sh"
source "$PROJECT_ROOT/lib/qdrant.sh"

parse_args "$@"

LAYER_NAME="security_news_facts"
COLLECTION="${QDRANT_COLLECTION:-cyber-security}"
LIMIT="${ARG_limit:-100}"
DRY_RUN="${ARG_dry_run:-}"

# 90 天 TTL（安全新聞的最大存活期）
TTL_DAYS=90

echo "🔍 [$LAYER_NAME] 開始資料保鮮監測..."
echo "========================================"

qdrant_init_env || { echo "❌ Qdrant 連線失敗" >&2; exit 1; }

# 查詢尚未標記 expires_at 的 points
echo "📡 查詢活躍新聞事實（無 expires_at）..."
POINTS_JSON="$(qdrant_scroll_without_field "$COLLECTION" "expires_at" "$LAYER_NAME" "$LIMIT")"

TOTAL="$(printf '%s' "$POINTS_JSON" | jq 'length')"
echo "📊 找到 $TOTAL 筆未結案的新聞事實"

if [[ "$TOTAL" -eq 0 ]]; then
  echo "✅ 無需檢查"
  exit 0
fi

EXPIRED_COUNT=0
ACTIVE_COUNT=0
CHECK_FAIL=0

# 計算 TTL 截止日期
if [[ "$(uname -s)" == "Darwin" ]]; then
  TTL_CUTOFF="$(date -u -v-${TTL_DAYS}d '+%Y-%m-%d')"
else
  TTL_CUTOFF="$(date -u -d "${TTL_DAYS} days ago" '+%Y-%m-%d')"
fi

########################################
# 逐筆檢查新聞事實狀態
########################################

printf '%s' "$POINTS_JSON" | jq -c '.[]' | while IFS= read -r point; do
  POINT_ID="$(printf '%s' "$point" | jq -r '.id')"
  PAYLOAD="$(printf '%s' "$point" | jq -c '.payload')"
  TITLE="$(printf '%s' "$PAYLOAD" | jq -r '.title // "untitled"')"
  DATE="$(printf '%s' "$PAYLOAD" | jq -r '.date // ""')"
  SOURCE_URL="$(printf '%s' "$PAYLOAD" | jq -r '.source_url // ""')"
  CATEGORY="$(printf '%s' "$PAYLOAD" | jq -r '.category // "unknown"')"

  EXPIRED=false
  EXPIRED_REASON=""

  # 檢查 1: TTL 過期（超過 90 天的新聞自動結案）
  if [[ -n "$DATE" ]] && [[ "$DATE" < "$TTL_CUTOFF" ]]; then
    EXPIRED=true
    EXPIRED_REASON="TTL expired: event date $DATE > ${TTL_DAYS} days ago"
  fi

  # 檢查 2: 嘗試 HTTP HEAD 確認原始公告是否仍可存取
  if [[ "$EXPIRED" == "false" ]] && [[ -n "$SOURCE_URL" ]]; then
    HTTP_CODE="$(curl -sS -o /dev/null -w '%{http_code}' --connect-timeout 10 --max-time 15 \
      -L "$SOURCE_URL" 2>/dev/null)" || HTTP_CODE="000"

    if [[ "$HTTP_CODE" == "404" ]] || [[ "$HTTP_CODE" == "410" ]]; then
      EXPIRED=true
      EXPIRED_REASON="Source URL returned HTTP $HTTP_CODE (removed)"
    elif [[ "$HTTP_CODE" == "000" ]]; then
      # 連線失敗，不判定為結案
      ((CHECK_FAIL++)) || true
    fi
    sleep 0.5  # Rate limit
  fi

  if [[ "$EXPIRED" == "true" ]]; then
    echo "  ⏰ 結案: $TITLE — $EXPIRED_REASON"
    if [[ -z "$DRY_RUN" ]]; then
      NOW="$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
      qdrant_set_payload "$COLLECTION" \
        "[\"$POINT_ID\"]" \
        "$(jq -nc --arg ea "$NOW" --arg er "$EXPIRED_REASON" '{expires_at: $ea, expired_reason: $er}')" \
        || echo "  ⚠️  寫入 expires_at 失敗: $POINT_ID" >&2
    else
      echo "  [DRY-RUN] 跳過寫入"
    fi
    ((EXPIRED_COUNT++)) || true
  else
    ((ACTIVE_COUNT++)) || true
  fi
done

echo ""
echo "========================================"
echo "📊 監測結果："
echo "   總數: $TOTAL"
echo "   已結案: $EXPIRED_COUNT"
echo "   仍活躍: $ACTIVE_COUNT"
echo "   檢查失敗: $CHECK_FAIL"
echo "✅ Monitor completed: $LAYER_NAME"
