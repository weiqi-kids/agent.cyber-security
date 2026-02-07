# Joint malware analysis report on Brickstorm backdoor

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-04 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

China state-sponsored actors deploy Brickstorm backdoor targeting VMware infrastructure, enabling credential extraction and hidden rogue VM creation in government and IT sectors.

## 事實內容

The Canadian Centre for Cyber Security, in coordination with CISA and NSA, released a joint malware analysis report on December 4, 2025, identifying Brickstorm backdoor operations.

**Threat Actor Attribution:**
"People's Republic of China (PRC) state-sponsored threat actors" are leveraging this malware for extended system persistence.

**Malware Capabilities:**
Brickstorm functions as a sophisticated backdoor targeting Linux environments, specifically:
- VMware vCenter servers
- VMware ESXI
- Windows systems

**Attack Techniques:**
Once successful, attackers can:
- Extract credentials from cloned virtual machine snapshots
- Establish hidden rogue VMs concealed from vCenter management interfaces

**Affected Sectors:**
The malware has primarily targeted:
- Government services facilities
- Information technology sector organizations
- VMware vSphere platforms

**Indicators of Compromise (IoCs):**
The joint publication includes IoCs and detection signatures derived from Brickstorm sample analysis, coordinated by Canadian Centre for Cyber Security with CISA and NSA.

**Mitigation Recommendations:**
Organizations should utilize the provided IoCs and detection signatures to identify and counteract Brickstorm malware instances within their infrastructure.

**Joint Coordination:**
This represents a coordinated international response involving:
- Canadian Centre for Cyber Security
- US Cybersecurity and Infrastructure Security Agency (CISA)
- US National Security Agency (NSA)

The report emphasizes the sophisticated nature of PRC state-sponsored operations targeting critical virtualization infrastructure, with particular focus on credential theft and persistent access mechanisms that evade standard management visibility.

## 受影響系統

- VMware vCenter servers
- VMware ESXI hypervisors
- VMware vSphere platforms
- Linux environments
- Windows systems
- Government services facilities infrastructure
- IT sector virtualization infrastructure

## 來源連結

- [Joint malware analysis report on Brickstorm backdoor](https://cyber.gc.ca/en/news-events/joint-malware-analysis-report-brickstorm-backdoor)

---
> 萃取時間: 2026-02-06 00:00 UTC
> 資料來源: Canadian Centre for Cyber Security ca-news
