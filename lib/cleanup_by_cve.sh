#!/bin/bash
# 基於 CVE 編號清理重複檔案
# 不同於 cleanup_duplicates.sh（基於 Exploit-DB URL），本腳本專門處理有 CVE 編號但可能來自不同來源的重複

set -e

BASE_DIR="${1:-docs/Extractor}"
DRY_RUN="${2:-true}"

echo "🔍 掃描目錄: $BASE_DIR"
echo "🔧 模式: $([ "$DRY_RUN" = "true" ] && echo "乾跑（不實際刪除）" || echo "實際執行")"
echo ""

TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# 步驟 1: 掃描所有 .md 檔案，提取 CVE 編號
echo "📊 步驟 1: 提取 CVE 元數據..."

find "$BASE_DIR" -name "*.md" -type f ! -path "*/raw/*" | while read file; do
    # 從檔案內容提取 CVE（可能有多個）
    cves=$(grep -oE 'CVE-[0-9]{4}-[0-9]+' "$file" 2>/dev/null | sort -u | tr '\n' ',' | sed 's/,$//')

    if [ -n "$cves" ]; then
        # 提取萃取時間
        extract_time=$(grep -oE '萃取時間[：:] ?[0-9]{4}-[0-9]{2}-[0-9]{2}' "$file" 2>/dev/null | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | head -1 || echo "1970-01-01")

        # 檔案大小（內容品質指標）
        size=$(wc -c < "$file" | tr -d ' ')

        # 是否在檔名中包含 CVE
        filename=$(basename "$file")
        has_cve_in_name=$(echo "$filename" | grep -q 'CVE-' && echo "1" || echo "0")

        echo "$cves|$file|$extract_time|$size|$has_cve_in_name"
    fi
done > "$TEMP_DIR/cve_files.txt"

if [ ! -s "$TEMP_DIR/cve_files.txt" ]; then
    echo "✅ 沒有找到含 CVE 的檔案"
    exit 0
fi

total_files=$(wc -l < "$TEMP_DIR/cve_files.txt" | tr -d ' ')
echo "   找到 $total_files 個含 CVE 的檔案"

# 步驟 2: 按 CVE 分組找出重複
echo "📊 步驟 2: 識別重複..."

# 展開多 CVE 檔案（一個檔案可能關聯多個 CVE）
while IFS='|' read cves filepath extract_time size has_cve; do
    # 分割 CVE 列表
    echo "$cves" | tr ',' '\n' | while read cve; do
        [ -n "$cve" ] && echo "$cve|$filepath|$extract_time|$size|$has_cve"
    done
done < "$TEMP_DIR/cve_files.txt" > "$TEMP_DIR/expanded.txt"

# 統計每個 CVE 出現的次數
cut -d'|' -f1 "$TEMP_DIR/expanded.txt" | sort | uniq -c | sort -rn | while read count cve; do
    if [ "$count" -gt 1 ]; then
        echo "$cve|$count"
    fi
done > "$TEMP_DIR/dup_cves.txt"

if [ ! -s "$TEMP_DIR/dup_cves.txt" ]; then
    echo "✅ 沒有找到 CVE 重複"
    exit 0
fi

dup_count=$(wc -l < "$TEMP_DIR/dup_cves.txt" | tr -d ' ')
echo "   發現 $dup_count 個 CVE 有重複檔案"

# 步驟 3: 決定保留哪個檔案
echo "📊 步驟 3: 決定保留檔案..."

total_to_delete=0
while IFS='|' read cve count; do
    echo "" >> "$TEMP_DIR/actions.txt"
    echo "=== $cve (${count} 個檔案) ===" >> "$TEMP_DIR/actions.txt"

    # 找出這個 CVE 的所有檔案
    grep "^$cve|" "$TEMP_DIR/expanded.txt" | sort -t'|' -k5 -r -k4 -rn -k3 -r > "$TEMP_DIR/group.txt"

    # 優先保留：檔名含 CVE > 檔案較大 > 萃取時間新
    keep_file=$(head -1 "$TEMP_DIR/group.txt" | cut -d'|' -f2)

    if [ "$(head -1 "$TEMP_DIR/group.txt" | cut -d'|' -f5)" = "1" ]; then
        keep_reason="檔名含 CVE"
    else
        keep_reason="檔案較大/萃取較新"
    fi

    echo "   保留: $(basename "$keep_file") ($keep_reason)" >> "$TEMP_DIR/actions.txt"

    # 標記要刪除的檔案（跳過第一個）
    tail -n +2 "$TEMP_DIR/group.txt" | while IFS='|' read _ filepath _; do
        echo "   刪除: $(basename "$filepath")" >> "$TEMP_DIR/actions.txt"
        echo "$filepath" >> "$TEMP_DIR/to_delete.txt"
        echo "1" >> "$TEMP_DIR/delete_count.txt"
    done

done < "$TEMP_DIR/dup_cves.txt"

if [ -f "$TEMP_DIR/delete_count.txt" ]; then
    total_to_delete=$(wc -l < "$TEMP_DIR/delete_count.txt" | tr -d ' ')
else
    total_to_delete=0
fi

echo "   需要刪除 $total_to_delete 個檔案"
echo ""

# 顯示前 30 個動作
echo "📋 清理計劃（前 30 組）:"
head -90 "$TEMP_DIR/actions.txt"
echo ""

if [ "$total_to_delete" -eq 0 ]; then
    echo "✅ 沒有需要刪除的檔案"
    exit 0
fi

# 步驟 4: 執行刪除
if [ "$DRY_RUN" = "true" ]; then
    echo "⚠️  乾跑模式：不實際刪除"
    echo "   若要實際執行，請使用: $0 $BASE_DIR false"
else
    echo "🗑️  步驟 4: 執行刪除..."
    deleted=0
    sort -u "$TEMP_DIR/to_delete.txt" | while read file; do
        if [ -f "$file" ]; then
            rm "$file"
            echo "deleted" >> "$TEMP_DIR/deleted.txt"
        fi
    done
    if [ -f "$TEMP_DIR/deleted.txt" ]; then
        deleted=$(wc -l < "$TEMP_DIR/deleted.txt" | tr -d ' ')
    fi
    echo "   已刪除 $deleted 個檔案"
fi

echo ""
echo "✅ 完成"
