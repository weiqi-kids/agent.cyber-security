# Analysis: Self-Propagating SSH Worm with Cryptographic C2

| Item | Content |
|------|---------|
| **Date** | 2026-02-12 |
| **Source** | SANS Internet Storm Center |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |

## Summary

SANS ISC publishes guest analysis of a self-propagating SSH worm achieving botnet recruitment in four seconds, featuring cryptographically signed command-and-control communications.

## Factual Content

SANS Internet Storm Center published a guest analysis by Johnathan Husch (ISC intern, SANS.edu BACS program) examining a sophisticated SSH worm with rapid propagation capabilities.

**Key Characteristics:**
- **Propagation Speed:** Four seconds to botnet recruitment
- **Attack Vector:** SSH brute-force/credential stuffing
- **C2 Security:** Cryptographically signed command-and-control communications
- **Worm Type:** Self-propagating malware

**Technical Significance:**
- Extremely rapid propagation timeline ("Four Seconds to Botnet")
- Use of cryptographic signatures for C2 integrity and authentication
- Demonstrates evolution of SSH-based worm techniques
- Potential for large-scale botnet formation

The analysis provides insights into modern worm propagation techniques and the increasing sophistication of self-replicating malware.

## Affected Systems

- SSH servers
- Linux/Unix systems with SSH exposure
- Cloud infrastructure with SSH access

## Source Links

- [Four Seconds to Botnet - Analyzing a Self Propagating SSH Worm with Cryptographically Signed C2](https://isc.sans.edu/diary/rss/32708)

---
> Extraction time: 2026-02-18 08:00 UTC
> Data source: SANS Internet Storm Center sans-isc