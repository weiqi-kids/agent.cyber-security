# Cyber threat bulletin: People's Republic of China cyber threat activity: PRC cyber actors target telecommunications companies as part of a global cyberespionage campaign

| 項目 | 內容 |
|------|------|
| **日期** | 2025-06-19 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Canadian Cyber Centre warns of Salt Typhoon (PRC state-sponsored) cyberespionage campaign targeting global telecommunications infrastructure, including Canadian companies.

## 事實內容

The Canadian Centre for Cyber Security issued a threat bulletin on Salt Typhoon, a People's Republic of China state-sponsored cyber threat group conducting a global cyberespionage campaign targeting telecommunications companies.

**Threat Actor:**

**Salt Typhoon** (PRC State-Sponsored Group):
Advanced persistent threat (APT) actor targeting telecommunications infrastructure globally, including Canadian networks.

**Attack Methods:**

**Edge Device Vulnerability Exploitation:**
Exploiting CVE-2023-20198 and other edge device vulnerabilities to compromise routers and network equipment. This provides initial access to telecommunications infrastructure.

**GRE Tunnel Establishment:**
Attackers establish Generic Routing Encapsulation (GRE) tunnels enabling traffic interception and exfiltration. GRE tunnels allow encrypted traffic to bypass network security controls.

**Espionage Objectives:**

**Customer Data Collection:**
- Call detail records (metadata about communications)
- Location information from mobile devices
- SMS messages and text communications
- Subscriber information and account data

**High-Value Target Monitoring:**
Tracking communications and movements of government officials, business executives, journalists, and other persons of intelligence interest.

**Canadian Impact:**

**Confirmed Compromises:**
"Three network devices registered to a Canadian telecommunications company were compromised by likely Salt Typhoon actors in mid-February 2025."

This represents confirmed PRC state-sponsored penetration of Canadian telecommunications infrastructure.

**Campaign Scope and Duration:**

**Global Targeting:**
The campaign affects major global telecommunications service providers, including United States carriers. Salt Typhoon has demonstrated persistent, sophisticated targeting of telecom backbone infrastructure.

**Extended Duration:**
Assessment indicates the campaign will likely continue over the next two years, representing a sustained, strategic intelligence collection operation.

**Expanded Targeting:**
Beyond direct telecommunications providers, targeting extends to:
- Managed service providers (MSPs) supporting telecom companies
- Cloud providers hosting telecom infrastructure
- Potential downstream victim compromise through trusted provider relationships

**Implications:**

**Intelligence Collection:**
PRC access to call records, location data, and communications enables strategic intelligence gathering on government officials, business leaders, and other targets.

**Supply Chain Risk:**
Compromise of telecommunications providers creates supply chain risk, potentially affecting customers and downstream organizations trusting those providers.

**Critical Infrastructure Vulnerability:**
Telecommunications infrastructure serves as backbone for other critical sectors, amplifying the strategic impact of these compromises.

**Recommended Actions:**

Organizations should:
- Patch CVE-2023-20198 and other edge device vulnerabilities immediately
- Monitor for unauthorized GRE tunnels and unusual network traffic
- Review router and network equipment configurations for unauthorized changes
- Implement network traffic analysis for anomaly detection
- Segment networks to limit lateral movement

## 受影響系統

- Canadian telecommunications companies (confirmed compromises)
- Global telecommunications service providers
- Managed service providers (MSPs) in telecom sector
- Cloud providers hosting telecom infrastructure
- Network edge devices and routers (CVE-2023-20198)

## 來源連結

- [Cyber threat bulletin: People's Republic of China cyber threat activity: PRC cyber actors target telecommunications companies as part of a global cyberespionage campaign](https://cyber.gc.ca/en/guidance/cyber-threat-bulletin-prc-cyber-actors-target-telecommunications-companies-global-cyberespionage-campaign)

---
> 萃取時間: 2026-01-27 00:00 UTC
> 資料來源: Canadian Centre for Cyber Security ca-news
