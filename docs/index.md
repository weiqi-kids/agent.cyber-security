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

[查看本週報告](#本週報告){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[GitHub](https://github.com/weiqi-kids/agent.cyber-security){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## 本週報告

### 威脅態勢分析
{: .d-inline-block }

最新
{: .label .label-green }

每週綜合分析全球資安威脅趨勢、重大事件、漏洞動態。

[前往查看]({{ site.baseurl }}/docs/Narrator/threat_landscape/){: .btn }

### 防禦建議
{: .d-inline-block }

每週更新
{: .label .label-blue }

基於當週威脅態勢，提供優先修補清單與安全控制建議。

[前往查看]({{ site.baseurl }}/docs/Narrator/defense_advisory/){: .btn }

---

## 資料來源

本系統整合以下資料來源進行分析：

| Layer | 說明 | 資料來源 |
|:------|:-----|:---------|
| **security_news_facts** | 資安新聞事實 | 國際 CERT/CC、TWCERT、GovCERT.HK 等 |
| **vulnerability_tracking** | 漏洞追蹤 | NVD、EPSS、各國 CERT 公告 |
| **exploit_intelligence** | 漏洞利用情報 | CISA KEV、Exploit-DB、VulnCheck |
| **threat_feeds** | 威脅情報饋送 | abuse.ch (URLhaus, MalwareBazaar, ThreatFox) |

---

## 系統架構

```
┌─────────────────────────────────────────────────────────────┐
│                     Extractor (萃取層)                       │
├─────────────┬─────────────┬─────────────┬──────────────────┤
│ security_   │ vulnerability│ exploit_    │ threat_          │
│ news_facts  │ _tracking    │ intelligence│ feeds            │
└──────┬──────┴──────┬───────┴──────┬──────┴────────┬─────────┘
       │             │              │               │
       ▼             ▼              ▼               ▼
┌─────────────────────────────────────────────────────────────┐
│                   Qdrant 向量資料庫                          │
│              (語意搜尋、跨 Layer 關聯分析)                    │
└─────────────────────────────────────────────────────────────┘
       │
       ▼
┌─────────────────────────────────────────────────────────────┐
│                     Narrator (報告層)                        │
├────────────────────────────┬────────────────────────────────┤
│     threat_landscape       │      defense_advisory          │
│     (威脅態勢分析)          │      (防禦建議)                 │
└────────────────────────────┴────────────────────────────────┘
```

---

## 免責聲明

本系統提供的資訊僅供參考，不構成完整的威脅評估或法律建議。重大安全決策請結合多方情資來源並諮詢專業資安顧問。

---

> 最後更新：{{ site.time | date: "%Y-%m-%d %H:%M" }}
