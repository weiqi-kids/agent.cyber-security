# UAT-9244: China-Nexus APT Targets South American Telecom Providers with Three New Malware Implants

| Item | Content |
|------|---------|
| **Date** | 2026-03-06 |
| **Source** | NCSC-FI Daily News |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |

## Summary

Cisco Talos discloses UAT-9244, a China-nexus APT linked to Famous Sparrow, targeting South American telecom infrastructure with TernDoor, PeerTime, and BruteEntry malware since 2024.

## Factual Content

Cisco Talos disclosed UAT-9244, assessed with high confidence to be a China-nexus advanced persistent threat (APT) actor closely associated with Famous Sparrow. Key findings:

- Active since 2024, targeting critical telecommunications infrastructure in South America.
- Attacks target both Windows and Linux-based endpoints and edge devices.
- Three malware implants are used:
  1. **TernDoor** — A new variation of the previously disclosed, Windows-based CrowDoor malware.
  2. **PeerTime** — An ELF-based backdoor that uses the BitTorrent protocol for malicious operations.
  3. **BruteEntry** — A brute force scanner typically installed on network edge devices, converting them into mass-scanning proxy nodes (Operational Relay Boxes/ORBs) that attempt to brute force SSH, Postgres, and Tomcat servers.

## Affected Systems

- South American telecommunications infrastructure
- Windows endpoints
- Linux endpoints and edge devices
- SSH, Postgres, and Tomcat servers (brute force targets)

## Source Link

- [UAT-9244 targets South American telecommunication providers with three new malware implants](https://blog.talosintelligence.com/uat-9244/)

---
> Extraction time: 2026-03-07 00:00 UTC
> Data source: NCSC-FI Daily News ncsc-fi-news
