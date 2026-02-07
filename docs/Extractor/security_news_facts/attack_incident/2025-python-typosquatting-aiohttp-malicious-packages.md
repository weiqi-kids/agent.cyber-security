# How typosquatting tricked me (a bit)

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-29 |
| **來源** | CERT.at (Austria) |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

CERT.at analyzes typosquatting campaign targeting Python packages, revealing sophisticated obfuscation techniques in malicious PyPI packages.

## 事實內容

A typosquatting campaign targeted Python developers by creating malicious packages with names similar to legitimate libraries like `aiohttp` and `aiohappyeyeballs`. Five packages were identified: `aiohappyeyeball`, `aiohttp-openssl`, `aiohttp-ssl`, `asynhttp`, and `httpserver-cache`.

**Attack Vector:**
The attacker embedded encrypted payloads within ZIP archives disguised as certificates or type definition files. The campaign employed sophisticated evasion techniques:
- Encryption keys derived from standard library filenames
- Native extension modules as final payloads
- Multi-stage loading mechanisms split across dependencies
- Obfuscated code to evade detection

**Technical Analysis:**
The malicious code successfully installed but appeared dormant during CERT.at's analysis, suggesting either incomplete deployment or capability for future activation. Unusual file inclusions (such as `__pycache__` directories in packages) were indicators warranting investigation.

**Outcome:**
All malicious packages were removed from PyPI before widespread installation.

**Key Lessons:**
- Typosquatting remains effective despite increased recognition efforts
- Attackers continuously evolve obfuscation techniques
- Supply chain attacks require constant vigilance even when payloads appear inactive
- Code review should flag unusual file inclusions in packages

The incident demonstrates the ongoing evolution of software supply chain attacks and the sophistication of modern malware distribution techniques.

## 受影響系統

- Python Package Index (PyPI)
- Python developers using aiohttp and related libraries
- Systems with installed packages: aiohappyeyeball, aiohttp-openssl, aiohttp-ssl, asynhttp, httpserver-cache

## 來源連結

- [How typosquatting tricked me (a bit)](https://www.cert.at/en/blog/2025/10/how-typosquatting-tricked-me-a-bit)

---
> 萃取時間: 2026-01-27 00:00 UTC
> 資料來源: CERT.at (Austria) cert-at
