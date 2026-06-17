# Supply Chain Compromise of JavaScript Axios Library

| 項目 | 內容 |
|------|------|
| **日期** | 2026-04-03 |
| **來源** | CERT.hr (Croatia) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

Attackers compromised a maintainer account of the widely-used JavaScript Axios library (83M+ weekly downloads) and published malicious versions axios@1.14.1 and others containing malware.

## 事實內容

A supply chain compromise occurred affecting the JavaScript Axios library. With over 83 million weekly downloads, Axios is one of the most widely used HTTP clients in the JavaScript ecosystem. According to a report by The Hacker News, attackers compromised the account of one of the main Axios maintainers and published malicious versions of the library — including axios@1.14.1 and potentially others. Any project consuming the compromised versions may have been exposed to malicious code execution. Organizations and developers using Axios are advised to verify their dependency versions and update to a clean release.

**Attack method**: Supply chain attack via account compromise of a package maintainer
**Malicious versions**: axios@1.14.1 (and potentially others)
**Impact**: Potential code execution in all applications consuming affected versions

## 受影響系統

- JavaScript/Node.js applications using Axios npm package
- axios@1.14.1 (confirmed malicious version)
- npm ecosystem consumers

## 來源連結

- [UPOZORENJE: kompromitacija lanca opskrbe JavaScript Axios biblioteke](https://www.cert.hr/upozorenje-kompromitacija-lanca-opskrbe-javascript-axios-biblioteke/?utm_source=rss&utm_medium=rss&utm_campaign=upozorenje-kompromitacija-lanca-opskrbe-javascript-axios-biblioteke)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：CERT.hr (Croatia) cert-hr
> Original language: Croatian (CERT.hr)
