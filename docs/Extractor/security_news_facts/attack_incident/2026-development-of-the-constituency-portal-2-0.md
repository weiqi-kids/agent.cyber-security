# Development of the „Constituency-Portal“ 2.0

| 項目 | 內容 |
|------|------|
| **日期** | 2020-10-22 |
| **來源** | CERT.at (Austria) |
| **分類** | attack_incident |
| **嚴重程度** | low |
| **信心水準** | high |

## 摘要
Dieser Blogpost ist auch auf Deutsch verf&uuml;gbar. Our partner Intevation GmbH develops the next generation of the "Consituency-Portal", our tool for administration of contact information. The new v...

## 事實內容
Dieser Blogpost ist auch auf Deutsch verf&uuml;gbar. Our partner Intevation GmbH develops the next generation of the "Consituency-Portal", our tool for administration of contact information. The new version follows the current version, which is a further developed &bdquo;do-portal&ldquo; (originally developed by CERT-EU). Since 2017 we adapted this software&nbsp;to our needs within the scope of CEF 2016-AT-IA-0089. Over the years our requirements grew significantly and the software architecture was no longer able to stand up to those, also the code maintenance got harder over time. Therefore, we decided for a new version of the software in spring this year: The software design will be majorly enhanced and will be based on Laravel and PHP. With the new version of the Constituency-Portal, we will be able to better address our daily CERT notifications to network owners with our tool IntelMQ, by a targeted attribution of networks and domains to the organisations. It is planned, that the address data can be self-managed by the Constituency themself. For this purpose the network owners will have the possibility to create user accounts themselves. The authentication will be managed by Keycloak, with which services to be developed in the future by AEC/CERT.at and GovCERT can be integrated as well. The development of the Software is performed by Intevation GmbH from Osnabr&uuml;ck, Germany, as Free Software until summer 2021 and is financed in large parts by CEF 2018-AT-IA-0111. Intevation did already substantially advance IntelMQ as part of other projects. The open development mode emphasizes our engagement for Free Software and the international CERT-community. The tool will be available for other CERTs/CSIRTs as well. The code-repository can be found at gitlab. This blog post is part of a series of blog posts related to our CEF Telecom 2018-AT-IA-0111 project, which also supports our participation in the CSIRTs Network.

## 來源連結
- [Development of the „Constituency-Portal“ 2.0](https://www.cert.at/en/blog/2020/10/development-of-the-constituency-portal-20)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：CERT.at (Austria) cert-at
