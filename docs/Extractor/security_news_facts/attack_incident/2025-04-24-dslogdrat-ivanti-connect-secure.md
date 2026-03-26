# DslogdRAT Malware Installed in Ivanti Connect Secure

| 項目 | 內容 |
|------|------|
| **日期** | 2025-04-24 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC documents DslogdRAT — a previously unreported malware family installed in Ivanti Connect Secure compromises. Observed alongside SPAWNCHIMERA in attacks exploiting Ivanti VPN vulnerabilities.

## 事實內容

JPCERT/CC published research on DslogdRAT, a malware family installed on targets after exploiting vulnerabilities in Ivanti Connect Secure VPN appliances. This malware was observed in addition to previously reported SPAWNCHIMERA malware in the same attack campaigns.

DslogdRAT characteristics:
- Named for its "dslogd" process masquerading behavior
- Functions as a Remote Access Trojan (RAT) installed post-exploitation
- Observed in attacks where Ivanti Connect Secure vulnerabilities were the initial access vector
- Represents an additional tool in threat actors' Ivanti-targeting toolkit alongside SPAWNCHIMERA

The documentation of DslogdRAT adds to the growing body of evidence that sophisticated threat actors (particularly Chinese APT groups) have developed specialized toolsets for persistence in compromised Ivanti VPN appliances.

## 受影響系統

- Ivanti Connect Secure VPN appliances (exploitation target)
- Internal networks accessed through compromised Ivanti VPN

## 來源連結

- [DslogdRAT Malware Installed in Ivanti Connect Secure - JPCERT/CC Blog](https://blogs.jpcert.or.jp/en/2025/04/dslogdrat.html)

---
> 萃取時間：2026-03-25 09:00 UTC
> 資料來源：JPCERT/CC Blog jpcert-blog
