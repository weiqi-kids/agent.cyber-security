# GSocket Backdoor Delivered Through Bash Script

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-20 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

A malicious Bash script discovered on March 19, 2026 installs a GSocket backdoor on victim computers; delivery mechanism unknown.

## 事實內容

A SANS ISC handler discovered a malicious Bash script that installs a GSocket backdoor on compromised systems:

Key findings:
- Discovery date: March 19, 2026 (published March 20, 2026)
- Malware type: GSocket backdoor
- Delivery mechanism: Malicious Bash script
- Delivery vector: Unknown — the handler does not know the source or how it is delivered to victims

GSocket (Global Socket) is a tool designed to create encrypted communications between systems behind firewalls/NAT. When weaponized as a backdoor, it allows attackers to maintain persistent, encrypted remote access even through corporate firewalls.

The Bash script nature suggests targeting Linux/Unix systems. The unknown delivery vector makes it harder to defend against.

- Attack method: Malicious Bash script → GSocket backdoor installation
- Target: Linux/Unix systems
- Detection: SANS ISC handler analysis

## 受影響系統

- Linux/Unix systems
- Systems that can execute Bash scripts (servers, workstations, containers)

## 來源連結

- [GSocket Backdoor Delivered Through Bash Script, (Fri, Mar 20th)](https://isc.sans.edu/diary/rss/32816)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：SANS ISC sans-isc
