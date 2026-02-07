# 1,500 Estonians Fall Victim to eesti.ee Social Engineering Fraud

## Metadata
- **Category**: attack_incident
- **Date**: 2025-12-18
- **Source**: CERT-EE (Estonia)
- **Feed ID**: cert-ee
- **Link**: https://ria.ee/uudised/kelmid-kasutanud-eestiee-andmeid-petuskeemides
- **Severity**: 高
- **Confidence**: 中

## Summary
Approximately 1,500 Estonians were manipulated into granting criminals access to their eesti.ee government portal accounts through social engineering, resulting in financial losses ranging from hundreds of thousands to over €1 million per victim.

## Description
The Estonian Police and Border Guard Board and the Estonian Information System Authority (RIA) reported that approximately 1,500 individuals fell victim to a sophisticated social engineering scheme targeting the eesti.ee government portal. This was not a data breach or security vulnerability, but rather a manipulation campaign.

Fraudsters contacted victims by phone, impersonating representatives from banks, health services, utilities, or police. They manipulated targets into revealing their PIN1 codes, establishing false credibility using personal information obtained from compromised eesti.ee accounts, including addresses, school information, and family member names.

With account access, fraudsters either demanded PIN2 codes to access banking systems, created fraudulent Smart-ID accounts on victim devices, or initiated unauthorized loans. Reported financial losses ranged from hundreds of thousands to over €1 million per victim.

Authorities recommend never entering PIN codes during unsolicited calls, avoiding transaction confirmations via Smart-ID or Mobile-ID when contacted by strangers, monitoring Smart-ID device lists for unfamiliar entries, and changing PINs and resetting Smart-ID accounts if compromised.

## Technical Details
- **Attack Vector**: Social engineering via phone calls
- **Impersonated Entities**: Banks, health services, utilities, police
- **Compromised Credentials**: PIN1 codes, Smart-ID accounts
- **Affected Accounts**: ~1,500 eesti.ee portal accounts
- **Financial Impact**: €100,000+ to €1,000,000+ per victim
- **Data Accessed**: Personal addresses, school info, family names

## Notes
- Original language: Estonian (CERT-EE)
- Technical details obtained via WebFetch
- High severity due to significant financial losses and scale
- Not a technical breach but social engineering
