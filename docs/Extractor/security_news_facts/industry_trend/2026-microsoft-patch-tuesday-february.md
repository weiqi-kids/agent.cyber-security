# Microsoft Patch Tuesday - February 2026

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-10 |
| **來源** | SANS ISC |
| **分類** | industry_trend |
| **嚴重程度** | High |
| **信心水準** | High |

## 摘要

Microsoft released February 2026 Patch Tuesday addressing 59 vulnerabilities, including 5 critical issues and 6 actively exploited vulnerabilities requiring immediate attention.

## 事實內容

Microsoft's February 2026 Patch Tuesday addressed 59 different vulnerabilities plus two Chromium vulnerabilities affecting Microsoft Edge, representing a lower-than-normal patch volume for the company.

**Vulnerability Breakdown:**
- 5 Critical severity vulnerabilities (3 already patched in Azure services)
- Multiple Important severity vulnerabilities affecting Windows, Office, and development tools
- 6 vulnerabilities currently being actively exploited in the wild

**Actively Exploited Vulnerabilities (Immediate Patching Required):**

1. **CVE-2026-21510** - Windows Shell vulnerability
2. **CVE-2026-21513** - Internet Explorer HTML engine vulnerability
3. **CVE-2026-21514** - Microsoft Word vulnerability
4. **CVE-2026-21533** - Remote Desktop privilege escalation vulnerability
5. **CVE-2026-21519** - Windows Manager vulnerability
6. **CVE-2026-21525** - Remote Access Connection Manager DoS vulnerability

**Affected Products:**
- Windows operating system components (Shell, Manager, Remote Desktop, Remote Access Connection Manager)
- Microsoft Office applications (Word, Excel, Outlook)
- Microsoft Azure cloud services
- Development tools (GitHub Copilot, Visual Studio)
- Windows Hyper-V virtualization platform
- Microsoft Edge web browser

**Security Implications:**

The six actively exploited vulnerabilities are particularly concerning as they affect commonly used Windows and Office components. Several relate to improper code execution warnings, which attackers can exploit to execute malicious code without adequate user notification.

Organizations should prioritize patching these six vulnerabilities immediately, as active exploitation indicates threat actors are already targeting these weaknesses in production environments.

The lower-than-normal patch volume may indicate Microsoft's focus on quality and thorough testing, or could represent a temporary lull before future larger patch releases.

## 受影響系統

- Microsoft Windows (all supported versions)
- Microsoft Office Suite (Word, Excel, Outlook)
- Microsoft Azure services
- Microsoft Edge browser
- Windows Hyper-V
- Visual Studio and GitHub Copilot

## 來源連結

- [Microsoft Patch Tuesday - February 2026](https://isc.sans.edu/diary/rss/32700)

---
> 萃取時間：2026-02-11 08:00 UTC
> 資料來源：SANS ISC (sans-isc)
> Notes: Content supplemented with WebFetch due to truncated RSS description
