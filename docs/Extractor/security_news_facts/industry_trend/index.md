---
layout: default
title: 產業趨勢
parent: 資安新聞事實
grand_parent: Extractor
nav_order: 4
---

# 產業趨勢 (Industry Trend)

資安產業趨勢與發展動態。

---

{% assign items = site.pages | where_exp: "page", "page.path contains 'security_news_facts/industry_trend'" | where_exp: "page", "page.name != 'index.md'" | sort: "name" | reverse %}
{% if items.size > 0 %}
| 標題 |
|:-----|
{% for item in items limit: 50 %}| [{{ item.title | default: item.name | remove: ".md" }}]({{ item.url | relative_url }}) |
{% endfor %}
{% else %}
目前無資料。
{% endif %}
