# KadNap Botnet: Sophisticated Malware Targets Asus Routers, 14,000+ Devices Infected

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-11 |
| **來源** | NCSC-FI (Finland) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Lumen's Black Lotus Labs discovered KadNap, a sophisticated botnet targeting Asus routers using Kademlia DHT for P2P C2 concealment, with over 14,000 devices infected since August 2025.

## 事實內容

The Black Lotus Labs team at Lumen Technologies discovered a sophisticated new malware named "KadNap" that primarily targets Asus routers. The malware conscripts infected devices into a botnet used to proxy malicious traffic. Key technical details:

- Active monitoring since August 2025, with the network now exceeding 14,000 infected devices
- KadNap employs a custom version of the Kademlia Distributed Hash Table (DHT) protocol to conceal the IP address of attacker infrastructure
- Uses peer-to-peer (P2P) architecture, making infrastructure takedown more resilient than traditional C2 setups
- The botnet proxies malicious traffic through infected routers, enabling threat actors to mask their true origin

The use of DHT-based P2P C2 represents a sophisticated operational security measure increasingly adopted by advanced threat actors to evade traditional network detection methods.

## 受影響系統

- Asus router models (specific models not detailed in summary)
- Home and small office network infrastructure
- Networks where infected routers serve as traffic proxies

## 來源連結

- [Silence of the hops: The KadNap botnet](https://blog.lumen.com/silence-of-the-hops-the-kadnap-botnet/)

---
> 萃取時間：2026-03-11 UTC
> 資料來源：NCSC-FI (Finland) ncsc-fi-news
