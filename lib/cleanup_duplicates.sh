#!/bin/bash
# 重複檔案清理腳本
# 策略：基於來源連結（Exploit-DB URL）識別重複，保留有 CVE 編號的檔案

set -e

BASE_DIR="${1:-docs/Extractor/exploit_intelligence/poc_available}"
DRY_RUN="${2:-true}"  # 預設為乾跑模式

echo "🔍 掃描目錄: $BASE_DIR"
echo "🔧 模式: $([ "$DRY_RUN" = "true" ] && echo "乾跑（不實際刪除）" || echo "實際執行")"
echo ""

# 建立暫存目錄
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# 步驟 1: 提取所有檔案的元數據
echo "📊 步驟 1: 提取元數據..."

for file in "$BASE_DIR"/*.md; do
    [ -f "$file" ] || continue

    filename=$(basename "$file")

    # 提取 Exploit-DB URL
    edb_url=$(grep -oE 'https://www.exploit-db.com/exploits/[0-9]+' "$file" 2>/dev/null | head -1 || echo "")

    # 提取 CVE
    cve=$(grep -oE 'CVE-[0-9]{4}-[0-9]+' "$file" 2>/dev/null | head -1 || echo "")

    # 提取萃取時間
    extract_time=$(grep -oE '萃取時間[：:] ?[0-9]{4}-[0-9]{2}-[0-9]{2}' "$file" 2>/dev/null | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | head -1 || echo "1970-01-01")

    if [ -n "$edb_url" ]; then
        echo "$edb_url|$filename|$cve|$extract_time" >> "$TEMP_DIR/metadata.txt"
    fi
done

if [ ! -f "$TEMP_DIR/metadata.txt" ]; then
    echo "✅ 沒有找到需要處理的檔案"
    exit 0
fi

# 步驟 2: 按來源 URL 分組找出重複
echo "📊 步驟 2: 識別重複..."

sort "$TEMP_DIR/metadata.txt" | uniq > "$TEMP_DIR/metadata_sorted.txt"

# 提取所有唯一的 EDB URL
cut -d'|' -f1 "$TEMP_DIR/metadata_sorted.txt" | sort | uniq -c | sort -rn | while read count url; do
    if [ "$count" -gt 1 ]; then
        echo "$url" >> "$TEMP_DIR/duplicate_urls.txt"
    fi
done

if [ ! -f "$TEMP_DIR/duplicate_urls.txt" ]; then
    echo "✅ 沒有找到重複檔案"
    exit 0
fi

dup_count=$(wc -l < "$TEMP_DIR/duplicate_urls.txt" | tr -d ' ')
echo "   發現 $dup_count 組重複"

# 步驟 3: 決定每組保留哪個檔案
echo "📊 步驟 3: 決定保留檔案..."

total_to_delete=0
while read url; do
    echo "" >> "$TEMP_DIR/actions.txt"
    echo "=== $url ===" >> "$TEMP_DIR/actions.txt"

    # 找出這個 URL 的所有檔案
    grep "^$url|" "$TEMP_DIR/metadata_sorted.txt" > "$TEMP_DIR/group.txt"

    # 決定保留哪個：優先有 CVE 的，其次萃取時間最新的
    # 格式: url|filename|cve|extract_time

    # 先找有 CVE 的（第 3 欄不為空）
    # 過濾出 CVE 欄位非空的行
    grep -E '\|CVE-[0-9]{4}-[0-9]+\|' "$TEMP_DIR/group.txt" > "$TEMP_DIR/with_cve.txt" 2>/dev/null || true

    if [ -s "$TEMP_DIR/with_cve.txt" ]; then
        # 有 CVE 的，按萃取時間排序取最新的
        keep_file=$(sort -t'|' -k4 -r "$TEMP_DIR/with_cve.txt" | head -1 | cut -d'|' -f2)
        keep_reason="有 CVE 編號"
    else
        # 沒有 CVE 的，按萃取時間排序
        keep_file=$(sort -t'|' -k4 -r "$TEMP_DIR/group.txt" | head -1 | cut -d'|' -f2)
        keep_reason="萃取時間最新"
    fi
    rm -f "$TEMP_DIR/with_cve.txt"

    echo "   保留: $keep_file ($keep_reason)" >> "$TEMP_DIR/actions.txt"

    # 標記要刪除的檔案
    while read line; do
        file=$(echo "$line" | cut -d'|' -f2)
        if [ "$file" != "$keep_file" ]; then
            echo "   刪除: $file" >> "$TEMP_DIR/actions.txt"
            echo "$BASE_DIR/$file" >> "$TEMP_DIR/to_delete.txt"
            total_to_delete=$((total_to_delete + 1))
        fi
    done < "$TEMP_DIR/group.txt"

done < "$TEMP_DIR/duplicate_urls.txt"

echo "   需要刪除 $total_to_delete 個檔案"
echo ""

# 顯示前 20 個動作
echo "📋 清理計劃（前 20 組）:"
head -60 "$TEMP_DIR/actions.txt"
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
    while read file; do
        if [ -f "$file" ]; then
            rm "$file"
            deleted=$((deleted + 1))
        fi
    done < "$TEMP_DIR/to_delete.txt"
    echo "   已刪除 $deleted 個檔案"
fi

echo ""
echo "✅ 完成"
