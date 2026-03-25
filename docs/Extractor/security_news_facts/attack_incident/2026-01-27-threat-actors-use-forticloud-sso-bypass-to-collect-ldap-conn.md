# Threat actors use FortiCloud SSO bypass to collect LDAP connection passwords

| Item | Content |
|------|---------|
| **Date** | 2026-01-27 |
| **Source** | CERT.at (Austria) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |
| **CVE** | CVE-2025-59718, CVE-2025-59719 |

## Summary
CERT.at gained access to a toolkit of an unknown threat actor targeting FortiCloud SSO bypass in Fortinet appliances (CVE-2025-59718/CVE-2025-59719)....

## Factual Content
CERT.at gained access to a toolkit of an unknown threat actor targeting FortiCloud SSO bypass in Fortinet appliances (CVE-2025-59718/CVE-2025-59719). We are releasing under TLP:CLEAR key findings about likely post-exploitation goals of the attacker.
The obtained exploit works only for the original vulnerability [1] and is not effective against patched devices. It is, however, known that the flaw still exists and affects all SSO setups in Fortinet appliances [2]. The exploit behavior is consistent with our previous publication.
The exploit is prepared to work against FortiGate instances, and in the toolkit, we have found two scripts for the post-exploitation analysis of the collected configuration dumps. The attacker:

looks for the LDAP/AD configuration settings,
is in the possession of the default FortiGate configuration encryption key.

The &ldquo;regular bind&ldquo; mode of LDAP/AD connection with FortiGate requires providing user credentials for the appliance [3], which FortiGate uses to establish a connection with the LDAP server. They are encrypted in the configuration, but by default, the encryption key is static and the same on all instances. We were able to confirm that the key included in the attacker toolkit works on the fresh FortiGate 7.6.5 VM.
Note: in our tests, we also confirmed that the normal local user passwords are NOT possible to retrieve back. Our understanding is that only the data that is necessary to become back (LDAP connection password for r

## Source Links
- [Threat actors use FortiCloud SSO bypass to collect LDAP connection passwords](https://www.cert.at/en/blog/2026/1/threat-actors-use-forticloud-to-collect-ldap-connection-passwords)

---
> Extraction time: 2026-03-07 UTC
> Data source: CERT.at (Austria) 
