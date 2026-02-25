# GE Vernova Enervista UR Setup

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-20 |
| **來源** | CISA (US) |
| **分類** | attack_incident |
| **嚴重程度** | High |
| **信心水準** | High |

## 摘要
View CSAF
Summary
Successful exploitation of these vulnerabilities may allow code execution with elevated privileges.
The following versions of GE Vernova Enervista UR Setup are affected:

Enervista U

## 事實內容
View CSAF
Summary
Successful exploitation of these vulnerabilities may allow code execution with elevated privileges.
The following versions of GE Vernova Enervista UR Setup are affected:

Enervista UR Setup &lt;8.70 (CVE-2026-1762, CVE-2026-1763)





CVSS
Vendor
Equipment
Vulnerabilities




v3 7.8
GE Vernova
GE Vernova Enervista UR Setup
Uncontrolled Search Path Element, Path Traversal: '.../...//'




Background

Critical Infrastructure Sectors: Critical Manufacturing, Energy, Water and Wastewater
Countries/Areas Deployed: Worldwide
Company Headquarters Location: United States


Vulnerabilities

Expand All +

CVE-2026-1762

The GE Vernova Enervista UR Setup Installer for versions prior to 8.70 are vulnerable to DLL hijacking. When running the installer in a location with unknown or untrusted DLLs, an attacker could obtain code execution with administrative privileges.
View CVE Details

Affected Products
GE Vernova Enervista UR Setup

Vendor:GE Vernova
Product Version:GE Vernova Enervista UR Setup: &lt;8.70
Product Status:known_affected


Remediations
Vendor fixGE Vernova recommends affected users to use patched versions of Enervista UR Setup: Versions 8.70 or later (https://www.gevernova.com/grid-solutions/resources?prod=urfamily&amp;type=7).https://www.gevernova.com/grid-solutions/resources?prod=urfamily&amp;type=7

Relevant CWE: CWE-427 Uncontrolled Search Path Element

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
7.8
HIGH
CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H







CVE-2026-1763

GE Vernova Enervista UR Setup versions prior to 8.70 are vulnerable to directory traversal when opening certain firmware update files. This could allow an attacker to write to some files on the filesystem with the privileges of the logged-in user.
View CVE Details

Affected Products
GE Vernova Enervista UR Setup

Vendor:GE Vernova
Product Version:GE Vernova Enervista UR Setup: &lt;8.70
Product Status:known_affected


Remediations
Vendor fixGE Vernova recommends affected users to use patched versions of Enervista UR Setup: Versions 8.70 or later (https://www.gevernova.com/grid-solutions/resources?prod=urfamily&amp;type=7).https://www.gevernova.com/grid-solutions/resources?prod=urfamily&amp;type=7

Relevant CWE: CWE-35 Path Traversal: '.../...//'

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
3.3
LOW
CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N








Acknowledgments

Reid Wightman of Dragos reported these vulnerabilities to CISA


Legal Notice and Terms of Use
This product is provided subject to this Notification (https://www.cisa.gov/notification) and this Privacy &amp; Use policy (https://www.cisa.gov/privacy-policy).

Recommended Practices
CISA recommends users take defensive measures to minimize the risk of exploitation of these vulnerabilities, such as:
Minimize network exposure for all control system devices and/or systems, ensuring they are not accessible from the internet.
Locate control system networks and remote devices behind firewalls and isolating them from business networks.
When remote access is required, use more secure methods, such as Virtual Private Networks (VPNs), recognizing VPNs may have vulnerabilities and should be updated to the most current version available. Also recognize VPN is only as secure as the connected devices.
CISA reminds organizations to perform proper impact analysis and risk assessment prior to deploying defensive measures.
CISA also provides a section for control systems security recommended practices on the ICS webpage on cisa.gov/ics. Several CISA products detailing cyber defense best practices are available for reading and download, including Improving Industrial Control Systems Cybersecurity with Defense-in-Depth Strategies.
CISA encourages organizations to implement recommended cybersecurity strategies for proactive defense of ICS assets.
Additional mitigation guidance and recommended practices are publicly available on the ICS webpage at cisa.gov/ics in the technical information paper, ICS-TIP-12-146-01B--Targeted Cyber Intrusion Detection and Mitigation Strategies.
Organizations observing suspected malicious activity should follow established internal procedures and report findings to CISA for tracking and correlation against other incidents.
No known public exploitation specifically targeting these vulnerabilities has been reported to CISA at this time. These vulnerabilities are not exploitable remotely.

Revision History

Initial Release Date: 2026-02-17




Date
Revision
Summary




2026-02-17
1
Initial Publication




Legal Notice and Terms of Use

## 來源連結
- [GE Vernova Enervista UR Setup](https://www.cisa.gov/news-events/ics-advisories/icsa-26-048-03)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：CISA (US) cisa
