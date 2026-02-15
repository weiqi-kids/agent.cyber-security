# TSUBAME Report Overflow (Apr-Jun 2025)

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-28 |
| **來源** | JPCERT/CC Blog |
| **分類** | other |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

TSUBAME sensors detected significant Iranian network disruptions during June 2025 Israel-Iran conflict, with consistent global port scanning activity targeting standard services across diverse networks.

## 事實內容

**Iran-Israel Conflict Impact:**
During June 13-25, 2025, military conflict between Israel and Iran caused significant network disruptions. Iranian IP address counts dropped dramatically:
- Typical range: 170-200 daily addresses
- June 13-18: Approximately 100-130 addresses
- June 19-27: Between 20-100 addresses

Israeli traffic showed no comparable changes. Reports indicated cyber attacks targeted Iranian state broadcasters, banks, and cryptocurrency platforms, with the government restricting internet connectivity as a defensive measure.

**Global Traffic Patterns:**
Both domestic and international TSUBAME sensors recorded peak packet activity in April, declining gradually through June. Overseas sensors consistently detected higher traffic volumes than Japanese sensors throughout the monitoring period.

**Port Scanning Observations:**
Analysis across eight global sensor locations identified consistent scanning targets:
- Most frequently observed: 23/TCP, 22/TCP, 80/TCP, 443/TCP, 8080/TCP
- Port 8728/TCP showed significant scanning activity across multiple regions
- Additional targets: 445/TCP (SMB), 3389/TCP (RDP), 81/TCP

This widespread pattern suggests coordinated reconnaissance campaigns targeting standard services across diverse networks globally.

## 受影響系統

- Iranian network infrastructure (state broadcasters, banks, cryptocurrency platforms)
- Global networks across all monitored regions
- Systems exposing ports 23, 22, 80, 443, 8080, 8728, 445, 3389, 81

## 來源連結

- [TSUBAME Report Overflow (Apr-Jun 2025)](https://blogs.jpcert.or.jp/en/2025/10/tsubame_overflow_2025-04-06.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
