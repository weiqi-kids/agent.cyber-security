# Poland Energy Sector Cyber Incident Highlights OT and ICS Security Gaps

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-10 |
| **來源** | CISA (US) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Cyber attack on Poland's energy sector in December 2025 via vulnerable edge devices resulted in wiper malware deployment, RTU damage, and loss of control.

## 事實內容

In December 2025, malicious cyber actors targeted and compromised operational technology (OT) and industrial control systems (ICS) in Poland's Energy Sector, specifically affecting renewable energy plants, a combined heat and power plant, and a manufacturing sector company.

The attack vector involved:
- Initial access through vulnerable internet-facing edge devices
- Deployment of wiper malware
- Damage to remote terminal units (RTUs)
- Loss of view and control between facilities and distribution system operators
- Destroyed data on human machine interfaces (HMIs)
- Corrupted system firmware on OT devices

While affected renewable energy systems continued production, system operators could not control or monitor them according to their intended design.

Key findings from CERT Polska's incident report:
1. Vulnerable edge devices remain prime targets (highlighting risks from end-of-support edge devices per BOD 26-02)
2. OT devices without firmware verification can be permanently damaged
3. Threat actors leveraged default credentials to pivot onto HMI and RTUs

CISA and DOE CESER urge OT asset owners to review mitigations and change default passwords immediately.

## 受影響系統

- Renewable energy plants (Poland)
- Combined heat and power plant
- Manufacturing sector facilities
- Remote Terminal Units (RTUs)
- Human Machine Interfaces (HMIs)

## 來源連結

- [Poland Energy Sector Cyber Incident Highlights OT and ICS Security Gaps](https://www.cisa.gov/news-events/alerts/2026/02/10/poland-energy-sector-cyber-incident-highlights-ot-and-ics-security-gaps)
- [CERT Polska Energy Sector Incident Report](https://cert.pl/en/posts/2026/01/incident-report-energy-sector-2025/)

---
> 萃取時間：2026-02-15 23:59 UTC
> 資料來源：CISA (US) cisa
