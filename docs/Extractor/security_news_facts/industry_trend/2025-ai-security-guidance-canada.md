# Artificial Intelligence - ITSAP.00.040

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-10 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | industry_trend |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

Canadian Cyber Centre identifies three primary AI threat categories: data poisoning, adversarial examples, and model inversion attacks requiring data quality safeguards.

## 事實內容

The Canadian Centre for Cyber Security published ITSAP.00.040 identifying three primary threat categories for AI systems.

**Three Primary AI Threat Categories:**

**1. Data Poisoning Attacks:**
Occur during machine learning training when "poisoned (inaccurate) data is injected into the training dataset, the learning system may be taught to make mistakes."

**2. Adversarial Examples:**
Post-training attacks where systems misclassify inputs—for example, modified traffic signs causing autonomous vehicles to misread stop signs.

**3. Model Inversion & Membership Inference:**
Threat actors query data models to either "reveal the underlying dataset" or confirm whether specific files were part of training data, compromising confidentiality.

**How Threat Actors Exploit AI:**
Malicious actors leverage AI to:
- Create deepfakes impersonating authority figures
- Clone legitimate websites
- Modify malware source code to evade detection
- Analyze public imagery to geolocate facilities and identify industrial control systems

**Data Quality Requirements:**
The guidance emphasizes that AI reliability depends on data integrity. Training datasets must be "complete, diverse and accurate." Missing or non-diverse data produces unreliable results and narrow applicability.

**Organizational Recommendations:**
Organizations deploying AI should:
- Adopt trustworthy AI policies minimizing biases and unintended consequences
- Develop protocols for handling sensitive and personal information
- Seek legal advice addressing ethical, privacy, and policy considerations
- Reference Canada's Directive on Automated Decision-Making as a policy model

**Critical Limitation:**
The document notes AI cannot substitute for human judgment in situations requiring intuition, adaptability, or causal reasoning.

The guidance emphasizes that AI security depends on comprehensive data governance, threat awareness, and recognition that AI systems complement rather than replace human decision-making.

## 受影響系統

- Machine learning training systems (data poisoning vectors)
- AI classification systems (adversarial examples)
- AI model infrastructure (inversion/inference attacks)
- Autonomous vehicle systems (traffic sign misclassification)
- Organizational data repositories
- Industrial control systems (reconnaissance via imagery analysis)

## 來源連結

- [Artificial Intelligence - ITSAP.00.040](https://cyber.gc.ca/en/guidance/artificial-intelligence-itsap00040)

---
> 萃取時間: 2026-02-06 00:00 UTC
> 資料來源: Canadian Centre for Cyber Security ca-news
