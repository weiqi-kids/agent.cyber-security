# Ransomware: How to prevent and recover (ITSAP.00.099)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-28 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | industry_trend |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Canadian Cyber Centre releases comprehensive ransomware prevention and recovery guidance, emphasizing phishing-resistant MFA and warning against ransom payments.

## 事實內容

The Canadian Centre for Cyber Security published ITSAP.00.099 (January 2026), defining ransomware as "a type of malware that denies a victim access to a system or data until they pay a sum of money."

**Key Prevention Measures:**

**Authentication & Access Control:**
- Deploy phishing-resistant multi-factor authentication (MFA)
- Use strong, unique passphrases on all accounts
- Implement password managers and vaults for administrative accounts
- Apply principle of least privilege with role-based access control
- Restrict administrative privileges; separate user and admin accounts

**System Hardening:**
- Apply updates and patches immediately to close vulnerabilities
- Deactivate macros by default in Microsoft Office
- Segment networks into smaller components to limit spread
- Install antimalware, antivirus, and firewall protections
- Deploy DNS filtering (e.g., Canadian Shield) to block malicious sites
- Implement DMARC for email authentication
- Use VPNs for secure network access

**Organizational Preparedness:**
- Develop incident response and disaster recovery plans
- Conduct regular testing of response procedures
- Maintain offline, encrypted backups disconnected from networks
- Provide continuous employee security awareness training
- Consider cyber insurance coverage

**Recovery Steps:**
1. Isolate infected devices immediately without powering down (preserve forensic evidence)
2. Report incidents to law enforcement and Canadian Anti-Fraud Centre
3. Reset all credentials across systems and accounts
4. Identify ransomware type using ransom notes and file extensions
5. Remediate entry points before reconnecting systems
6. Restore from clean backups after verifying they're malware-free
7. Apply patches and updates across all systems
8. Review incident and train employees on prevention

**Threat Actor Tactics:**
- Exploit vulnerabilities and phishing to deliver ransomware
- Use "ransomware-as-a-service" purchased from dark web
- Leverage AI tools to automate network reconnaissance
- Employ data theft as primary extortion method
- Deploy dormant strains that spread before encrypting files
- Demand cryptocurrency for anonymity and international profit movement

**Warning Against Payment:**
Document emphasizes NOT to pay ransom because threat actors may:
- Demand additional money
- Continue attacks
- Retarget organizations
- Leak or sell stolen data even after payment

## 受影響系統

- All organizational systems and networks
- Microsoft Office applications (macro exploitation)
- Email systems (phishing vectors)
- Administrative accounts and credentials
- Backup systems

## 來源連結

- [Ransomware: How to prevent and recover (ITSAP.00.099)](https://cyber.gc.ca/en/guidance/ransomware-how-prevent-and-recover-itsap00099)

---
> 萃取時間: 2026-02-06 00:00 UTC
> 資料來源: Canadian Centre for Cyber Security ca-news
