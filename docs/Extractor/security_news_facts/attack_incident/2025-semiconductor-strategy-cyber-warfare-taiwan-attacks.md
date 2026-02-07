# Semiconductor Strategy Behind Cyber Warfare - Security Attacks Target Design, Production, and Financial Analysts

| Item | Content |
|------|------|
| **Date** | 2025-08-28 |
| **Source** | TWCERT/CC |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence Level** | High |

## Summary

U.S. security company Proofpoint revealed three China-affiliated hacker organizations (UNK_DropPitch, UNK_SparkyCarp, UNK_FistBump) conducted large-scale cyber attacks against Taiwan's semiconductor industry from March to June 2025, targeting engineers, HR, and financial analysts.

## Factual Content

U.S. security company Proofpoint's latest disclosure revealed three China-affiliated hacker organizations conducted large-scale cyber attacks against Taiwan's semiconductor industry between March and June 2025. Before long-term observation confirms identity, Proofpoint prefixes suspected Advanced Persistent Threat (APT) organizations with "UNK," changing to "TAG" after identity establishment. The three main hacker organizations involved in this campaign are UNK_DropPitch, UNK_SparkyCarp, and UNK_FistBump.

The report shows past Chinese hacker campaigns mostly concentrated on defense, government, and academic research fields, but this attack's scale and concentration show its strategic focus has shifted toward Taiwan's major foundry-centric semiconductor ecosystem. Objectives may include obtaining advanced process technology or disrupting technology blockade response strategies against China.

According to Proofpoint and open-source threat intelligence analysis, attackers primarily use spear-phishing emails, exploiting realistic resumes, industry reports, salary information, or investment analysis content as lure documents, targeting engineers, HR, and financial analysts within Taiwan semiconductor companies. Once victims open attachments or click links, multiple remote control tools can be planted in target computers, including Cobalt Strike beacon and rare Voldemort backdoor programs, maintaining long-term lurking and stealing sensitive data for espionage.

Proofpoint further indicates UNK_DropPitch hacker organization expanded attack scope to research institutions and financial investment advisors, presumably intending to grasp future dynamics and business secrets of Taiwan chip enterprises, posing major threats to industry secrets and supply chain security.

**UNK_FistBump Hacker Organization**

UNK_FistBump compromised Taiwanese university graduate student email accounts between May and June 2025, impersonating their identities to send multiple phishing emails to HR departments of Taiwan semiconductor manufacturing, packaging, testing, and supply chain-related enterprises, posing as job seekers to entice recipients to open attachments. These email attachments contain links to online file-sharing services like Zendesk or Filemail, hosting malicious programs including Cobalt Strike Beacon and rare Voldemort backdoor programs.

**UNK_DropPitch Hacker Organization**

Between April and May 2025, UNK_DropPitch hacker organization launched phishing attacks against multiple large investment banks, targeting analysts specializing in Taiwan semiconductor and technology industry financial investment analysis. Attackers posed as fictitious financial investment companies claiming to seek cooperation with targets, enticing victims to open attachments through phishing emails.

Phishing email attachment links point to api[.]moctw[.]info, presumably forged as "Ministry of Transportation and Communications, R.O.C." or "Ministry of Culture" official API endpoints to increase credibility, inducing victims to believe this API is government-authorized service. When victims click links, they download compressed packages containing malicious libcef.dll files, with this DLL serving as a loader for loading HealthKick backdoor programs.

**UNK_SparkyCarp Hacker Organization**

UNK_SparkyCarp hacker organization launched phishing attacks against a Taiwan semiconductor company in March 2025. This organization established two C2 domains accshieldportal[.]com and acesportal[.]com, creating fake login pages mimicking enterprise internal systems, attempting to induce victim employees to input account and password to steal credential information.

## Affected Systems

- Taiwan semiconductor manufacturing companies
- Semiconductor packaging and testing enterprises
- Investment banks and financial analysis institutions
- University research departments

## Source Links

- [半導體戰略背後的網路戰–資安攻擊鎖定設計、生產與財經分析師](https://www.twcert.org.tw/tw/cp-104-10355-56906-1.html)

---
> Extraction time: 2026-02-06 UTC
> Data source: TWCERT/CC rss-104
> Note: Original language: Traditional Chinese (TWCERT/CC)
