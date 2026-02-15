# JSAC2025 -Workshop & Lightning Talk-

| 項目 | 內容 |
|------|------|
| **日期** | 2025-04-04 |
| **來源** | JPCERT/CC Blog |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

JSAC2025 workshops covered threat intelligence handling, automated malware configuration extraction using CERT Polska tools, and anti-analysis feature detection, with lightning talks on LLM-based security analysis and Japan-Spain cybersecurity collaboration.

## 事實內容

**Workshops:**

1. Threat Intelligence Handling (Tokio Marine Holdings):
   - Effective threat intelligence requires four key attributes: accuracy, audience-focused approach, actionability, and adequate timing
   - Tactical intelligence for SOC operations: IoC utilization and YARA/SIGMA rules with short lifespan (hours to days)
   - Operational intelligence: MITRE ATT&CK framework, threat hunting hypothesis development, and intelligence sharing via TLP protocols

2. Malware Configuration Extraction at Scale (CERT Polska - Michał Praszmo):
   - MWDB: Scalable malware repository supporting automated analysis
   - malduck: Python module extracting configuration details using YARA pattern matching
   - Karton: Distributed processing framework automating malware classification and C2 extraction
   - Participants engaged in hands-on exercises analyzing real-world malware scenarios

3. Anti-Analysis Features Analysis (LAC Co. - Takahiro Takeda):
   - AntiDebugSeeker: Automated tool identifying anti-debugging features in malware
   - Extracts potentially malicious APIs and detects evasion techniques triggered by specific keywords
   - Customizable detection rules adaptable to emerging threats

**Lightning Talks:**

1. DisarmBot: LLM-Based MITRE ATT&CK Tool (Atsushi Sada):
   - Multiple AI agents collaboratively analyzing security incidents
   - System incorporates attacker perspectives, defender insights, OSINT specialists, skeptics, and solution architects
   - Uses Microsoft's AutoGen framework combined with RAG technology and DISARM TTP framework

2. Japan-Spain Cybersecurity Collaboration (Masato Ikegami & Josep Albors):
   - Parallel attack campaigns across regions
   - Simultaneous information-stealing malware peaks
   - Shared vulnerabilities to Emotet
   - Coordinated response efforts through JPCERT/CC and INCIBE cooperation agreements
   - Emphasized international threat intelligence sharing importance

**Key Awards:**
- Excellent Presentation Award: Practical sandbox evasion countermeasures
- Special Recognition Award: First-time phishing campaign analysis from Mizuho Financial Group

## 受影響系統

- Security Operations Centers (SOC)
- Malware analysis infrastructure
- Threat intelligence platforms

## 來源連結

- [JSAC2025 -Workshop & Lightning Talk-](https://blogs.jpcert.or.jp/en/2025/04/jsac2025-workshop-lightning-talk.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
