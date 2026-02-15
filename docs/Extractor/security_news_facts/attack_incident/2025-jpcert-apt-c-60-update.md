# Update on Attacks by Threat Group APT-C-60

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-05 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

APT-C-60 continues targeting Japan and East Asia with updated SpyGlace malware (versions 3.1.12-3.1.14) via malicious VHDX files, impersonating job seekers to target recruitment staff.

## 事實內容

**Attack Timeline:**
Confirmed attacks occurred between June-August 2025. SpyGlace versions uploaded to GitHub:
- June 27, 2025: Version 3.1.12
- July 3, 2025: Version 3.1.13
- July 16, 2025: Version 3.1.14

**Targets:**
Japan and East Asian regions, specifically recruitment staff via spear-phishing campaigns impersonating job seekers.

**Attack Methods:**
- Malicious VHDX files attached directly to emails (evolution from previous Google Drive distribution)
- Embedded LNK files trigger legitimate Git executables to run malicious scripts
- Command chain: `P:\\LICENSES.LOG\\mingw64\\bin\\gcmd.exe 'cd .\\LICENSES.LOG\\mingw64\\bin && type glog.txt | gcmd.exe' && exit`
- COM hijacking for persistence via registry manipulation

**Malware Tools:**
- Downloader1: Identifies compromised machines using volume serial numbers and computer names; communicates with statcounter for reconnaissance; retrieves payloads from GitHub
- Downloader2: Downloads and executes SpyGlace variants and loaders
- SpyGlace: Reconnaissance malware with 15+ commands including process management, screenshot capture, and module loading

**SpyGlace Updates:**
Versions 3.1.12-3.1.14 show modifications where "prockill" and "proclist" commands now perform no action, with new "uld" command for module unloading.

**Encoding & Communication:**
- Customized RC4 with triple-iteration KSA cycles and modified XOR operations
- C2 communication uses BASE64 encoding with userid identifier "GOLDBAR"

**Infrastructure Changes:**
Shift from Bitbucket to GitHub repositories for payload distribution:
- carolab989
- football2025
- fenchiuwu
- goldbars33

## 受影響系統

- Windows systems
- Organizations with recruitment departments in Japan and East Asia

## 來源連結

- [Update on Attacks by Threat Group APT-C-60](https://blogs.jpcert.or.jp/en/2025/11/APT-C-60_update.html)

---
> 萃取時間: 2026-02-15 23:30 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
