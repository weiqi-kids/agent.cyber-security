# TSUBAME Report Overflow (Oct-Dec 2024)

| 項目 | 內容 |
|------|------|
| **日期** | 2025-03-21 |
| **來源** | JPCERT/CC Blog |
| **分類** | other |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

TSUBAME sensors observed reflection DDoS attacks targeting Japanese organizations from networks of banks, printing companies, securities firms, and airlines during October-December 2024, with consistent global scanning of ports 23, 8728, 22, 8080, 80, 443.

## 事實內容

**Reflection DDoS Attack Activity:**
JPCERT/CC observed reflection packets targeting Japanese organizations during October-December 2024. Analysis revealed: "packets were sent from the networks of banks, printing companies, securities firms, airlines, etc." Some companies experienced persistent targeting patterns, suggesting coordinated attack campaigns.

**Packet Volume Comparison:**
Monitoring data demonstrated geographic disparities in threat exposure. Overseas sensors consistently captured higher packet volumes than domestic Japanese sensors throughout the monitoring period, indicating differing threat landscapes between regions.

**Common Attack Vectors:**
Analysis across TSUBAME sensors (both domestic and international) identified widely-scanned protocols and ports:
- TCP ports: 23, 8728, 22, 8080, 80, 443
- UDP port: 123
- ICMP protocol
- Additional targets: 3389, 6379, 445, 1433, 34567

These consistent patterns suggest "these protocols are being scanned in a wide range of networks" globally.

**Recommendations:**
JPCERT/CC emphasized proactive defensive measures:
- Leveraging content delivery networks
- Developing contingency strategies
- Establishing clear user notification protocols for incident response

**Ongoing Monitoring:**
The organization continues sharing observation data with affected service providers and commits to publishing quarterly threat monitoring reports with supplementary alerts when unusual activity emerges.

## 受影響系統

- Japanese banks
- Printing companies
- Securities firms
- Airlines
- Systems exposing ports 23, 8728, 22, 8080, 80, 443, 123, 3389, 6379, 445, 1433, 34567

## 來源連結

- [TSUBAME Report Overflow (Oct-Dec 2024)](https://blogs.jpcert.or.jp/en/2025/03/tsubame_overflow_2024-10-12.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
