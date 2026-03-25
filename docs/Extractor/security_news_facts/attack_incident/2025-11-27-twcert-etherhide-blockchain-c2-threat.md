# Emerging Blockchain C2 Threat: "EtherHide" Leverages Smart Contracts to Evade Detection

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-27 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 中 |

## 摘要

TWCERT/CC highlights "EtherHide" — an emerging technique where attackers use blockchain smart contracts as command-and-control (C2) infrastructure to bypass traditional network defences.

## 事實內容

TWCERT/CC reported on an emerging threat technique called "EtherHide," which exploits blockchain technology to establish resilient and censorship-resistant command-and-control (C2) infrastructure.

Technical details:
- **Technique**: Attackers embed C2 instructions or malicious payload addresses within blockchain smart contracts
- **Platform**: Primarily observed on Ethereum and other public blockchain networks
- **First identified**: October 2023 by security researchers; now gaining adoption among threat actors
- **Evasion characteristics**:
  - Blockchain's decentralized, immutable, and pseudonymous nature makes C2 channels extremely difficult to take down
  - Traditional network security controls (domain blocking, IP blacklisting) are ineffective against blockchain-hosted C2
  - Malware fetches C2 instructions by querying smart contract state, which appears as legitimate blockchain traffic
- **Malware families**: Associated with various stealer and dropper malware families
- **Impact**: Organizations relying solely on domain/IP-based blocking may be unable to disrupt EtherHide-based C2 communications

As Web3 and smart contract adoption grows, this attack vector represents a significant evolution in threat actor tradecraft. Security teams should develop detection capabilities for anomalous blockchain network activity.

## 受影響系統

- Any endpoint infected with malware using EtherHide C2
- Network security systems relying on traditional domain/IP blocking
- Enterprise networks without blockchain traffic monitoring

## 來源連結

- [新興區塊鏈 C2 威脅浮現，「EtherHide」成駭客新寵 (TWCERT/CC)](https://www.twcert.org.tw/tw/cp-104-10535-99661-1.html)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：TWCERT/CC rss-104
> 注意：Original language: Traditional Chinese (zh-TW). Translated to English.
