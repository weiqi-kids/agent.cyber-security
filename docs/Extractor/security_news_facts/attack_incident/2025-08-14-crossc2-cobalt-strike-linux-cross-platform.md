# CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-14 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC confirmed incidents from September-December 2024 involving CrossC2 — a Cobalt Strike Beacon extension for Linux. Attackers combined CrossC2, PsExec, Plink, and Cobalt Strike for cross-platform lateral movement in compromised environments.

## 事實內容

From September to December 2024, JPCERT/CC confirmed incidents involving CrossC2, an extension tool to create Cobalt Strike Beacon for Linux OS.

Attack details:
- **Tool**: CrossC2 — extends Cobalt Strike's beacon capability to Linux targets
- **Combined toolset**: Attackers employed CrossC2 alongside PsExec, Plink, and Cobalt Strike
- **Purpose**: Cross-platform lateral movement attempts in compromised environments
- **Significance**: Extends post-exploitation capability from Windows to Linux systems within the same compromised network

This reflects a growing trend of threat actors extending Windows-centric attack tools to Linux environments, particularly relevant as enterprises increasingly run mixed Windows/Linux environments and Linux-based cloud infrastructure.

## 受影響系統

- Linux servers in enterprise environments
- Mixed Windows/Linux environments (lateral movement vector)

## 來源連結

- [CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks - JPCERT/CC Blog](https://blogs.jpcert.or.jp/en/2025/08/crossc2.html)

---
> 萃取時間：2026-03-25 09:00 UTC
> 資料來源：JPCERT/CC Blog jpcert-blog
