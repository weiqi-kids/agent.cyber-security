# Cline CLI 2.3.0 Supply Chain Attack Installed OpenClaw on Developer Systems

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-17 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Unauthorized party compromised npm publish token to distribute malicious Cline CLI version that installs OpenClaw on developer systems.

## 事實內容

On February 17, 2026, at 3:26 AM PT, an unauthorized attacker used a compromised npm publish token to publish a malicious update to the open-source AI-powered coding assistant Cline CLI on the NPM registry (version 2.3.0).

**Attack Method:**
- **Supply Chain Compromise**: Modified package.json with added postinstall script
- **Automatic Installation**: Script executes `npm install -g openclaw@latest` during Cline installation
- **Target**: Developer systems using Cline CLI

**Impact:**
- OpenClaw (self-hosted autonomous AI agent) installed without user authorization or knowledge
- No additional malicious behavior observed beyond unauthorized installation
- Affects developers who installed Cline version 2.3.0

**Mitigation:**
- Cline maintainers issued advisory alerting users
- Users advised to check for unauthorized OpenClaw installation

## 受影響系統

- Cline CLI version 2.3.0 (npm package)
- Developer systems with Node.js/npm environment

## 來源連結

- [Cline CLI 2.3.0 Supply Chain Attack Installed OpenClaw on Developer Systems](https://thehackernews.com/2026/02/cline-cli-230-supply-chain-attack.html)

---
> 萃取時間：2026-02-22 08:30 UTC
> 資料來源：NCSC-FI Daily News (ncsc-fi-news)
