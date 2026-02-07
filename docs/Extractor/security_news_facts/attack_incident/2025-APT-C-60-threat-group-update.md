# Update on Attacks by Threat Group APT-C-60

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-05 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

APT-C-60 continues targeted spear-phishing campaigns against recruitment staff in Japan and East Asia, using malicious VHDX files and evolving malware including SpyGlace versions 3.1.12-3.1.14.

## 事實內容

JPCERT/CC provided an update on ongoing attacks by APT-C-60 threat group, covering activities from June to August 2025. This follows previous reporting on the group's activities.

**Attack Methods:**
APT-C-60 conducts targeted spear-phishing campaigns impersonating job seekers to recruitment staff. The attack chain has evolved:

1. **Initial Delivery**: Malicious VHDX (Virtual Hard Disk) files now attached directly to emails, representing an evolution from previous Google Drive distribution methods
2. **Execution**: LNK files trigger legitimate Git executable (gcmd.exe) to run malicious scripts
3. **Persistence**: COM hijacking via registry key: `HKCU\Software\Classes\CLSID\{566296fe-e0e8-475f-ba9c-a31ad31620b1}\InProcServer32`

**Targets:**
- Primary focus: Japan and East Asian regions
- Specific targeting: Recruitment officers
- Attack timeframe: June-August 2025

**Malware Tools:**

*Downloader1*: Identifies compromised devices using "volume serial number + computer name" combinations. Communicates via statcounter legitimate statistics service for command and control.

*SpyGlace*: Three versions identified (3.1.12, 3.1.13, 3.1.14) with following capabilities:
- Modified RC4 encryption with increased KSA cycles
- AES-128-CBC file decryption capability
- Commands: remote shell, screenshot capture, process management, module loading

**Technical Details:**
- Encoding: XOR-based encryption with keys like "sgznqhtgnghvmzxponum"
- C2 Communication: BASE64 and RC4 with userid value "GOLDBAR"
- Infrastructure: Shifted from Bitbucket to GitHub for payload distribution

**Indicators of Compromise:**
Multiple GitHub repositories, IP addresses (185.181.230.71), file hashes, registry CLASSIDs, and at least 12 compromised device identifiers documented.

## 受影響系統

- Windows systems (COM hijacking via registry)
- Organizations with recruitment functions in Japan and East Asia

## 來源連結

- [Update on Attacks by Threat Group APT-C-60](https://blogs.jpcert.or.jp/en/2025/11/APT-C-60_update.html)

---
> 萃取時間: 2026-02-06 00:00 UTC
> 資料來源: JPCERT/CC Blog jpcert-blog
