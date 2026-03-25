# Development of the „Constituency-Portal“ 2.0

| Item | Content |
|------|---------|
| **Date** | 2020-10-22 |
| **Source** | CERT.at (Austria) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |


## Summary
Dieser Blogpost ist auch auf Deutsch verf&uuml;gbar.
Our partner Intevation GmbH develops the next generation of the "Consituency-Portal", our tool...

## Factual Content
Dieser Blogpost ist auch auf Deutsch verf&uuml;gbar.
Our partner Intevation GmbH develops the next generation of the "Consituency-Portal", our tool for administration of contact information.
The new version follows the current version, which is a further developed &bdquo;do-portal&ldquo; (originally developed by CERT-EU). Since 2017 we adapted this software&nbsp;to our needs within the scope of CEF 2016-AT-IA-0089.
Over the years our requirements grew significantly and the software architecture was no longer able to stand up to those, also the code maintenance got harder over time. Therefore, we decided for a new version of the software in spring this year: The software design will be majorly enhanced and will be based on Laravel and PHP. With the new version of the Constituency-Portal, we will be able to better address our daily CERT notifications to network owners with our tool IntelMQ, by a targeted attribution of networks and domains to the organisations. It is planned, that the address data can be self-managed by the Constituency themself. For this purpose the network owners will have the possibility to create user accounts themselves. The authentication will be managed by Keycloak, with which services to be developed in the future by AEC/CERT.at and GovCERT can be integrated as well.
The development of the Software is performed by Intevation GmbH from Osnabr&uuml;ck, Germany, as Free Software until summer 2021 and is financed in large parts by CEF 2018-AT-IA-0111. I

## Source Links
- [Development of the „Constituency-Portal“ 2.0](https://www.cert.at/en/blog/2020/10/development-of-the-constituency-portal-20)

---
> Extraction time: 2026-03-07 UTC
> Data source: CERT.at (Austria) 
