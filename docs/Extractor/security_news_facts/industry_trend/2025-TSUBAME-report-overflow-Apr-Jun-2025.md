# TSUBAME Report Overflow (Apr-Jun 2025)

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-28 |
| **來源** | JPCERT/CC Blog |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC's TSUBAME monitoring report for April-June 2025 reveals network traffic disruptions during Iran-Israel conflict and consistent global scanning patterns targeting common services.

## 事實內容

The TSUBAME Report Overflow series covers monitoring trends from overseas TSUBAME sensors for April to June 2025, highlighting several significant observations:

**Iran-Israel Conflict Impact:**
During June 13-25, 2025, military conflict between Israel and Iran coincided with observable changes in Iranian network activity. Iranian IP address counts dropped from typical ranges of 170-200 daily to 100-130 between June 13-18, then fell further to 20-100 from June 19-27. This correlated with reported cyber attacks targeting Iran's state broadcaster, banks, and cryptocurrency exchanges, with the government restricting internet connectivity in response.

**Global Traffic Patterns:**
Overseas sensors captured significantly more packet activity than domestic Japanese sensors. Both regions recorded the highest number of packets in April, with gradual decreases in following months.

**Scanning Activity:**
Analysis of eight geographically distributed TSUBAME sensors identified consistent scanning targets across regions. Nearly all sensors detected traffic on ports 22/TCP, 23/TCP, 80/TCP, 443/TCP, and 8080/TCP, indicating widespread reconnaissance activity targeting SSH, Telnet, HTTP, HTTPS, and alternative web services.

## 受影響系統

- SSH servers (port 22/TCP)
- Telnet services (port 23/TCP)
- HTTP servers (port 80/TCP)
- HTTPS servers (port 443/TCP)
- Alternative web services (port 8080/TCP)

## 來源連結

- [TSUBAME Report Overflow (Apr-Jun 2025)](https://blogs.jpcert.or.jp/en/2025/10/tsubame_overflow_2025-04-06.html)

---
> 萃取時間：2026-02-09 08:05 UTC
> 資料來源：JPCERT/CC Blog jpcert-blog
