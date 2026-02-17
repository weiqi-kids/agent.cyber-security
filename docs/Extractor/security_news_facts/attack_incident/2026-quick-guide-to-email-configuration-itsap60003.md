# Quick guide to email configuration (ITSAP.60.003)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-17 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | attack_incident |
| **嚴重程度** | 低 |
| **信心水準** | 高 |

## 摘要

August 2025 Awareness series ITSAP.60.003 August 2025 | Awareness series This publication introduces several email configuration concepts, focusing on the available email authentication methods to ver...

## 事實內容

August 2025 Awareness series ITSAP.60.003 August 2025 | Awareness series This publication introduces several email configuration concepts, focusing on the available email authentication methods to verify the authenticity of the message. On this page Sender Policy Framework DomainKeys Identified Mail Transport Layer Security encryption Domain-based Message Authentication Reporting and Conformance Learn more Sender Policy Framework Sender Policy Framework (SPF) is a TXT record added to your domain’s zone file to be queried by the domain name system (DNS) server associated with your domain. The record states which IP address(es) are allowed to send email from your domain or on your domain’s behalf. Emails from IP addresses, IP ranges, or third-party domains that are not included may be labelled as spam. DNS translates a human-readable address into a machine-readable address to direct the user to the correct location. DomainKeys Identified Mail DomainKeys Identified Mail (DKIM) is generally already configured by large and reputable host email services. Essentially, DKIM places a signature on outgoing emails, which can be verified by a public DNS record to ensure they haven’t been modified. The receiving email address compares the signature key upon receipt and if the DKIM signature is invalid, it will likely be labeled as spam. Transport Layer Security encryption Transport Layer Security (TLS) encryption is a protocol that encrypts messages between servers so that they don’t get compromised in transit. TLS is a core email configuration used to ensure the privacy and integrity of an organization’s communications. However, while TLS can secure the initial transfer from the email client to the first server, it doesn’t guarantee that subsequent transfers will also use TLS encryption. Domain-based Message Authentication Reporting and Conformance Domain-based Message Authentication Reporting and Conformance (DMARC) is generally already configured by your host email server as it’s an advanced and complex setting. DMARC is the recommended protocol that chooses what to do with the information taken from SPF and DKIM . There are three set policies (p=): p=none, in which no action is taken and the message is delivered p=quarantine, in which the message is placed in a spam or junk folder for review p=reject, in which the message is rejected or bounced back to sender There are also policies for subdomains which are labelled as “sp=” but are only applied if subdomains are explicitly defined. While DMARC may appear complex to set up, it’s essential in today’s cyber security landscape. You can use a DMARC parsing service that will help you translate and understand the DMARC ’s output response. Third-party DMARC auditing protocol services can help by providing you with policy assurances and reporting mechanisms to monitor authentication and potential threats. When implementing DMARC , you should review rules periodically to check if important mail is getting blocked. To maintain a reasonable level of protection, you should configure SPF , DKIM and DMARC . When choosing an email service provider, ensure that it supports these configurations, offers TLS encryption, and has strong anti-spam and threat mitigation features. Reporting a cyber incident If your organization is a victim of fraud, contact your local police and file a report online through the Canadian Anti-Fraud Centre’s online reporting system or by phone at 1-888-495-8501 . Report cyber incidents online via the Cyber Centre’s My Cyber Portal . Learn more Implementation guidance: email domain protection (ITSP.40.065 v1.1) Cyber security best practices for email (ITSAP.60.002) Protective domain name system (ITSAP.40.019)

## 受影響系統

- N/A (需進一步分析)

## 來源連結

- [Quick guide to email configuration (ITSAP.60.003)](https://cyber.gc.ca/en/guidance/quick-guide-email-configuration)

---
> 萃取時間：2026-02-17 08:10 UTC
> 資料來源：Canadian Centre for Cyber Security (ca-news)

