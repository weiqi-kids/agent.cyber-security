# Contagious Interview Attack Evolution: Abusing VS Code Tasks for Persistence

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-28 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Attackers evolved "Contagious Interview" campaign to abuse VS Code tasks.json automation, targeting cryptocurrency developers with BeaverTail malware.

## 事實內容

OpenSourceMalware (OSM) and Palo Alto Networks jointly reported a significant evolution in the "Contagious Interview" attack campaign. Attackers now abuse Visual Studio Code's built-in tasks.json automation mechanism instead of relying solely on tricking victims into manually executing malicious files.

**Attack Vector:**
Threat actors target cryptocurrency software engineers and freelancers on platforms like LinkedIn, Upwork, and Fiverr, posing as recruiters or employers offering high-paying positions. They request victims to download and test projects from GitHub/GitLab.

**Technical Exploitation:**
1. Malicious configuration: Attackers plant malicious tasks.json files in .vscode folder
2. Automation abuse: Using "runOn: folderOpen" property to auto-execute tasks when folder opens
3. Trust exploitation: When VS Code prompts "Workspace Trust," clicking "Yes" allows automatic task execution
4. Cross-platform infection: System downloads OS-specific bootstrapper (Windows/macOS/Linux) to establish persistence

**Malware Deployment:**
The attack deploys BeaverTail Type 701 variant (merged with OtterCookie functionality, sometimes called OtterCandy). The highly obfuscated JavaScript malware targets:
- 43+ cryptocurrency-related browser extensions (MetaMask, Phantom, etc.)
- Multiple wallet service providers
- Login credentials, session cookies, LocalStorage
- Browser LevelDB (.ldb) files

**Key Difference from ClickFix:**
Unlike ClickFix requiring manual code pasting, IDE attacks use software's built-in automation to execute malicious commands, making them more stealthy and "legitimate-looking." Security experts consider this a mainstream initial infection vector for next-wave APT attacks.

**Recommended Mitigations:**
1. Avoid trusting unknown code repositories in VS Code
2. Regularly inspect .vscode/tasks.json for abnormal auto-execution settings
3. Separate development environment from daily-use accounts
4. Deploy email gateway scanning and VS Code extension whitelisting
5. Disable unnecessary automatic task execution
6. Cryptocurrency personnel should enhance vigilance with endpoint protection and behavior monitoring

## 受影響系統

- Visual Studio Code (all versions with tasks.json support)
- Windows, macOS, Linux operating systems
- Cryptocurrency wallet browser extensions (43+ types)
- MetaMask, Phantom wallet extensions

## 來源連結

- [「Contagious Interview」攻擊手法再進化：濫用 VS Code Tasks 建立持久化機制](https://www.twcert.org.tw/tw/cp-104-10657-9d247-1.html)

---
> 萃取時間: 2026-02-15 23:22 UTC
> 資料來源: TWCERT/CC rss-104
