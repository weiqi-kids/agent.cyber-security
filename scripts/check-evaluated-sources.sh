#!/bin/bash
# check-evaluated-sources.sh
# 每日檢查「評估中」資料源的連線狀態
# 由 GitHub Action 排程執行，直接更新 docs/explored.md
#
# 邏輯：
#   - 對每個「評估中」項目做 HTTP 連線測試
#   - 成功：重置連續失敗計數，更新最後成功日期
#   - 失敗：連續失敗 +1
#   - 連續失敗 ≥ 30 天：標記為「待排除」，等待 Claude CLI 處理

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
EXPLORED="$PROJECT_ROOT/docs/explored.md"
TODAY="$(date -u '+%Y-%m-%d')"
FAILURE_THRESHOLD=30

trim() { sed 's/^ *//;s/ *$//' <<< "$1"; }

echo "🔍 檢查「評估中」資料源連線狀態 ($TODAY)"
echo "========================================"

if [[ ! -f "$EXPLORED" ]]; then
  echo "❌ 找不到 $EXPLORED"
  exit 1
fi

TMPFILE="$(mktemp)"
trap 'rm -f "$TMPFILE"' EXIT

in_eval=0
past_header=0
checked=0
ok_count=0
fail_count=0
pending_count=0

while IFS= read -r line || [[ -n "$line" ]]; do
  # 偵測「評估中」區塊開始
  if [[ "$line" == "## 評估中" ]]; then
    in_eval=1
    past_header=0
    printf '%s\n' "$line" >> "$TMPFILE"
    continue
  fi

  # 偵測下一個區塊 → 離開「評估中」
  if [[ $in_eval -eq 1 ]] && [[ "$line" =~ ^##\  ]]; then
    in_eval=0
    past_header=0
    printf '%s\n' "$line" >> "$TMPFILE"
    continue
  fi

  # 在區塊內但尚未過表頭：原樣輸出（含說明文字、表頭、分隔線）
  if [[ $in_eval -eq 1 ]] && [[ $past_header -eq 0 ]]; then
    printf '%s\n' "$line" >> "$TMPFILE"
    if [[ "$line" =~ ^\|--+ ]]; then
      past_header=1
    fi
    continue
  fi

  # 處理資料列
  if [[ $in_eval -eq 1 ]] && [[ $past_header -eq 1 ]] && [[ "$line" =~ ^\| ]]; then
    # 欄位：[0]="" [1]=資料源 [2]=類型 [3]=URL [4]=語言 [5]=發現日期 [6]=狀態 [7]=最後檢查 [8]=連續失敗 [9]=最後成功 [10]=""
    IFS='|' read -ra f <<< "$line"

    name="$(trim "${f[1]:-}")"
    type="$(trim "${f[2]:-}")"
    url="$(trim "${f[3]:-}")"
    lang="$(trim "${f[4]:-}")"
    discovery="$(trim "${f[5]:-}")"
    consec="$(trim "${f[8]:-0}")"
    last_success="$(trim "${f[9]:-從未}")"

    # 確保 consec 是數字
    if ! [[ "$consec" =~ ^[0-9]+$ ]]; then
      consec=0
    fi

    # HTTP 連線測試
    http_code="$(curl -sS -o /dev/null -w '%{http_code}' \
      --connect-timeout 10 --max-time 30 \
      -H "User-Agent: SourceEvaluator/1.0" \
      "$url" 2>/dev/null || echo "000")"

    if [[ "$http_code" =~ ^2 ]]; then
      # 連線成功 → 重置計數
      status="連線成功"
      consec=0
      last_success="$TODAY"
      ((ok_count++))
      echo "  ✅ $name → HTTP $http_code"
    else
      # 連線失敗 → 累加計數
      consec=$((consec + 1))
      ((fail_count++))

      if [[ $consec -ge $FAILURE_THRESHOLD ]]; then
        status="待排除"
        ((pending_count++))
        echo "  ⛔ $name → HTTP $http_code（連續 ${consec} 天，已標記待排除）"
      else
        status="連線失敗"
        echo "  ❌ $name → HTTP $http_code（連續 ${consec}/${FAILURE_THRESHOLD} 天）"
      fi
    fi

    ((checked++))

    # 重建資料列
    printf '| %s | %s | %s | %s | %s | %s | %s | %s | %s |\n' \
      "$name" "$type" "$url" "$lang" "$discovery" \
      "$status" "$TODAY" "$consec" "$last_success" >> "$TMPFILE"
    continue
  fi

  # 其餘行原樣輸出
  printf '%s\n' "$line" >> "$TMPFILE"
done < "$EXPLORED"

# 寫回
cp "$TMPFILE" "$EXPLORED"

echo ""
echo "========================================"
echo "✅ 檢查完成：$checked 個來源"
echo "   成功: $ok_count | 失敗: $fail_count | 待排除: $pending_count"

if [[ $pending_count -gt 0 ]]; then
  echo ""
  echo "⚠️  有 $pending_count 個來源標記為「待排除」，等待 Claude CLI 處理"
fi
