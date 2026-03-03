---
layout: default
title: 其他
parent: 資安新聞事實
grand_parent: Extractor
nav_order: 5
render_with_liquid: true
---

# 其他 (Other)

無法歸類到其他類別的資安新聞。

---

{% assign items = site.pages | where_exp: "page", "page.path contains 'security_news_facts/other'" | where_exp: "page", "page.name != 'index.md'" %}

## 概覽

此分類包含 **{{ items.size }}** 筆資料。

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
