---
title: "Tuency - Constituency Portal for CERTs"
source: "CERT.at (Austria)"
feed_id: "cert-at"
link: "https://www.cert.at/en/blog/2021/9/tuency-constituency-portal-for-iocs-and-certs"
pub_date: "Thu, 02 Sep 2021 10:37:18 GMT+0100"
category: "industry_trend"
confidence: "高"
tags: ["AI", "CERT", "Csirt", "Docker", "Intelmq", "LDAP", "SSO"]
---

## 摘要

The new Constituency Portal "Tuency" was designed by CERT.at and the development has been delegated to the software development company Intevation .

## 詳細內容

The new Constituency Portal "Tuency" was designed by CERT.at and the development has been delegated to the software development company Intevation . Tuency's web portal allows you to manage your constituency members who then can manage their relevant data themselves. This is important, for example, if IP subnets or email addresses change. Highlights In order to be future-proof and use production-ready software, Tuency ships with field-tested components. Name Description Laravel Used as PHP Framework Composer Used as PHP package manager Vue.JS Used for a single-page-application (SPA) frontend, yarn as package manager KeyCloak As authentication service Docker (optional) For containerized usage in your deployment PostgreSQL Used as database Customer-Relationship-Management (CRM) In Tuency, an organization administrator can create suborganizations, which in turn can also have their own administrator. In each organization, multiple users can be created, who can then manage the associated organization. Organizations are subject to a tree-like hierarchy. Tagging Individual tags can be set for each user, user group or organisation to represent users or organisations' memberships or attributes. The export functions can filter by these tags. Self-Management An organization administrator can claim network objects, for example Domains, Sub-Domains, IP address blocks, single IP addresses or RIPE Organisation handles. The claimed network objects are displayed in a tree-like structure to show the fine granularity of the claimed blocks. For network objects rules for security incident notifications can be configured and the network object can be associated with an abuse-contact. API Tuency itself offers a rich API to query the correct abuse-contact for a given network object (ASN, IP-Address, Domain) and supports hierarchical inheritance and notification rules! IntelMQ is able to communicate with the API through an expert ( IntelMQ "bot"). Keycloak Keycloak is used as identity and access management provider. It's open source and is widely used as a single sign-on solution. It uses standard protocols like OAuth 2.0, OpenID Connect and SAML 2.0 and also integrates with existing LDAP or Active Directory services. The Tuency source code and documentation can be found in Tuency's source-code repository . This blog post is part of a series of blog posts related to our CEF Telecom 2018-AT-IA-0111 and 2020-AT-IA-0254 and projects, which also support our participation in the CSIRTs Network.

## 來源資訊

- **來源**: CERT.at (Austria)
- **連結**: https://www.cert.at/en/blog/2021/9/tuency-constituency-portal-for-iocs-and-certs
- **發布時間**: Thu, 02 Sep 2021 10:37:18 GMT+0100
