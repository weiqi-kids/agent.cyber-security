# IntelMQ bug fix release 2.3.1

| 項目 | 內容 |
|------|------|
| **日期** | 2021-03-26 |
| **來源** | CERT.at (Austria) |
| **分類** | policy_regulation |
| **嚴重程度** | 低 |
| **信心水準** | 高 |

## 摘要

This release does not add any major features to IntelMQ but is considered purely a maintenance release. It addresses some minor errors and contains usability enhancements for the new API. Some notable...

## 事實內容

This release does not add any major features to IntelMQ but is considered purely a maintenance release. It addresses some minor errors and contains usability enhancements for the new API. Some notable changes are listed below. Below we present a short summary of the changes. We thank all contributors who participated in this release! As usual, the installation and upgrade instructions can be found on intelmq.readthedocs.io and the full changelogs can be seen on GitHub: IntelMQ 2.3.1 , IntelMQ API 2.3.1 & IntelMQ Manager 2.3.1 . The Cymru CAP Parser has been adapted to accommodate for the new format for events of the category "bruteforce" (by Sebastian Wagner, CERT.at). The Shodan Parser now supports nested conversions, improved protocol detection and has a greatly extended parser mapping (by Mikk Margus Möll, CERT.EE). A missing description for the Shodan Country Stream has been added to the feed documentation (by Sebastian Wagner, CERT.at). The sections on intelmq-cb-mailgen and fody in the ecosystem document received revised (by Bernhard Reiter, Intevation) and a new summary of hardware requirements has been added (by Sebastian Wagner, CERT.at). IntelMQ API-related changes The IntelMQ API documentation now has more details on the required write permission for the session database file (by Birger Schacht, CERT.at). The API backend now gives a more verbose error message for session database permission errors including a hint for resolution (by Birger Schacht, CERT.at). The intelmqsetup tool, which is part of the installation routine for manual IntelMQ installations, is now able to automatically create the required directory layout and file permissions for the IntelMQ API (by Sebastian Wagner, CERT.at) and also covers the webserver and sudoers configuration for IntelMQ API and IntelMQ Manager (by Sebastian Wagner, CERT.at). IntelMQ Manager-related changes The required authentication token in save-data requests of the "Configuration" tab is now sent to the backend (by Marcos Gonzalez, CNCSRD-DO). In the following two locations, link destinations that still pointed to the old PHP-based backend URLs have been fixed: "Clear Configuration" link destination on the configuration page and the link to the bots configuration on the monitor page (by Sebastian Wagner, CERT.at). This blog post is part of a series of blog posts related to our CEF Telecom 2018-AT-IA-0111 project, which also supports our participation in the CSIRTs Network.

## 受影響系統

- N/A (需進一步分析)

## 來源連結

- [IntelMQ bug fix release 2.3.1](https://www.cert.at/en/blog/2021/3/intelmq-bug-fix-release-231)

---
> 萃取時間：2026-02-17 08:10 UTC
> 資料來源：CERT.at (Austria) (cert-at)

