# FIRESTARTER Backdoor: APT Malware Targeting Cisco Firepower and Secure Firewall Devices

| 項目 | 內容 |
|------|------|
| **日期** | 2026-04-23 |
| **來源** | CISA (US) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

CISA and UK NCSC published a Malware Analysis Report on FIRESTARTER, an APT backdoor malware targeting publicly accessible Cisco Firepower and Secure Firewall devices running ASA or FTD software. The release aligns with CISA Emergency Directive ED 25-03 on Cisco device compromise.

## 事實內容

CISA analyzed a sample of FIRESTARTER malware obtained from a forensic investigation. Key findings:

- **Malware**: FIRESTARTER (backdoor)
- **Threat actors**: Advanced Persistent Threat (APT) actors — assessed by CISA and UK NCSC
- **Target devices**: Publicly accessible Cisco Firepower and Secure Firewall devices running:
  - Adaptive Security Appliance (ASA) software
  - Firepower Threat Defense (FTD) software
- **Purpose**: Persistence — FIRESTARTER operates as a backdoor implant
- **Confirmed wild deployment**: Successful implant observed on Cisco Firepower device running ASA software
- **Joint publication**: Released alongside CISA Emergency Directive (ED 25-03) update on identifying and mitigating potential compromise of Cisco devices

Key actions required for US FCEB Agencies:
- Collect and submit core dumps to CISA's Malware Next Generation platform
- Immediately report submission via CISA's 24/7 Operations Center
- Take no additional action until receiving CISA guidance

The advisory aligns with ED 25-03 and Supplemental Direction ED 25-03: Core Dump and Hunt Instructions.

## 受影響系統

- Cisco Firepower devices running ASA software (confirmed implant in wild)
- Cisco Secure Firewall devices running FTD software (targeted)
- Publicly accessible perimeter firewall/security appliances

## 來源連結

- [FIRESTARTER Backdoor - CISA Malware Analysis Report AR26-113A](https://www.cisa.gov/news-events/analysis-reports/ar26-113a)
- [ED 25-03: Identify and Mitigate Potential Compromise of Cisco Devices](https://www.cisa.gov/news-events/directives/v1-ed-25-03-identify-and-mitigate-potential-compromise-cisco-devices)

---
> 萃取時間：2026-04-26 00:00 UTC
> 資料來源：CISA (US) cisa
