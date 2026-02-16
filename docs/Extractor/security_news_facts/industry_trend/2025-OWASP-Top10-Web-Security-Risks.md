# OWASP 2025 Top 10 Web Application Security Risks Released

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-06 |
| **來源** | TWCERT/CC |
| **分類** | industry_trend |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

OWASP released 2025 Top 10 list with significant ranking changes, highlighting supply chain risks and misconfiguration challenges.

## 事實內容

The OWASP Top 10 2025 Web Application Security Risk list was officially published, reflecting significant shifts in current security threats:

**Key Rankings:**
1. **A01:2025 - Broken Access Control**: Remains at top position, allows attackers to bypass authorization
2. **A02:2025 - Security Misconfiguration**: Jumped to second place, covering system, application, and cloud service misconfigurations
3. **A03:2025 - Software Supply Chain Failures**: NEW entry at third place, addressing third-party software build, distribution, and update disruptions
4. **A04:2025 - Cryptographic Failures**: Dropped from second to fourth, covering weak encryption and key exposure
5. **A05:2025 - Injection**: Decreased in ranking, malicious code insertion attacks
6. **A06:2025 - Insecure Design**: Design and architecture flaws including logic errors
7. **A07:2025 - Authentication Failures**: System deception to accept invalid users as legitimate
8. **A08:2025 - Software and Data Integrity Failures**: Code and data not protected from tampering
9. **A09:2025 - Security Logging and Monitoring Failures**: Insufficient logging leading to delayed incident detection
10. **A10:2025 - Improper Handling of Edge Cases**: NEW category covering software behavior under unpredictable stress

**Notable Changes from 2021:**
- **Software Supply Chain Failures** enters Top 3 for first time, highlighting open-source package and third-party service risks
- **Improper Handling of Edge Cases** added as new category, covering error handling failures and logic collapse under stress
- SSRF (Server-Side Request Forgery) merged into Broken Access Control
- Cryptographic Failures and Injection attacks dropped in ranking, indicating improved defensive capabilities

**Implications:**
- Cloud architecture and third-party component management pose greater challenges
- AI-driven systems increase edge case handling risks
- Organizations need stronger supply chain security practices
- Traditional vulnerabilities (injection, crypto) better managed but still present

**Recommendations:**
1. Implement comprehensive access control testing and monitoring
2. Audit cloud service configurations regularly
3. Establish software supply chain security policies
4. Maintain updated dependency inventories
5. Enhance edge case testing in AI/ML systems

## 受影響系統

- Web applications worldwide
- Cloud-based services
- Applications using third-party dependencies
- AI/ML-driven systems

## 來源連結

- [OWASP 2025年Web應用安全十大威脅揭曉，存取控制漏洞位居榜首](https://www.twcert.org.tw/tw/cp-104-10548-03edd-1.html)

---
> 萃取時間: 2026-02-16 00:00 UTC
> 資料來源: TWCERT/CC rss-104
> 備註: Original language: zh-TW (Traditional Chinese)
