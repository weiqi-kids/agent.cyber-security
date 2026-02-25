# Updated UAC-0099 Toolset: MATCHBOIL, MATCHWOK, DRAGSTARE

| Item | Content |
|------|---------|
| **Date** | 2025-08-04 |
| **Source** | CERT-UA (Ukraine) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |

## Summary
Ukrainian CERT reports UAC-0099 using updated malware toolset including MATCHBOIL, MATCHWOK, and DRAGSTARE in targeted attacks against government agencies, Defense Forces, and defense-industrial complex, distributing HTA files via UKR.NET email with court summons themes.

## Factual Content
**Incident Details:**
- **Threat Actor:** UAC-0099
- **Target Sectors:**
  - Government agencies
  - Defense Forces
  - Defense-industrial complex enterprises
- **Malware Toolset:**
  - MATCHBOIL
  - MATCHWOK
  - DRAGSTARE

**Attack Vector:**
**Stage 1 - Email Distribution:**
- **Platform:** UKR.NET email service
- **Theme:** Court summons (судова повістка)
- **Content:** Links to legitimate file hosting services
- **Obfuscation:** URL shortener services used

**Stage 2 - File Delivery:**
- Double-nested ZIP archives
- Contains HTA (HTML Application) files

**Malware Delivery Chain:**
```
Phishing Email (court summons theme)
    ↓
UKR.NET sender address
    ↓
Shortened URL to legitimate file host
    ↓
Double ZIP archive
    ↓
HTA file (malicious payload)
    ↓
MATCHBOIL/MATCHWOK/DRAGSTARE deployment
```

**Social Engineering:**
- **Theme:** Court summons (highly effective in Ukrainian legal context)
- **Platform Trust:** Use of popular UKR.NET email service
- **Legitimacy:** Hosting on legitimate file services
- **Obfuscation:** URL shorteners hide true destination

**Target Profile:**
High-value targets across three critical sectors:
1. Government decision-makers
2. Military personnel and defense operations
3. Defense industry manufacturing and R&D

**Malware Evolution:**
Investigation reveals UAC-0099 has updated their toolset with new variants, indicating:
- Continuous development of capabilities
- Adaptation to detection methods
- Sustained targeting of Ukrainian critical sectors

**Impact:**
- Espionage against government and military
- Defense industry intellectual property theft
- Operational intelligence gathering
- Persistent access to critical infrastructure

**Attribution Context:**
UAC-0099 represents a tracked threat group demonstrating:
- Sophisticated social engineering
- Custom malware development
- Focus on strategic Ukrainian sectors
- Sustained multi-sector campaign

**Notes:** Original content in Ukrainian language (uk); translated to English for analysis; court summons theme particularly effective in Ukrainian context due to ongoing legal processes; defense-industrial complex targeting indicates interest in military capability intelligence; HTA files enable JavaScript/VBScript execution

## Source Links
- [Оновлений інструментарій UAC-0099: MATCHBOIL, MATCHWOK, DRAGSTARE](https://cert.gov.ua/article/6284949)

---
> Extraction time: 2026-02-24 UTC
> Data source: CERT-UA (Ukraine) cert-ua
