# Fake OpenClaw GitHub Installers Distribute GhostSocks and Information Stealers via Stealth Packer

| Item | Content |
|------|---------|
| **Date** | 2026-03-06 |
| **Source** | NCSC-FI Daily News |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |

## Summary

Malicious GitHub repositories posing as OpenClaw installers distributed info stealers using a novel "Stealth Packer" and GhostSocks malware to circumvent anti-fraud detections.

## Factual Content

Huntress researchers investigated malicious GitHub repositories that posed as OpenClaw installers, available between February 2nd and 10th, 2026. Key findings:

- The fake OpenClaw installers had low detection rates.
- They distributed information stealers using a novel packer called "Stealth Packer."
- The installers also delivered GhostSocks malware, which allows threat actors to circumvent anti-fraud detections by routing traffic through the victim's own system.
- Information stealers continue to serve as an initial access vector for severe attacks, with examples including the Snowflake customer database compromise (2024) and a Romanian oil pipeline operator compromise (2026).

## Affected Systems

- GitHub users downloading OpenClaw-related repositories
- Windows systems (info stealer and GhostSocks targets)
- Anti-fraud detection systems (bypassed via GhostSocks traffic routing)

## Source Link

- ["Malware, from the Outside!": How a Threat Actor Used Fake OpenClaw Installers](https://www.huntress.com/blog/openclaw-github-ghostsocks-infostealer)

---
> Extraction time: 2026-03-07 00:00 UTC
> Data source: NCSC-FI Daily News ncsc-fi-news
