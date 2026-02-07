#!/bin/bash
# security_news_facts 資料擷取腳本
# 從多個國際 CERT/安全機構 RSS 來源下載原始資料

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"

source "$PROJECT_ROOT/lib/args.sh"
source "$PROJECT_ROOT/lib/core.sh"
source "$PROJECT_ROOT/lib/rss.sh"

LAYER_NAME="security_news_facts"
RAW_DIR="$PROJECT_ROOT/docs/Extractor/$LAYER_NAME/raw"

# 確保 raw 目錄存在
mkdir -p "$RAW_DIR"

########################################
# 來源定義：feed_id|url|format
# format: rss 或 atom
########################################
FEEDS=(
  # 既有 — TWCERT
  "rss-104|https://www.twcert.org.tw/tw/rss-104-1.xml|rss"
  # 新增 — EN
  "cisa|https://www.cisa.gov/uscert/ncas/all.xml|rss"
  "ca-news|https://cyber.gc.ca/webservice/en/rss/news|atom"
  "cert-at|https://cert.at/cert-at.en.blog.rss_2.0.xml|rss"
  "cert-lv|https://cert.lv/en/feed/rss/all|rss"
  "jpcert-blog|https://blogs.jpcert.or.jp/en/atom.xml|atom"
  "ncsc-fi|https://www.kyberturvallisuuskeskus.fi/feed/rss/en|rss"
  "ncsc-fi-news|https://www.kyberturvallisuuskeskus.fi/sites/default/files/rss/news.xml|rss"
  "ncsc-fi-secnow|https://www.kyberturvallisuuskeskus.fi/feed/rss/en/399|rss"
  "sans-isc|https://isc.sans.edu/rssfeed.xml|rss"
  "uk-ncsc|https://www.ncsc.gov.uk/api/1/services/v1/report-rss-feed.xml|rss"
  # 新增 — 非英文
  "cert-br|https://www.cert.br/rss/certbr-rss.xml|rss"
  "cert-ee|https://www.ria.ee/et/news-feed/all/feed|rss"
  "cert-fr|https://www.cert.ssi.gouv.fr/feed/|rss"
  "cert-hr|https://www.cert.hr/feed/|rss"
  "cert-se|https://www.cert.se/feed.rss|rss"
  "cert-ua|https://cert.gov.ua/api/articles/rss|rss"
  "cert-ro|https://dnsc.ro/feed|rss"
  "cncs-pt|https://www.cncs.gov.pt/docs/noticias/feed-rss/index.xml|rss"
  "nsm-ncsc|https://nsm.no/fagomrader/digital-sikkerhet/nasjonalt-cybersikkerhetssenter/varsler-fra-ncsc/rss/|rss"
  "nukib|https://nukib.gov.cz/rss.xml|rss"
  "sk-cert|https://www.sk-cert.sk/index.html%3Ffeed=rss|rss"
)

########################################
# 主邏輯
########################################

echo "📡 [$LAYER_NAME] 開始擷取資料..."
echo "========================================"
echo "📋 共 ${#FEEDS[@]} 個來源"
echo ""

FETCH_OK=true
TOTAL_ITEMS=0
SUCCESS_COUNT=0
FAIL_COUNT=0

for feed_entry in "${FEEDS[@]}"; do
  IFS='|' read -r feed_id feed_url feed_format <<< "$feed_entry"

  echo "📥 擷取 ${feed_id}..."
  XML_FILE="$RAW_DIR/${feed_id}.xml"
  JSON_FILE="$RAW_DIR/${feed_id}.jsonl"

  if rss_fetch "$feed_url" "$XML_FILE"; then
    if rss_validate "$XML_FILE"; then
      ITEM_COUNT=$(rss_count_items "$XML_FILE")
      echo "✅ ${feed_id} 擷取成功：$ITEM_COUNT 筆 items"

      # XML → JSONL 轉換（rss_extract_items_jsonl 已支援 Atom 格式偵測）
      rss_extract_items_jsonl "$XML_FILE" > "$JSON_FILE"

      TOTAL_ITEMS=$((TOTAL_ITEMS + ITEM_COUNT))
      ((SUCCESS_COUNT++))
    else
      echo "⚠️  ${feed_id} 格式驗證失敗，跳過"
      ((FAIL_COUNT++))
    fi
  else
    echo "⚠️  ${feed_id} 擷取失敗，跳過"
    ((FAIL_COUNT++))
  fi

  echo ""
done

# === 記錄擷取時間 ===
date -u '+%Y-%m-%dT%H:%M:%SZ' > "$RAW_DIR/.last_fetch"

echo "========================================"
if [[ $FAIL_COUNT -eq 0 ]]; then
  echo "✅ Fetch completed: $LAYER_NAME"
else
  echo "⚠️  Fetch completed with warnings: $LAYER_NAME"
  echo "   ${FAIL_COUNT} 個來源擷取失敗（不影響其他來源）"
fi
echo "   成功: ${SUCCESS_COUNT}/${#FEEDS[@]} 個來源"
echo "   總計: ${TOTAL_ITEMS} items"
echo ""

# 列出所有產出的 JSONL 檔案
echo "📁 產出的 JSONL 檔案："
for feed_entry in "${FEEDS[@]}"; do
  IFS='|' read -r feed_id _ _ <<< "$feed_entry"
  if [[ -f "$RAW_DIR/${feed_id}.jsonl" ]]; then
    local_count="$(wc -l < "$RAW_DIR/${feed_id}.jsonl" | tr -d ' ')"
    echo "   raw/${feed_id}.jsonl: ${local_count} items"
  fi
done

echo ""
echo "💡 下一步：執行 Claude 萃取"
echo "   claude \"請依照 CLAUDE.md 進行萃取\""
