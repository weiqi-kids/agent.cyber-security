# Dust Specter APT Targets Government Officials in Iraq with Novel Malware

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Zscaler ThreatLabz 揭露疑似伊朗關聯 APT 組織 Dust Specter 於 2026 年 1 月針對伊拉克政府官員的攻擊行動，使用 SPLITDROP、TWINTASK、TWINTALK 和 GHOSTFORM 等新型惡意軟體。

## 事實內容

Zscaler ThreatLabz observed activity in **January 2026** by a suspected Iran-nexus threat actor targeting government officials in Iraq. The group, internally tracked by Zscaler as **Dust Specter**, used previously undocumented malware families.

**Attribution:**
- Threat actor: Dust Specter (Zscaler designation)
- Nexus: Iran (medium-to-high confidence)
- Basis: Significant overlap in TTPs, tooling, and victimology with known Iran-nexus APT groups
- Note: Attribution assessment may be updated as additional high-confidence indicators become available

**Novel malware families disclosed:**
1. **SPLITDROP** — Dropper component (first documented)
2. **TWINTASK** — Backdoor
3. **TWINTALK** — Backdoor (used alongside TWINTASK)
4. **GHOSTFORM** — Remote Access Trojan (RAT)

**Two distinct attack chains:**

**Attack Chain 1:**
- Component: SPLITDROP dropper
- Payloads: TWINTASK and TWINTALK backdoors
- Purpose: Establish persistent access, remote command execution

**Attack Chain 2:**
- Payload: GHOSTFORM RAT
- Purpose: Remote access, surveillance, data exfiltration

**Targeting:** Government officials in Iraq

**Victimology:** Consistent with previously observed Iran-nexus APT activity in the Middle East

## 受影響系統

- Government networks in Iraq
- Windows-based systems (implied by described malware capabilities)
- Government officials' endpoints

## 來源連結

- [Dust Specter APT Targets Government Officials in Iraq](https://www.zscaler.com/blogs/security-research/dust-specter-apt-targets-government-officials-iraq)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
