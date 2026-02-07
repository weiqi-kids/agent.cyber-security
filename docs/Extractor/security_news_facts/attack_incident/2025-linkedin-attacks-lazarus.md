# Beware of Contacts through LinkedIn: They Target Your Organization's Property, Not Yours

| 項目 | 內容 |
|------|------|
| **日期** | 2025-01-20 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Lazarus group (TraderTraitor) exploits LinkedIn via hijacked accounts, migrating victims to alternate platforms for malware delivery targeting defense, crypto, and financial sectors.

## 事實內容

JPCERT/CC reports Lazarus group LinkedIn-based attacks:

**Attack Method:**
1. **Initial Contact:** Hijacked legitimate LinkedIn accounts contact employees
2. **Channel Migration:** Victims directed to alternate platforms (Skype, WhatsApp, Telegram)
3. **Malware Delivery:** Requests to download/execute files (Word documents, ZIP archives, MSI installers)
4. **Persistence:** Attackers verify file execution and probe system environments

**Targets:**
- Defense industry employees (Operation Dream Job)
- Cryptocurrency exchange workers and developers (Operation Dangerous Password)
- Cryptocurrency users and organizations (Operation AppleJeus)
- Financial institutions and software developers

**Threat Actors:**
- **Lazarus Group** (North Korean cyber actors)
- Also tracked as **TraderTraitor**
- Notable breach: $308 million Bitcoin.DMM.com theft

**Defense Recommendations:**

**Organizational Controls:**
- "Restrict the use of SNS on work devices (e.g., prohibit installing SNS applications, configure access control)" where possible
- Establish policies governing employee SNS usage on corporate hardware
- Create protective measures and discussion protocols for contacted employees

**Individual Awareness:**
- Suspicious indicators: requests to change communication platforms
- Persistent file execution follow-ups
- Recruitment-themed outreach in English

## 受影響系統

- Defense industry organizations
- Cryptocurrency exchanges
- Financial institutions
- Software development organizations

## 來源連結

- [Beware of Contacts through LinkedIn: They Target Your Organization's Property, Not Yours](https://blogs.jpcert.or.jp/en/2025/01/initial_attack_vector.html)

---
> 萃取時間：2026-01-27 UTC
> 資料來源：JPCERT/CC Blog jpcert-blog
