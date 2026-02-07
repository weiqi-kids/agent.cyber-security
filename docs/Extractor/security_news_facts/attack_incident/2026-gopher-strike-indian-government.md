# APT Attacks Target Indian Government Using GOGITTER, GITSHELLPAD, and GOSHELL | Part 1

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

Zscaler identified Sept 2025 campaigns "Gopher Strike" and "Sheet Attack" targeting Indian government via Pakistan-linked APT using GOGITTER, GITSHELLPAD, GOSHELL, and Cobalt Strike.

## 事實內容

Zscaler ThreatLabz report on APT campaigns targeting Indian government (Sept 2025):

**Campaign Names:**
1. Gopher Strike
2. Sheet Attack

**Attribution:**
- Threat actor operates in Pakistan
- Primary targets: Indian government entities
- Medium confidence: possible new APT36 subgroup or parallel Pakistan-linked group

**Gopher Strike Campaign Tools:**

1. **GOGITTER:**
   - Initial downloader (previously undocumented)

2. **GITSHELLPAD:**
   - Backdoor for C2 communication (previously undocumented)

3. **GOSHELL:**
   - Golang shellcode loader
   - Deploys Cobalt Strike Beacon

**TTPs:**
- Previously undocumented techniques identified
- Shares similarities with APT36 (Pakistan-linked APT group)

**Publication Format:**
- Part 1: Gopher Strike campaign (current publication)
- Part 2 (forthcoming): Sheet Attack campaign, including attack chain, backdoors, and generative AI use in malware development

**Timeline:**
- Campaigns identified: September 2025
- Zscaler publication: January 2026

## 受影響系統

- Indian government infrastructure
- Systems targeted by Cobalt Strike Beacon
- Networks vulnerable to GITSHELLPAD backdoor

## 來源連結

- [APT Attacks Target Indian Government Using GOGITTER, GITSHELLPAD, and GOSHELL | Part 1](https://www.zscaler.com/blogs/security-research/apt-attacks-target-indian-government-using-gogitter-gitshellpad-and-goshell)

---
> 萃取時間：2026-01-27 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
> 備註：原始來源為 Zscaler ThreatLabz，透過 NCSC-FI 聚合
