# AI-Powered Knowledge Graph Generator & APTs

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-13 |
| **來源** | SANS ISC |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

SANS ISC introduces an AI-powered knowledge graph generator that processes unstructured threat intelligence using LLMs to extract entity relationships, demonstrated on APT28 and Russian GRU advisories.

## 事實內容

The AI Powered Knowledge Graph Generator (AIKG) uses large language models to automatically extract Subject-Predicate-Object (SPO) triplets from security documents and visualize entity relationships as interactive graphs. The tool works with any OpenAI-compatible API endpoint and was tested using Ollama with Google's Gemma 3 models (12b and 27b parameters).

In testing, AIKG successfully analyzed:
- SecurityWeek APT28 Article: Generated 38 nodes and 105 edges, revealing connections between threat actors, credential harvesting tactics, and Turkish-language phishing portals targeting nuclear researchers
- CISA Russian GRU Advisory: Produced 118 nodes with 486 edges across seven communities, surfacing the pattern "threat actors → targets → defense industry" alongside credential access and influence operations

The tool enables cybersecurity analysts to quickly identify entity relationships, attack patterns, and infrastructure connections within dense threat intelligence documents, enhancing context for reporting and analysis.

## 受影響系統

- Requires Python 3 and Ollama installation
- Tested on Lenovo ThinkBook 14 G4 (2022) with AMD Ryzen 7 5825U and 40GB memory running Ubuntu 24.04.3 LTS

## 來源連結

- [AI-Powered Knowledge Graph Generator & APTs, (Thu, Feb 12th)](https://isc.sans.edu/diary/rss/32712)

---
> 萃取時間：2026-02-15 15:49 UTC
> 資料來源：SANS ISC sans-isc
