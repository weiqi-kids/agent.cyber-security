# Tempted to Classifying APT Actors: Practical Challenges of Attribution in the Case of Lazarus's Subgroup

| 項目 | 內容 |
|------|------|
| **日期** | 2025-03-25 |
| **來源** | JPCERT/CC Blog |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC analysis reveals Lazarus now represents a collection of many sub-groups rather than a single entity, creating classification challenges due to overlapping tactics, vendor naming inconsistencies, and shared malware genealogy.

## 事實內容

**Core Attribution Challenge:**
"Lazarus" no longer represents a single group but rather "a collection of many sub-groups." This evolution complicates attribution efforts significantly.

**Subgroup Classification Issues:**

Overlapping Tactics and Infrastructure:
- Multiple Lazarus subgroups share similar initial attack vectors
- Several groups "contact individual engineers on LinkedIn or other SNS to have them download a malicious Python or npm package via PyPI or GitHub"

Vendor Naming Inconsistencies:
- Different security organizations use conflicting terminology
- Example: One group operates under multiple labels: "Unit42 calls the group Gleaming Pisces, and Microsoft refers to it as Citrine Sleet"

**Identified Subgroup Categories:**
- Campaign-level labels: Operation Dreamjob, AppleJeus, Contagious Interview
- Group-level labels: Diamond Sleet, APT38, Bluenoroff, Andariel
- Task force-like structures: Bureau325 (2021-2023), APT43 (identified 2023)

**Practical Reasons for Subgroup-Level Analysis:**

1. Targeted Threat Alerts:
   - Understanding which subgroup targets specific sectors enables precise warnings
   - Cryptocurrency businesses and defense industries face different threat profiles

2. Counter-Operations:
   - Accurate subgroup identification supports long-term tracking
   - Understanding "what kind of activities are intended by the government agencies behind these Lazarus subgroups"

3. Deterrent Communication:
   - Detailed attribution serves as a message to adversaries
   - Demonstrates defender capabilities and potentially renders new tactics obsolete through disclosure

**Technical Evidence of Relationships:**
Malware genealogy across subgroups:
- PoolRAT to PondRAT: Malware variants share "a common A5/1 encryption key" across different subgroups
- Comebacker Variants: Found in both TEMP.Hermit/Diamond Sleet operations and later Moonstone Sleet campaigns
- FudModule: Detected in both Diamond Sleet and Citrine Sleet activities

**Attribution Framework:**
- Hard Attribution: Legal-grade identification of specific individuals and organizations
- Soft Attribution: Virtual grouping of actors and profiling for operational response

Even without definitive hard attribution, soft attribution enables effective defensive measures.

**Contemporary Challenges:**
Task force-like structures (Bureau325, APT43) "free from existing group structures" further complicate traditional subgrouping approaches. These entities share tools across established groups, blurring organizational boundaries.

**Critical Consideration:**
Threat intelligence isn't created solely by disclosing organizations—"victim organizations and analysts involved in on-site response play an extremely important role," requiring balanced consideration of disclosure impacts.

## 受影響系統

- Cryptocurrency businesses
- Defense industries
- Individual engineers on LinkedIn and social networks
- Organizations targeted by social engineering campaigns

## 來源連結

- [Tempted to Classifying APT Actors: Practical Challenges of Attribution in the Case of Lazarus's Subgroup](https://blogs.jpcert.or.jp/en/2025/03/classifying-lazaruss-subgroup.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
