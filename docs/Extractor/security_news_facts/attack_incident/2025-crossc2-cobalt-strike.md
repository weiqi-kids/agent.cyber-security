# CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-14 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC confirmed incidents from September-December 2024 involving CrossC2, an extension tool creating Cobalt Strike Beacon for Linux, used alongside PsExec, Plink, and Cobalt Strike.

## 事實內容

**Attack Timeline**:
- **Period**: September to December 2024
- **Confirmation**: JPCERT/CC confirmed multiple incidents

**Tools Used**:
- **Primary Tool**: CrossC2 - Extension tool for Cobalt Strike Beacon on Linux OS
- **Supporting Tools**:
  - PsExec (Windows administration tool)
  - Plink (SSH client)
  - Cobalt Strike (main C2 framework)

**Attack Characteristics**:
- Cross-platform capability: Attackers expanded from Windows-focused Cobalt Strike to Linux systems
- Multi-tool approach: Combination of legitimate administration tools and malicious frameworks
- Persistence: Multiple incidents observed over 4-month period

**Significance**:
This represents an evolution in attacker tactics, extending popular Windows-focused attack frameworks to Linux environments, expanding the attack surface.

## 受影響系統

- Linux OS systems
- Windows systems (via traditional Cobalt Strike/PsExec)
- Cross-platform enterprise environments

## 來源連結

- [CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks](https://blogs.jpcert.or.jp/en/2025/08/crossc2.html)

---
> 萃取時間：2026-02-22 09:30 UTC
> 資料來源：JPCERT/CC Blog jpcert-blog
