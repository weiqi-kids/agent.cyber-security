# Backdoor CABINETRAT Used by UAC-0245 for Targeted Attacks Against Ukrainian Defense Forces

| Item | Content |
|------|---------|
| **Date** | 2025-09-30 |
| **Source** | CERT-UA (Ukraine) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |

## Summary
Ukrainian CERT reports UAC-0245 using CABINETRAT backdoor in September 2025 targeted attacks against Defense Forces, distributing malicious XLL files via Signal messenger with themes including military requests and personal documents.

## Factual Content
**Incident Details:**
- **Alert ID:** CERT-UA#17479
- **Threat Actor:** UAC-0245
- **Discovery Date:** September 2025
- **Malware:** CABINETRAT (backdoor)
- **File Type:** XLL (Excel Add-in files)

**Attack Vector:**
Distribution of malicious XLL files via Signal messenger application, disguised with specific filenames:
- "Звернення УБД.xll" (UBD Appeal)
- "recept_ruslana_nekitenko.xll" (Ruslana Nekitenko's Receipt)
- "500.zip" (containing document allegedly about detained border crossers)

**Technical Details:**
XLL files are executable (PE, Portable Executable) format that can be loaded by Excel's Add-in manager using the exported function "xlAutoOpen", providing automatic execution capability.

**Distribution Method:**
- **Platform:** Signal (encrypted messaging app)
- **File Format:** XLL disguised as legitimate documents
- **Themes:** Military appeals, personal documents, border security incidents

**Target:**
Ukrainian Defense Forces personnel, exploiting:
- Military context and operational concerns
- Trust in Signal's encrypted communications
- Credible document themes relevant to military operations

**Malware Characteristics:**
- **Type:** Backdoor (CABINETRAT)
- **Persistence:** XLL Add-in mechanism in Excel
- **Execution:** Automatic via xlAutoOpen function
- **Delivery:** Compressed archives and raw XLL files

**Social Engineering:**
Multiple themed lures:
1. Military bureau appeals
2. Personal receipts/documents
3. Security incidents (border crossing detentions)

**Impact:**
- Persistent backdoor access to military systems
- Data exfiltration from defense personnel
- Potential operational intelligence gathering
- Compromise of military communications

**Reporting Source:**
Information received from information exchange participants, indicating collaborative threat intelligence sharing among Ukrainian security organizations.

**Notes:** Original content in Ukrainian language (uk); translated to English for analysis; XLL is Excel Add-in format, less commonly used attack vector; Signal usage indicates targeting of security-conscious users; military themes highly effective against defense personnel during conflict

## Source Links
- [Бекдор CABINETRAT використовується UAC-0245 для цільових кібератак у відношенні СОУ (CERT-UA#17479)](https://cert.gov.ua/article/6285549)

---
> Extraction time: 2026-02-24 UTC
> Data source: CERT-UA (Ukraine) cert-ua
