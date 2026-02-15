# LockBit 5.0 Ransomware Returns with Enhanced Technical Complexity and Cross-Platform Capabilities

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-28 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

LockBit 5.0 ransomware re-emerged with technical upgrades including enhanced obfuscation, anti-analysis defenses, and cross-platform capabilities targeting Windows, Linux, and VMware ESXi.

## 事實內容

LockBit 5.0 ransomware has re-emerged with multiple technical upgrades, demonstrating the ransomware family maintains high activity and influence in the ransomware ecosystem. LockBit 5.0 not only strengthened code obfuscation and reverse analysis defense mechanisms but further enhanced cross-platform operational capabilities.

According to Trend Micro research team sample analysis, LockBit 5.0 has variants targeting Windows, Linux, and VMware ESXi system environments, enabling attackers to impact hybrid cloud or virtualized environments with single attack actions, causing wider enterprise operational impacts.

**Windows Platform Variant:**
Binary files employ extensive obfuscation and packing techniques, utilizing multiple anti-analysis techniques including bypassing Event Tracing for Windows (ETW) and terminating security-related services, loading malicious payloads through DLL reflective loading.

Features include:
- Simple user interface (viewable via -h parameter) clearly describing ransomware options and settings for attacker flexibility
- Encrypted file extensions in random 16-character format, increasing recovery difficulty
- Built-in simple chat interface facilitating ransom negotiation with victims
- Geopolitical avoidance mechanism: stops execution upon detecting Russian language systems or Russia geographic location

**Linux Variant:**
Continues Windows version core functionality, demonstrating cross-platform capabilities with same operational convenience and flexibility as Windows version. Adds command-line options targeting specific directories and file types to improve attack precision.

**VMware ESXi Variant:**
Major upgrade targeting virtualized infrastructure environments. Since ESXi hosts typically carry multiple virtual machines, attackers can execute encryption at host level through single malicious payload, rapidly affecting entire virtualized environment causing large-scale operational disruption.

**Malware Capabilities:**
BeaverTail Type 701 significantly enhanced with information-stealing capabilities:
- Targets 43+ cryptocurrency-related browser extensions (MetaMask, Phantom, etc.)
- Multiple wallet service providers
- Login credentials, session cookies, LocalStorage
- Browser LevelDB (.ldb) highly sensitive data

**Recommended Mitigations:**
1. Regularly update and patch all operating systems and application software
2. Strengthen ransomware detection and blocking technology, deploy behavior analysis and anomaly monitoring tools
3. Enhance security awareness training, alert to ransomware social engineering attacks
4. Establish strict access control and isolation policies, reduce lateral movement risks
5. Regularly backup important data and plan post-incident data recovery mechanisms

## 受影響系統

- Windows operating systems (all versions)
- Linux operating systems (all versions)
- VMware ESXi virtualization platforms
- Hybrid cloud and virtualized infrastructure environments

## 來源連結

- [LockBit 5.0 勒索軟體再度活躍，展現更高技術複雜度與跨平台攻擊能力](https://www.twcert.org.tw/tw/cp-104-10458-ee4fb-1.html)

---
> 萃取時間: 2026-02-15 23:37 UTC
> 資料來源: TWCERT/CC rss-104
