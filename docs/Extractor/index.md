---
layout: default
title: Extractor
nav_order: 2
nav_exclude: true
has_children: true
permalink: /docs/Extractor/
render_with_liquid: true
sitemap: true
last_modified_at: 2026-03-03T14:53:21+08:00
---

# Extractor 萃取層

自動化收集並結構化處理各類資安情報來源。

---

## 資料 Layers

| Layer | 說明 | 資料來源數 |
|:------|:-----|:-----------|
| [security_news_facts](security_news_facts/) | 資安新聞事實 | 22 |
| [vulnerability_tracking](vulnerability_tracking/) | 漏洞追蹤 | 13 |
| [exploit_intelligence](exploit_intelligence/) | 漏洞利用情報 | 4 |
| [threat_feeds](threat_feeds/) | 威脅情報饋送 | 4 |

---

## 資料分類

每個 Layer 的資料依據其特性分類到不同的 category 目錄：

### security_news_facts
- `attack_incident` - 攻擊事件
- `vulnerability_disclosure` - 漏洞揭露
- `policy_regulation` - 政策法規
- `industry_trend` - 產業趨勢
- `other` - 其他

### vulnerability_tracking
- `critical_high` - Critical/High 嚴重程度
- `medium` - Medium 嚴重程度
- `low_info` - Low/Info 或未評估

### exploit_intelligence
- `active_exploitation` - 活躍利用中
- `poc_available` - 有 PoC 公開
- `vulnerability_disclosure` - 漏洞揭露
- `informational` - 資訊性內容

### threat_feeds
- `malicious_url` - 惡意 URL
- `malware_sample` - 惡意程式樣本
- `c2_infrastructure` - C2 基礎設施
- `ioc_indicator` - IoC 指標
