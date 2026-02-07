# Shutdown of CERT Spamblok service

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-10 |
| **來源** | CERT.hr (Croatia) |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 中 |

## 摘要
CERT.hr announced end-of-year shutdown of CERT Spamblok service, advising system administrators to remove or comment out spamblok.cert.hr references in spamassassin-cn plugin configurations.

## 事實內容
CERT.hr notified users that it is shutting down the CERT Spamblok service at the end of the year. All system administrators who have implemented this service through the spamassassin-cn plugin on their email servers are requested to comment out or remove entries referencing spamblok.cert.hr in their plugin configurations. CERT Spamblok was a DNSBL (DNS-based Blackhole List) system provided by Croatia's national CERT. The advance notice allows administrators time to update their email security configurations before service termination.

## 受影響系統
- Email servers using spamassassin-cn plugin with CERT Spamblok
- System administrators needing to update configurations

## 來源連結
- [Gašenje usluge CERT Spamblok](https://www.cert.hr/gasenje-usluge-cert-spamblok/)

---
> 萃取時間: 2026-01-28 UTC
> 資料來源: CERT.hr (Croatia) cert-hr
>
> **Notes:** Original language: Croatian (CERT.hr). Translation provided for international accessibility.
