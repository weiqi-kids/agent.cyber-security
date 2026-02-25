# Massive infection of NPM software packages

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-15 |
| **來源** | SK-CERT (Slovakia) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Aikido security researchers identified compromise of 18 NPM packages with 2.6 billion weekly downloads, containing malicious code that threatens vast downstream software supply chain.

## 事實內容

The National Cyber Security Centre warns about compromised NPM (Node Package Manager) packages containing malicious code. The scale of the compromise presents significant risks to the software supply chain.

**Scope of Compromise:**
- 18 software packages identified as compromised
- Total of 2.6 billion weekly downloads across all affected packages
- Massive number of downstream products at risk

**Discovery:**
Security researchers at Aikido security company identified the compromised packages and malicious code injection.

**Impact:**
The compromised packages are widely used as dependencies in countless other software products, creating a cascading supply chain risk affecting potentially millions of applications and services worldwide.

**Risk Level:**
Critical due to:
- Extremely high download volume
- Widespread dependency usage
- Supply chain multiplication effect
- Potential for large-scale compromise

The incident highlights the vulnerability of modern software development's heavy reliance on open-source package repositories.

## 受影響系統

- NPM package ecosystem
- Node.js applications
- JavaScript development environments
- Downstream products using affected packages
- Software supply chain globally

## 來源連結

- [Masívna infekcia softvérových balíkov NPM](https://www.sk-cert.sk/sk/masivna-infekcia-softverovych-balikov-npm/)

---
> 萃取時間: 2026-02-24 UTC
> 資料來源: SK-CERT (Slovakia) sk-cert
> 備註: Original language: Slovak
