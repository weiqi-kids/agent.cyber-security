# Salesforce Data Extortion Campaign Exploits Misconfigured Guest Accounts

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-11 |
| **來源** | NCSC-FI (Finland) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

A cybercrime gang is exploiting misconfigured Salesforce guest accounts to steal customer data and hold it for ransom; Salesforce confirms no platform vulnerability.

## 事實內容

A prolific cybercrime gang is targeting Salesforce customers' data by exploiting misconfigured guest accounts intended to provide public access to certain services. Key findings:

- The attacks exploit guest account misconfigurations, not a vulnerability in the Salesforce platform itself
- Guest accounts misconfigured to provide access beyond intended public services are the attack vector
- Attackers successfully steal an organization's Salesforce customer data and then conduct extortion/ransom demands
- The data theft campaign ties to a financially motivated threat actor with a history of targeting cloud SaaS platforms
- Salesforce confirmed the campaign does not stem from a vulnerability in its platform

Organizations using Salesforce are advised to audit guest account configurations and ensure they do not have unintended access to sensitive customer data.

## 受影響系統

- Salesforce platform deployments with misconfigured guest accounts
- Organizations' customer data stored in Salesforce
- Salesforce CRM instances across industries

## 來源連結

- [Salesforce Sounds Alarm Over Fresh Data Extortion Campaign](https://www.databreachtoday.com/salesforce-sounds-alarm-over-fresh-data-extortion-campaign-a-30958)

---
> 萃取時間：2026-03-11 UTC
> 資料來源：NCSC-FI (Finland) ncsc-fi-news
