# Yokogawa FAST/TOOLS

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
Successful exploitation of these vulnerabilities could allow an attacker to redirected users to malicious sites, decrypt communications, perform a man-in-the-middle (MITM) attack, ex

## 事實內容
View CSAF
Summary
Successful exploitation of these vulnerabilities could allow an attacker to redirected users to malicious sites, decrypt communications, perform a man-in-the-middle (MITM) attack, execute malicious scripts, steal files, and perform other various attacks.
The following versions of Yokogawa FAST/TOOLS are affected:

FAST/TOOLS &gt;=R9.01|&lt;=R10.04 (CVE-2025-66594, CVE-2025-66595, CVE-2025-66597, CVE-2025-66598, CVE-2025-66599, CVE-2025-66600, CVE-2025-66601, CVE-2025-66602, CVE-2025-66603, CVE-2025-66604, CVE-2025-66605, CVE-2025-66606, CVE-2025-66607, CVE-2025-66608)





CVSS
Vendor
Equipment
Vulnerabilities




v3 8.2
Yokogawa
Yokogawa FAST/TOOLS
Generation of Error Message Containing Sensitive Information, Cross-Site Request Forgery (CSRF), Use of a Broken or Risky Cryptographic Algorithm, Exposure of Sensitive System Information to an Unauthorized Control Sphere, Improperly Implemented Security Check for Standard, Reliance on IP Address for Authentication, Cleartext Transmission of Sensitive Information, Exposure of Private Personal Information to an Unauthorized Actor, Improper Neutralization of Invalid Characters in Identifiers in Web Pages, Path Traversal: '\..\filename'




Background

Critical Infrastructure Sectors: Critical Manufacturing, Energy, Food and Agriculture
Countries/Areas Deployed: Worldwide
Company Headquarters Location: Japan


Vulnerabilities

Expand All +

CVE-2025-66594

Detailed messages are displayed on the error page. This information could be exploited by an attacker for other attacks.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-209 Generation of Error Message Containing Sensitive Information

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
5.3
MEDIUM
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N







CVE-2025-66595

This product is vulnerable to cross-site request forgery (CSRF). When a user accesses a link crafted by an attacker, the user's account could be compromised.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-352 Cross-Site Request Forgery (CSRF)

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
5.3
MEDIUM
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:L/A:N







CVE-2025-66597

This product supports weak cryptographic algorithms, potentially allowing an attacker to decrypt communications with the web server.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-327 Use of a Broken or Risky Cryptographic Algorithm

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
8.2
HIGH
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:L/A:N







CVE-2025-66598

This product supports old SSL/TLS versions, potentially allowing an attacker to decrypt communications with the web server.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-327 Use of a Broken or Risky Cryptographic Algorithm

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
7.1
HIGH
CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:L/A:N







CVE-2025-66599

Physical paths could be displayed on web pages. This information could be exploited by an attacker for other attacks.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-497 Exposure of Sensitive System Information to an Unauthorized Control Sphere

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
5.3
MEDIUM
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N







CVE-2025-66600

This product lacks HSTS (HTTP Strict Transport Security) configuration. When an attacker performs a Man in the middle (MITM) attack, communications with the web server could be sniffed.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-358 Improperly Implemented Security Check for Standard

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
8.2
HIGH
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:L/A:N







CVE-2025-66601

This product does not specify MIME types. When an attacker performs a content sniffing attack, malicious scripts could be executed.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-358 Improperly Implemented Security Check for Standard

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
6.5
MEDIUM
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:L/A:N







CVE-2025-66602

The web server accepts access by IP address. When a worm that randomly searches for IP addresses intrudes into the network, it could potentially be attacked by the worm.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-291 Reliance on IP Address for Authentication

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
5.3
MEDIUM
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N







CVE-2025-66603

The web server accepts the OPTIONS method. An attacker could potentially use this information to carry out other attacks.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-358 Improperly Implemented Security Check for Standard

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
3.1
LOW
CVSS:3.1/AV:N/AC:H/PR:N/UI:R/S:U/C:L/I:N/A:N







CVE-2025-66604

The library version could be displayed on the web page. This information could be exploited by an attacker for other attacks.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-319 Cleartext Transmission of Sensitive Information

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
3.1
LOW
CVSS:3.1/AV:N/AC:H/PR:N/UI:R/S:U/C:L/I:N/A:N







CVE-2025-66605

Since there are input fields on this web page with the autocomplete attribute enabled, the input content could be saved in the browser the user is using.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-359 Exposure of Private Personal Information to an Unauthorized Actor

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
3.1
LOW
CVSS:3.1/AV:N/AC:H/PR:N/UI:R/S:U/C:L/I:N/A:N







CVE-2025-66606

This product does not properly encode URLs. An attacker could tamper with web pages or execute malicious scripts.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-86 Improper Neutralization of Invalid Characters in Identifiers in Web Pages

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
3.4
LOW
CVSS:3.1/AV:N/AC:H/PR:N/UI:R/S:C/C:L/I:N/A:N







CVE-2025-66607

The response header contains an insecure setting. Users could be redirected to malicious sites by an attacker.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-358 Improperly Implemented Security Check for Standard

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
3.7
LOW
CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:L/A:N







CVE-2025-66608

This product fails to adequately validate URLs. An attacker could send maliciously crafted requests to gain unauthorized access to files on the web server.
View CVE Details

Affected Products
Yokogawa FAST/TOOLS

Vendor:Yokogawa
Product Version:Yokogawa FAST/TOOLS: &gt;=R9.01|&lt;=R10.04
Product Status:known_affected


Remediations
MitigationYokogawa recommends users update to revision R10.04 and apply patch software (CS_e12787). After the patch is applied, users should apply R10.04 SP3.
MitigationYokogawa strongly recommends that all users establish and maintain a comprehensive security program, not just for addressing the vulnerability identified in this YSAR. Security program components include patch updates, antivirus software, backup and recovery solutions, zoning, hardening, whitelisting, firewalls, and other related measures. Yokogawa can assist organizations in setting up and continuously maintaining a security program. As a starting point for developing the most effective risk mitigation plan, Yokogawa offers security risk assessment services.
MitigationFor questions related to this report, please contact Yokogawa https://contact.yokogawa.com/cs/gw?c-id=000498.

Relevant CWE: CWE-29 Path Traversal: '\..\filename'

Metrics




CVSS Version
Base Score
Base Severity
Vector String




3.1
7.5
HIGH
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N








Acknowledgments

Yokogawa reported these vulnerabilities to CISA


Legal Notice and Terms of Use
This product is provided subject to this Notification (https://www.cisa.gov/notification) and this Privacy &amp; Use policy (https://www.cisa.gov/privacy-policy).

Recommended Practices
CISA recommends users take defensive measures to minimize the risk of exploitation of these vulnerabilities, such as:
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
No known public exploitation specifically targeting these vulnerabilities has been reported to CISA at this time.

Revision History

Initial Release Date: 2026-02-10




Date
Revision
Summary




2026-02-10
1
Initial Republication of YSAR-26-0001-E




Legal Notice and Terms of Use

## 來源連結
- [Yokogawa FAST/TOOLS](https://www.cisa.gov/news-events/ics-advisories/icsa-26-041-01)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：CISA (US) cisa
