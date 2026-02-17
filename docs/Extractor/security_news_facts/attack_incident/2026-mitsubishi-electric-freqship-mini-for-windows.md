# Mitsubishi Electric FREQSHIP-mini for Windows

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-03 |
| **來源** | CISA (US) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

View CSAF Summary Successful exploitation of this vulnerability could allow an attacker to gain unauthorized access to, modify, delete, or destroy information stored on the system where the affected p...

## 事實內容

View CSAF Summary Successful exploitation of this vulnerability could allow an attacker to gain unauthorized access to, modify, delete, or destroy information stored on the system where the affected product is installed, or cause a denial-of-service condition on the affected system. The following versions of Mitsubishi Electric FREQSHIP-mini for Windows are affected: FREQSHIP-mini for Windows >=8.0.0| CVSS Vendor Equipment Vulnerabilities v3 8.8 Mitsubishi Electric Mitsubishi Electric FREQSHIP-mini for Windows Incorrect Default Permissions Background Critical Infrastructure Sectors: Critical Manufacturing, Energy, Information Technology, Healthcare and Public Health, Government Services and Facilities Countries/Areas Deployed: Japan Company Headquarters Location: Japan Vulnerabilities Expand All + CVE-2025-10314 A malicious code execution vulnerability exists in Mitsubishi's small-capacity UPS shutdown software, FREQSHIP-mini for Windows, due to incorrect default permissions. A local attacker may be able to execute arbitrary code with system privileges by replacing service executable or DLL files in the installation directory with specially crafted files. View CVE Details Affected Products Mitsubishi Electric FREQSHIP-mini for Windows Vendor: Mitsubishi Electric Product Version: Mitsubishi Electric FREQSHIP-mini for Windows: >=8.0.0| Product Status: known_affected Remediations Vendor fix The vulnerability has been addressed in FREQSHIP-mini for Windows version 8.1.0 or later. Download and install the updated version from the Mitsubishi Electric download site at https://www.mitsubishielectric.co.jp/fa/download/index.html . Mitigation Mitsubishi Electric recommends that customers take the following mitigation measures to minimize the risk of this vulnerability being exploited: Use the PCs with the affected product installed only within a LAN, and block remote logins from untrusted networks, hosts, and non-administrator users. Block unauthorized access by using a firewall or virtual private network (VPN), etc., and allow remote login only for administrators when connecting the PCs with the affected product installed to the internet. Restrict physical access to the PC and its connected network to prevent unauthorized access. Do not click on links or open attachments in emails from untrusted sources. Install and regularly update antivirus software. Mitigation Mitsubishi Electric Corporation recommends users contact their local Mitsubishi Electric representative at https://www.mitsubishielectric.co.jp/fa/support/purchase/index.html with questions. Mitigation For additional details, refer to Mitsubishi Electric's security advisory at https://www.mitsubishielectric.com/en/psirt/vulnerability/pdf/2025-019_en.pdf . Relevant CWE: CWE-276 Incorrect Default Permissions Metrics CVSS Version Base Score Base Severity Vector String 3.1 8.8 HIGH CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:H Acknowledgments Kazuma Matsumoto of GMO Cybersecurity by IERAE, Inc. reported this vulnerability to Mitsubishi Electric Legal Notice and Terms of Use This product is provided subject to this Notification (https://www.cisa.gov/notification) and this Privacy & Use policy (https://www.cisa.gov/privacy-policy). Recommended Practices CISA recommends users take defensive measures to minimize the risk of exploitation of this vulnerability. CISA reminds organizations to perform proper impact analysis and risk assessment prior to deploying defensive measures. CISA also provides a section for control systems security recommended practices on the ICS webpage on cisa.gov/ics. Several CISA products detailing cyber defense best practices are available for reading and download, including Improving Industrial Control Systems Cybersecurity with Defense-in-Depth Strategies. CISA encourages organizations to implement recommended cybersecurity strategies for proactive defense of ICS assets. Additional mitigation guidance and recommended practices are publicly available on the ICS webpage at cisa.gov/ics in the technical information paper, ICS-TIP-12-146-01B--Targeted Cyber Intrusion Detection and Mitigation Strategies. Organizations observing suspected malicious activity should follow established internal procedures and report findings to CISA for tracking and correlation against other incidents. CISA also recommends users take the following measures to protect themselves from social engineering attacks: Do not click web links or open attachments in unsolicited email messages. Refer to Recognizing and Avoiding Email Scams for more information on avoiding email scams. Refer to Avoiding Social Engineering and Phishing Attacks for more information on social engineering attacks. No known public exploitation specifically targeting this vulnerability has been reported to CISA at this time. This vulnerability is not exploitable remotely. Revision History Initial Release Date: 2026-02-03 Date Revision Summary 2026-02-03 1 Initial Republication of Mitsubishi Electric 2025-019. Legal Notice and Terms of Use

## 受影響系統

- N/A (需進一步分析)

## 來源連結

- [Mitsubishi Electric FREQSHIP-mini for Windows](https://www.cisa.gov/news-events/ics-advisories/icsa-26-034-01)

---
> 萃取時間：2026-02-17 08:10 UTC
> 資料來源：CISA (US) (cisa)

