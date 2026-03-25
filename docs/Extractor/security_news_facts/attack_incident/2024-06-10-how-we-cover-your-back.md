# How We Cover Your Back

| Item | Content |
|------|---------|
| **Date** | 2024-06-10 |
| **Source** | CERT.at (Austria) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |


## Summary
As a national CERT, one of our extremely important tasks is to proactively inform network operators about potential or confirmed security issues that...

## Factual Content
As a national CERT, one of our extremely important tasks is to proactively inform network operators about potential or confirmed security issues that could affect Austrian companies. Initially, I intended to discuss the technical changes in our systems, but I believe it's better to start by explaining what we actually do and how we help you sleep well at night &mdash; though you should never rely solely on us!
Understanding the Security Landscape
Consider the vastness of the Internet: millions of connected devices, millions of different configurations, and thousands of solutions. In Austria alone, shodan.io reports approximately 1.7 million devices accessible online [1]. These include web and mail servers, VPN endpoints, databases, and virtually anything else you can imagine connected to the Internet. Such devices can be misconfigured, exposed by mistake, or have critical vulnerabilities. While the owners are primarily responsible for their services, we enhance the security of Austrians by notifying network operators of significant issues.
As you can imagine, handling every possible case would be impossible. Therefore, we focus on the most typical issues and automate much of our processes. Our approach heavily relies on automated data processing and sending notifications via email. To accomplish this, we subscribe to data feeds from partners like ShadowServer [2], a non-profit organization, and process them with an open-source solution called IntelMQ [3]. We handle about 9

## Source Links
- [How We Cover Your Back](https://www.cert.at/en/blog/2024/6/how-we-cover-your-back)

---
> Extraction time: 2026-03-07 UTC
> Data source: CERT.at (Austria) 
