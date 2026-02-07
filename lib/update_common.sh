#!/usr/bin/env bash
# update_common.sh - 共用批次更新流程
# 提供 4 個 Layer update.sh 共用的批次 embedding + 批次 upsert 邏輯
# 注意：預期被其他 script 用 `source` 載入

if [[ -n "${UPDATE_COMMON_SH_LOADED:-}" ]]; then
  return 0 2>/dev/null || exit 0
fi
UPDATE_COMMON_SH_LOADED=1

_update_common_lib_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "${_update_common_lib_dir}/core.sh"
. "${_update_common_lib_dir}/chatgpt.sh"
. "${_update_common_lib_dir}/qdrant.sh"

########################################
# update_collect_files LAYER_NAME DOCS_DIR [--all|file1 file2 ...]
#
# 功能：
#   - 收集要處理的 .md 檔案清單
#   - 支援 --all（自動掃描）或指定檔案清單
#
# 設定全域變數：
#   UPDATE_MD_FILES: 檔案路徑陣列
#   UPDATE_N_FILES: 檔案數量
########################################
update_collect_files() {
  local layer_name="$1"
  local docs_dir="$2"
  shift 2

  UPDATE_MD_FILES=()
  if [[ $# -eq 0 ]] || [[ "${1:-}" == "--all" ]]; then
    while IFS= read -r -d '' f; do
      UPDATE_MD_FILES+=("$f")
    done < <(find "$docs_dir" -path "*/raw" -prune -o -name "*.md" -type f -print0 2>/dev/null)
    UPDATE_N_FILES=${#UPDATE_MD_FILES[@]}
    echo "📂 自動掃描模式：找到 ${UPDATE_N_FILES} 個 .md 檔案"
  else
    UPDATE_MD_FILES=("$@")
    UPDATE_N_FILES=$#
  fi
}

########################################
# update_filter_new_files COLLECTION LAYER_NAME
#
# 功能：
#   - 批次查詢已存在的 point IDs，過濾出新檔案
#
# 前置條件：
#   UPDATE_MD_FILES 已設定
#
# 設定全域變數：
#   UPDATE_NEW_FILES: 需要新增的檔案路徑陣列
#   UPDATE_NEW_IDS: 對應的 point ID 陣列
#   UPDATE_SKIP_COUNT: 跳過的檔案數
########################################
update_filter_new_files() {
  local collection="$1"
  local layer_name="$2"

  UPDATE_NEW_FILES=()
  UPDATE_NEW_IDS=()
  UPDATE_SKIP_COUNT=0

  if [[ ${UPDATE_N_FILES:-0} -eq 0 ]]; then
    return 0
  fi

  # Phase 1: 批次產生所有 ID（單一 Python 呼叫，避免 N 次 process spawn）
  local id_input_file id_output_file
  id_input_file="$(mktemp)"
  id_output_file="$(mktemp)"

  for f in "${UPDATE_MD_FILES[@]}"; do
    local dir="${f%/*}"
    local base="${f##*/}"
    echo "${layer_name}-${dir##*/}-${base%.md}" >> "$id_input_file"
  done

  echo "🔑 批次產生 ${UPDATE_N_FILES} 個 UUID..."
  _qdrant_ids_to_uuids_batch "$id_input_file" "$id_output_file"
  rm -f "$id_input_file"

  local all_ids=()
  while IFS= read -r uuid_line; do
    all_ids+=("$uuid_line")
  done < "$id_output_file"
  rm -f "$id_output_file"

  # Phase 2: 分批查詢已存在的 IDs（每批 500）
  local existing_file
  existing_file="$(mktemp)"
  local batch_size=500
  local total=${#all_ids[@]}
  local offset=0

  echo "🔍 批次查詢已存在的 IDs（共 ${total}，每批 ${batch_size}）..."

  while [[ $offset -lt $total ]]; do
    local end=$((offset + batch_size))
    [[ $end -gt $total ]] && end=$total

    # 組裝此批次的 JSON array
    local batch_ids_json="["
    local first=1
    for ((idx=offset; idx<end; idx++)); do
      if [[ $first -eq 1 ]]; then first=0; else batch_ids_json+=","; fi
      batch_ids_json+="\"${all_ids[$idx]}\""
    done
    batch_ids_json+="]"

    # 查詢 Qdrant，將結果逐行寫入檔案
    local batch_existing
    batch_existing="$(qdrant_get_existing_ids "$collection" "$batch_ids_json" 2>/dev/null)" || batch_existing="[]"
    printf '%s' "$batch_existing" | jq -r '.[]' >> "$existing_file" 2>/dev/null

    offset=$end
    echo "  📡 已查詢 $offset / $total" >&2
  done

  # Phase 3: 單次 grep 做集合差運算（相容 bash 3.2，避免 N 次 process spawn）
  local all_ids_file
  all_ids_file="$(mktemp)"
  printf '%s\n' "${all_ids[@]}" > "$all_ids_file"

  # 一次 grep 找出所有已存在 ID 的行號（1-based）
  local skip_lines_file
  skip_lines_file="$(mktemp)"
  if [[ -s "$existing_file" ]]; then
    grep -Fxnf "$existing_file" "$all_ids_file" 2>/dev/null | \
      cut -d: -f1 | sort -n > "$skip_lines_file" || true
  else
    > "$skip_lines_file"
  fi
  rm -f "$all_ids_file" "$existing_file"

  # 載入跳過行號（0-based index）
  local skip_arr=()
  while IFS= read -r ln; do
    skip_arr+=("$((ln - 1))")
  done < "$skip_lines_file"
  rm -f "$skip_lines_file"

  UPDATE_SKIP_COUNT=${#skip_arr[@]}

  # Merge-style 單次掃描：skip_arr 已排序，逐步比對
  local skip_idx=0
  local n_skip=${#skip_arr[@]}
  local i=0
  for f in "${UPDATE_MD_FILES[@]}"; do
    if [[ $skip_idx -lt $n_skip ]] && [[ "${skip_arr[$skip_idx]}" == "$i" ]]; then
      ((skip_idx++))
    else
      UPDATE_NEW_FILES+=("$f")
      UPDATE_NEW_IDS+=("${all_ids[$i]}")
    fi
    ((i++))
  done

  echo "🔍 過濾結果：${#UPDATE_NEW_FILES[@]} 筆新增 / ${UPDATE_SKIP_COUNT} 筆跳過"
}

########################################
# update_extract_texts EXTRACT_FN TEXTS_FILE
#
# 功能：
#   - 對每個新檔案呼叫 EXTRACT_FN，萃取 embed text
#   - 結果寫入 TEXTS_FILE（每行一個 JSON string）
#
# 前置條件：
#   UPDATE_NEW_FILES 已設定
#
# 參數：
#   EXTRACT_FN: 萃取函式名稱（接收 md_file 路徑，stdout 輸出純文字）
#   TEXTS_FILE: 輸出檔案路徑
########################################
update_extract_texts() {
  local extract_fn="$1"
  local texts_file="$2"

  > "$texts_file"  # 清空

  for f in "${UPDATE_NEW_FILES[@]}"; do
    local text
    text="$("$extract_fn" "$f")"
    # 轉為 JSON string 寫入（確保特殊字元被 escape）
    printf '%s\n' "$text" | jq -Rs '.' >> "$texts_file"
  done

  echo "📝 萃取完成：$(wc -l < "$texts_file" | tr -d ' ') 筆 embed text"
}

########################################
# update_build_payloads BUILD_PAYLOAD_FN PAYLOADS_FILE
#
# 功能：
#   - 對每個新檔案呼叫 BUILD_PAYLOAD_FN，建構 Qdrant payload
#   - 結果寫入 PAYLOADS_FILE（JSONL，每行一個 JSON object）
#
# 前置條件：
#   UPDATE_NEW_FILES 已設定
#
# 參數：
#   BUILD_PAYLOAD_FN: payload 建構函式名稱（接收 md_file 路徑，stdout 輸出 JSON）
#   PAYLOADS_FILE: 輸出檔案路徑
########################################
update_build_payloads() {
  local build_fn="$1"
  local payloads_file="$2"

  > "$payloads_file"

  for f in "${UPDATE_NEW_FILES[@]}"; do
    local payload_line
    payload_line="$("$build_fn" "$f" | tr -d '\n')"
    echo "$payload_line" >> "$payloads_file"
  done
}

########################################
# update_batch_upsert COLLECTION VECTORS_FILE PAYLOADS_FILE [UPSERT_BATCH_SIZE]
#
# 功能：
#   - 將 vectors + payloads 批次 upsert 到 Qdrant
#   - 每 UPSERT_BATCH_SIZE 筆一批
#
# 前置條件：
#   UPDATE_NEW_FILES, UPDATE_NEW_IDS 已設定
#
# 參數：
#   COLLECTION: Qdrant collection 名稱
#   VECTORS_FILE: 向量檔案（JSONL，每行一個 JSON vector array）
#   PAYLOADS_FILE: payload 檔案（JSONL，每行一個 JSON object）
#   UPSERT_BATCH_SIZE: 每批 upsert 筆數（預設 100）
#
# 回傳全域變數：
#   UPDATE_NEW_COUNT: 成功新增筆數
#   UPDATE_FAIL_COUNT: 失敗筆數
########################################
update_batch_upsert() {
  local collection="$1"
  local vectors_file="$2"
  local payloads_file="$3"
  local upsert_batch="${4:-100}"

  UPDATE_NEW_COUNT=0
  UPDATE_FAIL_COUNT=0

  local total=${#UPDATE_NEW_FILES[@]}
  if [[ $total -eq 0 ]]; then
    return 0
  fi

  local processed=0

  while [[ $processed -lt $total ]]; do
    local start=$((processed + 1))
    local end=$((processed + upsert_batch))
    [[ $end -gt $total ]] && end=$total
    local count=$((end - start + 1))

    echo "📤 [batch_upsert] 批次 upsert: 第 ${start}–${end} 筆（共 ${total}）" >&2

    # 組裝 points JSON array
    local points_json="["
    local first=1
    for ((idx=start-1; idx<end; idx++)); do
      local line_num=$((idx + 1))
      local point_id="${UPDATE_NEW_IDS[$idx]}"
      local vector
      vector="$(sed -n "${line_num}p" "$vectors_file")"
      local payload
      payload="$(sed -n "${line_num}p" "$payloads_file")"

      # 跳過 embedding 失敗的（null vector）
      if [[ "$vector" == "null" ]] || [[ -z "$vector" ]]; then
        ((UPDATE_FAIL_COUNT++))
        continue
      fi

      if [[ $first -eq 1 ]]; then
        first=0
      else
        points_json+=","
      fi
      points_json+="$(jq -nc --arg id "$point_id" --argjson vec "$vector" --argjson pay "$payload" \
        '{id: $id, vector: $vec, payload: $pay}')"
    done
    points_json+="]"

    # 跳過全部失敗的批次
    if [[ "$points_json" == "[]" ]]; then
      processed=$end
      continue
    fi

    if qdrant_upsert_points_batch "$collection" "$points_json"; then
      local batch_count
      batch_count="$(printf '%s' "$points_json" | jq 'length')"
      ((UPDATE_NEW_COUNT += batch_count))
    else
      echo "❌ [batch_upsert] 批次 ${start}–${end} upsert 失敗，改用逐筆" >&2
      # fallback: 逐筆 upsert
      for ((idx=start-1; idx<end; idx++)); do
        local line_num=$((idx + 1))
        local point_id="${UPDATE_NEW_IDS[$idx]}"
        local vector
        vector="$(sed -n "${line_num}p" "$vectors_file")"
        local payload
        payload="$(sed -n "${line_num}p" "$payloads_file")"

        if [[ "$vector" == "null" ]] || [[ -z "$vector" ]]; then
          continue  # 已在上面計算過
        fi

        if qdrant_upsert_point "$collection" "$point_id" "$vector" "$payload"; then
          ((UPDATE_NEW_COUNT++))
        else
          ((UPDATE_FAIL_COUNT++))
        fi
        sleep 0.2
      done
    fi

    processed=$end
  done

  echo "📊 新增: ${UPDATE_NEW_COUNT} 筆 | 跳過: ${UPDATE_SKIP_COUNT} 筆 | 失敗: ${UPDATE_FAIL_COUNT} 筆"
}

########################################
# update_check_review_needed LAYER_NAME
#
# 功能：
#   - 檢查 MD_FILES 中是否有 [REVIEW_NEEDED] 標記
#   - 若有，輸出清單並嘗試建立 GitHub Issue
#
# 前置條件：
#   UPDATE_MD_FILES 已設定
########################################
update_check_review_needed() {
  local layer_name="$1"

  echo "🔍 檢查 REVIEW_NEEDED 標記..."
  local review_files=""
  if [[ ${UPDATE_N_FILES:-0} -gt 0 ]]; then
    for f in "${UPDATE_MD_FILES[@]}"; do
      if [[ -f "$f" ]] && grep -q "\[REVIEW_NEEDED\]" "$f" 2>/dev/null; then
        review_files+="  - $f\n"
      fi
    done
  fi

  if [[ -n "$review_files" ]]; then
    echo "⚠️ 發現需要審核的檔案："
    echo -e "$review_files"

    if command -v gh >/dev/null 2>&1; then
      gh issue create \
        --title "[Extractor] $layer_name - 需要人工審核" \
        --label "review-needed" \
        --body "偵測到 [REVIEW_NEEDED] 標記，請檢查以下檔案：
$(echo -e "$review_files")

發生時間：$(date -u '+%Y-%m-%d %H:%M UTC')
相關目錄：docs/Extractor/$layer_name/" 2>/dev/null || {
        echo "⚠️ 無法建立 GitHub Issue（可能未設定 gh CLI）"
      }
    fi
  else
    echo "✅ 無 REVIEW_NEEDED 標記"
  fi
}

########################################
# update_run_batch_pipeline COLLECTION LAYER_NAME EXTRACT_FN BUILD_PAYLOAD_FN [EMBED_BATCH_SIZE] [UPSERT_BATCH_SIZE]
#
# 功能：
#   - 完整批次流程：過濾 → 萃取文字 → 批次 embedding → 批次 upsert
#
# 參數：
#   COLLECTION: Qdrant collection 名稱
#   LAYER_NAME: Layer 名稱
#   EXTRACT_FN: embed text 萃取函式
#   BUILD_PAYLOAD_FN: payload 建構函式
#   EMBED_BATCH_SIZE: embedding 批次大小（預設 50）
#   UPSERT_BATCH_SIZE: upsert 批次大小（預設 100）
########################################
update_run_batch_pipeline() {
  local collection="$1"
  local layer_name="$2"
  local extract_fn="$3"
  local build_payload_fn="$4"
  local embed_batch="${5:-50}"
  local upsert_batch="${6:-100}"

  # Phase 1: 過濾已存在的檔案
  update_filter_new_files "$collection" "$layer_name"

  if [[ ${#UPDATE_NEW_FILES[@]} -eq 0 ]]; then
    echo "ℹ️  無新增檔案需要處理"
    return 0
  fi

  # Phase 2: 萃取 embed text
  local tmp_texts tmp_vectors tmp_payloads
  tmp_texts="$(mktemp)"
  tmp_vectors="$(mktemp)"
  tmp_payloads="$(mktemp)"

  update_extract_texts "$extract_fn" "$tmp_texts"

  # Phase 3: 批次 embedding
  echo "🧠 開始批次 embedding（batch_size=${embed_batch}）..."
  chatgpt_embed_batch "$tmp_texts" "$tmp_vectors" "$embed_batch"

  # Phase 4: 建構 payloads
  update_build_payloads "$build_payload_fn" "$tmp_payloads"

  # Phase 5: 批次 upsert
  echo "📤 開始批次 upsert（batch_size=${upsert_batch}）..."
  update_batch_upsert "$collection" "$tmp_vectors" "$tmp_payloads" "$upsert_batch"

  # 清理臨時檔案
  rm -f "$tmp_texts" "$tmp_vectors" "$tmp_payloads"
}
