# Joint guidance on malicious cyber threats to SD-WAN networks

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-25 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | policy_regulation |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要
Malicious cyber threat actors are targeting Software-Defined Wide Area Networks (SD-WAN) networks used by organizations globally. The Canadian Centre for Cyber Security (Cyber Centre), a part of the C

## 事實內容
Malicious cyber threat actors are targeting Software-Defined Wide Area Networks (SD-WAN) networks used by organizations globally. The Canadian Centre for Cyber Security (Cyber Centre), a part of the Communications Security Establishment Canada (CSE), and international partners strongly encourage immediate action to ensure SD-WAN s are patched, hardened and investigated for potential compromise. Consult the following for additional information and recommendations: Australia’s Signals Directorate’s Australian Cyber Security Centre (ASD ACSC) CISCO SD-WAN threat hunt guide (PDF) Cyber Centre alert on this threat Cyber Centre advisory on this threat Cisco’s advisory on this threat The Cyber Centre is monitoring the situation and can provide assistance and advice as required. If you believe your organization has been impacted or requires assistance, contact us by email at contact@cyber.gc.ca or by phone at 613-949-7048 or 1‑833‑CYBER‑88 . Quote We urge Canadian organizations and their network defenders to heed this warning, use the hunt guide, and patch. These malicious cyber threat actors are targeting organizations globally. Vigilance and immediate action will help us all harden our defences to get ahead of this threat. Rajiv Gupta, Head of the Canadian Centre for Cyber Security Background The Cyber Centre has joined ACSC and the following other international partners in releasing guidance alerting of malicious cyber threat actors targeting SD-WAN networks used by organizations globally: New Zealand National Cyber Security Centre (NCSC-NZ) United Kingdom National Cyber Security Centre (NCSC-UK) United States National Security Agency (NSA) United States Cybersecurity and Infrastructure Security Agency (CISA) Threat actors have been observed using CVE-2026-20127 to add a malicious rogue peer. They have then conducted a range of follow-on actions to achieve root access and maintain persistent, long-term access to SD-WAN networks. ACSC ’s hunt guide (PDF) has been prepared based on observations from various investigations and details the tactics, techniques and procedures (TTPs) leveraged by these malicious actors. The hunt guide aims to support network owners and defenders to conduct detection and threat hunting activities and provides mitigation guidance to reduce the risk from the observed TTPs . Mitigation advice The authoring agencies strongly urge network defenders to ensure SD-WAN s are fully patched (including for CVE-2026-20127) and to hunt for evidence of compromise detailed in the hunt guide. The guidance also urges organizations to review and implement Cisco's SD-WAN hardening guidance. To reduce the risks to your networks, Cisco’s SD-WAN hardening guidance should be reviewed in full. It includes advice on the following: Network perimeter controls: Ensure control components are behind a firewall, isolate VPN 512 interfaces, and use IP blocks for manually provisioned edge IPs SD-WAN manager access: Replace the self-signed certificate for the web user interface Control and data plane security: Use pairwise keying Session timeout: Limit to the shortest period possible Logging: Forward to a remote syslog server Additional resources For more information on vulnerabilities, visit our Alerts and advisories page . For best practices, visit our Cyber security guidance page .

## 受影響系統
- Cisco
- SD-WAN

## 來源連結
- [Joint guidance on malicious cyber threats to SD-WAN networks](https://cyber.gc.ca/en/news-events/joint-guidance-malicious-cyber-threats-sd-wan-networks)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：Canadian Centre for Cyber Security (ca-news)
