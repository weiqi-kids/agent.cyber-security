#!/bin/bash
# threat_feeds 資料保鮮監測腳本
# 檢查 Qdrant 中尚未標記 expires_at 的 IoC 是否已下線/結案
# 建議頻率：每 10 分鐘
#
# 用法：monitor.sh [--limit N] [--dry-run]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"

source "$PROJECT_ROOT/lib/args.sh"
source "$PROJECT_ROOT/lib/core.sh"
source "$PROJECT_ROOT/lib/api.sh"
source "$PROJECT_ROOT/lib/qdrant.sh"

parse_args "$@"

LAYER_NAME="threat_feeds"
COLLECTION="${QDRANT_COLLECTION:-cyber-security}"
LIMIT="${ARG_limit:-100}"
DRY_RUN="${ARG_dry_run:-}"

echo "🔍 [$LAYER_NAME] 開始資料保鮮監測..."
echo "========================================"

qdrant_init_env || { echo "❌ Qdrant 連線失敗" >&2; exit 1; }

# 查詢尚未標記 expires_at 的 points
echo "📡 查詢活躍 IoC（無 expires_at）..."
POINTS_JSON="$(qdrant_scroll_without_field "$COLLECTION" "expires_at" "$LAYER_NAME" "$LIMIT")"

TOTAL="$(printf '%s' "$POINTS_JSON" | jq 'length')"
echo "📊 找到 $TOTAL 筆未結案的 IoC"

if [[ "$TOTAL" -eq 0 ]]; then
  echo "✅ 無需檢查"
  exit 0
fi

EXPIRED_COUNT=0
ACTIVE_COUNT=0
CHECK_FAIL=0

########################################
# 逐筆檢查 IoC 狀態
########################################

printf '%s' "$POINTS_JSON" | jq -c '.[]' | while IFS= read -r point; do
  POINT_ID="$(printf '%s' "$point" | jq -r '.id')"
  PAYLOAD="$(printf '%s' "$point" | jq -c '.payload')"
  CATEGORY="$(printf '%s' "$PAYLOAD" | jq -r '.category // "unknown"')"
  TITLE="$(printf '%s' "$PAYLOAD" | jq -r '.title // "untitled"')"
  SOURCE_URL="$(printf '%s' "$PAYLOAD" | jq -r '.source_url // ""')"
  CONTENT="$(printf '%s' "$PAYLOAD" | jq -r '.original_content // ""')"

  EXPIRED=false
  EXPIRED_REASON=""

  case "$CATEGORY" in
    malicious_url)
      # URLhaus: 用 URL 查詢狀態
      IOC_URL="$(printf '%s' "$CONTENT" | grep -oE 'hxxps?://[^ ]+' | head -1 | sed 's/hxxp/http/g; s/hxxps/https/g')"
      if [[ -n "$IOC_URL" ]]; then
        TMP_RESP="$(mktemp)"
        if api_fetch_json "https://urlhaus-api.abuse.ch/v1/url/" "$TMP_RESP" "POST" "url=$IOC_URL"; then
          STATUS="$(jq -r '.url_status // "unknown"' "$TMP_RESP" 2>/dev/null)"
          if [[ "$STATUS" == "offline" ]] || [[ "$STATUS" == "unknown" && "$(jq -r '.query_status' "$TMP_RESP" 2>/dev/null)" == "no_results" ]]; then
            EXPIRED=true
            EXPIRED_REASON="URLhaus status: $STATUS"
          fi
        else
          ((CHECK_FAIL++)) || true
        fi
        rm -f "$TMP_RESP"
        sleep 1  # Rate limit
      fi
      ;;

    c2_infrastructure)
      # Feodo Tracker: 用 IP 查詢狀態
      IOC_IP="$(printf '%s' "$CONTENT" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -1)"
      if [[ -n "$IOC_IP" ]]; then
        TMP_RESP="$(mktemp)"
        if api_fetch_json "https://feodotracker.abuse.ch/api/v1/" "$TMP_RESP" "POST" "query=host&host=$IOC_IP"; then
          STATUS="$(jq -r '.data[0].status // "unknown"' "$TMP_RESP" 2>/dev/null)"
          if [[ "$STATUS" == "offline" ]]; then
            EXPIRED=true
            EXPIRED_REASON="Feodo Tracker status: offline"
          fi
        else
          ((CHECK_FAIL++)) || true
        fi
        rm -f "$TMP_RESP"
        sleep 1
      fi
      ;;

    malware_sample)
      # MalwareBazaar: 用 SHA256 查詢
      SHA256="$(printf '%s' "$CONTENT" | grep -oE '[a-f0-9]{64}' | head -1)"
      if [[ -n "$SHA256" ]]; then
        TMP_RESP="$(mktemp)"
        if api_fetch_json "https://mb-api.abuse.ch/api/v1/" "$TMP_RESP" "POST" "query=get_info&hash=$SHA256"; then
          QUERY_STATUS="$(jq -r '.query_status // "unknown"' "$TMP_RESP" 2>/dev/null)"
          if [[ "$QUERY_STATUS" == "hash_not_found" ]] || [[ "$QUERY_STATUS" == "no_results" ]]; then
            EXPIRED=true
            EXPIRED_REASON="MalwareBazaar: sample removed"
          fi
        else
          ((CHECK_FAIL++)) || true
        fi
        rm -f "$TMP_RESP"
        sleep 1
      fi
      ;;

    ioc_indicator)
      # ThreatFox: 用 IoC 查詢
      IOC_VALUE="$(printf '%s' "$CONTENT" | grep -oE '`[^`]+`' | head -1 | tr -d '`')"
      if [[ -n "$IOC_VALUE" ]]; then
        TMP_RESP="$(mktemp)"
        SEARCH_BODY="$(jq -nc --arg ioc "$IOC_VALUE" '{query: "search_ioc", search_term: $ioc}')"
        if api_fetch_json "https://threatfox-api.abuse.ch/api/v1/" "$TMP_RESP" "POST" "$SEARCH_BODY"; then
          QUERY_STATUS="$(jq -r '.query_status // "unknown"' "$TMP_RESP" 2>/dev/null)"
          CONFIDENCE="$(jq -r '.data[0].confidence_level // 100' "$TMP_RESP" 2>/dev/null)"
          if [[ "$QUERY_STATUS" == "no_result" ]] || [[ "$CONFIDENCE" -eq 0 ]]; then
            EXPIRED=true
            EXPIRED_REASON="ThreatFox: IoC removed or confidence=0"
          fi
        else
          ((CHECK_FAIL++)) || true
        fi
        rm -f "$TMP_RESP"
        sleep 1
      fi
      ;;
  esac

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
