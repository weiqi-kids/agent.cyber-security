---
layout: default
title: C2 基礎設施
parent: 威脅情報饋送
grand_parent: Extractor
nav_order: 3
---

# C2 基礎設施 (C2 Infrastructure)

Command and Control 伺服器情報。

---

{% assign items = site.pages | where_exp: "page", "page.path contains 'threat_feeds/c2_infrastructure'" | where_exp: "page", "page.name != 'index.md'" | sort: "name" | reverse %}
{% if items.size > 0 %}
| 標題 |
|:-----|
{% for item in items limit: 50 %}| [{{ item.title | default: item.name | remove: ".md" }}]({{ item.url | relative_url }}) |
{% endfor %}
{% else %}
目前無資料。
{% endif %}
