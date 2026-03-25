# IntelMQ bug fix release 2.3.1

| Item | Content |
|------|---------|
| **Date** | 2021-03-26 |
| **Source** | CERT.at (Austria) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |


## Summary
This release does not add any major features to IntelMQ but is considered purely a maintenance release. It addresses some minor errors and contains...

## Factual Content
This release does not add any major features to IntelMQ but is considered purely a maintenance release. It addresses some minor errors and contains usability enhancements for the new API. Some notable changes are listed below. Below we present a short summary of the changes. We thank all contributors who participated in this release!
As usual, the installation and upgrade instructions can be found on intelmq.readthedocs.io and the full changelogs can be seen on GitHub: IntelMQ 2.3.1, IntelMQ API 2.3.1 &amp; IntelMQ Manager 2.3.1.
The Cymru CAP Parser has been adapted to&nbsp;accommodate for the new format for events of the category "bruteforce" (by Sebastian Wagner, CERT.at). The Shodan Parser now supports nested conversions, improved protocol detection and has a greatly extended parser mapping (by Mikk Margus M&ouml;ll, CERT.EE). A missing description for the Shodan Country Stream has been added to the feed documentation (by Sebastian Wagner, CERT.at).
The sections on intelmq-cb-mailgen and fody in the ecosystem document received revised (by Bernhard Reiter, Intevation) and a new summary of hardware requirements has been added (by Sebastian Wagner, CERT.at).
IntelMQ API-related changes
The IntelMQ API documentation now has more details on the required write permission for the session database file (by Birger Schacht, CERT.at). The API backend now gives a more verbose error message for session database permission errors including a hint for resolution (by Birger Schacht,

## Source Links
- [IntelMQ bug fix release 2.3.1](https://www.cert.at/en/blog/2021/3/intelmq-bug-fix-release-231)

---
> Extraction time: 2026-03-07 UTC
> Data source: CERT.at (Austria) 
