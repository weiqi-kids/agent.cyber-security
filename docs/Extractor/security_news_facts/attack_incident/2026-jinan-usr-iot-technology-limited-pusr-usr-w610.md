# Jinan USR IOT Technology Limited (PUSR) USR-W610

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
Successful exploitation of these vulnerabilities could result in authentication being disabled, a denial-of-service condition, or an attacker stealing valid user credentials, includi

## 事實內容
View CSAF
Summary
Successful exploitation of these vulnerabilities could result in authentication being disabled, a denial-of-service condition, or an attacker stealing valid user credentials, including administrator credentials.
The following versions of Jinan USR IOT Technology Limited (PUSR) USR-W610 are affected:

USR-W610 &lt;=3.1.1.0 (CVE-2026-25715, CVE-2026-24455, CVE-2026-26049, CVE-2026-26048)





CVSS
Vendor
Equipment
Vulnerabilities




v3 9.8
Jinan USR IOT Technology Limited (PUSR)
Jinan USR IOT Technology Limited (PUSR) USR-W610
Weak Password Requirements, Cleartext Transmission of Sensitive Information, Insufficiently Protected Credentials, Missing Authentication for Critical Function




Background

Critical Infrastructure Sectors: Critical Manufacturing
Countries/Areas Deployed: Worldwide
Company Headquarters Location: China


Vulnerabilities

Expand All +

CVE-2026-25715

The web management interface of the device allows the administrator username and password to be set to blank values. Once applied, the device permits authentication with empty credentials over the web management interface and Telnet service. This effectively disables authentication across all critical management channels, allowing any network-adjacent attacker to gain full administrative control without credentials.
View CVE Details

Affected Products
Jinan USR IOT Technology Limited (PUSR) USR-W610

Vendor:Jinan USR IOT Technology Limited (PUSR)
Product Version:Jinan USR IOT Technology Limited (PUSR) USR-W610: &lt;=3.1.1.0
Product Status:known_affected


Remediations
Vendor fixJinan USR IOT Technology Limited (PUSR) has stated that the product is end-of-life, and there are no plans to patch. Users of PUSR USR-W610 devices are encouraged to contact PUSR and keep their systems up to date.

Relevant CWE: CWE-521 Weak Password Requirements

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
9.8
CRITICAL
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H







CVE-2026-24455

The embedded web interface of the device does not support HTTPS/TLS for authentication and uses HTTP Basic Authentication. Traffic is encoded but not encrypted, exposing user credentials to passive interception by attackers on the same network.
View CVE Details

Affected Products
Jinan USR IOT Technology Limited (PUSR) USR-W610

Vendor:Jinan USR IOT Technology Limited (PUSR)
Product Version:Jinan USR IOT Technology Limited (PUSR) USR-W610: &lt;=3.1.1.0
Product Status:known_affected


Remediations
Vendor fixJinan USR IOT Technology Limited (PUSR) has stated that the product is end-of-life, and there are no plans to patch. Users of PUSR USR-W610 devices are encouraged to contact PUSR and keep their systems up to date.

Relevant CWE: CWE-319 Cleartext Transmission of Sensitive Information

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
7.5
HIGH
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N







CVE-2026-26049

The web management interface of the device renders the passwords in a plaintext input field. The current password is directly visible to anyone with access to the UI, potentially exposing administrator credentials to unauthorized observation via shoulder surfing, screenshots, or browser form caching.
View CVE Details

Affected Products
Jinan USR IOT Technology Limited (PUSR) USR-W610

Vendor:Jinan USR IOT Technology Limited (PUSR)
Product Version:Jinan USR IOT Technology Limited (PUSR) USR-W610: &lt;=3.1.1.0
Product Status:known_affected


Remediations
Vendor fixJinan USR IOT Technology Limited (PUSR) has stated that the product is end-of-life, and there are no plans to patch. Users of PUSR USR-W610 devices are encouraged to contact PUSR and keep their systems up to date.

Relevant CWE: CWE-522 Insufficiently Protected Credentials

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
5.7
MEDIUM
CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:H/I:N/A:N







CVE-2026-26048

The Wi-Fi router is vulnerable to de-authentication attacks due to the absence of Management Frame Protection, allowing forged deauthentication and disassociation frames to be broadcast without authentication or encryption. An attacker can use this to cause unauthorized disruptions and create a denial-of-service condition.
View CVE Details

Affected Products
Jinan USR IOT Technology Limited (PUSR) USR-W610

Vendor:Jinan USR IOT Technology Limited (PUSR)
Product Version:Jinan USR IOT Technology Limited (PUSR) USR-W610: &lt;=3.1.1.0
Product Status:known_affected


Remediations
Vendor fixJinan USR IOT Technology Limited (PUSR) has stated that the product is end-of-life, and there are no plans to patch. Users of PUSR USR-W610 devices are encouraged to contact PUSR and keep their systems up to date.

Relevant CWE: CWE-306 Missing Authentication for Critical Function

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
7.5
HIGH
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H








Acknowledgments

Abhishek Pandey of Payatu Security Consulting reported CVE-2026-25715, CVE-2026-24455, and CVE-2026-26049 to CISA
Abhishek Pandey and Ranit Pradhan of Payatu Security Consulting reported CVE-2026-26048 to CISA


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
No known public exploitation specifically targeting these vulnerabilities has been reported to CISA at this time.

Revision History

Initial Release Date: 2026-02-19




Date
Revision
Summary




2026-02-19
1
Initial Publication




Legal Notice and Terms of Use

## 來源連結
- [Jinan USR IOT Technology Limited (PUSR) USR-W610](https://www.cisa.gov/news-events/ics-advisories/icsa-26-050-03)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：CISA (US) cisa
