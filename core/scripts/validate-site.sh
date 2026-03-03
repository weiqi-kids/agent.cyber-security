#!/bin/bash
# validate-site.sh — 部署前網站結構驗證
# 用法：bash core/scripts/validate-site.sh
#
# 檢查項目：
# 1. 每個含 .md 的 Extractor 子目錄是否有 index.md
# 2. 每個 Extractor index.md 是否含 render_with_liquid: true 和 sitemap: true
# 3. 內容檔案是否含未跳脫的 {{ }} Liquid 語法（警告）
#
# Exit codes:
#   0 = 全部通過
#   1 = 有錯誤（會導致 Jekyll 建置失敗）

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
EXTRACTOR_DIR="$PROJECT_ROOT/docs/Extractor"

errors=0
warnings=0

echo "=========================================="
echo " Jekyll 網站結構驗證"
echo "=========================================="
echo ""

# ------------------------------------------
# 檢查 1：每個含 .md 的子目錄是否有 index.md
# ------------------------------------------
echo "--- 檢查 1：子目錄 index.md 完整性 ---"

# 找出所有含有 .md 檔案的目錄（排除 raw/ 目錄）
while IFS= read -r dir; do
  # 跳過 raw 目錄
  [[ "$dir" == */raw ]] && continue

  # 檢查此目錄是否有非 index.md 的 .md 檔案
  has_content=false
  for f in "$dir"/*.md; do
    [ -f "$f" ] || continue
    [ "$(basename "$f")" = "index.md" ] && continue
    has_content=true
    break
  done

  if $has_content && [ ! -f "$dir/index.md" ]; then
    rel="${dir#"$PROJECT_ROOT"/}"
    echo "  ERROR: $rel/ 缺少 index.md"
    errors=$((errors + 1))
  fi
done < <(find "$EXTRACTOR_DIR" -type d 2>/dev/null)

if [ $errors -eq 0 ]; then
  echo "  OK: 所有子目錄都有 index.md"
fi
echo ""

# ------------------------------------------
# 檢查 2：index.md 是否有必要的 front matter 設定
# ------------------------------------------
echo "--- 檢查 2：index.md front matter 設定 ---"

check2_errors=0
while IFS= read -r idx; do
  rel="${idx#"$PROJECT_ROOT"/}"
  # 讀取 front matter（--- 到 --- 之間的內容）
  frontmatter=$(awk '/^---$/{c++; if(c==2) exit} c==1{print}' "$idx")

  if ! echo "$frontmatter" | grep -q "render_with_liquid: true"; then
    echo "  ERROR: $rel 缺少 render_with_liquid: true"
    errors=$((errors + 1))
    check2_errors=$((check2_errors + 1))
  fi

  if ! echo "$frontmatter" | grep -q "sitemap: true"; then
    echo "  ERROR: $rel 缺少 sitemap: true"
    errors=$((errors + 1))
    check2_errors=$((check2_errors + 1))
  fi
done < <(find "$EXTRACTOR_DIR" -name "index.md" -type f 2>/dev/null)

if [ $check2_errors -eq 0 ]; then
  echo "  OK: 所有 index.md 都有 render_with_liquid: true 和 sitemap: true"
fi
echo ""

# ------------------------------------------
# 檢查 3：內容檔案是否含 {{ }} Liquid 語法
# ------------------------------------------
echo "--- 檢查 3：Liquid 語法衝突（資訊性） ---"

# 只在 render_with_liquid 未全域關閉時才是問題
# 目前 _config.yml 已設定 render_with_liquid: false for Extractor
# 此檢查作為額外安全網，僅輸出警告

check3_count=0
while IFS= read -r md; do
  # 跳過 index.md（這些有 render_with_liquid: true）
  [ "$(basename "$md")" = "index.md" ] && continue
  # 跳過 raw 目錄
  [[ "$md" == */raw/* ]] && continue

  if grep -q '{{' "$md" 2>/dev/null; then
    rel="${md#"$PROJECT_ROOT"/}"
    if [ $check3_count -lt 5 ]; then
      echo "  WARN: $rel 含有 {{ }} 語法"
    fi
    warnings=$((warnings + 1))
    check3_count=$((check3_count + 1))
  fi
done < <(find "$EXTRACTOR_DIR" -name "*.md" -type f 2>/dev/null)

if [ $warnings -gt 5 ]; then
  echo "  ... 及其他 $((warnings - 5)) 個檔案"
fi
if [ $warnings -gt 0 ]; then
  echo "  INFO: 共 $warnings 個檔案含 {{ }}（已由 _config.yml render_with_liquid: false 保護）"
else
  echo "  OK: 無 Liquid 語法衝突"
fi
echo ""

# ------------------------------------------
# 結果
# ------------------------------------------
echo "=========================================="
if [ $errors -gt 0 ]; then
  echo " FAIL: $errors 個錯誤, $warnings 個警告"
  echo " 請修正錯誤後再部署"
  echo "=========================================="
  exit 1
else
  echo " PASS: 0 個錯誤, $warnings 個警告"
  echo "=========================================="
  exit 0
fi
