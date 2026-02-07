# PeckBirdy: A Versatile Script Framework for LOLBins Exploitation Used by China-aligned Threat Groups

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Since 2023, China-aligned APT groups use PeckBirdy, a JScript-based C&C framework exploiting LOLBins, targeting Asian governments and Chinese gambling industries.

## 事實內容

Trend Micro report on PeckBirdy framework (originally presented at HitCon Aug 2025):

**Framework Characteristics:**
- Script-based C&C framework active since 2023
- Implemented using JScript (old script language)
- Designed for LOLBins (Living off the land binaries) exploitation
- Enables execution across different environments

**Targets:**
- Chinese gambling industries
- Asian government entities
- Private organizations in Asia

**Attribution:**
- Linked to China-aligned APT actors
- At least two campaigns identified using PeckBirdy

**Framework Capabilities:**

**Flexible Deployment Across Kill Chain:**
1. **Initial Attack Phase:** Watering-hole control server
2. **Lateral Movement Phase:** Reverse shell server
3. **Backdoor Phase:** C&C server

**Technical Characteristics:**
- Advanced capabilities despite using old script language
- LOLBins exploitation ensures cross-environment compatibility
- Versatile usage throughout multiple attack stages

**Timeline:**
- Active since 2023
- Publicly discussed at HitCon conference August 2025
- Trend Micro detailed analysis published January 2026

## 受影響系統

- Windows systems (JScript/LOLBins execution)
- Asian government infrastructure
- Chinese gambling industry systems

## 來源連結

- [PeckBirdy: A Versatile Script Framework for LOLBins Exploitation Used by China-aligned Threat Groups](https://www.trendmicro.com/en_us/research/26/a/peckbirdy-script-framework.html)

---
> 萃取時間：2026-01-27 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
> 備註：原始來源為 Trend Micro 研究報告，透過 NCSC-FI 聚合
