---
layout: home
title: 首頁
nav_order: 1
nav_exclude: false
description: "資安威脅情報中心 - 自動化資安情報收集與分析系統"
permalink: /
---

# 資安威脅情報中心
{: .fs-9 }

自動化收集、萃取、分析全球資安威脅情報，提供可行動的防禦建議。
{: .fs-6 .fw-300 }

<div class="d-flex flex-justify-between flex-items-center mb-4">
<span class="Label Label--success">資料更新：{{ site.data.status.last_execution_display }}</span>
</div>

{% assign threat_reports = site.pages | where_exp: "page", "page.path contains 'Narrator/threat_landscape'" | where_exp: "page", "page.name != 'index.md'" | sort: "name" | reverse %}
{% assign defense_reports = site.pages | where_exp: "page", "page.path contains 'Narrator/defense_advisory'" | where_exp: "page", "page.name != 'index.md'" | sort: "name" | reverse %}

[威脅態勢分析]({% if threat_reports.size > 0 %}{{ threat_reports[0].url | relative_url }}{% else %}{{ site.baseurl }}/docs/Narrator/threat_landscape/{% endif %}){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[防禦建議]({% if defense_reports.size > 0 %}{{ defense_reports[0].url | relative_url }}{% else %}{{ site.baseurl }}/docs/Narrator/defense_advisory/{% endif %}){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## 系統概覽

| 資料層 | 筆數 | 最後更新 |
|:-------|-----:|:---------|
{% for layer in site.data.status.layers %}| {{ layer[0] | replace: "_", " " | capitalize }} | {{ layer[1].items_count | default: 0 }} | {{ layer[1].last_fetch | date: "%m-%d %H:%M" }} |
{% endfor %}

---

## 活躍利用漏洞
{: .d-inline-block }

高優先級
{: .label .label-red }

以下漏洞正被實際攻擊利用，建議立即評估影響並修補。

{% assign active_exploits = site.pages | where_exp: "p", "p.path contains 'active_exploitation'" | where_exp: "p", "p.name != 'index.md'" | sort: "name" | reverse %}
{% if active_exploits.size > 0 %}
| CVE/漏洞 | 連結 |
|:---------|:-----|
{% for item in active_exploits limit: 5 %}| {{ item.title | default: item.name | remove: ".md" }} | [詳情]({{ item.url | relative_url }}) |
{% endfor %}

[查看全部 {{ active_exploits.size }} 筆 →]({{ site.baseurl }}/docs/Extractor/exploit_intelligence/active_exploitation/)
{% else %}
目前無活躍利用漏洞資料。
{% endif %}

---

## 最新報告

### 威脅態勢分析
{: .d-inline-block }

最新
{: .label .label-green }

每週綜合分析全球資安威脅趨勢、重大事件、漏洞動態。

{% if threat_reports.size > 0 %}
{% assign latest_threat = threat_reports[0] %}
**{{ latest_threat.title }}**

[查看報告]({{ latest_threat.url | relative_url }}){: .btn }
{% else %}
目前無報告。
{% endif %}

### 防禦建議
{: .d-inline-block }

每週更新
{: .label .label-blue }

基於當週威脅態勢，提供優先修補清單與安全控制建議。

{% if defense_reports.size > 0 %}
{% assign latest_defense = defense_reports[0] %}
**{{ latest_defense.title }}**

[查看報告]({{ latest_defense.url | relative_url }}){: .btn }
{% else %}
目前無報告。
{% endif %}

---

## 免責聲明

本系統提供的資訊僅供參考，不構成完整的威脅評估或法律建議。重大安全決策請結合多方情資來源並諮詢專業資安顧問。

---

> 最後更新：{{ site.time | date: "%Y-%m-%d %H:%M" }}
