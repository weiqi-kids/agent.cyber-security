# UAC-0001 (APT28) Cyberattacks Against Government Agencies Using BEARDSHELL and COVENANT

| 項目 | 內容 |
|------|------|
| **日期** | 2025-06-21 |
| **來源** | CERT-UA (Ukraine) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

UAC-0001 (APT28) compromised central executive authority's information system, deploying BEARDSHELL and SLIMAGENT malware on Windows server during March-April 2024 incident.

## 事實內容

During March-April 2024, while responding to a cyber incident in the information and communication system (ICS) of a central executive authority, CERT-UA identified a technical asset running Windows Server operating system. On this server, two malicious software implementations were discovered: BEARDSHELL and SLIMAGENT.

**Attack Details:**
- **Threat Actor:** UAC-0001 (APT28)
- **Malware Used:** BEARDSHELL, SLIMAGENT
- **Related Framework:** COVENANT (mentioned in title)
- **Compromised System:** Windows Server in government ICS
- **Target:** Central executive authority of Ukraine
- **Attack Method:** Advanced persistent threat with server compromise

**Timeline:**
- March-April 2024: Active incident period
- June 21, 2025: CERT-UA public disclosure

**Technical Details:**
- Server role: Appears to have been a critical system in government ICS
- Two distinct malware families deployed
- Incident discovered during CERT-UA response activities

**Context:**
This incident represents typical APT28 tactics of targeting government infrastructure and maintaining persistent access through multiple malware tools. The delayed disclosure (over a year later) is common for sensitive government compromises, allowing for full remediation and investigation before public disclosure.

## 受影響系統

- Windows Server operating systems
- Ukrainian central executive authority ICS
- Government information systems

## 來源連結

- [CERT-UA Article](https://cert.gov.ua/article/6284080)

---
> 萃取時間：2026-02-11 19:10 UTC
> 資料來源：CERT-UA (Ukraine) cert-ua
> Original language: Ukrainian (uk)
