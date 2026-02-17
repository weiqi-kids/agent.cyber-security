# AVEVA PI to CONNECT Agent

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-10 |
| **來源** | CISA (US) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

View CSAF Summary Successful exploitation of this vulnerability could result in an unauthorized access to the proxy server. The following versions of AVEVA PI to CONNECT Agent are affected: PI to CONN...

## 事實內容

View CSAF Summary Successful exploitation of this vulnerability could result in an unauthorized access to the proxy server. The following versions of AVEVA PI to CONNECT Agent are affected: PI to CONNECT Agent CVSS Vendor Equipment Vulnerabilities v3 6.5 AVEVA AVEVA PI to CONNECT Agent Insertion of Sensitive Information into Log File Background Critical Infrastructure Sectors: Critical Manufacturing Countries/Areas Deployed: Worldwide Company Headquarters Location: United Kingdom Vulnerabilities Expand All + CVE-2026-1495 The vulnerability, if exploited, could allow an attacker with Event Log Reader (S-1-5-32-573) privileges to obtain proxy details, including URL and proxy credentials, from the PI to CONNECT event log files. This could enable unauthorized access to the proxy server. View CVE Details Affected Products AVEVA PI to CONNECT Agent Vendor: AVEVA Product Version: AVEVA PI to CONNECT Agent: Product Status: known_affected Remediations Mitigation AVEVA recommends that organizations evaluate the impact of this vulnerability based on their operational environment, architecture, and product implementation. Vendor fix Users of affected product versions should apply security updates to mitigate the risk of proxy details exposure in newly generated PI to CONNECT Agent event logs. Vendor fix Users who have used affected product versions, should review existing PI to CONNECT Agent event logs (live/backups/copies) for exposed proxy connection details and consider purging the sensitive data from logs and/or configuring new credentials for access to the proxy service. Mitigation The following general defensive measures are recommended: Mitigation Remove use of plain text passwords in proxy URLs. Alternatively, if passwords are required by the proxy, then use least-privilege credentials. Mitigation Ensure only trusted users are given Event Log Reader (S-1-5-32-573) privileges on hosts where PI to CONNECT is installed. Mitigation Review existing PI to CONNECT event logs (live/backups/copies) for exposed proxy connection details and consider purging the sensitive data from logs and/or configuring new credentials for access to the proxy service. Vendor fix All affected versions can be fixed by upgrading to PI to CONNECT Agent v2.5.2790 or higher. The latestversion of the agent can be downloaded from the CONNECT Data Services Portal here: https://datahub.connect.aveva.com/. Mitigation For additional information please refer to AVEVA-2026-003 https://www.aveva.com/content/dam/aveva/documents/support/cyber-security-updates/SecurityBulletin_AVEVA-2026-003.pdf. Relevant CWE: CWE-532 Insertion of Sensitive Information into Log File Metrics CVSS Version Base Score Base Severity Vector String 3.1 6.5 MEDIUM CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:C/C:H/I:N/A:N Acknowledgments AVEVA reported this vulnerability to CISA Legal Notice and Terms of Use This product is provided subject to this Notification (https://www.cisa.gov/notification) and this Privacy & Use policy (https://www.cisa.gov/privacy-policy). Recommended Practices CISA recommends users take defensive measures to minimize the risk of exploitation of this vulnerability, such as: Minimize network exposure for all control system devices and/or systems, ensuring they are not accessible from the internet. Locate control system networks and remote devices behind firewalls and isolating them from business networks. When remote access is required, use more secure methods, such as Virtual Private Networks (VPNs), recognizing VPNs may have vulnerabilities and should be updated to the most current version available. Also recognize VPN is only as secure as the connected devices. CISA reminds organizations to perform proper impact analysis and risk assessment prior to deploying defensive measures. CISA also provides a section for control systems security recommended practices on the ICS webpage on cisa.gov/ics. Several CISA products detailing cyber defense best practices are available for reading and download, including Improving Industrial Control Systems Cybersecurity with Defense-in-Depth Strategies. CISA encourages organizations to implement recommended cybersecurity strategies for proactive defense of ICS assets. Additional mitigation guidance and recommended practices are publicly available on the ICS webpage at cisa.gov/ics in the technical information paper, ICS-TIP-12-146-01B--Targeted Cyber Intrusion Detection and Mitigation Strategies. Organizations observing suspected malicious activity should follow established internal procedures and report findings to CISA for tracking and correlation against other incidents. No known public exploitation specifically targeting this vulnerability has been reported to CISA at this time. This vulnerability is not exploitable remotely. Revision History Initial Release Date: 2026-02-10 Date Revision Summary 2026-02-10 1 Initial Republication of AVEVA-2026-003 Legal Notice and Terms of Use

## 受影響系統

- N/A (需進一步分析)

## 來源連結

- [AVEVA PI to CONNECT Agent](https://www.cisa.gov/news-events/ics-advisories/icsa-26-041-04)

---
> 萃取時間：2026-02-17 08:10 UTC
> 資料來源：CISA (US) (cisa)

