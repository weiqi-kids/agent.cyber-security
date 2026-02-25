# Contagious Interview Attack Evolution - Abusing VS Code Tasks for Persistence

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-28 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Attackers evolved "Contagious Interview" campaign by abusing VS Code's tasks.json automation to auto-execute malware when developers open project folders in trusted mode.

## 事實內容

Security researchers from OSM (OpenSourceMalware) and Palo Alto Networks issued a joint warning about a significant evolution in the "Contagious Interview" operation. Attackers have shifted from relying on victims manually executing malicious files to abusing Visual Studio Code's built-in tasks.json automation mechanism.

### Attack Vector

**Target Profile**: Software engineers and freelancers in cryptocurrency industry

**Social Engineering Phase**:
- Attackers impersonate recruiters or employers on LinkedIn, Upwork, Fiverr
- Offer high-paying positions or project opportunities to lower-vigilance developers
- After gaining trust, request engineers to download and test a project from GitHub/GitLab

**Technical Infiltration Mechanism**:
1. **Malicious Configuration Embedding**: Plant malicious tasks.json in project's .vscode folder
2. **Abuse Automation Attributes**: Use `runOn: folderOpen` property - tasks auto-execute when VS Code opens the folder
3. **Exploit Trust Psychology**: When VS Code prompts "Workspace Trust," job-seeking victims clicking "Yes" allow automated task execution
4. **Cross-Platform Infection**: Upon task trigger, system downloads OS-specific bootstrapper (Windows/macOS/Linux), establishes persistence, and loads subsequent malicious modules

### Malware Capabilities

**Identified Malware**: BeaverTail latest variant (Type 701) with OtterCookie functionality fusion (some analysis call it OtterCandy)

**Capabilities**:
- Targets 43+ cryptocurrency-related browser extensions (MetaMask, Phantom, etc.)
- Steals credentials from multiple wallet service providers
- Exfiltrates login credentials, session cookies, LocalStorage
- Harvests browser LevelDB (.ldb) sensitive data

**Distinction from ClickFix**: Unlike ClickFix requiring manual code pasting, IDE attacks leverage software built-in automation to execute malicious commands. Experts view its high stealth and "legitimized" operations as the next mainstream initial infection vector for APT attacks.

### Mitigation Measures

1. Avoid casually clicking VS Code "Trust" option when opening unknown code repositories
2. Regularly inspect .vscode/tasks.json for anomalous or auto-execution configurations
3. Separate development environment from daily-use accounts with permission isolation
4. Deploy email gateway scanning and VS Code extension whitelisting; restrict/disable unnecessary task auto-execution
5. Cryptocurrency industry personnel should heighten vigilance and implement endpoint protection with behavioral monitoring

## 受影響系統

- Visual Studio Code (all versions with tasks.json support)
- Developers using GitHub/GitLab for project downloads
- Cryptocurrency industry software engineers

## 來源連結

- [「Contagious Interview」攻擊手法再進化：濫用 VS Code Tasks 建立持久化機制](https://www.twcert.org.tw/tw/cp-104-10657-9d247-1.html)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：TWCERT/CC rss-104
