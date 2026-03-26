# Emerging Blockchain C2 Threat: "EtherHide" Becomes Hacker Favorite

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-27 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

EtherHide technique uses blockchain smart contracts as C2 infrastructure, exploiting decentralization and immutability to bypass traditional defenses (domain blocking, IP blocking, traffic monitoring). First identified in October 2023, now gaining widespread threat actor adoption.

## 事實內容

As Web3 and smart contract technology mature, threat actors are increasingly using blockchain platforms as Command and Control (C2) infrastructure.

EtherHide technique (first proposed October 2023):
- **Method**: Attackers write C2 malicious instructions or payload addresses into smart contracts on the blockchain
- **Why effective**: Exploits blockchain's decentralized, immutable, and anonymous properties to bypass traditional network defenses including domain blocking, IP blocking, and traffic monitoring
- **Mechanism**: During both infection and attack phases, malware queries the blockchain to obtain the latest instructions, forming a highly resilient C2 architecture
- **Challenge for defenders**: Traditional takedown methods (removing domains, blocking IPs) are ineffective against on-chain infrastructure

This technique represents a significant evolution in malware C2 resilience, making threat actor infrastructure extremely difficult to disrupt.

## 受影響系統

- Enterprise networks (threatened by EtherHide-based malware)
- Security monitoring tools (traditional solutions ineffective against blockchain C2)

## 來源連結

- [新興區塊鏈 C2 威脅浮現，「EtherHide」成駭客新寵 - TWCERT/CC](https://www.twcert.org.tw/tw/cp-104-10535-99661-1.html)

---
> 萃取時間：2026-03-25 09:00 UTC
> 資料來源：TWCERT/CC rss-104
> Notes: Original language: Traditional Chinese (TWCERT/CC). Translated to English for extraction.
