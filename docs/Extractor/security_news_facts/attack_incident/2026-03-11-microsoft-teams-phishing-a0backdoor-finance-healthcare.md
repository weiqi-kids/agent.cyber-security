# Microsoft Teams Phishing Campaign Deploys A0Backdoor Against Finance and Healthcare

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-11 |
| **來源** | NCSC-FI (Finland) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Hackers used Microsoft Teams to impersonate IT staff, gained remote access via Quick Assist, and deployed a new malware called A0Backdoor against financial and healthcare organizations.

## 事實內容

A threat actor is targeting employees at financial and healthcare organizations via Microsoft Teams to deploy a new backdoor malware called A0Backdoor. Key attack details from BleepingComputer reporting:

- **Initial vector**: Threat actors flood target email inboxes with spam, then contact victims via Microsoft Teams impersonating the company's IT support staff
- **Social engineering**: Attackers offer to "help" with the spam problem to gain the victim's trust
- **Remote access acquisition**: Victims are persuaded to grant remote access through Microsoft Quick Assist
- **Payload**: Once remote access is obtained, attackers deploy A0Backdoor, a newly identified malware
- **Sectors targeted**: Financial institutions and healthcare organizations
- **Technique classification**: This is a variation of the "vishing via Teams" technique previously used by threat actors including Storm-1811 and BlackBasta-affiliated groups

## 受影響系統

- Microsoft Teams environments
- Windows endpoints at financial and healthcare organizations
- Microsoft Quick Assist remote access tool

## 來源連結

- [Microsoft Teams phishing targets employees with A0Backdoor malware](https://www.bleepingcomputer.com/news/security/microsoft-teams-phishing-targets-employees-with-backdoors/)

---
> 萃取時間：2026-03-11 UTC
> 資料來源：NCSC-FI (Finland) ncsc-fi-news
