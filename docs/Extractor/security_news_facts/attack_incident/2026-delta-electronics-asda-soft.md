# Delta Electronics ASDA-Soft

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
Successful exploitation of this vulnerability may allow an attacker to write arbitrary data beyond the bounds of a stack-allocated buffer, leading to the corruption of a structured e

## 事實內容
View CSAF
Summary
Successful exploitation of this vulnerability may allow an attacker to write arbitrary data beyond the bounds of a stack-allocated buffer, leading to the corruption of a structured exception handler (SEH).
The following versions of Delta Electronics ASDA-Soft are affected:

ASDA-Soft &lt;=7.2.0.0 (CVE-2026-1361)





CVSS
Vendor
Equipment
Vulnerabilities




v3 7.8
Delta Electronics
Delta Electronics ASDA-Soft
Stack-based Buffer Overflow




Background

Critical Infrastructure Sectors: Critical Manufacturing
Countries/Areas Deployed: Worldwide
Company Headquarters Location: Taiwan


Vulnerabilities

Expand All +

CVE-2026-1361

A stack-based buffer overflow vulnerability exists in ASDA_Soft version 7.2.0.0 when parsing .par files. The root cause is the improper validation of a user-controlled size parameter, which is checked incorrectly against the upper limits of the local buffer. This allows data to be written past the end of the buffer.
View CVE Details

Affected Products
Delta Electronics ASDA-Soft

Vendor:Delta Electronics
Product Version:Delta Electronics ASDA-Soft: &lt;=7.2.0.0
Product Status:known_affected


Remediations
MitigationDelta has fixed this vulnerability and released a new version v7.2.2.0 at Delta Download Center (https://downloadcenter.deltaww.com/en-US/DownloadCenter?v=1&amp;q=asda-soft&amp;sort_expr=cdate&amp;sort_dir=DESC).https://downloadcenter.deltaww.com/en-US/DownloadCenter?v=1&amp;q=asda-soft&amp;sort_expr=cdate&amp;sort_dir=DESC
MitigationFor more information, see Delta Electronics advisory Delta-PCSA-2026-00003 at https://www.deltaww.com/en-US/service-support/product-cybersecurity/advisoryhttps://www.deltaww.com/en-US/service-support/product-cybersecurity/advisory
MitigationDelta Electronics provides the following general recommendations: Do not click on untrusted internet links or open unsolicited attachments in emails. Avoid exposing control systems and equipment to the Internet. Place control system networks and remote devices behind firewalls, and isolate them from the business network. When remote access is required, use a secure access method, such as a virtual private network (VPN).If you have any product-related support concerns, contact Delta via the portal page(https://www.deltaww.com/en-US/service-support/contact-us?type=1) for any information or materials you may require.https://www.deltaww.com/en-US/service-support/contact-us?type=1

Relevant CWE: CWE-121 Stack-based Buffer Overflow

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
7.8
HIGH
CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H








Acknowledgments

nisu of Trend Research reported this vulnerability to CISA


Legal Notice and Terms of Use
This product is provided subject to this Notification (https://www.cisa.gov/notification) and this Privacy &amp; Use policy (https://www.cisa.gov/privacy-policy).

Recommended Practices
CISA recommends users take defensive measures to minimize the risk of exploitation of this vulnerability. CISA reminds organizations to perform proper impact analysis and risk assessment prior to deploying defensive measures.
CISA also provides a section for control systems security recommended practices on the ICS webpage on cisa.gov/ics. Several CISA products detailing cyber defense best practices are available for reading and download, including Improving Industrial Control Systems Cybersecurity with Defense-in-Depth Strategies.
CISA encourages organizations to implement recommended cybersecurity strategies for proactive defense of ICS assets.
Additional mitigation guidance and recommended practices are publicly available on the ICS webpage at cisa.gov/ics in the technical information paper, ICS-TIP-12-146-01B--Targeted Cyber Intrusion Detection and Mitigation Strategies.
Organizations observing suspected malicious activity should follow established internal procedures and report findings to CISA for tracking and correlation against other incidents.
No known public exploitation specifically targeting this vulnerability has been reported to CISA at this time. This vulnerability is not exploitable remotely.

Revision History

Initial Release Date: 2026-02-17




Date
Revision
Summary




2026-02-17
1
Initial Publication.




Legal Notice and Terms of Use

## 來源連結
- [Delta Electronics ASDA-Soft](https://www.cisa.gov/news-events/ics-advisories/icsa-26-048-02)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：CISA (US) cisa
