# Mitsubishi Electric MELSEC iQ-R Series

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-05 |
| **來源** | CISA (US) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

View CSAF Summary Successful exploitation of this vulnerability may allow an attacker to read device data or part of a control program from the affected product, write device data in the affected prod...

## 事實內容

View CSAF Summary Successful exploitation of this vulnerability may allow an attacker to read device data or part of a control program from the affected product, write device data in the affected product, or cause a denial-of-service condition on the affected product. The following versions of Mitsubishi Electric MELSEC iQ-R Series are affected: MELSEC iQ-R Series R08/16/32/120PCPU firmware CVSS Vendor Equipment Vulnerabilities v3 9.4 Mitsubishi Electric Mitsubishi Electric MELSEC iQ-R Series Improper Validation of Specified Quantity in Input Background Critical Infrastructure Sectors: Critical Manufacturing Countries/Areas Deployed: Worldwide Company Headquarters Location: Japan Vulnerabilities Expand All + CVE-2025-15080 An information disclosure, information tampering, and denial-of-service vulnerability exists in Mitsubishi Electric proprietary protocol communication and SLMP communication used in FA products. An attacker may be able to read device data or part of a control program from the affected product, write device data in the affected product, or cause a denial-of-service condition on the affected product by sending a specially crafted packet containing a specific command to the affected product. View CVE Details Affected Products Mitsubishi Electric MELSEC iQ-R Series Vendor: Mitsubishi Electric Product Version: Mitsubishi Electric MELSEC iQ-R Series R08/16/32/120PCPU firmware: Product Status: known_affected Remediations Mitigation Mitsubishi Electric recommends users of the affected products follow the procedure below to update firmware version 49 or later. Download the update file for the fixed version, the engineering software for firmware upgrade, and the manual from the download website at https://www.mitsubishielectric.com/fa/download/index.html . For details on updating the firmware, see MELSEC iQ-R Module Configuration Manual "Appendix 2 Firmware Update Function". Mitigation Mitsubishi Electric recommends the following mitigations to reduce the risk of exploiting this vulnerability: Use a firewall or virtual private network (VPN) block access from untrusted networks and hosts using a firewall. Use the product within a LAN and block access from untrusted networks and hosts through a firewall. Use firewalls, IP filters, and similar controls to minimize connections to the product and prevent access from untrusted networks and hosts. For details on the IP filter function, refer to "IP Filter" in section 1.13, Security, of the MELSEC iQ-R Ethernet User's Manual (Application). Restrict physical access to the affected product and its connected LAN. Mitigation For specific update instructions and additional details see the Mitsubishi Electric advisory at https://www.mitsubishielectric.com/psirt/vulnerability/pdf/2025-020_en.pdf . Mitigation For further information, contact your local Mitsubishi Electric representative at https://www.mitsubishielectric.com/fa/service-support/index.html . Relevant CWE: CWE-1284 Improper Validation of Specified Quantity in Input Metrics CVSS Version Base Score Base Severity Vector String 3.1 9.4 CRITICAL CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:H/A:H Acknowledgments Mitsubishi Electric reported this vulnerability to CISA Legal Notice and Terms of Use This product is provided subject to this Notification (https://www.cisa.gov/notification) and this Privacy & Use policy (https://www.cisa.gov/privacy-policy). Recommended Practices CISA recommends users take defensive measures to minimize the risk of exploitation of this vulnerability. CISA reminds organizations to perform proper impact analysis and risk assessment prior to deploying defensive measures. CISA also provides a section for control systems security recommended practices on the ICS webpage on cisa.gov/ics. Several CISA products detailing cyber defense best practices are available for reading and download, including Improving Industrial Control Systems Cybersecurity with Defense-in-Depth Strategies. CISA encourages organizations to implement recommended cybersecurity strategies for proactive defense of ICS assets. Additional mitigation guidance and recommended practices are publicly available on the ICS webpage at cisa.gov/ics in the technical information paper, ICS-TIP-12-146-01B--Targeted Cyber Intrusion Detection and Mitigation Strategies. Organizations observing suspected malicious activity should follow established internal procedures and report findings to CISA for tracking and correlation against other incidents. No known public exploitation specifically targeting this vulnerability has been reported to CISA at this time. Revision History Initial Release Date: 2026-02-05 Date Revision Summary 2026-02-05 1 Initial Republication of Mitsubishi Electric 2025-020 Legal Notice and Terms of Use

## 受影響系統

- N/A (需進一步分析)

## 來源連結

- [Mitsubishi Electric MELSEC iQ-R Series](https://www.cisa.gov/news-events/ics-advisories/icsa-26-036-02)

---
> 萃取時間：2026-02-17 08:10 UTC
> 資料來源：CISA (US) (cisa)

