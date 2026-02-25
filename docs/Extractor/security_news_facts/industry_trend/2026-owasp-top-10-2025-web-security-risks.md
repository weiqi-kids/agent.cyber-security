# OWASP 2025 Top 10 Web Application Security Risks Released - Access Control Remains Top Threat

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-11 |
| **來源** | TWCERT/CC |
| **分類** | industry_trend |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

OWASP 2025 Top 10 published with significant ranking changes. Broken Access Control remains #1, while Security Misconfiguration and Software Supply Chain Failures rise to #2 and #3.

## 事實內容

The 2025 OWASP Top 10 Web Application Security Risk list was officially released, with notable ranking changes reflecting rapid evolution of current security threats. Broken Access Control continues to top the list, while Security Misconfiguration and Software Supply Chain Failures rose to second and third positions, indicating greater challenges enterprises face in cloud architecture and third-party component management.

### Major Changes in 2025

**New Categories Added**:
1. **Software Supply Chain Failures** - First-time entry into top three, highlighting increasing risks from open-source packages and third-party services
2. **Mishandling of Exceptional Conditions** - Covers software performance under unpredictable stress, from poor error handling to logic collapse; risks rising with interconnected systems and AI-driven trends

**Category Consolidation**:
- Server-Side Request Forgery (SSRF) merged into "Broken Access Control"

**Ranking Declines**:
- Cryptographic Failures and Injection attacks remain on list but dropped in ranking, showing organizations have accumulated certain defensive capabilities against these vulnerabilities

### 2025 OWASP Top 10 Rankings

| Rank | Category | Description |
|------|----------|-------------|
| A01:2025 | Broken Access Control | Allows attackers to bypass authorization or access without authorization |
| A02:2025 | Security Misconfiguration | Incorrect configuration of systems, applications, or cloud services |
| A03:2025 | Software Supply Chain Failures | Interruptions or issues in third-party software build, distribution, or update processes |
| A04:2025 | Cryptographic Failures | Lack of encryption, insufficient encryption strength, encryption key leaks, and related errors |
| A05:2025 | Injection | Attackers insert malicious code or commands into input fields |
| A06:2025 | Insecure Design | Design and architecture flaws, covering application logic errors |
| A07:2025 | Authentication Failures | Attackers trick systems into identifying invalid or incorrect users as legitimate |
| A08:2025 | Software or Data Integrity Failures | Failure to effectively prevent treating invalid or untrusted code/data as trusted valid data |
| A09:2025 | Logging & Alerting Failures | Lack of logging and alerting prevents attack/vulnerability detection and rapid effective response |
| A10:2025 | Mishandling of Exceptional Conditions | Includes opening failures, improper error handling, logic errors, and other abnormal conditions systems may encounter |

### TWCERT/CC Recommendations

1. **Strengthen Access Control**: Adopt principle of least privilege; regularly review permission settings to prevent unauthorized access
2. **Complete Third-Party Inventory**: Establish tracking mechanisms (e.g., SBOM); implement supply chain security assessments and continuous monitoring
3. **Regular Security Testing**: Conduct vulnerability scanning and penetration testing for external-facing services to reduce exploitation risk of exposed vulnerabilities
4. **Enhanced Authentication**: Require multi-factor authentication (MFA); limit failed login attempt counts
5. **Establish PSIRT**: Build anomaly handling and incident response mechanisms to ensure systems maintain security under abnormal conditions
6. **Regular Training**: Update security awareness and technical training to master latest threats and defense techniques

## 受影響系統

- All web applications requiring security assessment and improvement
- Organizations managing cloud architectures and third-party components

## 來源連結

- [OWASP 2025年Web應用安全十大威脅揭曉，存取控制漏洞位居榜首](https://www.twcert.org.tw/tw/cp-104-10548-03edd-1.html)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：TWCERT/CC rss-104
