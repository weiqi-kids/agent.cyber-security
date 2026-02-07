#!/usr/bin/env python3
"""
Qdrant 語意查詢腳本

用法：
    python qdrant_query.py --query "遠端程式碼執行" --limit 10
    python qdrant_query.py --query "APT 半導體" --filter source_layer=security_news_facts
    python qdrant_query.py --query "CVE-2024" --limit 5 --filter category=critical_high
"""

import argparse
import json
import os
import sys
from pathlib import Path

try:
    import requests
    from openai import OpenAI
except ImportError:
    print("請安裝依賴：pip install requests openai", file=sys.stderr)
    sys.exit(1)


def load_env():
    """載入 .env 檔案"""
    env_path = Path(__file__).parent.parent.parent / ".env"
    if env_path.exists():
        with open(env_path) as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith("#") and "=" in line:
                    key, value = line.split("=", 1)
                    os.environ.setdefault(key.strip(), value.strip())


def get_embedding(text: str, client: OpenAI) -> list[float]:
    """使用 OpenAI 產生文字嵌入向量"""
    model = os.environ.get("EMBEDDING_MODEL", "text-embedding-3-small")
    response = client.embeddings.create(input=text, model=model)
    return response.data[0].embedding


def search_qdrant(vector: list[float], limit: int, filter_dict: dict | None = None) -> dict:
    """在 Qdrant 中搜尋相似向量"""
    url = os.environ.get("QDRANT_URL", "")
    api_key = os.environ.get("QDRANT_API_KEY", "")
    collection = os.environ.get("QDRANT_COLLECTION", "cyber-security")

    if not url:
        raise ValueError("QDRANT_URL 未設定")

    headers = {
        "Content-Type": "application/json",
    }
    if api_key:
        headers["api-key"] = api_key

    payload = {
        "vector": vector,
        "limit": limit,
        "with_payload": True,
    }

    if filter_dict:
        must_conditions = []
        for key, value in filter_dict.items():
            must_conditions.append({"key": key, "match": {"value": value}})
        payload["filter"] = {"must": must_conditions}

    response = requests.post(
        f"{url.rstrip('/')}/collections/{collection}/points/search",
        headers=headers,
        json=payload,
        timeout=30,
    )
    response.raise_for_status()
    return response.json()


def parse_filter(filter_str: str | None) -> dict | None:
    """解析 filter 字串（格式：key1=value1,key2=value2）"""
    if not filter_str:
        return None
    result = {}
    for pair in filter_str.split(","):
        if "=" in pair:
            key, value = pair.split("=", 1)
            result[key.strip()] = value.strip()
    return result if result else None


def main():
    parser = argparse.ArgumentParser(description="Qdrant 語意查詢")
    parser.add_argument("--query", "-q", required=True, help="查詢文字")
    parser.add_argument("--limit", "-l", type=int, default=10, help="回傳筆數（預設 10）")
    parser.add_argument("--filter", "-f", help="篩選條件（格式：key=value,key2=value2）")
    parser.add_argument("--json", action="store_true", help="輸出原始 JSON")
    args = parser.parse_args()

    load_env()

    openai_key = os.environ.get("OPENAI_API_KEY")
    if not openai_key:
        print("錯誤：OPENAI_API_KEY 未設定", file=sys.stderr)
        sys.exit(1)

    client = OpenAI(api_key=openai_key)

    # 產生查詢向量
    try:
        query_vector = get_embedding(args.query, client)
    except Exception as e:
        print(f"嵌入向量產生失敗：{e}", file=sys.stderr)
        sys.exit(1)

    # 搜尋 Qdrant
    try:
        filter_dict = parse_filter(args.filter)
        result = search_qdrant(query_vector, args.limit, filter_dict)
    except Exception as e:
        print(f"Qdrant 搜尋失敗：{e}", file=sys.stderr)
        sys.exit(1)

    if args.json:
        print(json.dumps(result, ensure_ascii=False, indent=2))
        return

    # 格式化輸出
    points = result.get("result", [])
    if not points:
        print("未找到相關結果")
        return

    print(f"找到 {len(points)} 筆相關結果：\n")
    for i, point in enumerate(points, 1):
        payload = point.get("payload", {})
        score = point.get("score", 0)
        print(f"[{i}] 相似度：{score:.4f}")
        print(f"    標題：{payload.get('title', 'N/A')}")
        print(f"    日期：{payload.get('date', 'N/A')}")
        print(f"    Layer：{payload.get('source_layer', 'N/A')}")
        print(f"    分類：{payload.get('category', 'N/A')}")
        print(f"    來源：{payload.get('source_url', 'N/A')}")
        print()


if __name__ == "__main__":
    main()
