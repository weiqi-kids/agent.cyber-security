---
layout: default
title: 惡意 URL
parent: 威脅情報饋送
grand_parent: Extractor
nav_order: 1
---

# 惡意 URL (Malicious URL)

已識別的惡意 URL 情報。

---

{% assign items = site.pages | where_exp: "page", "page.path contains 'threat_feeds/malicious_url'" | where_exp: "page", "page.name != 'index.md'" | sort: "name" | reverse %}
{% if items.size > 0 %}
| 標題 |
|:-----|
{% for item in items limit: 50 %}| [{{ item.title | default: item.name | remove: ".md" }}]({{ item.url | relative_url }}) |
{% endfor %}
{% else %}
目前無資料。
{% endif %}
