# JSAC2025 -Day 2-

| 項目 | 內容 |
|------|------|
| **日期** | 2025-04-01 |
| **來源** | JPCERT/CC Blog |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

JSAC2025 Day 2 featured presentations on KeepSpy phishing malware, real-time phishing detection systems, ransomware ESXi/NAS exploitation, and APT campaigns including PlushDaemon supply chain attacks and MirrorFace's Operation AkaiRyu targeting European diplomats.

## 事實內容

**Phishing Attack Countermeasures:**

Mizuho Financial Group:
- Analyzed KeepSpy malware and phishing criminal operations
- Examined "the functionality of the malware and how it executes commands" to distribute phishing URLs via SMS
- Emphasized collaborative detection using certificate transparency logs and automation systems for rapid takedown

LAC:
- Discussed real-time phishing detection systems addressing rapidly evolving threats
- Noted that "phishing attacks tend to exploit major brands or events that attract significant public attention"
- Constantly shifting attack patterns tied to SSL certificate adoption and authentication standards

NTT Communications:
- Analyzed two similar phishing-as-a-service kits targeting Japan
- Revealed "the similarities between the promotional videos shared within the attacker community"
- Demonstrated how Docker enables efficient phishing site deployment through automated domain configuration

**Advanced Ransomware Techniques (Sygnia):**
- Exposed ransomware groups exploiting ESXi and NAS devices as "covert operations" channels
- Attackers leverage stolen credentials for backdoor access while evading EDR detection
- Investigation requires examining SSH authentication logs, command histories, and system timestamps on both host and sandbox environments

**APT Group Activities:**

ESET:
1. PlushDaemon:
   - Compromised a Korean VPN provider's website to distribute SlowStepper backdoor malware alongside legitimate software
   - Represents sophisticated supply chain exploitation

2. MirrorFace's Operation AkaiRyu:
   - Targeted European diplomatic institutions using World Expo-themed emails
   - Deployed ANEL malware with customized loaders
   - Suggests "potential connection between APT10 and MirrorFace"

Itochu Cyber & Intelligence:
- Revealed MirrorFace exploiting Windows Sandbox features to evade detection
- Highlighted how "system updates designed to improve user convenience could unintentionally benefit attackers"

## 受影響系統

- Financial institutions (phishing targets)
- ESXi hypervisors
- NAS devices
- Korean VPN provider infrastructure
- European diplomatic institutions
- Windows Sandbox environments

## 來源連結

- [JSAC2025 -Day 2-](https://blogs.jpcert.or.jp/en/2025/03/jsac2025day2.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
