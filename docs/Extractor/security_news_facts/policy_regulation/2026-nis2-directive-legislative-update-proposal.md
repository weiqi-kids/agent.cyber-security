# A patch for the NIS2 Directive

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-21 |
| **來源** | CERT.at (Austria) |
| **分類** | policy_regulation |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

EU Commission proposes legislative update to NIS2 Directive, addressing implementation issues and adapting to changing cybersecurity landscape.

## 事實內容

On January 20, 2026, the EU Commission presented a package of legislative proposals including an update to the NIS2 directive. This is characterized as a "maintenance release" to fix issues encountered during implementation across 27 Member States.

**Key Bug Fixes:**
- Establish minimum size requirements for DNS server operators to be considered relevant entities
- Clarify scope to prevent large companies with minor photovoltaic installations from being classified as electricity sector entities

**New Adaptations:**
- Inclusion of Providers of European Digital Identity Wallets
- Special reporting requirements for ransomware cases

**Changes to CSIRTs Network:**
The proposal redefines the CSIRTs network composition to explicitly include ENISA alongside representatives of designated CSIRTs and CERT-EU. A new Article 37a describes ENISA's role in mutual assistance.

This change should be read in conjunction with the proposed update to the Cybersecurity Act, which further defines ENISA's operational role. While ENISA increasingly performs operational work (tracking incidents across Europe, providing alerts and statistics), they traditionally facilitate and coordinate rather than conduct direct incident response.

**Identified Gaps in Proposal:**
- Recital (44) confusion not addressed (originated from European Parliament version but corresponding articles missing from final directive)
- Article 15(3)n references outdated "Security Operations Centres (SOCs)" terminology instead of harmonizing with Cyber Solidarity Act's "national and cross-border cyber hubs"
- Unclear relationship between national cooperation forums (Article 11(4), Article 19) and national cyber hubs from CSoA
- Ongoing definitional issues with "CSIRTs Network" using "representatives of CSIRTs" and "national CSIRT" terminology

CERT.at notes this is a preliminary reaction with potential for more detailed review in the future.

## 受影響系統

- EU Member States implementing NIS2 Directive
- CSIRTs across EU
- ENISA (European Union Agency for Cybersecurity)
- DNS server operators
- Electricity sector entities
- Providers of European Digital Identity Wallets

## 來源連結

- [A patch for the NIS2 Directive](https://www.cert.at/en/blog/2026/1/a-patch-for-the-nis2-directive)

---
> 萃取時間: 2026-01-27 00:00 UTC
> 資料來源: CERT.at (Austria) cert-at
