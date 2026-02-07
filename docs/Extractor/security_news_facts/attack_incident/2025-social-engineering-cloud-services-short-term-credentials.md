# Social Engineering Tactics Upgraded: Combining Cloud Services and Short-Term Credentials to Evade Defense

| Item | Content |
|------|------|
| **Date** | 2025-10-29 |
| **Source** | TWCERT/CC |
| **Category** | attack_incident |
| **Severity** | Medium |
| **Confidence Level** | Medium |

## Summary

TWCERT/CC received external intelligence on a wave of social engineering attacks combining cloud services and spoofed domains, where hackers rent Microsoft 365 services, register similar official domains, and apply for short-term SSL certificates to evade email and web defense mechanisms.

## Factual Content

TWCERT/CC received external intelligence that a recent wave of social engineering attacks combining cloud services and spoofed domains has emerged. Hackers rent Microsoft 365 services, register near-identical official domains, and apply for short-term SSL certificates attempting to evade email and webpage defense mechanisms to launch phishing email attacks.

According to intelligence content, in the first wave of attack actions, hackers used rented legitimate Microsoft 365 email accounts to impersonate "Microsoft account abnormal login activity notifications," launching phishing email attacks against multiple targets within enterprises, requesting targets to log into accounts to view abnormal login notifications. Additionally, attackers use URL Pattern filtering for targets. If matching rules, customized phishing pages are displayed to steal account passwords; if not matching, redirection goes to official legitimate login pages.

URL Pattern is a rule for determining whether URLs conform to specific formats. Attackers can use such URL Patterns to precisely filter targets, deciding when to display phishing pages.

In the second wave of attack actions, hackers adopted spear-phishing tactics, also using Microsoft 365 services but changing to "continuously" sending multiple fake "Microsoft one-time code notifications" to specific targets, attempting to create the illusion that target accounts are experiencing multiple login attempts. Afterward, they again send fake "Microsoft account abnormal login activity notifications," enticing targets to click links to immediately log into accounts to view abnormal login records, thereby stealing target account passwords.

Hacker organizations continue upgrading social engineering and phishing attack tactics. This attack adopted advanced strategies, repeatedly sending fake Microsoft system notifications attempting to create urgent atmospheres, exploiting recipient trust in official notifications and time pressure to induce recipients to provide account passwords without sufficient verification under click malicious links, causing unauthorized account access and sensitive data leakage. TWCERT/CC reminds enterprises and the public to maintain high vigilance, especially when receiving emails seemingly from official sources, to be extra cautious to avoid becoming attack targets.

## Affected Systems

- Microsoft 365 users and enterprise email systems
- Organizations with insufficient email security awareness training
- Systems lacking multi-factor authentication (MFA)

## Source Links

- [社交工程手法再升級:結合雲端服務與短期憑證規避防禦](https://www.twcert.org.tw/tw/cp-104-10473-991dd-1.html)

---
> Extraction time: 2026-02-06 UTC
> Data source: TWCERT/CC rss-104
> Note: Original language: Traditional Chinese (TWCERT/CC)
