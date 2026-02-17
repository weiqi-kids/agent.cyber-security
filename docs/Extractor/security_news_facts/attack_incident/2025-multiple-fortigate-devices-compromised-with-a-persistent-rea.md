# Multiple FortiGate devices compromised with a persistent read-only access

| 項目 | 內容 |
|------|------|
| **日期** | 2025-04-16 |
| **來源** | CERT.at (Austria) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Please note : The original author of this post was Kamil Mankowski. Alexander Riepl was merely responsible for publishing and some translation efforts. On Friday, April 10th, Fortinet released informa...

## 事實內容

Please note : The original author of this post was Kamil Mankowski. Alexander Riepl was merely responsible for publishing and some translation efforts. On Friday, April 10th, Fortinet released information about a worldwide compromise of FortiGate devices, giving the attacker persistent read-only access. Threat actors seemingly used three known vulnerabilities in the SSL VPN feature to gain initial access to the devices and a symbolic link in the file system to survive patching of FortiOS. Background FortiGate is a VPN solution that enables remote access to corporate systems. It provides the legacy SSL VPN solution as one of its options. This feature was previously exposed to critical vulnerabilities CVE-2022-42475, CVE-2023-27997 and CVE-2024-21762. Each of these vulnerabilities allowed a remote, unauthenticated attacker to execute code on the device via a specially crafted request. The attacker used these vulnerabilities to compromise Fortigate devices and then placed a symbolic link in a folder used to serve language files. These are accessible without authentication, allowing anyone knowing the location to gain read-only access to the file system, including the full device configuration. The vulnerability patches provided by Fortinet did not remove the symlink. The ShadowServer Foundation has identified several thousand compromised devices worldwide . Our internal analysis shows up to 840 affected devices in Austria at the highest peak, and the current number is slightly higher than the number ShadowServer reports for Austria. Devices at risk All FortiGate devices, physical or virtual, that have or have had the SSL-VPN feature enabled and were ever vulnerable to one of the mentioned vulnerabilities (see affected FortiOS versions in the advisories - 1 , 2 , 3 ) are potentially at risk. According to CERT.nz , the attacks could have occurred as early as 2023. Although the details of the attack have not been made public, CERT.at was informed about this incident by a third party at the beginning of the year. Since then, we have been monitoring the situation in Austria closely and have been actively informing network operators since February. According to Fortinet, their active customers have also been contacted. Mitigation If your device has been compromised, we recommend you initiate an incident response and investigate all activity on the device. Fortinet has also released mitigations, including: AV/IPS signatures that flag the malicious symlink - for devices with active IPS FortiOS versions 7.6.2, 7.4.7, 7.2.11 & 7.0.17, 6.4.16 that remove the symlink Fortinet has also published guidelines to recover compromised devices. If you received our February alert, please note that there are currently updates available that remove the malicious artifact. Further recommendations We strongly recommend that all FortiGate administrators ensure that their firmware is up to date. For organisations using SSL VPN, we recommend considering a long-term migration to alternative remote access methods due to the long history of security issues. Fortinet offers migration guides to IPSec or dial-up VPN depending on the use case.

## 受影響系統

- N/A (需進一步分析)

## 來源連結

- [Multiple FortiGate devices compromised with a persistent read-only access](https://www.cert.at/en/blog/2025/4/multiple-fortigate-devices-compromised-with-a-persistent-read-only-access)

---
> 萃取時間：2026-02-17 08:10 UTC
> 資料來源：CERT.at (Austria) (cert-at)

