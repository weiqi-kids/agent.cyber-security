# Double Agents and User Agents: Navigating the Realm of Malicious Python Packages

| 項目 | 內容 |
|------|------|
| **日期** | 2024-04-22 |
| **來源** | CERT.at (Austria) |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

CERT.at analyzes two distinct malicious Python package campaigns targeting developers through compromised repositories and typosquatting.

## 事實內容

Two sophisticated malicious package campaigns were discovered and removed from PyPI in April 2024.

**Campaign 1: "Double Agent" Oak-Grabber Compromise**

Attackers compromised the Oak-Grabber-V2 repository to inject malicious dependencies into PyPI. The campaign deployed five malicious packages: `argsreq`, `colarg`, `colargs`, `reqarg`, `reqargs`.

**Attack Mechanism:**
The packages spied on malware developers by harvesting:
- Wi-Fi passwords
- PowerShell command history
- Screenshots
- Installed applications
Data was exfiltrated via the Nagogy Grabber tool.

**Campaign 2: Counterfeit User-Agent Parsers**

Malicious packages (`user-agents-parser`, `user-agents-parsers`) impersonated legitimate user-agent parsing libraries. These packages:
- Executed arbitrary shell commands through HTTP headers
- Established persistent reverse shells via crontab
- Enabled remote command execution on infected systems

**Key Techniques:**

**Unicode Normalization Obfuscation:**
Exploited PEP 3131 (Unicode identifiers) to evade static analysis by using visually similar Unicode characters.

**Metadata Preservation:**
Cloned legitimate package metadata to gain developer trust and appear authentic in PyPI searches.

**Strategic PyPI Uploads:**
Carefully timed uploads to maximize exposure before detection.

**Target:**
Both campaigns specifically exploited developers' reliance on popular open-source tools, demonstrating supply chain attack sophistication.

**Outcome:**
All malicious packages were discovered and removed from PyPI in April 2024 following CERT.at's analysis.

**Implications:**
The campaigns highlight evolving attacker techniques including Unicode-based evasion, repository compromise, and targeting of developer tools. Package managers need enhanced detection for Unicode obfuscation and compromised upstream dependencies.

## 受影響系統

- Python Package Index (PyPI)
- Python developers using compromised packages
- Malware developer tools (Oak-Grabber-V2)
- Systems with installed packages: argsreq, colarg, colargs, reqarg, reqargs, user-agents-parser, user-agents-parsers

## 來源連結

- [Double Agents and User Agents: Navigating the Realm of Malicious Python Packages](https://www.cert.at/en/blog/2024/4/double-agents-and-user-agents-navigating-the-realm-of-malicious-python-packages)

---
> 萃取時間: 2026-01-27 00:00 UTC
> 資料來源: CERT.at (Austria) cert-at
