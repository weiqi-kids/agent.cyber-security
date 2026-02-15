# DslogdRAT Malware Installed in Ivanti Connect Secure

| 項目 | 內容 |
|------|------|
| **日期** | 2025-04-24 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

DslogdRAT, a remote access trojan deployed via CVE-2025-0282 zero-day exploitation, targets Japanese organizations with sophisticated multi-process architecture, XOR-encoded C2 communication, and operational time restrictions (8:00-20:00).

## 事實內容

**Overview:**
DslogdRAT is a remote access trojan discovered on systems compromised through CVE-2025-0282, a zero-day vulnerability in Ivanti Connect Secure. Attacks targeting Japanese organizations occurred around December 2024.

**Installation Method:**
Deployed via a Perl-based web shell that executed arbitrary commands when receiving authenticated HTTP requests containing specific cookie value: "DSAUTOKEN=af95380019083db5."

**Technical Architecture:**

Execution Flow:
- Main process spawns a child that decodes configuration data
- Second child contains core functionality
- Persistent execution through loop routines with sleep intervals

Communication Protocol:
- Socket connections with XOR-encoded data
- 7-byte block encoding using keys 0x01-0x07
- Initial communications transmit host information in formatted structure beginning with "ff ff ff ff" headers

**Operational Capabilities:**
- File upload/download operations
- Shell command execution
- Proxy functionality for traffic forwarding
- Connection management (stop, exit functions)

**Behavioral Restrictions:**
The malware operates exclusively between 8:00 AM and 8:00 PM, remaining dormant otherwise—likely designed to avoid detection during non-business hours.

**Configuration Details:**
XOR-encoded configuration data (key: 0x63):
- C2 IP: 3.112.192[.]119
- Port: 443
- Sleep interval: 1250ms
- Default shell: /bin/sh

**Associated Threats:**
SPAWNSNARE was identified on the same compromised system, suggesting coordinated multi-malware deployment strategies.

**Indicators of Compromise:**

File Hashes:
- DslogdRAT: 1dd64c00f061425d484dd67b359ad99df533aa430632c55fa7e7617b55dab6a8
- Web shell: f48857263991eea1880de0f62b3d1d37101c2e7739dcd8629b24260d08850f9c

File Paths:
- /home/bin/dslogd
- /home/webserver/htdocs/dana-na/cc/ccupdate.cgi

## 受影響系統

- Ivanti Connect Secure VPN appliances
- Japanese organizations specifically targeted

## 來源連結

- [DslogdRAT Malware Installed in Ivanti Connect Secure](https://blogs.jpcert.or.jp/en/2025/04/dslogdrat.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
