# Abusing .arpa: Threat Actors Exploit the TLD That Isn't Supposed to Host Anything

| Item | Content |
|------|---------|
| **Date** | 2026-03-06 |
| **Source** | NCSC-FI Daily News |
| **Category** | attack_incident |
| **Severity** | Medium |
| **Confidence** | High |

## Summary

Threat actors abuse the .arpa TLD by acquiring IPv6 address space and creating A records under reverse DNS names via Hurricane Electric and Cloudflare to leverage their reputations.

## Factual Content

Infoblox researchers discovered that threat actors are abusing the .arpa top-level domain, which is not intended to host content. The attack method involves:

1. Acquiring IPv6 address space, gaining delegated control of the corresponding .arpa subdomain.
2. Instead of adding expected PTR records, creating A records for the reverse DNS names.
3. Leveraging the good reputations of DNS providers such as Hurricane Electric and Cloudflare.

Researchers confirmed that some other DNS providers also allow these configurations, though testing was not exhaustive. Affected providers were notified of the gap.

## Affected Systems

- DNS infrastructure
- IPv6 reverse DNS (.arpa) zones
- Hurricane Electric DNS services
- Cloudflare DNS services

## Source Link

- [Abusing .arpa: The TLD That Isn't Supposed to Host Anything](https://www.infoblox.com/blog/threat-intelligence/abusing-arpa-the-tld-that-isnt-supposed-to-host-anything/)

---
> Extraction time: 2026-03-07 00:00 UTC
> Data source: NCSC-FI Daily News ncsc-fi-news
