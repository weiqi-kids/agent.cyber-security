# IntelMQ 3.0 - Configuration, Domain based workflow, IEPs

| Item | Content |
|------|---------|
| **Date** | 2021-08-02 |
| **Source** | CERT.at (Austria) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |


## Summary
We are happy to announce the completion of the IntelMQ 3.0 milestone. The addition of 2 developers to the IntelMQ development team in October 2020...

## Factual Content
We are happy to announce the completion of the IntelMQ 3.0 milestone. The addition of 2 developers to the IntelMQ development team in October 2020 allowed us to work on major IntelMQ 3.0 changes - new features as well as architectural changes. The most important new features are:

Domain-based workflow (Capability to use domain-based data)
Simplified configuration management
Easier bot development via "Mixins"

The development was based on a thorough collection of user requirements by former CERT.at employee Aaron Kaplan. This requirements collection included personal interviews in the CERT-community, workshops at CERT-conferences as well as architectural reviews. Our previous IntelMQ release, IntelMQ 2.3.0, was an intermediate step, and brought, for example, Docker-support, the IntelMQ-API and the revised documentation page.
Domain based workflow
The introduction of various new IntelMQ bots (also know as "Experts") removed IntelMQ's previous limitation to IP address-based data. Versions prior to IntelMQ 3.0 supported almost no domain-based workflows, most operations and look-ups could only be performed with IP addresses. For example, if the domain "example.com" was used as a command and control server, IntelMQ had to resolve example.com to an IP address and add that to the event. Any further processing was based on this IP address. To overcome this limitations, we added some new components in IntelMQ 3.0 that address the different requirements for processing domain-b

## Source Links
- [IntelMQ 3.0 - Configuration, Domain based workflow, IEPs](https://www.cert.at/en/blog/2021/8/intelmq-30-domain-based-workflow-ieps)

---
> Extraction time: 2026-03-07 UTC
> Data source: CERT.at (Austria) 
