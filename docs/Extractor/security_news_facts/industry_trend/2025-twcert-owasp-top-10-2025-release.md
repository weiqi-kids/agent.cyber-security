# OWASP 2025 Web Application Security Top 10 Released

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-11 |
| **來源** | TWCERT/CC |
| **分類** | industry_trend |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

OWASP released 2025 Top 10 with significant changes: Broken Access Control remains #1, Security Misconfiguration rises to #2, new category Software Supply Chain Failures enters at #3.

## 事實內容

The OWASP Top 10 Web Application Security Risks for 2025 was officially released, showing significant ranking changes reflecting rapid evolution of current security threats. Broken Access Control remains at the top, while Security Misconfiguration and Software Supply Chain Failures rise to second and third positions, indicating greater challenges for enterprises in cloud architecture and third-party component management.

**Key Changes:**
- Two new categories added: "Software Supply Chain Failures" and "Mishandling of Exceptional Conditions"
- Server-Side Request Forgery (SSRF) merged into "Broken Access Control"
- "Software Supply Chain Failures" enters top 3 for first time, highlighting increased risks from open-source packages and third-party services
- "Cryptographic Failures" and "Injection" remain on list but rank lower, indicating accumulated defense capabilities
- New category "Mishandling of Exceptional Conditions" covers software behavior under unpredictable stress, with rising risks amid interconnected systems and AI-driven trends

**2025 OWASP Top 10:**
1. A01:2025 - Broken Access Control
2. A02:2025 - Security Misconfiguration
3. A03:2025 - Software Supply Chain Failures (NEW)
4. A04:2025 - Cryptographic Failures
5. A05:2025 - Injection
6. A06:2025 - Insecure Design
7. A07:2025 - Authentication Failures
8. A08:2025 - Software or Data Integrity Failures
9. A09:2025 - Logging & Alerting Failures
10. A10:2025 - Mishandling of Exceptional Conditions (NEW)

**TWCERT/CC Recommendations:**
1. Strengthen access control mechanisms using principle of least privilege, regularly review permission settings
2. Conduct complete inventory of third-party components and vendors, establish tracking mechanisms (e.g., SBOM), implement supply chain security assessment and continuous monitoring
3. Perform regular security testing (vulnerability scanning, penetration testing) on external-facing websites
4. Enhance security authentication mechanisms, require multi-factor authentication (MFA), limit failed login attempts
5. Establish Product Security Incident Response Team (PSIRT) to build anomaly handling and incident response mechanisms
6. Regularly update security awareness and technical training to master latest threats and defense techniques

## 受影響系統

- All web applications and services
- Cloud infrastructure and third-party service integrations
- Open-source package dependencies
- Server-side rendering frameworks

## 來源連結

- [OWASP 2025年Web應用安全十大威脅揭曉，存取控制漏洞位居榜首](https://www.twcert.org.tw/tw/cp-104-10548-03edd-1.html)

---
> 萃取時間: 2026-02-15 23:27 UTC
> 資料來源: TWCERT/CC rss-104
