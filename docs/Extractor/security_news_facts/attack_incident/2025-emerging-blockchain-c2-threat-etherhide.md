# Emerging Blockchain C2 Threat Surfaces, "EtherHide" Becomes Hacker Favorite

| Item | Content |
|------|------|
| **Date** | 2025-11-27 |
| **Source** | TWCERT/CC |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence Level** | High |

## Summary

Security researchers identified "EtherHide" technology exploiting blockchain platforms as Command & Control (C2) architecture, frequently combined with "ClearFake" fake update attacks to bypass traditional network defense mechanisms.

## Factual Content

As Web3 and smart contract technology mature, security threats also show new evolution. Attackers have begun using blockchain platforms as Command & Control (C2) architecture. In October 2023, security researchers first proposed a technology named "EtherHide," which uses blockchain's decentralization, immutability, and anonymity characteristics. Attackers write C2 malicious commands or malicious payload addresses into smart contracts, thereby bypassing traditional network defense mechanisms such as domain blocking, IP blocking, and traffic monitoring, increasing C2 architecture stealth.

EtherHide technology writes malicious payloads or commands into smart contracts on the blockchain, enabling malware to obtain latest commands during infection and subsequent attack stages by querying the blockchain, forming a C2 channel that's difficult to block. According to multiple security incident analyses, EtherHide is often used in combination with the fake update "ClearFake," first inducing downloads through fake updates, then EtherHide provides subsequent payloads, becoming an important technique for attackers' initial penetration.

ClearFake is an attack technique centered on social engineering, first discovered in Q2 2023. Attackers plant malicious JavaScript code in infected websites (practical cases mostly occur in compromised WordPress sites). When users browse these pages, the website displays fake messages disguised as system notifications or software updates to induce users to click. Once users mistakenly click, hidden malicious commands are immediately executed.

From 2024 to present, common attack flows include:

1. Attackers first compromise vulnerable WordPress websites to gain website control
2. After gaining website control, attackers plant malicious JavaScript code on website pages
3. When users browse infected websites, malicious JavaScript code is automatically executed
4. Malicious code displays fake update messages (ClearFake campaign), tricking users into clicking
5. When users click, malicious JavaScript connects to smart contracts on BSC (Binance Smart Chain), using EtherHide technology to obtain malicious commands or payload locations placed by attackers on the blockchain
6. Based on on-chain commands, malicious JavaScript subsequently downloads and deploys next-stage malware to victim computers
7. Finally, malware starts and executes its predetermined attack behavior

BSC (Binance Smart Chain) is a blockchain platform launched by Binance in 2020, supporting decentralized applications and smart contracts. EtherHide technology is mostly deployed on BSC, presumably related to the convenience of its development environment API. Attackers commonly use the "eth_call" method provided by Binance SDK for reading smart contract query operations without paying transaction fees (gas) and leaving no records on the blockchain.

## Affected Systems

- WordPress and other CMS platforms with vulnerabilities
- Users of browsers with cryptocurrency wallet extensions (MetaMask, etc.)
- Enterprise systems interacting with public blockchains

## Source Links

- [新興區塊鏈 C2 威脅浮現,「EtherHide」成駭客新寵](https://www.twcert.org.tw/tw/cp-104-10535-99661-1.html)

---
> Extraction time: 2026-02-06 UTC
> Data source: TWCERT/CC rss-104
> Note: Original language: Traditional Chinese (TWCERT/CC)
