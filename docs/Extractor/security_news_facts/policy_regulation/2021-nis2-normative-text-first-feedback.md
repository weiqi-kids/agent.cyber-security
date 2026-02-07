# NIS2 Proposal: First feedback on the normative text

| 項目 | 內容 |
|------|------|
| **日期** | 2021-03-10 |
| **來源** | CERT.at (Austria) |
| **分類** | policy_regulation |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

CERT.at provides initial feedback on NIS2 normative text, identifying critical issues in definitions, CSIRT structure, and operational requirements.

## 事實內容

March 2021 analysis by CERT.at identifies several critical issues requiring revision in the NIS2 normative text.

**Definition Clarity Issues:**

The term "service" lacks necessary qualifiers like "essential" or "important," risking absurd coverage scenarios (e.g., employee vacation camp ISPs being subject to NIS2 requirements). This definitional gap could significantly expand scope beyond intended critical infrastructure.

**CSIRT Structure Concerns:**

"National CSIRT" terminology needs clear definition to distinguish from sectoral and organizational CSIRTs. The Single Point of Contact (SPoC) should be removed from operational roles and replaced by CyCLONe (Cyber Crisis Liaison Organisation Network) officers for clearer coordination.

**DNS Requirements (Article 23):**

The focus on TLD registries and accurate domain registration data is "not thought through." Incorrect registration data rarely causes DNS disruptions, suggesting misunderstanding of actual DNS security threats. Requirements miss the substantive security picture.

**Threat Reporting Scope:**

The "cyber threat" definition is excessively broad. Reporting should target concrete events with actual compromise risk, not generic software patches or routine vulnerability announcements. Overly broad reporting could overwhelm CSIRTs with non-actionable information.

**Vulnerability Registry Duplication:**

ENISA should cooperate with existing CVE databases (MITRE, NVD) rather than create parallel vulnerability registries. Duplication wastes resources and creates inconsistencies.

**Overall Assessment:**

Numerous articles require clarification on scope, definitions, and operational procedures before finalization. The feedback indicates fundamental structural issues rather than minor technical corrections.

## 受影響系統

- NIS2 Directive development (EU legislative process)
- CSIRT operational frameworks
- DNS infrastructure governance
- Vulnerability disclosure processes
- ENISA vulnerability tracking systems

## 來源連結

- [NIS2 Proposal: First feedback on the normative text](https://www.cert.at/en/blog/2021/3/nis2-proposal-first-feedback-on-the-normative-text)

---
> 萃取時間: 2026-01-27 00:00 UTC
> 資料來源: CERT.at (Austria) cert-at
