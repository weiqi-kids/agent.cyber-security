# Siemens Polarion

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-12 |
| **來源** | CISA (US) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

View CSAF Summary Polarion before V2506 contains a vulnerability that could allow authenticated remote attackers to conduct cross-site scripting attacks. Siemens has released new versions for the affe...

## 事實內容

View CSAF Summary Polarion before V2506 contains a vulnerability that could allow authenticated remote attackers to conduct cross-site scripting attacks. Siemens has released new versions for the affected products and recommends to update to the latest versions. The following versions of Siemens Polarion are affected: Polarion V2404 vers:intdot/ Polarion V2410 vers:intdot/ CVSS Vendor Equipment Vulnerabilities v3 7.6 Siemens Siemens Polarion Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting') Background Critical Infrastructure Sectors: Energy, Critical Manufacturing Countries/Areas Deployed: Worldwide Company Headquarters Location: Germany Vulnerabilities Expand All + CVE-2025-40587 The affected application allows arbitrary JavaScript code be included in document titles. This could allow an authenticated remote attacker to conduct a stored cross-site scripting attack by creating specially crafted document titles that are later viewed by other users of the application. View CVE Details Affected Products Siemens Polarion Vendor: Siemens Product Version: Polarion V2404, Polarion V2410 Product Status: known_affected Remediations Vendor fix Update to V2404.5 or later version Vendor fix Update to V2410.2 or later version Relevant CWE: CWE-79 Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting') Metrics CVSS Version Base Score Base Severity Vector String 3.1 7.6 HIGH CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:H/I:L/A:N Acknowledgments Siemens ProductCERT reported this vulnerability to CISA. Thales Digital Factory reported these vulnerabilities to Siemens. General Recommendations As a general security measure, Siemens strongly recommends to protect network access to devices with appropriate mechanisms. In order to operate the devices in a protected IT environment, Siemens recommends to configure the environment according to Siemens' operational guidelines for Industrial Security (Download: https://www.siemens.com/cert/operational-guidelines-industrial-security), and to follow the recommendations in the product manuals. Additional information on Industrial Security by Siemens can be found at: https://www.siemens.com/industrialsecurity Additional Resources For further inquiries on security vulnerabilities in Siemens products and solutions, please contact the Siemens ProductCERT: https://www.siemens.com/cert/advisories Terms of Use The use of Siemens Security Advisories is subject to the terms and conditions listed on: https://www.siemens.com/productcert/terms-of-use. Legal Notice and Terms of Use This product is provided subject to this Notification (https://www.cisa.gov/notification) and this Privacy & Use policy (https://www.cisa.gov/privacy-policy). Recommended Practices CISA recommends users take defensive measures to minimize the exploitation risk of these vulnerabilities. Minimize network exposure for all control system devices and/or systems, and ensure they are not accessible from the internet. Locate control system networks and remote devices behind firewalls and isolate them from business networks. When remote access is required, use more secure methods, such as Virtual Private Networks (VPNs), recognizing VPNs may have vulnerabilities and should be updated to the most recent version available. Also recognize VPN is only as secure as its connected devices. CISA reminds organizations to perform proper impact analysis and risk assessment prior to deploying defensive measures. CISA also provides a section for control systems security recommended practices on the ICS webpage on cisa.gov. Several CISA products detailing cyber defense best practices are available for reading and download, including Improving Industrial Control Systems Cybersecurity with Defense-in-Depth Strategies. CISA encourages organizations to implement recommended cybersecurity strategies for proactive defense of ICS assets. Additional mitigation guidance and recommended practices are publicly available on the ICS webpage at cisa.gov in the technical information paper, ICS-TIP-12-146-01B--Targeted Cyber Intrusion Detection and Mitigation Strategies. Organizations observing suspected malicious activity should follow established internal procedures and report findings to CISA for tracking and correlation against other incidents. Advisory Conversion Disclaimer This ICSA is a verbatim republication of Siemens ProductCERT SSA-035571 from a direct conversion of the vendor's Common Security Advisory Framework (CSAF) advisory. This is republished to CISA's website as a means of increasing visibility and is provided "as-is" for informational purposes only. CISA is not responsible for the editorial or technical accuracy of republished advisories and provides no warranties of any kind regarding any information contained within this advisory. Further, CISA does not endorse any commercial product or service. Please contact Siemens ProductCERT directly for any questions regarding this advisory. Revision History Initial Release Date: 2026-02-10 Date Revision Summary 2026-02-10 1 Publication Date 2026-02-12 2 Initial CISA Republication of Siemens ProductCERT SSA-035571 advisory Legal Notice and Terms of Use

## 受影響系統

- N/A (需進一步分析)

## 來源連結

- [Siemens Polarion](https://www.cisa.gov/news-events/ics-advisories/icsa-26-043-02)

---
> 萃取時間：2026-02-17 08:10 UTC
> 資料來源：CISA (US) (cisa)

