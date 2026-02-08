#!/usr/bin/env bash
# api.sh - API 資料源共用函式
# 注意：預期被其他 script 用 `source` 載入
# 不在這裡 set -euo pipefail，交給呼叫端決定。

if [[ -n "${API_SH_LOADED:-}" ]]; then
  return 0 2>/dev/null || exit 0
fi
API_SH_LOADED=1

_api_lib_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "${_api_lib_dir}/core.sh"

########################################
# api_rate_limit_wait SOURCE_ID MIN_INTERVAL_SECONDS
#
# 功能：
#   - 依據來源 ID 追蹤 API 呼叫時間，確保兩次呼叫間隔不低於指定秒數
#   - 使用 /tmp 暫存時間戳記
#
# 參數：
#   SOURCE_ID: 來源識別碼（如 "nvd-cve"）
#   MIN_INTERVAL_SECONDS: 最小間隔秒數（預設 1）
#
# 用法：
#   api_rate_limit_wait "nvd-cve" 40   # NVD 無 key：每 40 秒 1 次
########################################
api_rate_limit_wait() {
  local source_id="$1"
  local min_interval="${2:-1}"
  local ts_file="/tmp/.api_ratelimit_${source_id}"

  if [[ -f "$ts_file" ]]; then
    local last_ts now elapsed wait_time
    last_ts="$(cat "$ts_file" 2>/dev/null || echo "0")"
    now="$(date +%s)"
    elapsed=$((now - last_ts))

    if [[ $elapsed -lt $min_interval ]]; then
      wait_time=$((min_interval - elapsed))
      echo "⏳ [rate_limit] ${source_id}: 等待 ${wait_time}s（限速保護，間隔 ${min_interval}s）..." >&2
      sleep "$wait_time"
    fi
  fi

  # 更新時間戳記
  date +%s > "$ts_file"
}

########################################
# api_fetch_json URL OUTPUT_FILE [METHOD] [BODY] [HEADERS...]
#
# 功能：
#   - 通用 JSON API fetch（支援 GET/POST）
#   - 內建 retry + timeout + User-Agent
#
# 參數：
#   URL: API endpoint URL
#   OUTPUT_FILE: 輸出 JSON 檔案路徑
#   METHOD: HTTP 方法（預設 GET）
#   BODY: POST body（字串或 JSON）
#   HEADERS...: 額外 HTTP headers（格式 "Key: Value"）
#
# 回傳值：
#   0  = 成功
#   >0 = 失敗
########################################
api_fetch_json() {
  local url="$1"
  local output_file="$2"
  local method="${3:-GET}"
  local body="${4:-}"
  shift 4 2>/dev/null || shift $# 2>/dev/null
  # bash 3.2 + set -u 不支援空陣列展開，用計數器防護
  local _n_extra_headers=$#
  local headers=()
  [[ $_n_extra_headers -gt 0 ]] && headers=("$@")

  require_cmd curl || return 1

  local max_retries="${API_MAX_RETRIES:-3}"
  local retry_delay="${API_RETRY_DELAY:-3}"
  local http_code

  local curl_args=(
    -sS -L
    --tlsv1.2
    -H "User-Agent: IndustryIntelligenceArchitect/1.0"
    -H "Accept: application/json"
    -w '%{http_code}'
    -o "$output_file"
    --connect-timeout 15
    --max-time 120
  )

  # HTTP 方法
  if [[ "$method" == "POST" ]]; then
    curl_args+=(-X POST)
    if [[ -n "$body" ]]; then
      # 偵測是否為 JSON（以 { 或 [ 開頭）
      if [[ "$body" =~ ^[\{\[] ]]; then
        curl_args+=(-H "Content-Type: application/json" -d "$body")
      else
        curl_args+=(-H "Content-Type: application/x-www-form-urlencoded" -d "$body")
      fi
    fi
  fi

  # 額外 headers（bash 3.2 安全寫法）
  if [[ $_n_extra_headers -gt 0 ]]; then
    for h in "${headers[@]}"; do
      if [[ -n "$h" ]]; then
        curl_args+=(-H "$h")
      fi
    done
  fi

  for ((attempt=1; attempt<=max_retries; attempt++)); do
    http_code="$(
      curl "${curl_args[@]}" "$url" 2>/dev/null
    )" || {
      local rc=$?
      if [[ $attempt -lt $max_retries ]]; then
        echo "⚠️  [api_fetch_json] curl 失敗 (exit=$rc)，重試 $attempt/$max_retries..." >&2
        sleep $retry_delay
        continue
      fi
      echo "❌ [api_fetch_json] curl 失敗 (exit=$rc)，已重試 $max_retries 次" >&2
      return 1
    }

    if [[ "$http_code" =~ ^2[0-9][0-9]$ ]]; then
      return 0
    fi

    if [[ $attempt -lt $max_retries ]]; then
      echo "⚠️  [api_fetch_json] HTTP=${http_code}，重試 $attempt/$max_retries..." >&2
      sleep $retry_delay
    else
      echo "❌ [api_fetch_json] HTTP=${http_code}，已重試 $max_retries 次" >&2
      rm -f "$output_file"
      return 1
    fi
  done

  return 1
}

########################################
# api_json_to_jsonl JSON_FILE JQ_FILTER OUTPUT_FILE
#
# 功能：
#   - 將 JSON array 轉為 JSONL（每行一筆 JSON）
#
# 參數：
#   JSON_FILE: 輸入 JSON 檔案路徑
#   JQ_FILTER: jq 過濾器（從回應中提取 items）
#   OUTPUT_FILE: 輸出 JSONL 檔案路徑
#
# 回傳值：
#   0  = 成功
#   >0 = 失敗
########################################
api_json_to_jsonl() {
  local json_file="$1"
  local jq_filter="$2"
  local output_file="$3"

  require_cmd jq || return 1

  if [[ ! -f "$json_file" ]]; then
    echo "❌ [api_json_to_jsonl] 檔案不存在：$json_file" >&2
    return 1
  fi

  jq -c "$jq_filter" "$json_file" > "$output_file" 2>/dev/null || {
    echo "❌ [api_json_to_jsonl] jq 轉換失敗：$json_file (filter: $jq_filter)" >&2
    return 1
  }

  local count
  count="$(wc -l < "$output_file" | tr -d ' ')"
  echo "✅ [api_json_to_jsonl] 轉換完成：$count 筆 → $output_file" >&2
  return 0
}

########################################
# api_dedup_jsonl INPUT_JSONL ID_FIELD PROCESSED_FILE OUTPUT_JSONL
#
# 功能：
#   - 從 JSONL 中過濾掉已處理的項目（客戶端去重）
#   - 比對 ID 欄位與已處理 ID 清單
#
# 參數：
#   INPUT_JSONL: 輸入 JSONL 檔案路徑
#   ID_FIELD: JSON 中的 ID 欄位名稱（如 "id"、"sha256"）
#   PROCESSED_FILE: 已處理 ID 清單檔案路徑
#   OUTPUT_JSONL: 輸出 JSONL 檔案路徑（僅含新項目）
#
# 回傳值：
#   0 = 成功（stdout 輸出新增筆數）
#
# 用法：
#   NEW_COUNT=$(api_dedup_jsonl input.jsonl "id" processed.txt output.jsonl)
########################################
api_dedup_jsonl() {
  local input_jsonl="$1"
  local id_field="$2"
  local processed_file="$3"
  local output_jsonl="$4"

  require_cmd jq || return 1

  # 確保已處理清單檔案存在
  local processed_dir
  processed_dir="$(dirname "$processed_file")"
  mkdir -p "$processed_dir"
  touch "$processed_file"

  local total_count new_count skip_count

  # 計算總筆數
  total_count="$(wc -l < "$input_jsonl" | tr -d ' ')"

  if [[ ! -s "$processed_file" ]]; then
    # 已處理清單為空，全部都是新的
    cp "$input_jsonl" "$output_jsonl"
    new_count="$total_count"
    skip_count=0
  else
    # 使用 grep -v -F -f 進行高效過濾
    # 1. 提取所有 ID
    # 2. 過濾掉已處理的 ID
    # 3. 只保留新 ID 對應的行

    local tmp_ids tmp_new_ids
    tmp_ids="$(mktemp)"
    tmp_new_ids="$(mktemp)"

    # 提取當前所有 ID
    jq -r ".$id_field // empty" "$input_jsonl" > "$tmp_ids" 2>/dev/null

    # 找出新 ID（不在已處理清單中的）
    grep -v -F -x -f "$processed_file" "$tmp_ids" > "$tmp_new_ids" 2>/dev/null || true

    new_count="$(wc -l < "$tmp_new_ids" | tr -d ' ')"
    skip_count=$((total_count - new_count))

    if [[ "$new_count" -eq 0 ]]; then
      # 沒有新項目
      : > "$output_jsonl"
    else
      # 過濾 JSONL，只保留新 ID 的行
      # 使用 jq 的 select + 檔案讀取方式
      jq -c --slurpfile new_ids <(jq -R -s 'split("\n") | map(select(length > 0))' "$tmp_new_ids") \
        "select(.$id_field as \$id | \$new_ids[0] | index(\$id))" \
        "$input_jsonl" > "$output_jsonl" 2>/dev/null || {
        # 備用方案：逐行 grep
        : > "$output_jsonl"
        while IFS= read -r line; do
          local item_id
          item_id="$(echo "$line" | jq -r ".$id_field // empty" 2>/dev/null)"
          if [[ -n "$item_id" ]] && grep -q -F -x "$item_id" "$tmp_new_ids"; then
            echo "$line" >> "$output_jsonl"
          fi
        done < "$input_jsonl"
      }
    fi

    rm -f "$tmp_ids" "$tmp_new_ids"
  fi

  echo "📊 [dedup] 總計: $total_count, 新增: $new_count, 略過: $skip_count" >&2
  echo "$new_count"
  return 0
}

########################################
# api_mark_processed JSONL_FILE ID_FIELD PROCESSED_FILE
#
# 功能：
#   - 將 JSONL 中的 ID 加入已處理清單
#   - 供 update.sh 在萃取成功後呼叫
#
# 參數：
#   JSONL_FILE: 已成功處理的 JSONL 檔案路徑
#   ID_FIELD: JSON 中的 ID 欄位名稱
#   PROCESSED_FILE: 已處理 ID 清單檔案路徑
#
# 用法：
#   api_mark_processed urlhaus.jsonl "id" processed/urlhaus-ids.txt
########################################
api_mark_processed() {
  local jsonl_file="$1"
  local id_field="$2"
  local processed_file="$3"

  require_cmd jq || return 1

  if [[ ! -f "$jsonl_file" ]] || [[ ! -s "$jsonl_file" ]]; then
    return 0
  fi

  local processed_dir
  processed_dir="$(dirname "$processed_file")"
  mkdir -p "$processed_dir"

  # 提取 ID 並追加到已處理清單（去重）
  local tmp_new
  tmp_new="$(mktemp)"

  jq -r ".$id_field // empty" "$jsonl_file" > "$tmp_new" 2>/dev/null

  if [[ -s "$tmp_new" ]]; then
    cat "$tmp_new" >> "$processed_file"
    # 去重（保持順序無所謂，重點是唯一性）
    sort -u "$processed_file" -o "$processed_file"

    local added_count
    added_count="$(wc -l < "$tmp_new" | tr -d ' ')"
    echo "✅ [mark_processed] 已標記 $added_count 筆 ID 為已處理" >&2
  fi

  rm -f "$tmp_new"
  return 0
}

########################################
# api_paginate URL OUTPUT_FILE PAGE_PARAM PER_PAGE MAX_PAGES
#
# 功能：
#   - 分頁 API 支援（透過 query parameter 分頁）
#
# 參數：
#   URL: API base URL（不含分頁參數）
#   OUTPUT_FILE: 合併後的輸出 JSON 檔案
#   PAGE_PARAM: 分頁參數名（如 "page"、"offset"）
#   PER_PAGE: 每頁筆數
#   MAX_PAGES: 最大頁數
#
# 回傳值：
#   0  = 成功
#   >0 = 失敗
########################################
api_paginate() {
  local url="$1"
  local output_file="$2"
  local page_param="${3:-page}"
  local per_page="${4:-100}"
  local max_pages="${5:-5}"

  require_cmd jq || return 1
  require_cmd curl || return 1

  local tmp_dir
  tmp_dir="$(mktemp -d)"
  local separator="?"
  [[ "$url" == *"?"* ]] && separator="&"

  local total_items=0

  for ((page=1; page<=max_pages; page++)); do
    local page_url="${url}${separator}${page_param}=${page}&per_page=${per_page}"
    local page_file="${tmp_dir}/page_${page}.json"

    if ! api_fetch_json "$page_url" "$page_file"; then
      echo "⚠️  [api_paginate] 第 ${page} 頁失敗，停止分頁" >&2
      break
    fi

    # 檢查是否為空結果（停止分頁）
    local count
    count="$(jq 'if type == "array" then length else 0 end' "$page_file" 2>/dev/null || echo "0")"
    if [[ "$count" -eq 0 ]]; then
      echo "ℹ️  [api_paginate] 第 ${page} 頁無結果，分頁結束" >&2
      break
    fi

    total_items=$((total_items + count))

    # 限速（避免被 ban）
    sleep 1
  done

  # 合併所有頁面
  jq -s 'add // []' "${tmp_dir}"/page_*.json > "$output_file" 2>/dev/null || {
    echo "❌ [api_paginate] 合併頁面失敗" >&2
    rm -rf "$tmp_dir"
    return 1
  }

  rm -rf "$tmp_dir"
  echo "✅ [api_paginate] 分頁完成：${total_items} 筆 → $output_file" >&2
  return 0
}
