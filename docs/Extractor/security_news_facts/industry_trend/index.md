---
layout: default
title: 產業動態
parent: 資安新聞事實
grand_parent: Extractor
nav_order: 4
render_with_liquid: true
sitemap: true
---

# 產業動態 (Industry Trend)

資安產業的商業、技術趨勢。

---

{% assign items = site.pages | where_exp: "page", "page.path contains 'security_news_facts/industry_trend'" | where_exp: "page", "page.name != 'index.md'" %}

## 概覽

此分類包含 **{{ items.size }}** 筆產業動態資料。

由於資料量龐大，本頁面僅顯示最近 50 筆。

{% assign sorted = items | sort: "name" | reverse %}
{% if sorted.size > 0 %}
| 標題 |
|:-----|
{% for item in sorted limit: 50 %}| [{{ item.title | default: item.name | remove: ".md" }}]({{ item.url | relative_url }}) |
{% endfor %}
{% else %}
目前無資料。
{% endif %}
