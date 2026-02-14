---
title: "Google Presentations Abused for Phishing"
date: "2026-01-30"
source: "SANS ISC"
source_url: "https://isc.sans.edu/diary/rss/32668"
category: "attack_incident"
confidence: "high"
keywords: ["Phishing", "Google Presentations", "Vivaldi Webmail", "Social Engineering", "Cloud Service Abuse", "Weebly"]
threat_indicators:
  - type: "technique"
    value: "Google Presentations publishing feature abuse"
  - type: "target"
    value: "Vivaldi Webmail users"
  - type: "infrastructure"
    value: "Weebly hosting platform"
cve_mentioned: []
notes: "Phishing campaign exploiting Google Presentations' published mode to remove security warnings and enhance legitimacy of credential theft attacks."
---

# Google Presentations Abused for Phishing

## Attack Overview

A phishing campaign targeted Vivaldi Webmail users through a deceptive email that directed victims to a malicious Google Presentations slideshow. The attack exploited a legitimate Google feature to bypass security warnings, as reported by SANS ISC on January 30, 2026.

## Technique Details

The attackers leveraged Google's presentation publishing feature to remove footer warnings that typically alert users to phishing content. As the article explains, "Usually, Google Docs displays a footer notice that warns viewers about phishing sites" but this protection disappears when presentations are published and shared via the public link format.

### Attack Flow

1. **Initial Contact**: Users received a convincing email impersonating Vivaldi Webmail
2. **Malicious Redirect**: The email linked to a Google Presentations "published" slideshow
3. **Warning Bypass**: The published format removed security warnings that normally appear in shared documents
4. **Credential Harvesting**: The slide contained a link directing users to a fake login form hosted on Weebly

## Technical Mechanism

### URL Structure
Published presentations use a distinct URL pattern (replacing "edit" with "/pub") that enables the attacker to customize settings like:
- Auto-advance delays
- Preventing automatic looping
- Removing Google's security footer warnings

This customization makes the malicious presentation appear more legitimate and professional.

### Security Feature Bypass
The key vulnerability lies in Google's design decision: published presentations don't display the same phishing warnings that appear in shared documents. This creates a trust gap that attackers exploit.

## Security Implications

This campaign demonstrates several concerning trends:

1. **Legitimate Service Abuse**: Cloud services can be weaponized when attackers understand platform-specific features
2. **Warning Removal**: The removal of built-in phishing warnings significantly increases the likelihood of successful credential theft
3. **Multi-Platform Chain**: Combining Google Presentations with Weebly hosting creates a more credible attack chain
4. **Email Targeting**: Targeting specific webmail services (Vivaldi) suggests potential reconnaissance or targeted campaigns

## Analysis

While the email itself may not be "overly convincing" according to the researcher, the use of Google's trusted infrastructure combined with the removal of security warnings creates a sophisticated social engineering attack. The technique is particularly effective against users who trust Google's platforms and may not scrutinize links as carefully when they lead to google.com domains.

Organizations should be aware that legitimate cloud services can be exploited in ways that bypass traditional security controls, requiring enhanced user awareness training and potentially URL filtering rules that detect suspicious presentation sharing patterns.
