# Supply Chain Compromise Impacts Axios Node Package Manager (npm)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-04-20 |
| **來源** | CISA (US) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

CISA issued an alert regarding a software supply chain compromise of the Axios npm package. On March 31, 2026, malicious versions axios@1.14.1 and axios@0.30.4 were published containing a dependency that downloads multi-stage payloads including a remote access trojan.

## 事實內容

- On March 31, 2026, two Axios npm packages (axios@1.14.1 and axios@0.30.4) were compromised.
- The malicious packages injected dependency plain-crypto-js@4.2.1.
- plain-crypto-js@4.2.1 downloads multi-stage payloads from cyber threat actor infrastructure.
- Payloads include a remote access trojan (RAT).
- Axios is a widely-used HTTP client for JavaScript used in Node.js and browser environments.
- CISA released the alert on 2026-04-20 to provide guidance in response to the compromise.
- Organizations using Axios in their applications are urged to check for affected versions and remediate.
- CISA urges organizations to implement supply chain security practices and review dependencies.

## 受影響系統

- Applications using axios@1.14.1 or axios@0.30.4 npm packages
- Node.js and browser-based JavaScript applications using Axios

## 來源連結

- [Supply Chain Compromise Impacts Axios Node Package Manager](https://www.cisa.gov/news-events/alerts/2026/04/20/supply-chain-compromise-impacts-axios-node-package-manager)

---
> 萃取時間：2026-04-26 UTC
> 資料來源：CISA (US) cisa
