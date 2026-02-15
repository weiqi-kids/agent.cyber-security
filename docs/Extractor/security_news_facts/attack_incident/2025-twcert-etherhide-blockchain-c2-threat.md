# Emerging Blockchain C2 Threat: EtherHide Becomes Attacker's New Tool

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-27 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Attackers abuse blockchain as C2 infrastructure using "EtherHide" technique, embedding malicious commands in smart contracts, often paired with ClearFake fake update attacks.

## 事實內容

As Web3 and smart contract technology matures, security threats evolve into new forms. Attackers now use blockchain platforms as Command & Control (C2) infrastructure. In October 2023, security researchers first proposed "EtherHide" technique, which exploits blockchain's decentralization, immutability, and anonymity to embed C2 malicious commands or malicious payload addresses in smart contracts, bypassing traditional network defenses like domain blocking, IP blocking, and traffic monitoring.

**EtherHide Technical Overview:**
Attackers write malicious payloads or commands into blockchain smart contracts, enabling malware to obtain latest commands during infection and subsequent attack stages by querying the blockchain, forming a C2 channel that's difficult to block.

**Integration with ClearFake:**
EtherHide frequently pairs with fake update technique "ClearFake" (first discovered Q2 2023). Attackers inject malicious JavaScript code into compromised WordPress websites. When users browse infected pages, fake system notifications or software updates appear, tricking users into clicking. Once clicked, hidden malicious commands execute immediately.

**Attack Flow (2024 to present):**
1. Attackers compromise vulnerable WordPress websites to gain control
2. Inject malicious JavaScript code into website pages
3. When users browse infected websites, malicious JavaScript executes automatically
4. JavaScript displays fake update messages (ClearFake campaign) to trick user clicks
5. Upon user click, malicious JavaScript connects to BSC (Binance Smart Chain) smart contracts, using EtherHide to retrieve attacker's malicious commands or payload locations from blockchain
6. Following on-chain instructions, JavaScript downloads and deploys next-stage malware to victim's computer
7. Malware launches and executes predetermined attack behaviors

**Why BSC (Binance Smart Chain)?**
BSC, launched by Binance in 2020, supports decentralized applications and smart contracts. EtherHide predominantly deploys on BSC, likely due to API convenience. Attackers commonly use Binance SDK's "eth_call" method for reading smart contract queries without paying transaction fees (gas) and without leaving blockchain records. eth_call enables malware to communicate frequently and covertly with smart contracts without cost or trace risks.

**EtherHide Appeal to Attackers:**
1. Traditional tracking techniques difficult to apply in blockchain environments
2. Blockchain data cannot be deleted - malicious commands persist once deployed
3. Attackers need not deploy extensive files on victim endpoints, reducing detection risk

**Recommended Mitigations:**
1. Multiple real incidents stem from WordPress and common CMS vulnerabilities or malicious plugins. Ensure core and plugins always updated, deploy Web Application Firewall (WAF) to reduce malicious script injection risk
2. When victims download and execute malicious payloads, endpoint protection systems, dynamic behavior analysis, and sandbox technology remain essential for detecting malware and abnormal activities
3. Attack chains commonly use fake updates or fake download pages to trick user clicks. Enterprises should conduct regular social engineering exercises to enhance employee vigilance toward malicious update messages and unknown notifications
4. If sensitive systems require node or RPC interface interaction with public chains, plan whitelisting or other access control mechanisms to avoid malicious on-chain data impact
5. Security companies and antivirus vendors should view EtherHide as new threat source, appropriately incorporating into behavior detection models and threat intelligence databases

## 受影響系統

- WordPress websites and common CMS platforms
- Binance Smart Chain (BSC) smart contract infrastructure
- End-user workstations accessing compromised websites
- Browser environments executing JavaScript

## 來源連結

- [新興區塊鏈 C2 威脅浮現，「EtherHide」成駭客新寵](https://www.twcert.org.tw/tw/cp-104-10535-99661-1.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: TWCERT/CC rss-104
