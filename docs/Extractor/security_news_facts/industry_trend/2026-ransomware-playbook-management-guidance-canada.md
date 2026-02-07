# Ransomware playbook (ITSM.00.099)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-28 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | industry_trend |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Canadian Cyber Centre releases comprehensive ransomware playbook with three-stage defense framework, warning of 26% annual increase in incidents and AI-powered attacks.

## 事實內容

The Canadian Centre for Cyber Security published ITSM.00.099 (effective December 11, 2025), identifying ransomware as "the top cybercrime threat to Canada's critical infrastructure" with incidents increasing approximately 26% annually.

**Modern Attack Tactics:**
- Double extortion (encryption + data theft threats)
- Covert reconnaissance of organizational communications
- Supply chain infiltration
- AI-powered autonomous attacks enabling rapid exploitation
- Data monetization through public release threats

**Three-Stage Defense Framework:**

**Stage 1: Prevention (Prevent Initial Access)**
- Implement multi-factor authentication (MFA)
- Conduct employee cybersecurity training
- Deploy application allow lists
- Use strong passphrases
- Segment networks
- Scan for vulnerabilities regularly

**Stage 2: Detection (Prevent Spread)**
- Deploy antivirus/antimalware software
- Establish firewalls and intrusion detection systems
- Apply principle of least privilege
- Monitor systems with automated alerting

**Stage 3: Recovery (Minimize Impact)**
- Maintain offline backups (critical mitigation)
- Test restoration processes monthly
- Implement both offline and cloud backups
- Document recovery procedures

**Incident Response Lifecycle (Four Phases):**
1. **Prepare:** Assign policies, test processes, track vulnerabilities
2. **Observe:** Monitor networks, generate incident reports
3. **Resolve:** Analyze findings, disconnect devices, run antimalware tools
4. **Understand:** Identify root causes, conduct lessons-learned sessions

**Email Domain Protection (Three Protocols):**
- **SPF (Sender Policy Framework):** Authorizes legitimate mail servers
- **DKIM (DomainKeys Identified Mail):** Digitally signs emails for authentication
- **DMARC:** Enforces authentication policies across both protocols

**Immediate Response Checklist:**
1. Isolate infected systems from networks and Internet
2. Report to local police, Canadian Anti-Fraud Centre, and Cyber Centre
3. Assemble incident response team
4. Reset administrator credentials (protecting backup access)
5. Wipe and reinstall operating systems
6. Run antivirus diagnostics on backups before restoration

**Critical Warning - Do Not Pay Ransom:**
- Payment funds criminal enterprises and terrorism
- No guarantee of file recovery or decryption keys
- May violate sanctions or money laundering laws
- Validates RaaS (Ransomware-as-a-Service) business models, encouraging future attacks

**AI Defense Safeguards:**
- Data categorization procedures
- Continuous monitoring for model drift
- Human-in-the-loop oversight for critical decisions
- Robust auditing and incident response mechanisms

**Additional Recommendations:**
- Engage cyber insurance providers for professional response support
- Develop alternative communication channels (external email) during incidents
- Conduct business impact analysis to identify critical functions
- Perform tabletop exercises to test response readiness
- Share incident findings with cybersecurity community

**Key Quote on Backups:**
"Having 1 or more backup files available provides your organization with an increased chance of recovering and getting back to business more quickly if you are the victim of ransomware."

## 受影響系統

- Critical infrastructure organizations in Canada
- Email systems (domain protection protocols)
- Network infrastructure
- Backup systems (offline and cloud)
- AI systems used for defense

## 來源連結

- [Ransomware playbook (ITSM.00.099)](https://cyber.gc.ca/en/guidance/ransomware-playbook-itsm00099)

---
> 萃取時間: 2026-02-06 00:00 UTC
> 資料來源: Canadian Centre for Cyber Security ca-news
