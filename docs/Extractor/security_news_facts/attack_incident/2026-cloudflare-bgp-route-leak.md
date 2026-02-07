# Cloudflare misconfiguration behind recent BGP route leak

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

Cloudflare Jan 22 BGP route leak (25 minutes) caused by router misconfiguration in Miami affected IPv6 traffic with 12 Gbps dropped and measurable congestion.

## 事實內容

BleepingComputer report on Cloudflare BGP incident:

**Incident Details:**

**Date:** January 22, 2026
**Duration:** 25 minutes
**Cause:** Accidental policy misconfiguration on a router

**Impact:**
- Affected IPv6 traffic
- Measurable congestion and packet loss
- Approximately 12 Gbps of dropped traffic
- Affected external networks beyond Cloudflare customers

**Technical Details:**

**BGP System:**
- Border Gateway Protocol routes data across different autonomous systems (AS)
- Sends data through smaller networks to destination

**Route Leak Type:**
Quote: "During the incident on January 22, we caused a similar kind of route leak, in which we took routes from some of our peers and redistributed them in Miami to some of our peers and providers."

**Classification:**
- According to RFC7908 definitions
- Mixture of Type 3 and Type 4 route leaks on the Internet

**Location:** Miami routing infrastructure

## 受影響系統

- IPv6 traffic routing
- Cloudflare peers and providers
- External networks beyond Cloudflare customers

## 來源連結

- [Cloudflare misconfiguration behind recent BGP route leak](https://www.bleepingcomputer.com/news/security/cloudflare-misconfiguration-behind-recent-bgp-route-leak/)

---
> 萃取時間：2026-01-27 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
> 備註:原始來源為 BleepingComputer，透過 NCSC-FI 聚合
