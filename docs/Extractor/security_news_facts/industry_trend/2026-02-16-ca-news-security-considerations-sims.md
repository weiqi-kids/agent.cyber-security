# Security Considerations for SIMs (ITSAP.10.021)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-16 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | industry_trend |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

Canada's Cyber Centre releases updated guidance on SIM card security, addressing SIM swapping attacks and risks to mobile-based authentication.

## 事實內容

The Canadian Centre for Cyber Security published guidance document ITSAP.10.021 on security considerations for SIM cards. The guidance addresses the growing threat of SIM-based attacks that compromise mobile communication security and authentication.

Key topics covered:
- **SIM swapping (SIM hijacking)**: Attackers convince mobile carriers to transfer a victim's phone number to an attacker-controlled SIM, enabling interception of SMS-based two-factor authentication codes
- **SIM cloning**: Duplication of SIM card credentials to intercept communications
- **Risks to organizations**: Mobile numbers used for MFA recovery or verification are vulnerable to SIM swap attacks; successful attacks can lead to account takeover and unauthorized access to corporate systems
- **Mitigations recommended**:
  - Move away from SMS-based MFA toward authenticator apps or hardware security keys
  - Add PIN/passcode protection to mobile carrier accounts
  - Monitor for suspicious account activity and unexpected carrier changes
  - Educate employees on social engineering tactics used to initiate SIM swaps

The guidance is part of the Awareness series and is applicable to both organizations and individuals.

## 受影響系統

- Mobile carrier authentication systems
- SMS-based two-factor authentication
- Individual and organizational mobile accounts
- Cloud services using phone number verification

## 來源連結

- [Security considerations for SIMs (ITSAP.10.021)](https://cyber.gc.ca/en/guidance/security-considerations-sims)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：Canadian Centre for Cyber Security ca-news
