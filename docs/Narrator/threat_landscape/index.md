---
layout: default
title: 威脅態勢分析
parent: Narrator
nav_order: 1
nav_exclude: false
has_children: true
permalink: /docs/Narrator/threat_landscape/
---

# 威脅態勢分析 (Threat Landscape)

每週綜合分析全球資安威脅趨勢，輔助資安人員制定防禦策略。

## 報告內容

1. **近期重大資安事件** - 從國際多來源提取，按嚴重程度排序
2. **漏洞趨勢分析** - 本週新增漏洞統計、廠商分布、EPSS Top 10
3. **活躍利用與 PoC 動態** - KEV 新增漏洞、新公開 PoC
4. **攻擊手法歸納** - TTP 分類統計、與前期比較
5. **新興威脅識別** - 首次出現的攻擊手法或目標

## 資料來源

- security_news_facts (資安新聞事實)
- vulnerability_tracking (漏洞追蹤)
- exploit_intelligence (漏洞利用情報)
- threat_feeds (威脅情報饋送)

## 歷史報告

{% assign reports = site.pages | where_exp: "page", "page.path contains 'Narrator/threat_landscape'" | where_exp: "page", "page.name != 'index.md'" | sort: "name" | reverse %}
{% for report in reports limit: 10 %}
- [{{ report.title | default: report.name }}]({{ report.url | relative_url }})
{% endfor %}
