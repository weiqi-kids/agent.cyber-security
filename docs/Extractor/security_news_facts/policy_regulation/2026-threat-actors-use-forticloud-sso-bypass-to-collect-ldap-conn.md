| 欄位 | 內容 |
|------|------|
| **標題** | Threat actors use FortiCloud SSO bypass to collect LDAP connection passwords |
| **來源** | CERT.at (Austria) |
| **發布時間** | 2026-01-27T17:16:28Z |
| **信心度** | 中 |

## 摘要

CERT.at gained access to a toolkit of an unknown threat actor targeting FortiCloud SSO bypass in For...

## 事實內容

CERT.at gained access to a toolkit of an unknown threat actor targeting FortiCloud SSO bypass in Fortinet appliances (CVE-2025-59718/CVE-2025-59719). We are releasing under TLP:CLEAR key findings about likely post-exploitation goals of the attacker. The obtained exploit works only for the original vulnerability [1] and is not effective against patched devices. It is, however, known that the flaw still exists and affects all SSO setups in Fortinet appliances [2]. The exploit behavior is consistent with our previous publication . The exploit is prepared to work against FortiGate instances, and in the toolkit, we have found two scripts for the post-exploitation analysis of the collected configuration dumps. The attacker: looks for the LDAP/AD configuration settings, is in the possession of th...

## 受影響系統

- 依內容而定（需參閱完整文章）

## 來源連結

- [CERT.at - Threat actors use FortiCloud SSO bypass to collect LDAP connection passwords](https://www.cert.at/en/blog/2026/1/threat-actors-use-forticloud-to-collect-ldap-connection-passwords)

## 萃取時間

2026-02-15T00:00:00+08:00
