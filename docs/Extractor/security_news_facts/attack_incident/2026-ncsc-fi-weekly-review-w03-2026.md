# Weekly review of the National Cyber Security Centre Finland (NCSC-FI) - 3/2026

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-22 |
| **來源** | NCSC-FI (Finland) |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

NCSC-FI warns of hotel phishing campaigns exploiting booking data breaches, automated scam calls impersonating banks, and widespread verification code account takeovers affecting Telegram and WhatsApp. Organizations deploying AI assistants face significant security challenges requiring risk assessment and access controls.

## 事實內容

### Phishing Campaigns Targeting Travel Bookings

Criminals are conducting sophisticated phishing attacks against travelers using hotel and accommodation booking services. Attackers harvest payment card details or redirect payments to fraudulent accounts by exploiting data from breaches of reservation systems like Booking.com.

**Attack Techniques:**
- Sophisticated social engineering using legitimate-looking communications
- Exploitation of data from previous booking system breaches
- Payment redirection to fraudulent accounts

**Recommendations:**
- Use strong, unique passwords for booking accounts
- Verify domain names before entering credentials
- Avoid clicking links in unsolicited messages

### Automated Scam Calls Impersonating Banks

Recorded scam calls are being made to Finnish citizens, with callers impersonating bank representatives. Calls originate from foreign numbers, though spoofing of Finnish numbers has been largely prevented.

**Key Warning:**
Banks and authorities will never request credentials via phone calls.

**Recommendations:**
- Hang up immediately on suspicious calls
- Contact banks independently using official customer service numbers

### Verification Code Account Takeover Attacks

Users of Telegram and WhatsApp are reporting unsolicited verification codes sent via SMS. This indicates potential account takeover attempts using fatigue-based attack techniques.

**Attack Method:**
- Attackers request verification codes for victims' accounts
- Multiple attempts create notification fatigue
- Users may inadvertently share codes or fail to recognize the threat

**Recommendations:**
- Enable two-step verification on messaging apps
- Never share verification codes with anyone
- Report suspicious verification code messages

### AI Assistant Security Risks

Organizations implementing AI assistants face significant security challenges when these systems integrate with organizational databases and systems.

**Security Concerns:**
- Unauthorized access to sensitive data through AI interfaces
- Lack of proper access controls and audit logging
- Insufficient security testing before deployment

**Mitigation Strategies:**
- Conduct thorough risk assessments before AI deployment
- Implement strict access restrictions
- Enable comprehensive logging and monitoring
- Perform security testing of AI integrations

## 受影響系統

- Booking.com and hotel reservation platforms
- Telegram messaging platform
- WhatsApp messaging platform
- Banking customer service systems
- AI assistant platforms and integrations
- SMS/telephony infrastructure

## 來源連結

- [Weekly review of the National Cyber Security Centre Finland (NCSC-FI) - 3/2026](https://www.kyberturvallisuuskeskus.fi/en/news/weekly-review-national-cyber-security-centre-finland-ncsc-fi-32026)

---
> 萃取時間: 2026-01-27 05:25 UTC
> 資料來源: NCSC-FI (Finland) ncsc-fi
> 萃取方式: RSS + WebFetch補充
