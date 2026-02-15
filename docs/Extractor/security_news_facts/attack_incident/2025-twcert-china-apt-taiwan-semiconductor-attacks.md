# Cyber Warfare Behind Semiconductor Strategy: Attacks Target Design, Production, and Financial Analysts

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-28 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Proofpoint revealed three China-linked APT groups (UNK_DropPitch, UNK_SparkyCarp, UNK_FistBump) launched large-scale attacks against Taiwan semiconductor industry March-June 2025.

## 事實內容

US security company Proofpoint latest disclosure reveals three China-linked hacker organizations launched large-scale cyber attacks against Taiwan semiconductor industry during March-June 2025. Proofpoint uses "UNK" prefix naming for suspected APT organizations before long-term observation confirms identity, changing to "TAG" after identity establishment. Three main organizations involved: UNK_DropPitch, UNK_SparkyCarp, and UNK_FistBump.

**Strategic Shift:**
Report shows past Chinese hacker operations mostly concentrated on defense, government, and academic research sectors, but this attack's scale and concentration indicate strategic focus has shifted toward semiconductor ecosystem centered on Taiwan's major foundry enterprises. Goals possibly include obtaining advanced process technology or disrupting technology blockade response strategies targeting China.

**Attack Methods:**
Attackers mainly used spear-phishing emails with realistic resumes, industry reports, salary information, or investment analysis content as lure documents, targeting Taiwan semiconductor company engineers, HR, and financial analysts. Once victims open attachments or click links, multiple remote control tools can be planted, including Cobalt Strike beacon and rare Voldemort backdoor, to maintain long-term persistence and steal sensitive data for espionage.

**UNK_FistBump:**
- Activity: May-June 2025
- Compromised Taiwan university graduate student email accounts
- Impersonated identities sending phishing emails to semiconductor manufacturing, packaging, testing, and supply chain HR departments
- Disguised as job seekers to lure recipients into opening attachments
- Email attachments contained links to Zendesk or Filemail file-sharing services
- Stored malicious programs including Cobalt Strike Beacon and rare Voldemort backdoor
- Different malware triggered different attack chains, showing capability to adjust attack methods for different targets

**UNK_DropPitch:**
- Activity: April-May 2025
- Targeted major investment bank analysts specializing in Taiwan semiconductor and tech industry financial investment analysis
- Posed as fictional financial investment companies claiming cooperation investment interest
- Lured victims to open attachments
- Attachment links pointed to api[.]moctw[.]info, possibly spoofing "Ministry of Transportation and Communications, R.O.C." or "Ministry of Culture" official API endpoints
- Downloaded compressed packages containing malicious libcef.dll files
- DLL loader used to load HealthKick backdoor
- Also used brilliant-bubblegum-137cfe[.]netlify[.]app C2 (Netlify legitimate free static website service)
- Delivered another malicious DLL named pbvm90.dll as loader

**UNK_SparkyCarp:**
- Activity: March 2025
- Targeted one Taiwan semiconductor company with phishing attacks
- Established two C2 domains: accshieldportal[.]com and acesportal[.]com
- Forged login pages mimicking internal enterprise systems
- Attempted to trick victim employees into inputting accounts and passwords to steal credential information
- Demonstrated targeted and customized infrastructure deployment capabilities
- Used high-fidelity social engineering techniques to increase attack success rates

**Extended Impact:**
Proofpoint indicated UNK_DropPitch expanded attack scope to research institutions and financial investment advisors, speculating intent to master Taiwan chip enterprise future dynamics and commercial secrets, posing major threats to industry secrets and supply chain security.

## 受影響系統

- Taiwan semiconductor manufacturing, packaging, testing companies
- Supply chain related enterprises
- Research institutions and financial investment advisors
- HR and engineering personnel workstations
- Financial analyst systems

## 來源連結

- [半導體戰略背後的網路戰–資安攻擊鎖定設計、生產與財經分析師](https://www.twcert.org.tw/tw/cp-104-10355-56906-1.html)

---
> 萃取時間: 2026-02-15 23:45 UTC
> 資料來源: TWCERT/CC rss-104
