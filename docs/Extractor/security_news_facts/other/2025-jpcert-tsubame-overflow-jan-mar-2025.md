# TSUBAME Report Overflow (Jan-Mar 2025)

| 項目 | 內容 |
|------|------|
| **日期** | 2025-07-08 |
| **來源** | JPCERT/CC Blog |
| **分類** | other |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

TSUBAME sensors detected coordinated scanning campaigns targeting port 23/TCP with malware-characteristic packets exceeding 50% during peak periods, compromising routers, security cameras, DVRs, and NAS devices from overseas manufacturers.

## 事實內容

**Monitoring Trends in Japan:**
JPCERT/CC analyzed threat data throughout fiscal year 2024. Port 23/TCP received the most directed packets observed by sensors. During three significant periods, malware-characteristic packets exceeded 50% of total traffic to this port:
- May 2024
- September-December 2024
- February-March 2025

**Primary Attack Patterns:**
Three distinct device categories were compromised during peak periods:
- May 2024: Routers from overseas vendors (TP-Link)
- September-December 2024: Security cameras, DVRs, and NAS devices from overseas manufacturers
- February-March 2025: Routers from vendors like ASUS

Attackers leveraged accessible ports from the Internet and vulnerability information to target specific products, indicating coordinated scanning behavior and DDoS infrastructure development.

**Geographical Comparison:**
Overseas sensors consistently detected higher packet volumes than domestic sensors throughout the monitoring period. Both regions experienced significant increases in March 2025, suggesting widespread vulnerability scanning campaigns.

**Common Threat Vectors:**
Analysis across six sensor locations identified consistent attack targets:
- Port 23/TCP
- Port 8728/TCP
- Port 22/TCP
- Port 80/TCP
- ICMP protocol

These patterns indicate wide range of networks exposure to standardized scanning activities.

**Recommendations:**
Security device owners should:
- Maintain current firmware
- Apply proper configurations
- Conduct port scans to verify internet accessibility restrictions

## 受影響系統

- TP-Link routers
- ASUS routers
- Security cameras (overseas manufacturers)
- DVRs (overseas manufacturers)
- NAS devices (overseas manufacturers)
- Systems exposing ports 23, 8728, 22, 80

## 來源連結

- [TSUBAME Report Overflow (Jan-Mar 2025)](https://blogs.jpcert.or.jp/en/2025/07/tsubame_overflow_2025-01-03.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
