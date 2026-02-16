# Taiwan Financial Sector Targeted by Sophisticated Phishing Campaign

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Large-scale phishing campaign targets Taiwan's financial institutions using fake official notifications to steal credentials and financial data.

## 事實內容

TWCERT/CC detected a coordinated phishing campaign targeting Taiwan's banking and financial services sector in late January 2026.

**Attack Characteristics:**
1. **Social Engineering Tactics**:
   - Fake emails impersonating Financial Supervisory Commission (FSC) and major banks
   - Urgent subject lines claiming "account suspension" or "security verification required"
   - Professional-looking email templates mimicking official correspondence
   - Use of legitimate-looking sender addresses with minor variations

2. **Technical Methods**:
   - Phishing links redirecting to fake banking login pages
   - Domains registered with similar names to legitimate financial institutions
   - SSL certificates acquired to display "secure" padlock icons
   - Mobile-responsive fake pages targeting smartphone users

3. **Objectives**:
   - Harvesting online banking credentials
   - Collecting personal identification numbers and account details
   - Capturing one-time passwords (OTP) through real-time phishing kits
   - Installing information-stealing malware on victim devices

**Indicators of Attack:**
- Emails with urgent language demanding immediate action
- Links to domains not matching official bank websites
- Requests for full credentials including passwords and OTPs
- Poor grammar or unusual phrasing in Chinese text

**Recommended Protection Measures:**
1. **User Awareness**:
   - Verify sender email addresses carefully
   - Never click links in unsolicited emails
   - Access banking services by typing URLs directly
   - Contact banks through official channels to verify suspicious communications

2. **Technical Controls**:
   - Enable email filtering and anti-phishing tools
   - Implement multi-factor authentication (MFA)
   - Keep browsers and security software updated
   - Use hardware security keys for high-value accounts

3. **Organizational Response**:
   - Conduct employee security awareness training
   - Implement email authentication (SPF, DKIM, DMARC)
   - Monitor for domain squatting and brand impersonation
   - Establish incident reporting procedures

## 受影響系統

- Taiwan banking customers (individual and corporate)
- Financial services employees
- Users of online banking platforms
- Mobile banking application users

## 來源連結

- [針對我國金融業之網路釣魚攻擊事件](https://www.twcert.org.tw/tw/cp-104-10685-da22a-1.html)

---
> 萃取時間: 2026-02-16 00:00 UTC
> 資料來源: TWCERT/CC rss-104
> 備註: Original language: zh-TW (Traditional Chinese)
