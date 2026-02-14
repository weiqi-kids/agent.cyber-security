# UAC-0001 Cyberattacks Against Defense Sector Using LAMEHUG Malware with LLM Integration

| 項目 | 內容 |
|------|------|
| **日期** | 2025-07-17 |
| **來源** | CERT-UA (Ukraine) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

UAC-0001 (APT28) conducted cyberattacks against Ukrainian security and defense sector using LAMEHUG malware that integrates Large Language Model (LLM) capabilities, distributed via spearphishing emails.

## 事實內容

On July 10, 2025, CERT-UA received information about the distribution of emails among executive authorities, allegedly from a representative of a relevant ministry, with an attachment named "Додаток.pdf.zip" (Attachment.pdf.zip). The ZIP archive contained an executable file with a ".pif" extension, converted using PyInstaller from source code developed in Python, classified by CERT-UA as the LAMEHUG malicious software.

**Attack Details:**
- **Threat Actor:** UAC-0001 (APT28)
- **Malware Used:** LAMEHUG (Python-based, PyInstaller-converted)
- **Notable Feature:** Uses Large Language Model (LLM) integration
- **Attack Vector:** Spearphishing email with malicious attachment
- **File Format:** ZIP archive containing .pif executable
- **Disguise:** PDF document name ("Attachment.pdf.zip")
- **Target:** Executive authorities, security and defense sector
- **Attack Method:** Email impersonation of government ministry

**Timeline:**
- July 10, 2025: Attack campaign detected
- July 17, 2025: CERT-UA public disclosure

**Technical Details:**
- Python-based malware compiled with PyInstaller
- Use of .pif extension (Program Information File) for execution
- Integration of LLM capabilities (specific usage not detailed in advisory)

**Context:**
This represents an evolution in APT28's toolkit, incorporating emerging AI/LLM technologies into their malware. The use of LLM capabilities in malware is a relatively novel development in the threat landscape.

## 受影響系統

- Executive authorities in Ukraine
- Security and defense sector organizations
- Windows systems (.pif file execution)

## 來源連結

- [CERT-UA Advisory #16039](https://cert.gov.ua/article/6284730)

---
> 萃取時間：2026-02-11 19:10 UTC
> 資料來源：CERT-UA (Ukraine) cert-ua
> Original language: Ukrainian (uk)
