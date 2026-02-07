# CERT.hr Spamblok Service Shutdown Announcement

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-10 |
| **來源** | CERT.hr (Croatia) |
| **分類** | other |
| **嚴重程度** | 未評估 |
| **信心水準** | 中 |

## 摘要

CERT.hr announced end-of-year shutdown of Spamblok DNSBL service, advising administrators to update configurations.

## 事實內容

CERT.hr notified users about the end-of-year shutdown of its CERT Spamblok service. System administrators who implemented this service on email servers via the spamassassin-cn plugin were instructed to comment out or remove configuration entries referencing spamblok.cert.hr. CERT Spamblok was a DNSBL (DNS-based Blackhole List) system for spam filtering.

## 受影響系統

- Email servers using CERT Spamblok DNSBL
- Spamassassin-cn plugin configurations

## 來源連結

- [Gašenje usluge CERT Spamblok](https://www.cert.hr/gasenje-usluge-cert-spamblok/?utm_source=rss&utm_medium=rss&utm_campaign=gasenje-usluge-cert-spamblok)

---
> 萃取時間: 2026-01-27 UTC
> 資料來源: CERT.hr (Croatia) cert-hr
> Original language: Croatian (CERT.hr)
