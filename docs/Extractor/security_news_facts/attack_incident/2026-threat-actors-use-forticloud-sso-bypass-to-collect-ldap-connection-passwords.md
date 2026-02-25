# Threat actors use FortiCloud SSO bypass to collect LDAP connection passwords

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | CERT.at (Austria) |
| **分類** | attack_incident |
| **嚴重程度** | unknown |
| **信心水準** | high |

## 摘要
CERT.at gained access to a toolkit of an unknown threat actor targeting FortiCloud SSO bypass in Fortinet appliances (CVE-2025-59718/CVE-2025-59719). We are releasing under TLP:CLEAR key findings abou...

## 事實內容
CERT.at gained access to a toolkit of an unknown threat actor targeting FortiCloud SSO bypass in Fortinet appliances (CVE-2025-59718/CVE-2025-59719). We are releasing under TLP:CLEAR key findings about likely post-exploitation goals of the attacker. The obtained exploit works only for the original vulnerability [1] and is not effective against patched devices. It is, however, known that the flaw still exists and affects all SSO setups in Fortinet appliances [2]. The exploit behavior is consistent with our previous publication. The exploit is prepared to work against FortiGate instances, and in the toolkit, we have found two scripts for the post-exploitation analysis of the collected configuration dumps. The attacker: looks for the LDAP/AD configuration settings, is in the possession of the default FortiGate configuration encryption key. The &ldquo;regular bind&ldquo; mode of LDAP/AD connection with FortiGate requires providing user credentials for the appliance [3], which FortiGate uses to establish a connection with the LDAP server. They are encrypted in the configuration, but by default, the encryption key is static and the same on all instances. We were able to confirm that the key included in the attacker toolkit works on the fresh FortiGate 7.6.5 VM. Note: in our tests, we also confirmed that the normal local user passwords are NOT possible to retrieve back. Our understanding is that only the data that is necessary to become back (LDAP connection password for regular bind, private keys for certificates, etc.) could be decrypted. Preventive recommendations We strongly recommend activating the &ldquo;private data encryption&rdquo; feature [4] in FortiGate devices, which replaces the default encryption key. This step is also officially recommended by Fortinet as a hardening measure [5]. The encryption key has to be the same in all instances in an HA cluster. Using a custom encryption key helps &ldquo;buying time&rdquo; for credential rotation after a configuration leak. As always, CERT.at strongly recommends keeping management interfaces not accessible from the public internet. In the last blog post, the Fortinet PSIRT recommends setting a local-in policy to restrict access on the administrative interface [6]. References [1] https://fortiguard.fortinet.com/psirt/FG-IR-25-647&nbsp;[2] https://www.fortinet.com/blog/psirt-blogs/analysis-of-sso-abuse-on-fortios[3] https://docs.fortinet.com/document/fortigate/7.6.0/administration-guide/102264/configuring-an-ldap-server[4] https://community.fortinet.com/t5/FortiGate/Technical-Tip-How-to-enable-private-data-encryption-feature-on-a/ta-p/339071[5] https://docs.fortinet.com/document/fortigate/7.6.0/best-practices/555436/hardening#SecurePassStorage[6] https://docs.fortinet.com/document/fortigate/7.6.4/administration-guide/363127/local-in-policy

## 來源連結
- [Threat actors use FortiCloud SSO bypass to collect LDAP connection passwords](https://www.cert.at/en/blog/2026/1/threat-actors-use-forticloud-to-collect-ldap-connection-passwords)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：CERT.at (Austria) cert-at
