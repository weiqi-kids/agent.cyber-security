# Honeywell CCTV Products

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
Successful exploitation of this vulnerability could lead to account takeovers and unauthorized access to camera feeds; an unauthenticated attacker may change the recovery email addre

## 事實內容
View CSAF
Summary
Successful exploitation of this vulnerability could lead to account takeovers and unauthorized access to camera feeds; an unauthenticated attacker may change the recovery email address, potentially leading to further network compromise.
The following versions of Honeywell CCTV Products are affected:

I-HIB2PI-UL 2MP IP 6.1.22.1216 (CVE-2026-1670)
SMB NDAA MVO-3 WDR_2MP_32M_PTZ_v2.0 (CVE-2026-1670)
PTZ WDR 2MP 32M WDR_2MP_32M_PTZ_v2.0 (CVE-2026-1670)
25M IPC WDR_2MP_32M_PTZ_v2.0 (CVE-2026-1670)





CVSS
Vendor
Equipment
Vulnerabilities




v3 9.8
Honeywell
Honeywell CCTV Products
Missing Authentication for Critical Function




Background

Critical Infrastructure Sectors: Commercial Facilities
Countries/Areas Deployed: Worldwide
Company Headquarters Location: United States


Vulnerabilities

Expand All +

CVE-2026-1670

The affected product is vulnerable to an unauthenticated API endpoint exposure, which may allow an attacker to remotely change the "forgot password" recovery email address.
View CVE Details

Affected Products
Honeywell CCTV Products

Vendor:Honeywell
Product Version:Honeywell I-HIB2PI-UL 2MP IP: 6.1.22.1216, Honeywell SMB NDAA MVO-3: WDR_2MP_32M_PTZ_v2.0, Honeywell PTZ WDR 2MP 32M: WDR_2MP_32M_PTZ_v2.0, Honeywell 25M IPC: WDR_2MP_32M_PTZ_v2.0
Product Status:known_affected


Remediations
MitigationHoneywell recommends users contact Honeywell at https://www.honeywell.com/us/en/contact/support for patch information.https://www.honeywell.com/us/en/contact/support

Relevant CWE: CWE-306 Missing Authentication for Critical Function

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
9.8
CRITICAL
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H








Acknowledgments

Souvik Kandar reported this vulnerability to CISA


Legal Notice and Terms of Use
This product is provided subject to this Notification (https://www.cisa.gov/notification) and this Privacy &amp; Use policy (https://www.cisa.gov/privacy-policy).

Recommended Practices
CISA recommends users take defensive measures to minimize the risk of exploitation of this vulnerability, such as:
Minimize network exposure for all control system devices and/or systems, ensuring they are not accessible from the Internet.
Locate control system networks and remote devices behind firewalls and isolating them from business networks.
When remote access is required, use more secure methods, such as Virtual Private Networks (VPNs), recognizing VPNs may have vulnerabilities and should be updated to the most current version available. Also recognize VPN is only as secure as the connected devices.
CISA reminds organizations to perform proper impact analysis and risk assessment prior to deploying defensive measures.
CISA also provides a section for control systems security recommended practices on the ICS webpage on cisa.gov/ics. Several CISA products detailing cyber defense best practices are available for reading and download, including Improving Industrial Control Systems Cybersecurity with Defense-in-Depth Strategies.
CISA encourages organizations to implement recommended cybersecurity strategies for proactive defense of ICS assets.
Additional mitigation guidance and recommended practices are publicly available on the ICS webpage at cisa.gov/ics in the technical information paper, ICS-TIP-12-146-01B--Targeted Cyber Intrusion Detection and Mitigation Strategies.
Organizations observing suspected malicious activity should follow established internal procedures and report findings to CISA for tracking and correlation against other incidents.
CISA also recommends users take the following measures to protect themselves from social engineering attacks:
Do not click web links or open attachments in unsolicited email messages.
Refer to Recognizing and Avoiding Email Scams for more information on avoiding email scams.
Refer to Avoiding Social Engineering and Phishing Attacks for more information on social engineering attacks.
No known public exploitation specifically targeting this vulnerability has been reported to CISA at this time.

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
- [Honeywell CCTV Products](https://www.cisa.gov/news-events/ics-advisories/icsa-26-048-04)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：CISA (US) cisa
