---
layout: default
title: 防禦建議
parent: Narrator
nav_order: 2
has_children: true
permalink: /docs/Narrator/defense_advisory/
---

# 防禦建議 (Defense Advisory)

每週提供 IT/資安管理人員可執行的防禦行動建議。

## 報告內容

1. **優先修補清單** - 按優先級排序（活躍利用 > EPSS 高分 > CVSS 高分）
2. **安全控制建議** - 區分通用建議與針對本週威脅的具體措施
3. **緩解策略** - 尚無修補的漏洞或新興威脅的臨時措施
4. **注意事項** - 適用範圍、可能副作用、測試建議

## 資料來源

- security_news_facts (資安新聞事實)
- vulnerability_tracking (漏洞追蹤) - 優先 Critical/High
- exploit_intelligence (漏洞利用情報) - 活躍利用優先

## 歷史報告

{% assign reports = site.pages | where_exp: "page", "page.path contains 'Narrator/defense_advisory'" | where_exp: "page", "page.name != 'index.md'" | sort: "name" | reverse %}
{% for report in reports limit: 10 %}
- [{{ report.title | default: report.name }}]({{ report.url | relative_url }})
{% endfor %}
