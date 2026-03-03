---
layout: default
title: 惡意 URL
parent: 威脅情報饋送
grand_parent: Extractor
nav_order: 1
render_with_liquid: true
sitemap: true
---

# 惡意 URL (Malicious URL)

已識別的惡意 URL 情報。

---

{% assign items = site.pages | where_exp: "page", "page.path contains 'threat_feeds/malicious_url'" | where_exp: "page", "page.name != 'index.md'" %}

## 概覽

此分類包含 **{{ items.size }}** 筆 IoC 資料。

由於資料量龐大，本頁面僅提供統計資訊。

## 存取方式

- **搜尋**：使用右上角搜尋功能查詢 URL 或關鍵字
- **API**：查詢 `index.json` 取得完整清單
- **Qdrant**：透過向量資料庫進行語意搜尋
