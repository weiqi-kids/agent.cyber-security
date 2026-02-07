---
layout: default
title: 其他
parent: 資安新聞事實
grand_parent: Extractor
nav_order: 5
---

# 其他 (Other)

其他資安相關新聞。

---

{% assign items = site.pages | where_exp: "page", "page.path contains 'security_news_facts/other'" | where_exp: "page", "page.name != 'index.md'" | sort: "name" | reverse %}
{% if items.size > 0 %}
| 標題 |
|:-----|
{% for item in items limit: 50 %}| [{{ item.title | default: item.name | remove: ".md" }}]({{ item.url | relative_url }}) |
{% endfor %}
{% else %}
目前無資料。
{% endif %}
