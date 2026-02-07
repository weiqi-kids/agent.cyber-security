# Testing the Koord2ool

| 項目 | 內容 |
|------|------|
| **日期** | 2024-11-11 |
| **來源** | CERT.at (Austria) |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

CERT.at tests Koord2ool incident tracking tool during national cyber exercise, identifying implementation challenges and configuration requirements.

## 事實內容

Koord2ool is an extension for LimeSurvey that tracks the state of incidents across a constituency during emergencies. Built for the EU-funded AWAKE project, it generates dashboards visualizing response data over time.

**Testing Context:**
CERT.at tested the tool during a national cyber exercise organized by KSÖ (Austrian Coordination Office for IT Security) and AIT (Austrian Institute of Technology). The exercise distributed surveys to six virtual companies to monitor their status throughout the simulation.

**Key Findings:**

**Participation Challenges:**
- Limited participant engagement during exercise
- Organizers must officially announce survey requirements and enforce regular completion intervals
- Institutional integration and mandate are essential for effectiveness

**Technical Configuration Requirements:**
- Requires careful LimeSurvey configuration including closed-mode access
- Participant-based response persistence must be properly configured
- Survey anonymization settings must be disabled to track individual responses over time

**Operational Limitations:**
- Adding questions mid-exercise is cumbersome, requiring survey deactivation and data re-importation
- LimeSurvey's built-in restrictions on duplicate invitation emails required workarounds for multi-response scenarios
- Real-time adaptability to emerging incident characteristics is limited

**Conclusion:**
CERT.at developers concluded the concept shows promise for incident state tracking but requires strong institutional integration, participant buy-in, and official mandates for real-world effectiveness. The tool is most suitable for structured exercises with pre-defined data collection intervals.

## 受影響系統

- LimeSurvey platform
- Koord2ool extension (AWAKE project)
- Incident response coordination systems
- National cyber exercise infrastructure (Austria)

## 來源連結

- [Testing the Koord2ool](https://www.cert.at/en/blog/2024/11/testing-the-koord2ool)

---
> 萃取時間: 2026-01-27 00:00 UTC
> 資料來源: CERT.at (Austria) cert-at
