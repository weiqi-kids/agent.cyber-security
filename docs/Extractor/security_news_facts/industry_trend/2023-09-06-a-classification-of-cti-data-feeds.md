# A Classification of CTI Data Feeds

| 項目 | 內容 |
|------|------|
| **日期** | 2023-09-06 |
| **來源** | CERT.at (Austria) |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 中 |

## 摘要

CERT.at classifies cyber threat intelligence (CTI) data feeds by abstraction layer (tactical/operational/strategic), discussing IoC utility, decay, and the procurement of commercial CTI under EU ECCC funding.

## 事實內容

CERT.at processes and shares a wide selection of CTI as part of its core mission as Austria's hub for IT security information. The blog post was prompted by involvement in two EU-funded commercial CTI procurement projects, including one stemming from the DEP call DIGITAL-ECCC-2022-CYBER-03 with the ECCC (European Cybersecurity Competence Centre).

**CTI Abstraction Layers:**
- **Tactical**: Identifies threat actors via IoCs (IP addresses, domains, hashes); analysis of TTPs (tactics, techniques, and procedures) to predict and identify upcoming attacks at early stages.
- **Operational**: Most technical level; shares specific details about attacks, motivation, threat actor capabilities, and individual campaigns.
- **Strategic**: High-level information for decision-makers; focuses on geopolitical context, motivations, and long-term threat landscape.

**Key arguments on IoC utility:**
- IoCs have a limited lifespan ("decay") — infrastructure is frequently rotated by threat actors.
- Raw IoC feeds without context have limited defensive value; TTPs-based intelligence is more durable.
- Commercial CTI must be evaluated on quality, not just volume of indicators.

The post positions CERT.at's view on how national CERTs should approach CTI procurement and integration, particularly in the context of EU-funded emergency response and cross-border sharing initiatives.

## 受影響系統

- National CERT/CSIRT organisations
- NIS entities participating in EU CTI sharing programmes

## 來源連結

- [A classification of CTI Data feeds](https://www.cert.at/en/blog/2023/9/cti-data-feeds)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：CERT.at (Austria) cert-at
