# Executive Impersonation Social Engineering Attacks - LINE Group and Personal Data Requests

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-09 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

TWCERT/CC received multiple threat intelligence reports of attackers impersonating company executives via email to request LINE group creation and employee personal data collection.

## 事實內容

TWCERT/CC recently received multiple external threat intelligence reports revealing attackers impersonating internal company executives to launch social engineering attacks, deceiving recipients into opening emails and executing instructions. Organizations are advised to strengthen preventive measures and heighten vigilance; avoid clicking suspicious attachments or links in emails to prevent compromise.

### Attack Characteristics

**Attack Email Features**:
Attack emails exhibit obvious characteristics, with content primarily using "executive directives," "administrative needs," and "urgent tasks" as entry points.

**Email Content Examples**:
1. "For company management convenience, please create a dedicated internal company LINE group. After creation, forward the group QR code to this mailbox, and I will join shortly to arrange work."
2. "Request colleagues to provide employee list personal data"

### Attack Method

**Social Engineering Tactics**:
- Impersonate company executives using spoofed email addresses
- Exploit authority and urgency to pressure recipients into compliance
- Request creation of communication channels (LINE groups) for further exploitation
- Directly request sensitive employee personal information

**Risk**:
- Unauthorized access to internal communication channels
- Personal data leakage
- Potential follow-on attacks targeting collected information
- Organizational structure exposure

### TWCERT/CC Mitigation Recommendations

1. **Heighten Email Vigilance**:
   - Verify email source correctness
   - Avoid clicking suspicious attachments or links to prevent malware implantation or phishing site redirection
   - If accidentally entering suspected malicious websites, never input personal information, account passwords, or financial information

2. **Verify Sender Information**:
   - Check for anomalous sender information
   - Re-confirm email authenticity with supervisor or IT department
   - If suspected social engineering attack, immediately report to IT department for follow-up handling

3. **Enhanced Authentication**:
   - Regularly change passwords meeting complexity principles
   - Enable multi-factor authentication (MFA) to strengthen security protection and reduce attacker intrusion risk

4. **Network Administrator Actions**:
   - Reference latest threat intelligence and compromise indicators
   - Deploy preventive blocking measures to intercept and filter suspicious emails

5. **Internal Awareness Training**:
   - Continuously strengthen internal security awareness and drill operations
   - Enhance personnel social engineering attack identification capabilities and protection awareness to reduce compromise risk

## 受影響系統

- Corporate email systems
- Organizations using LINE for internal communications
- Employees with access to personnel information

## 來源連結

- [提高社交工程警覺！偽冒主管要求建群組與提供個資](https://www.twcert.org.tw/tw/cp-104-10547-7ab7d-1.html)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：TWCERT/CC rss-104
