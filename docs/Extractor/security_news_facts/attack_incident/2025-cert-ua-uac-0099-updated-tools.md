# UAC-0099 Updated Toolkit: MATCHBOIL, MATCHWOK, DRAGSTARE

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-04 |
| **來源** | CERT-UA (Ukraine) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

UAC-0099 conducted cyberattacks against Ukrainian government agencies, Defense Forces, and defense industry using updated malware toolkit including MATCHBOIL, MATCHWOK, and DRAGSTARE.

## 事實內容

CERT-UA investigated a series of cyberattacks carried out by the UAC-0099 group against government agencies, Defense Forces, and defense-industrial complex enterprises in Ukraine. The typical attack chain begins with phishing emails distributed primarily via UKR.NET with "court summons" themes.

**Attack Details:**
- **Threat Actor:** UAC-0099
- **Malware Used:** MATCHBOIL, MATCHWOK, DRAGSTARE (updated toolkit)
- **Attack Vector:** Phishing emails via UKR.NET
- **Email Theme:** Court summons (judicial notices)
- **Distribution Method:** Links to legitimate file services (including URL-shortened links)
- **Payload Format:** Double-archived HTA files
- **Target:** Government agencies, Defense Forces, defense-industrial complex
- **Attack Method:** Multi-stage phishing campaign

**Attack Chain:**
1. Phishing email with court summons theme
2. Link to legitimate file service (often URL-shortened)
3. Download of double-archived file
4. Execution of HTA file
5. Deployment of malware toolkit

**Timeline:**
- August 4, 2025: CERT-UA disclosure of updated toolkit

**Context:**
UAC-0099 continuously updates its malware toolkit. The use of legitimate file services and URL shorteners helps evade detection and increases victim trust.

## 受影響系統

- Government agencies in Ukraine
- Ukrainian Defense Forces
- Defense-industrial complex enterprises
- Windows systems (HTA file execution)

## 來源連結

- [CERT-UA Article](https://cert.gov.ua/article/6284949)

---
> 萃取時間：2026-02-11 19:10 UTC
> 資料來源：CERT-UA (Ukraine) cert-ua
> Original language: Ukrainian (uk)
