# Device Code Phishing Attacks via EvilTokens PhaaS Platform Emerge as New Enterprise Threat

| 項目 | 內容 |
|------|------|
| **日期** | 2026-05-29 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Attackers using the EvilTokens Phishing-as-a-Service (PhaaS) platform combine AI and automation to conduct Device Code phishing attacks against enterprises, bypassing MFA and hijacking accounts via legitimate OAuth authorization flows.

## 事實內容

Microsoft security researchers and cybersecurity vendors have observed attackers leveraging a new phishing-as-a-service platform named **"EvilTokens"** to conduct large-scale "Device Code" phishing campaigns targeting enterprises and organizations.

**Attack Mechanism:**
- Attackers use social engineering to trick users into completing an authorization process on a legitimate official page (Microsoft Azure or Google Cloud OAuth)
- The Device Code flow is abused — the victim authorizes a device code that the attacker controls, granting the attacker persistent access tokens
- This technique successfully **bypasses Multi-Factor Authentication (MFA)** because the authorization occurs on the legitimate platform
- Post-compromise, attackers steal internal sensitive data and may escalate to broader network access

**Platform Capabilities (EvilTokens):**
- Combines AI and automation tools to scale attacks
- Reduces technical barrier for threat actors
- Specifically designed to target corporate and organizational accounts on Microsoft Azure and Google Cloud platforms

**Why Effective:** Security experts highlight that because the authorization step occurs on official legitimate pages (Microsoft/Google), traditional phishing detection mechanisms and user training focused on "suspicious URLs" are ineffective against this technique.

**Target Profile:** Enterprises and organizations with Azure/Google Workspace deployments, particularly those with high-value internal data.

## 受影響系統

- Microsoft Azure (Entra ID / Azure AD) accounts
- Google Workspace / Google Cloud accounts
- Any organization using OAuth Device Code flow

## 來源連結

- [「裝置碼」釣魚攻擊成新興威脅，企業與組織成主要目標](https://www.twcert.org.tw/tw/cp-104-10933-e5921-1.html)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：TWCERT/CC rss-104
