# Joint cyber security advisory on worldwide network compromises by People's Republic of China state-sponsored actors

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-27 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Joint international advisory warns of PRC state-sponsored actors (overlapping with Salt Typhoon) compromising critical infrastructure through router exploitation.

## 事實內容

The Canadian Centre for Cyber Security, NSA, and international cybersecurity partners issued a joint advisory on People's Republic of China state-sponsored actors conducting worldwide network compromises, with partial overlap with the "Salt Typhoon" threat group.

**Attack Methods:**

**Vulnerability Exploitation:**
Threat actors exploit "publicly known common vulnerabilities and exposures" (CVEs) to gain initial access to network infrastructure. They focus on unpatched systems and known security flaws.

**Router Modification for Persistence:**
Attackers modify routers to establish persistent access that survives reboots and security updates. Modified routers serve as:
- Long-term footholds in compromised networks
- Command and control infrastructure
- Pivot points for lateral movement

**Lateral Movement:**
Compromised devices are leveraged to pivot into additional networks, expanding access from edge devices into internal infrastructure.

**Targeted Sectors:**

- **Telecommunications**: Primary target for intelligence collection and infrastructure positioning
- **Government**: Federal, state/provincial, and local government networks
- **Transportation**: Logistics and critical transportation infrastructure
- **Lodging**: Hotels and hospitality sector (likely for intelligence on travelers)
- **Military Infrastructure**: Defense-related systems and contractors

**Primary Targets:**

Major telecommunications providers' backbone infrastructure:
- Backbone routers (core network infrastructure)
- Provider edge (PE) routers
- Customer edge (CE) routers

This targeting enables traffic interception, data collection, and potential network disruption.

**Mitigation Recommendations:**

**Active Threat Hunting:**
Network defenders are urged to actively search for malicious activity rather than relying solely on passive detection. Proactive hunting for indicators of compromise is essential.

**Countermeasures:**
Implement recommended countermeasures from the full advisory, including:
- Patch known vulnerabilities immediately
- Review router configurations for unauthorized changes
- Monitor for suspicious network traffic patterns
- Implement network segmentation
- Use secure management protocols for network devices

**International Coordination:**
Joint issuance by Canadian Cyber Centre, NSA, and international partners demonstrates coordinated threat intelligence sharing and unified response to strategic cyber threats.

**Strategic Context:**
This campaign represents sophisticated, persistent targeting by nation-state actors seeking long-term access to critical infrastructure for intelligence collection and potential future disruption.

## 受影響系統

- Telecommunications backbone routers
- Provider edge (PE) and customer edge (CE) routers
- Government network infrastructure
- Transportation systems
- Lodging/hospitality networks
- Military infrastructure and contractors

## 來源連結

- [Joint cyber security advisory on worldwide network compromises by People's Republic of China state-sponsored actors](https://cyber.gc.ca/en/news-events/joint-cyber-security-advisory-worldwide-network-compromises-peoples-republic-china-state-sponsored-actors)

---
> 萃取時間: 2026-01-27 00:00 UTC
> 資料來源: Canadian Centre for Cyber Security ca-news
