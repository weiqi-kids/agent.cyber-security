# RaaS Group "The Gentlemen" Expands Attack Scope via SystemBC Malware Integration

| 項目 | 內容 |
|------|------|
| **日期** | 2026-04-30 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Ransomware-as-a-Service (RaaS) group "The Gentlemen," active since mid-2025, significantly expanded operations in Q1 2026 by integrating SystemBC proxy malware, conducting double extortion attacks combining file encryption with large-scale sensitive data exfiltration.

## 事實內容

The Ransomware-as-a-Service (RaaS) group **"The Gentlemen"** emerged in mid-2025 and has seen a dramatic scale expansion in Q1 2026 through integration of the **SystemBC** proxy malware.

**Double Extortion Strategy:**
- Encrypts victim system files
- Simultaneously exfiltrates large volumes of critical business data as leverage for ransom payment demands
- Uses the data leak threat as a secondary coercive mechanism

**SystemBC Integration (per incident response findings):**
The Gentlemen extensively deploys SystemBC in their intrusion workflow. SystemBC is a proxy/backdoor malware that:
- Establishes persistent covert communication channels
- Enables lateral movement within compromised networks
- Facilitates command-and-control (C2) traffic obfuscation via SOCKS5 proxy capabilities
- Supports multi-stage payload delivery

**Operational Maturity:** The group demonstrates high sophistication in their attack operations, combining initial access, credential harvesting, lateral movement via SystemBC, data exfiltration, and final ransomware deployment in a coordinated sequence.

**Scale:** The Q1 2026 expansion represents a significant increase in attack volume and geographic reach compared to the group's initial 2025 activity period.

## 受影響系統

- Enterprise Windows environments (primary ransomware targets)
- Organizations across multiple sectors (specific verticals not disclosed in this report)
- Networks where SystemBC can establish persistent proxy connections

## 來源連結

- [勒索軟體組織「The Gentlemen」結合SystemBC惡意軟體擴大攻擊版圖](https://www.twcert.org.tw/tw/cp-104-10889-f86c4-1.html)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：TWCERT/CC rss-104
