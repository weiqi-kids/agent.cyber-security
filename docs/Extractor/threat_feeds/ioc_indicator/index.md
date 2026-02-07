---
layout: default
title: IoC 指標
parent: 威脅情報饋送
grand_parent: Extractor
nav_order: 4
---

# IoC 指標 (IoC Indicator)

入侵指標 (Indicators of Compromise)。

---

{% assign items = site.pages | where_exp: "page", "page.path contains 'threat_feeds/ioc_indicator'" | where_exp: "page", "page.name != 'index.md'" | sort: "name" | reverse %}
{% if items.size > 0 %}
| 標題 |
|:-----|
{% for item in items limit: 50 %}| [{{ item.title | default: item.name | remove: ".md" }}]({{ item.url | relative_url }}) |
{% endfor %}
{% else %}
目前無資料。
{% endif %}
