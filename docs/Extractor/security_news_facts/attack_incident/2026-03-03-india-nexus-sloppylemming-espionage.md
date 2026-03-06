# India-Nexus SloppyLemming Espionage Campaign Targeted Pakistan, Bangladesh, Sri Lanka

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Arctic Wolf 研究人員揭露印度關聯威脅行為者 SloppyLemming 對巴基斯坦、孟加拉和斯里蘭卡政府機構及關鍵基礎設施進行的一年期間諜活動，使用 BurrowShell 後門和鍵盤記錄惡意軟體。

## 事實內容

Arctic Wolf cybersecurity researchers disclosed a year-long espionage campaign attributed to an **India-nexus threat actor** tracked as **SloppyLemming**. The campaign targeted government agencies and critical infrastructure operators in Pakistan, Bangladesh, and Sri Lanka from approximately January 2025 through early 2026.

**Attribution:**
- Threat actor: SloppyLemming (Arctic Wolf designation)
- Nexus: India (assessed with confidence by Arctic Wolf)
- Prior activity: Cloudflare previously identified related activity in September 2024
- This campaign represents an expansion of previously identified threat activity

**Attack methods — two distinct chains:**

1. **BurrowShell backdoor delivery:**
   - Vector: Malicious PDF documents
   - Payload: BurrowShell backdoor
   - Capabilities: Screenshot capture, file system manipulation

2. **Excel-based malware delivery:**
   - Vector: Malicious Excel documents
   - Payload: Malware with keylogger and reconnaissance capabilities
   - Purpose: Credential harvesting, network mapping

**Targets:**
- Government agencies in Pakistan, Bangladesh, and Sri Lanka
- Critical infrastructure operators in the same countries

**Timeline:** Campaign ran for approximately one year beginning January 2025

## 受影響系統

- Government agency networks in Pakistan, Bangladesh, Sri Lanka
- Critical infrastructure systems in South/Southeast Asia
- Windows systems (implied by PDF/Excel-based attack vectors)

## 來源連結

- [Alleged India-linked espionage campaign targeted Pakistan, Bangladesh, Sri Lanka](https://therecord.media/india-pakistan-cyber-campaign-apt)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
