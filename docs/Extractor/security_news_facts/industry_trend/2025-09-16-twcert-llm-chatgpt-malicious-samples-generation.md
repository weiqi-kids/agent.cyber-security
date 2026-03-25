# Research: LLM Security Bypass — Researchers Use ChatGPT to Generate Thousands of Malicious Code Samples

| 項目 | 內容 |
|------|------|
| **日期** | 2025-09-16 |
| **來源** | TWCERT/CC |
| **分類** | industry_trend |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

Palo Alto Networks research demonstrates that LLMs like ChatGPT can be manipulated to generate thousands of functional malicious code samples (stealers, ransomware) using jailbreaking techniques, posing significant security risks.

## 事實內容

TWCERT/CC relayed findings from a Palo Alto Networks research report demonstrating critical security risks posed by large language models (LLMs) when used maliciously.

Key research findings:
- **Capability demonstrated**: LLMs enable non-programmers to automatically generate large volumes of functional malicious code samples within hours
- **Malware types generated**: Data stealers, ransomware, and potentially novel malware variants not yet seen in the wild
- **Jailbreaking effectiveness**: Current protective mechanisms (prompt filtering, content policies) are easily bypassed using jailbreaking techniques
- **Scale**: Researchers were able to generate thousands of unique malicious samples in a short timeframe
- **Novelty risk**: LLMs can generate new malware variants combining existing techniques in previously unseen configurations, challenging signature-based detection
- **Accessibility barrier lowered**: The democratization of malware creation significantly lowers the skill barrier for threat actors

Research methodology: Palo Alto Networks designed controlled experiments using various jailbreaking prompts to test the limits of LLM safety guardrails, with responsible disclosure to AI providers.

Security implications:
- AI providers must continuously improve content filtering and safety training
- Organizations should expect increased volume and diversity of malware attacks as LLM-generated malware becomes more accessible
- Threat intelligence platforms need to adapt to rapidly mutating malware families

## 受影響系統

- LLM platforms (ChatGPT, and similar)
- Endpoint detection and response systems facing novel malware variants
- Organizations targeted by LLM-assisted malware campaigns

## 來源連結

- [LLM防線全面失守？資安研究員用ChatGPT模擬攻擊竟生成數千惡意樣本 (TWCERT/CC)](https://www.twcert.org.tw/tw/cp-104-10383-91fe0-1.html)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：TWCERT/CC rss-104
> 注意：Original language: Traditional Chinese (zh-TW). Translated to English.
