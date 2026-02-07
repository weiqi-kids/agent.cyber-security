# Threat Actors Exploit FortiCloud SSO Bypass to Steal LDAP Passwords

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-XX |
| **來源** | CERT.at (Austria) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

威脅行為者利用FortiCloud SSO繞過漏洞竊取LDAP連接密碼。

## 事實內容

CERT.at reported that threat actors are actively exploiting a FortiCloud Single Sign-On (SSO) bypass vulnerability to collect LDAP (Lightweight Directory Access Protocol) connection passwords. FortiCloud is Fortinet's cloud-based management platform for FortiGate firewalls and other security appliances.

The SSO bypass allows attackers to circumvent authentication controls and gain unauthorized access to FortiCloud management interfaces. Once accessed, attackers can extract LDAP connection credentials that organizations use to integrate their FortiGate devices with Active Directory or other directory services for user authentication.

Stolen LDAP credentials provide attackers with broad access to corporate directories, potentially enabling further lateral movement, privilege escalation, and data exfiltration within victim networks. The attack demonstrates the high value of cloud management platform compromises in multi-stage intrusions.

Organizations using FortiCloud should immediately review their FortiCloud configurations, rotate LDAP service account credentials, implement additional monitoring for FortiCloud access, and apply available security updates from Fortinet.

## 受影響系統

- Fortinet FortiCloud
- FortiGate firewalls integrated with FortiCloud
- LDAP/Active Directory services

## 來源連結

- [Threat actors use FortiCloud SSO bypass to collect LDAP connection passwords](https://www.cert.at/en/blog/2026/1/threat-actors-use-forticloud-to-collect-ldap-connection-passwords)

---
> 萃取時間：2026-01-28 UTC
> 資料來源：CERT.at (Austria) cert-at
