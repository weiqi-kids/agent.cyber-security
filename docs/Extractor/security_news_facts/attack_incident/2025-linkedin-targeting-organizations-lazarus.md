# Beware of Contacts through LinkedIn: They Target Your Organization's Property, Not Yours

| 項目 | 內容 |
|------|------|
| **日期** | 2025-01-20 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

Threat actors, including Lazarus group, exploit LinkedIn through account hijacking and social engineering to target defense industry and cryptocurrency sector employees, aiming to compromise organizational systems rather than individuals.

## 事實內容

JPCERT/CC reported on unauthorized contact campaigns through LinkedIn targeting organizational assets. Recent reports highlight threat actors using LinkedIn as an initial attack vector, with attackers focusing on compromising company systems rather than individual employees.

**Attack Methods:**

Threat actors exploit LinkedIn through several techniques:

*Account Hijacking*
Attackers compromise legitimate LinkedIn accounts, particularly those belonging to HR representatives or recruiters at defense contractors. This provides credibility to malicious outreach.

*Communication Migration*
Attackers request targets switch platforms to Skype, WhatsApp, Telegram, or other messaging services, moving conversations away from LinkedIn's monitoring and security controls.

*Malicious File Distribution*
Victims are tricked into downloading and executing files disguised as:
- Job offers and recruiting materials
- Cryptocurrency trading tools
- Technical documentation or software

**Primary Targets:**

The Lazarus group and similar threat actors primarily target:
- Defense industry employees
- Cryptocurrency exchange personnel and developers
- Cryptocurrency users and organizations
- Financial institutions

**Key Insight:** Attackers "target your organization's property, not yours"—they seek to compromise company systems and assets rather than individual employees' personal information.

**Identifying Suspicious Contacts:**

Red flags include:
- Requests to change communication tool from LinkedIn to other platforms
- Persistent inquiries about whether files were executed
- Questions regarding system environment details
- English-language communications (most targeting Japanese firms use Japanese emails)
- Fake recruiter personas advertising expensive fees or unusual opportunities

**Security Recommendations:**

Organizations should implement:

*Technical Controls*
- Restrict SNS usage on work devices through policy or technical controls
- Prohibit SNS applications on corporate systems
- Implement access controls limiting LinkedIn and similar platforms

*Policy & Awareness*
- Establish employee guidelines for SNS use if permitted
- Educate staff on attack indicators and social engineering tactics
- Create reporting mechanisms for suspicious contacts

*Risk Management*
- Assess whether business requirements justify SNS access on corporate devices
- Implement protective measures if SNS use is necessary
- Monitor for account compromises and suspicious activities

**Threat Attribution:**

Activity consistent with Lazarus group tactics, known for targeting:
- Defense contractors
- Cryptocurrency sector
- Financial institutions

## 受影響系統

- Corporate systems accessed via work devices
- Defense industry organizations
- Cryptocurrency exchanges and platforms
- Financial institutions

## 來源連結

- [Beware of Contacts through LinkedIn: They Target Your Organization's Property, Not Yours](https://blogs.jpcert.or.jp/en/2025/01/initial_attack_vector.html)

---
> 萃取時間: 2026-02-06 00:00 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
