# "Contagious Interview" Attack Method Evolves: Abusing VS Code Tasks for Persistence

| Item | Content |
|------|------|
| **Date** | 2026-01-28 |
| **Source** | TWCERT/CC |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence Level** | High |

## Summary

Security research teams OSM and Palo Alto Networks disclosed that the "Contagious Interview" campaign has evolved to abuse Visual Studio Code's tasks.json automation mechanism, targeting cryptocurrency industry developers with BeaverTail malware (Type 701).

## Factual Content

Security research teams OpenSourceMalware (OSM) and Palo Alto Networks recently issued a joint warning that the "Contagious Interview" campaign launched by hacker organizations has undergone significant technical evolution. Attackers no longer rely solely on tricking victims into manually executing malicious files but have shifted to abusing Visual Studio Code's built-in tasks.json automation mechanism. When developers open malicious project folders in trusted mode, malicious commands are automatically triggered in the background without manual compilation or execution, significantly increasing attack stealth.

This wave of attacks primarily targets software engineers and freelancers in the cryptocurrency industry. Attackers first pose as recruiters or employers on LinkedIn, Upwork, or Fiverr and other job and outsourcing platforms. They proactively contact developers with lower vigilance using high-paying job positions or new projects as bait.

After gaining trust, attackers request engineers to download a project from GitHub or GitLab for testing. When the engineer opens the project folder using VS Code, the core penetration technique involves:

- Embedding malicious configuration: Attackers plant a malicious tasks.json file in the project's .vscode folder
- Abusing automation attributes: The configuration file uses the "runOn: folderOpen" attribute, meaning malicious tasks are automatically executed when VS Code opens the folder
- Exploiting "trust" psychology: When VS Code displays a "Workspace Trust" prompt asking if the author is trusted, if job-seeking victims click "Yes," the system will directly allow automated tasks
- Cross-platform infection: After task triggering, the system automatically downloads corresponding bootstrappers based on the victim's OS (Windows, macOS, or Linux), establishing persistence and loading subsequent malicious modules

This attack exploits developer trust in tools like Visual Studio Code, enticing victims to download seemingly normal projects and click "trust author." Unlike ClickFix which requires guiding users to manually paste code, IDE attacks execute malicious commands through software's built-in automation tasks. Its high stealth and "legitimized" operations are viewed by experts as the mainstream initial infection vector for next-generation targeted attacks (APT).

The malicious program planted through this mechanism has been identified as **BeaverTail latest variant (Type 701)**, showing functional convergence trends with **OtterCookie** (some analysts call it **OtterCandy**). Once malicious tasks start, the system downloads corresponding bootstrappers based on the victim's OS, ultimately executing highly obfuscated JavaScript malware BeaverTail (Type 701).

This version of BeaverTail has significantly enhanced capabilities, primarily aimed at stealing information. It can target at least 43+ cryptocurrency-related browser extensions (e.g., MetaMask, Phantom) and multiple wallet service providers for data theft, while also stealing login credentials, Session Cookies, LocalStorage, and highly sensitive data such as browser LevelDB (.ldb).

## Affected Systems

- Visual Studio Code users (all platforms: Windows, macOS, Linux)
- Cryptocurrency industry developers and engineers
- Targeted browser extensions: MetaMask, Phantom, and 40+ other crypto wallets

## Source Links

- [「Contagious Interview」攻擊手法再進化:濫用 VS Code Tasks 建立持久化機制](https://www.twcert.org.tw/tw/cp-104-10657-9d247-1.html)

---
> Extraction time: 2026-02-06 UTC
> Data source: TWCERT/CC rss-104
> Note: Original language: Traditional Chinese (TWCERT/CC)
