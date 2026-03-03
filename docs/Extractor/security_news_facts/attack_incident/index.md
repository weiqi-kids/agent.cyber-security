---
layout: default
title: 攻擊事件
parent: 資安新聞事實
grand_parent: Extractor
nav_order: 1
render_with_liquid: true
---

# 攻擊事件 (Attack Incident)

描述實際發生的資安攻擊或入侵事件。

---

{% assign items = site.pages | where_exp: "page", "page.path contains 'security_news_facts/attack_incident'" | where_exp: "page", "page.name != 'index.md'" %}

## 概覽

此分類包含 **{{ items.size }}** 筆攻擊事件資料。

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
