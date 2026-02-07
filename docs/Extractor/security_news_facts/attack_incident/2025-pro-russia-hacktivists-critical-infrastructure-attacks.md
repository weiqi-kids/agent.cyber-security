# Joint cyber security advisory on pro-Russia hacktivists conducting opportunistic attacks on global critical infrastructure

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-09 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Joint international advisory warns of pro-Russia hacktivist groups exploiting unsecured VNC connections to attack critical infrastructure globally.

## 事實內容

Canada's Cyber Centre, the FBI, and international cybersecurity partners issued a joint advisory warning of ongoing opportunistic attacks by pro-Russia hacktivist groups targeting critical infrastructure worldwide.

**Threat Actors:**
Pro-Russia hacktivist groups conducting unsophisticated but effective opportunistic attacks against critical infrastructure entities globally.

**Attack Tactics:**

**Primary Vector:**
Exploitation of "minimally secured, Internet-facing virtual network computing (VNC) connections" to gain access to operational technology control devices within critical infrastructure systems.

**Technical Method:**
Attackers scan for and exploit publicly exposed VNC services with weak or default credentials, bypassing authentication to access industrial control systems and SCADA environments directly.

**Affected Sectors:**
Critical infrastructure entities worldwide across multiple sectors including energy, water, transportation, and manufacturing.

**Key Mitigations:**

**Network Isolation:**
- Remove OT assets from public internet exposure
- Eliminate direct internet connectivity for industrial control systems
- Use secure remote access solutions with multi-factor authentication instead of VNC

**Network Segmentation:**
- Establish clear boundaries between IT and OT networks
- Implement firewall rules restricting cross-network traffic
- Use demilitarized zones (DMZs) for necessary interconnections

**Asset Management and Authentication:**
- Maintain complete inventory of OT assets
- Implement robust authentication procedures
- Eliminate default credentials on all systems
- Enforce strong password policies

**Security Features:**
- Enable control system security features for separated audit functions
- Implement role-based access control
- Log all OT system access and changes

**Monitoring and Alerting:**
- Monitor OT network traffic continuously for anomalies
- Configure safeguards for operational setpoint ranges
- Enable deviation alerts for unauthorized changes
- Implement intrusion detection for OT networks

**Business Continuity:**
- Develop comprehensive business continuity plans
- Practice incident response procedures regularly
- Establish manual override procedures for OT systems
- Test recovery processes

**Assessment:**
The advisory emphasizes that despite using unsophisticated methods (scanning for exposed VNC), these attacks pose significant infrastructure risks. The low technical barrier enables persistent campaigns requiring immediate defensive action from all critical infrastructure operators.

**International Coordination:**
The joint issuance by Canada, United States (FBI), and international partners indicates coordinated threat intelligence sharing and unified defensive recommendations across allied nations.

## 受影響系統

- Critical infrastructure globally (energy, water, transportation, manufacturing)
- Internet-facing VNC connections
- Operational technology control systems
- SCADA systems with network connectivity
- Industrial control systems

## 來源連結

- [Joint cyber security advisory on pro-Russia hacktivists conducting opportunistic attacks on global critical infrastructure](https://cyber.gc.ca/en/news-events/joint-cyber-security-advisory-pro-russia-hacktivists-conducting-opportunistic-attacks-global-critical-infrastructure)

---
> 萃取時間: 2026-01-27 00:00 UTC
> 資料來源: Canadian Centre for Cyber Security ca-news
