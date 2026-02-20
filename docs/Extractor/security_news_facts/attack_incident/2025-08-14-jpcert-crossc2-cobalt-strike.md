# CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-14 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC confirms incidents involving CrossC2 tool extending Cobalt Strike attacks to Linux systems.

## 事實內容

From September to December 2024, JPCERT/CC confirmed multiple incidents involving CrossC2, an extension tool that creates Cobalt Strike Beacons for Linux operating systems. This represents a significant expansion of Cobalt Strike's capabilities beyond its traditional Windows-focused operations.

The attackers employed CrossC2 alongside other tools including:
- PsExec (Windows lateral movement tool)
- Plink (SSH tunneling tool)
- Cobalt Strike (command and control framework)

This multi-tool approach demonstrates sophisticated attack campaigns where threat actors leverage CrossC2 to extend their reach across heterogeneous enterprise environments. The use of CrossC2 allows attackers to:
- Compromise Linux servers alongside Windows systems
- Maintain unified command and control across platforms
- Expand lateral movement capabilities in mixed-OS environments

The confirmation of multiple incidents indicates this is not an isolated attack but part of a broader trend of cross-platform threat campaigns.

## 受影響系統

- Linux OS systems
- Mixed Windows/Linux enterprise environments
- Cobalt Strike infrastructure

## 來源連結

- [CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks](https://blogs.jpcert.or.jp/en/2025/08/crossc2.html)

---
> 萃取時間: 2026-02-20 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
