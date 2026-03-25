# Multiple FortiGate devices compromised with a persistent read-only access

| Item | Content |
|------|---------|
| **Date** | 2025-04-16 |
| **Source** | CERT.at (Austria) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |
| **CVE** | CVE-2024-21762, CVE-2022-42475, CVE-2023-27997 |

## Summary
Please note: The original author of this post was Kamil Mankowski. Alexander Riepl was merely responsible for publishing and some translation...

## Factual Content
Please note: The original author of this post was Kamil Mankowski. Alexander Riepl was merely responsible for publishing and some translation efforts.

On Friday, April 10th, Fortinet released information about a worldwide compromise of FortiGate devices, giving the attacker persistent read-only access. Threat actors seemingly used three known vulnerabilities in the SSL VPN feature to gain initial access to the devices and a symbolic link in the file system to survive patching of FortiOS.
Background
FortiGate is a VPN solution that enables remote access to corporate systems. It provides the legacy SSL VPN solution as one of its options. This feature was previously exposed to critical vulnerabilities CVE-2022-42475, CVE-2023-27997 and CVE-2024-21762. Each of these vulnerabilities allowed a remote, unauthenticated attacker to execute code on the device via a specially crafted request.
The attacker used these vulnerabilities to compromise Fortigate devices and then placed a symbolic link in a folder used to serve language files. These are accessible without authentication, allowing anyone knowing the location to gain read-only access to the file system, including the full device configuration. The vulnerability patches provided by Fortinet did not remove the symlink.
The ShadowServer Foundation has identified several thousand compromised devices worldwide. Our internal analysis shows up to 840 affected devices in Austria at the highest peak, and the current number is sligh

## Source Links
- [Multiple FortiGate devices compromised with a persistent read-only access](https://www.cert.at/en/blog/2025/4/multiple-fortigate-devices-compromised-with-a-persistent-read-only-access)

---
> Extraction time: 2026-03-07 UTC
> Data source: CERT.at (Austria) 
