# UAC-0001 (APT28) Cyberattacks Against Government Agencies Using BEARDSHELL and COVENANT

| Item | Content |
|------|---------|
| **Date** | 2025-06-21 |
| **Source** | CERT-UA (Ukraine) |
| **Category** | attack_incident |
| **Severity** | Critical |
| **Confidence** | High |

## Summary
Ukrainian CERT reports UAC-0001 (APT28) intrusion into central government executive agency's information system in March-April 2024, deploying BEARDSHELL and SLIMAGENT malware on Windows server, with incident response conducted throughout 2024-2025.

## Factual Content
**Incident Details:**
- **Threat Actor:** UAC-0001 (APT28/Fancy Bear - Russian GRU)
- **Incident Timeline:** March-April 2024
- **Response Period:** 2024-2025
- **Target:** Central executive government agency (Ukraine)
- **Compromised System:** Windows server within information-communication system

**Malware Deployment:**
Two primary malicious programs identified:
1. **BEARDSHELL**
2. **SLIMAGENT**

(Note: Report title mentions COVENANT but body references SLIMAGENT - likely variants or related toolset)

**Incident Response:**
Investigation and response measures conducted by:
- National Computer Emergency Response Team of Ukraine (CERT-UA)
- Extended incident response operation spanning approximately one year

**Server Compromise:**
- **System Type:** Windows Server
- **Environment:** Information-Communication System (ICS) of government agency
- **Role:** Server functions not specified but within critical government infrastructure

**Malware Characteristics:**
- **BEARDSHELL:** Custom malware tool used by APT28
- **SLIMAGENT:** Secondary payload for persistence and data exfiltration
- **Purpose:** Long-term espionage and data collection

**Attack Sophistication:**
- Successful penetration of government ICS
- Server-level compromise (elevated privileges)
- Multiple malware stages
- Extended dwell time before detection

**Impact Assessment:**
- Compromise of central government agency
- Access to sensitive government communications
- Potential data exfiltration over extended period
- National security implications

**Threat Actor Profile:**
UAC-0001 (APT28) characteristics:
- Russian military intelligence (GRU) Unit 26165
- Advanced persistent threat capabilities
- Government and military targeting focus
- Sophisticated custom malware development

**Response Complexity:**
Extended incident response timeline suggests:
- Deep network penetration
- Multiple persistence mechanisms
- Thorough forensic investigation required
- Complete remediation complexity

**Notes:** Original content in Ukrainian language (uk); translated to English for analysis; APT28 is one of most sophisticated state-sponsored threat groups; incident occurred during Russia-Ukraine conflict; extended response period indicates sophisticated compromise; government ICS compromise represents high-value intelligence target

## Source Links
- [Кібератаки UAC-0001 (APT28) у відношенні державних органів із застосуванням BEARDSHELL та COVENANT](https://cert.gov.ua/article/6284080)

---
> Extraction time: 2026-02-24 UTC
> Data source: CERT-UA (Ukraine) cert-ua
