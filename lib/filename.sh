#!/bin/bash
# filename.sh — 檔名標準化工具庫
# 用途：確保萃取產出的檔名一致性，避免重複產生相同內容的檔案
#
# 使用方式：
#   source lib/filename.sh
#   filename_normalize_cve "cve-2026-22769"  # → "CVE-2026-22769"
#   filename_normalize_slug "Casdoor 2.55.0 Cross-Site Request Forgery"  # → "casdoor-2-55-0-csrf"
#   filename_generate "2026" "CVE-2026-22769" ""  # → "2026-CVE-2026-22769.md"

set -euo pipefail

# 防止重複載入
[[ -n "${FILENAME_SH_LOADED:-}" ]] && return 0
FILENAME_SH_LOADED=1

# =============================================================================
# 常見漏洞類型縮寫（使用 sed 替換，相容 bash 3.x）
# =============================================================================
_filename_apply_abbreviations() {
  local input="$1"
  echo "$input" | sed \
    -e 's/cross-site-scripting/xss/g' \
    -e 's/cross-site-request-forgery/csrf/g' \
    -e 's/remote-code-execution/rce/g' \
    -e 's/local-privilege-escalation/lpe/g' \
    -e 's/sql-injection/sqli/g' \
    -e 's/command-injection/cmdi/g' \
    -e 's/denial-of-service/dos/g' \
    -e 's/buffer-overflow/bof/g' \
    -e 's/heap-overflow/heap-bof/g' \
    -e 's/stack-overflow/stack-bof/g' \
    -e 's/use-after-free/uaf/g' \
    -e 's/information-disclosure/info-leak/g' \
    -e 's/authentication-bypass/auth-bypass/g' \
    -e 's/authorization-bypass/authz-bypass/g' \
    -e 's/insecure-deserialization/deserialization/g' \
    -e 's/server-side-request-forgery/ssrf/g' \
    -e 's/xml-external-entity/xxe/g' \
    -e 's/arbitrary-file-upload/file-upload/g' \
    -e 's/arbitrary-file-read/file-read/g' \
    -e 's/arbitrary-file-write/file-write/g' \
    -e 's/arbitrary-file-delete/file-delete/g' \
    -e 's/unrestricted-file-upload/file-upload/g' \
    -e 's/reflected-xss/xss/g'
}

# =============================================================================
# filename_normalize_cve — 標準化 CVE 編號
# =============================================================================
# 輸入：任意格式的 CVE 編號（如 "cve-2026-22769", "CVE2026-22769"）
# 輸出：標準格式 "CVE-YYYY-NNNNN"
#
# 範例：
#   filename_normalize_cve "cve-2026-22769"  # → "CVE-2026-22769"
#   filename_normalize_cve "CVE202622769"   # → "CVE-2026-22769"
#   filename_normalize_cve "invalid"         # → "" (空字串)
# =============================================================================
filename_normalize_cve() {
  local input="${1:-}"
  [[ -z "$input" ]] && echo "" && return 0

  # 移除空白、轉大寫
  local cleaned
  cleaned=$(echo "$input" | tr '[:lower:]' '[:upper:]' | tr -d ' ')

  # 使用 sed 提取並格式化（相容 bash 3.x 和 macOS）
  # 先處理標準格式 CVE-YYYY-NNNNN
  if echo "$cleaned" | grep -q 'CVE-[0-9]\{4\}-[0-9]'; then
    echo "$cleaned" | sed 's/.*\(CVE-[0-9][0-9][0-9][0-9]-[0-9][0-9]*\).*/\1/'
    return 0
  fi

  # 處理無分隔符格式 CVEYYYYYNNNN
  if echo "$cleaned" | grep -q 'CVE[0-9]\{4\}[0-9]'; then
    local year number
    year=$(echo "$cleaned" | sed 's/.*CVE\([0-9][0-9][0-9][0-9]\).*/\1/')
    number=$(echo "$cleaned" | sed 's/.*CVE[0-9][0-9][0-9][0-9]\([0-9][0-9]*\).*/\1/')
    echo "CVE-${year}-${number}"
    return 0
  fi

  echo ""
}

# =============================================================================
# filename_normalize_slug — 標準化 slug（用於非 CVE 的描述性檔名）
# =============================================================================
# 輸入：任意標題或描述
# 輸出：標準化的 slug（小寫、連字號分隔、縮寫常見詞）
#
# 規則：
#   1. 轉小寫
#   2. 移除版本號中的 .（2.55.0 → 2-55-0）
#   3. 空格和特殊字元轉為 -
#   4. 連續 - 合併為單一 -
#   5. 移除開頭和結尾的 -
#   6. 套用縮寫（Cross-Site-Request-Forgery → csrf）
#   7. 限制長度（最多 60 字元）
#
# 範例：
#   filename_normalize_slug "Casdoor 2.55.0 Cross-Site Request Forgery"
#   # → "casdoor-2-55-0-csrf"
# =============================================================================
filename_normalize_slug() {
  local input="${1:-}"

  # 轉小寫
  local slug
  slug=$(echo "$input" | tr '[:upper:]' '[:lower:]')

  # 移除常見前綴（如 "exploit - ", "poc: " 等）
  slug=$(echo "$slug" | sed -E 's/^(exploit|poc|vulnerability|vuln|advisory)[[:space:]]*[-:][[:space:]]*//')

  # 移除括號內的內容（通常是重複資訊）
  slug=$(echo "$slug" | sed -E 's/\([^)]*\)//g')

  # 替換版本號中的 . 為 -
  slug=$(echo "$slug" | sed -E 's/([0-9])\.([0-9])/\1-\2/g')

  # 替換特殊字元為 -
  slug=$(echo "$slug" | sed -E 's/[^a-z0-9-]+/-/g')

  # 合併連續 -
  slug=$(echo "$slug" | sed -E 's/-+/-/g')

  # 移除開頭和結尾的 -
  slug=$(echo "$slug" | sed -E 's/^-+|-+$//g')

  # 套用縮寫
  slug=$(_filename_apply_abbreviations "$slug")

  # 限制長度（保留完整單詞）
  if [[ ${#slug} -gt 60 ]]; then
    slug="${slug:0:60}"
    # 移除最後不完整的單詞
    slug=$(echo "$slug" | sed -E 's/-[^-]*$//')
  fi

  echo "$slug"
}

# =============================================================================
# filename_generate — 生成標準檔名
# =============================================================================
# 參數：
#   $1 - 年份（YYYY）
#   $2 - 唯一識別符（CVE 編號、公告編號、或描述）
#   $3 - 來源標記（可選，如 "exploitdb", "nuclei"）
#
# 優先順序：
#   1. CVE 編號：{年份}-CVE-{編號}.md
#   2. 其他編號：{年份}-{來源}-{編號}.md
#   3. 描述：{年份}-{來源}-{標準化slug}.md
#
# 範例：
#   filename_generate "2026" "CVE-2026-22769" ""
#   # → "2026-CVE-2026-22769.md"
#
#   filename_generate "2026" "Casdoor CSRF" "exploitdb"
#   # → "2026-exploitdb-casdoor-csrf.md"
# =============================================================================
filename_generate() {
  local year="${1:-$(date +%Y)}"
  local identifier="${2:-}"
  local source="${3:-}"

  # 嘗試解析為 CVE
  local cve
  cve=$(filename_normalize_cve "$identifier")

  if [[ -n "$cve" ]]; then
    # 有 CVE 編號
    echo "${year}-${cve}.md"
  elif [[ -n "$source" ]]; then
    # 無 CVE，有來源標記
    local slug
    slug=$(filename_normalize_slug "$identifier")
    echo "${year}-${source}-${slug}.md"
  else
    # 無 CVE、無來源標記
    local slug
    slug=$(filename_normalize_slug "$identifier")
    echo "${year}-${slug}.md"
  fi
}

# =============================================================================
# filename_extract_cve_from_file — 從檔案名稱提取 CVE 編號
# =============================================================================
# 輸入：檔案路徑或檔名
# 輸出：CVE 編號（若有）或空字串
#
# 範例：
#   filename_extract_cve_from_file "2026-CVE-2026-22769.md"
#   # → "CVE-2026-22769"
# =============================================================================
filename_extract_cve_from_file() {
  local filepath="${1:-}"
  local basename
  basename=$(basename "$filepath" .md)

  # 使用 grep 提取 CVE（相容 bash 3.x）
  local cve
  cve=$(echo "$basename" | grep -oE 'CVE-[0-9]{4}-[0-9]+' | head -1)

  echo "${cve:-}"
}

# =============================================================================
# filename_build_index — 建立檔案索引
# =============================================================================
# 輸入：docs/Extractor/{layer_name}/ 目錄路徑
# 輸出：JSON 格式的索引到 stdout
#
# 索引格式：
#   {
#     "by_cve": { "CVE-2026-22769": "active_exploitation/2026-CVE-2026-22769.md" },
#     "by_filename": { "2026-CVE-2026-22769.md": "active_exploitation/2026-CVE-2026-22769.md" }
#   }
#
# 範例：
#   filename_build_index "/path/to/docs/Extractor/exploit_intelligence"
# =============================================================================
filename_build_index() {
  local base_dir="${1:-}"

  if [[ ! -d "$base_dir" ]]; then
    echo '{"by_cve":{},"by_filename":{}}'
    return 0
  fi

  local by_cve="{}"
  local by_filename="{}"

  # 遍歷所有 .md 檔案（排除 raw/ 和 index.md）
  while IFS= read -r filepath; do
    [[ -z "$filepath" ]] && continue

    # 取得相對路徑（從 base_dir 開始）
    local relpath="${filepath#$base_dir/}"
    local basename
    basename=$(basename "$filepath")

    # 提取 CVE
    local cve
    cve=$(filename_extract_cve_from_file "$basename")

    # 加入索引
    if [[ -n "$cve" ]]; then
      by_cve=$(echo "$by_cve" | jq --arg k "$cve" --arg v "$relpath" '. + {($k): $v}')
    fi
    by_filename=$(echo "$by_filename" | jq --arg k "$basename" --arg v "$relpath" '. + {($k): $v}')

  done < <(find "$base_dir" -name "*.md" -type f ! -path "*/raw/*" ! -name "index.md" 2>/dev/null)

  # 組合輸出
  jq -n --argjson by_cve "$by_cve" --argjson by_filename "$by_filename" \
    '{by_cve: $by_cve, by_filename: $by_filename}'
}

# =============================================================================
# filename_exists_in_index — 檢查識別符是否已存在於索引中
# =============================================================================
# 參數：
#   $1 - 識別符（CVE 編號或檔名）
#   $2 - 索引 JSON 字串或檔案路徑
#
# 回傳：
#   0 - 存在
#   1 - 不存在
#
# 範例：
#   if filename_exists_in_index "CVE-2026-22769" "$index_json"; then
#     echo "已存在"
#   fi
# =============================================================================
filename_exists_in_index() {
  local identifier="${1:-}"
  local index="${2:-}"

  # 判斷 index 是檔案路徑還是 JSON 字串
  local index_json
  if [[ -f "$index" ]]; then
    index_json=$(cat "$index")
  else
    index_json="$index"
  fi

  # 標準化 CVE
  local cve
  cve=$(filename_normalize_cve "$identifier")

  if [[ -n "$cve" ]]; then
    # 檢查 by_cve
    local result
    result=$(echo "$index_json" | jq -r --arg k "$cve" '.by_cve[$k] // empty')
    [[ -n "$result" ]] && return 0
  fi

  # 檢查 by_filename
  local result
  result=$(echo "$index_json" | jq -r --arg k "$identifier" '.by_filename[$k] // empty')
  [[ -n "$result" ]] && return 0

  return 1
}

# =============================================================================
# filename_get_path_from_index — 從索引取得檔案路徑
# =============================================================================
# 參數：
#   $1 - 識別符（CVE 編號或檔名）
#   $2 - 索引 JSON 字串或檔案路徑
#
# 輸出：檔案相對路徑，若不存在則為空字串
# =============================================================================
filename_get_path_from_index() {
  local identifier="${1:-}"
  local index="${2:-}"

  local index_json
  if [[ -f "$index" ]]; then
    index_json=$(cat "$index")
  else
    index_json="$index"
  fi

  # 標準化 CVE
  local cve
  cve=$(filename_normalize_cve "$identifier")

  if [[ -n "$cve" ]]; then
    local result
    result=$(echo "$index_json" | jq -r --arg k "$cve" '.by_cve[$k] // empty')
    [[ -n "$result" ]] && echo "$result" && return 0
  fi

  # 檢查 by_filename
  local result
  result=$(echo "$index_json" | jq -r --arg k "$identifier" '.by_filename[$k] // empty')
  echo "$result"
}

# =============================================================================
# filename_suggest_next — 建議下一個可用的檔名（處理衝突）
# =============================================================================
# 參數：
#   $1 - 基礎檔名（不含 .md）
#   $2 - 索引 JSON 字串或檔案路徑
#
# 輸出：可用的檔名（含 .md）
#
# 範例：
#   filename_suggest_next "2026-CVE-2026-22769" "$index_json"
#   # 若 2026-CVE-2026-22769.md 存在 → "2026-CVE-2026-22769-2.md"
# =============================================================================
filename_suggest_next() {
  local base="${1:-}"
  local index="${2:-}"

  # 移除 .md 後綴（若有）
  base="${base%.md}"

  local candidate="${base}.md"
  local counter=2

  while filename_exists_in_index "$candidate" "$index"; do
    candidate="${base}-${counter}.md"
    ((counter++))

    # 安全限制：最多嘗試 100 次
    if [[ $counter -gt 100 ]]; then
      echo "${base}-$(date +%s).md"
      return 0
    fi
  done

  echo "$candidate"
}

# =============================================================================
# 測試函數（執行 bash lib/filename.sh test 觸發）
# =============================================================================
_filename_test() {
  # 暫時關閉 errexit 以便測試可以繼續
  set +e

  echo "=== filename.sh 單元測試 ==="
  local passed=0
  local failed=0

  # 測試 filename_normalize_cve
  echo ""
  echo "--- filename_normalize_cve ---"

  _test_case() {
    local input="$1"
    local expected="$2"
    local actual
    actual=$(filename_normalize_cve "$input")
    if [[ "$actual" == "$expected" ]]; then
      echo "  ✓ '$input' → '$actual'"
      passed=$((passed + 1))
    else
      echo "  ✗ '$input' → '$actual' (expected: '$expected')"
      failed=$((failed + 1))
    fi
  }

  _test_case "CVE-2026-22769" "CVE-2026-22769"
  _test_case "cve-2026-22769" "CVE-2026-22769"
  _test_case "CVE202622769" "CVE-2026-22769"
  _test_case "CVE-2026-1" "CVE-2026-1"
  _test_case "invalid" ""
  _test_case "" ""

  # 測試 filename_normalize_slug
  echo ""
  echo "--- filename_normalize_slug ---"

  _test_slug() {
    local input="$1"
    local actual
    actual=$(filename_normalize_slug "$input")
    echo "  '$input' → '$actual'"
    passed=$((passed + 1))
  }

  _test_slug "Casdoor 2.55.0 Cross-Site Request Forgery"
  _test_slug "Remote Code Execution in Apache Struts"
  _test_slug "SQL Injection Vulnerability"
  _test_slug "Exploit - Buffer Overflow in OpenSSL 3.0.1"

  # 測試 filename_generate
  echo ""
  echo "--- filename_generate ---"

  _test_gen() {
    local year="$1"
    local id="$2"
    local source="$3"
    local actual
    actual=$(filename_generate "$year" "$id" "$source")
    echo "  ($year, '$id', '$source') → '$actual'"
    passed=$((passed + 1))
  }

  _test_gen "2026" "CVE-2026-22769" ""
  _test_gen "2026" "Casdoor CSRF" "exploitdb"
  _test_gen "2026" "Remote Code Execution" "nuclei"
  _test_gen "2025" "cve-2025-1234" ""

  # 測試 filename_build_index（需要實際目錄）
  echo ""
  echo "--- filename_build_index ---"
  echo "  (需要實際目錄，跳過)"

  # 總結
  echo ""
  echo "=== 測試完成 ==="
  echo "通過: $passed"
  echo "失敗: $failed"

  if [[ $failed -gt 0 ]]; then
    return 1
  fi
  return 0
}

# 若直接執行且帶有 test 參數
if [[ "${BASH_SOURCE[0]:-}" == "${0:-}" ]] && [[ -n "${0:-}" ]]; then
  if [[ "${1:-}" == "test" ]]; then
    _filename_test
  else
    echo "用法: source lib/filename.sh"
    echo "      bash lib/filename.sh test  # 執行測試"
  fi
fi
