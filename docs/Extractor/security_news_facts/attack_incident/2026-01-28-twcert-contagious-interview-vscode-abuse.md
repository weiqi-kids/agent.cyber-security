# Contagious Interview Attack Evolution: Abusing VS Code Tasks for Persistence

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-28 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Threat actors evolve "Contagious Interview" campaign to abuse VS Code tasks.json for automatic malware execution targeting cryptocurrency developers.

## 事實內容

Security research teams OSM (OpenSourceMalware) and Palo Alto Networks have jointly disclosed a significant technical evolution in the "Contagious Interview" attack campaign. Attackers have shifted from relying on victims manually executing malicious files to abusing Visual Studio Code's built-in tasks.json automation mechanism.

**Attack Flow:**

**Initial Contact:**
- Target: Software engineers and freelancers in cryptocurrency industry
- Platforms: LinkedIn, Upwork, Fiverr
- Social Engineering: High-salary job offers or new project opportunities

**Technical Infiltration:**
1. **Malicious Configuration**: Attackers plant malicious tasks.json in project's .vscode folder
2. **Automation Abuse**: Configuration uses `runOn: folderOpen` property for automatic execution when folder opens
3. **Trust Exploitation**: VS Code "Workspace Trust" prompt - clicking "Yes" allows automatic task execution
4. **Cross-platform Infection**: System automatically downloads OS-specific bootstrapper (Windows/macOS/Linux)

**Malware Deployment - BeaverTail Type 701:**

The campaign delivers BeaverTail (Type 701) variant, showing functional convergence with OtterCookie (also called OtterCandy by some analysts).

**Capabilities:**
- Targets 43+ cryptocurrency-related browser extensions (MetaMask, Phantom, etc.)
- Steals wallet credentials from multiple service providers
- Extracts login credentials, session cookies, LocalStorage
- Harvests browser LevelDB (.ldb) sensitive data

**Stealth Characteristics:**
Unlike ClickFix attacks requiring manual code pasting, IDE-based attacks use legitimate software automation features, making them highly covert and "legitimized" operations. Security experts view this as the next mainstream initial infection vector for targeted APT attacks.

**Mitigation Recommendations:**
1. Avoid clicking "Trust" for unknown code repositories in VS Code
2. Regularly inspect .vscode/tasks.json for anomalous or auto-execution configurations
3. Implement privilege separation between development and daily-use accounts
4. Deploy email gateway scanning and VS Code extension whitelisting
5. Disable or restrict unnecessary automatic task execution
6. Cryptocurrency industry personnel should maintain heightened vigilance with endpoint protection and behavior monitoring

## 受影響系統

- Visual Studio Code users
- Cryptocurrency industry developers and freelancers
- All operating systems (Windows, macOS, Linux)

## 來源連結

- [「Contagious Interview」攻擊手法再進化：濫用 VS Code Tasks 建立持久化機制](https://www.twcert.org.tw/tw/cp-104-10657-9d247-1.html)

---
> 萃取時間: 2026-02-20 UTC
> 資料來源: TWCERT/CC rss-104
> Original language: Traditional Chinese (zh-TW)
