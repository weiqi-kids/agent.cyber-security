# Update on Attacks by Threat Group APT-C-60

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-05 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

APT-C-60 targets Japan/East Asia HR staff via spear-phishing with malicious VHDX files, deploying SpyGlace RAT (v3.1.12-3.1.14) using GitHub for C2.

## 事實內容

JPCERT/CC reports updates on APT-C-60 threat group activities:

**Attack Methods:**
- Spear-phishing emails impersonating job applicants
- Malicious VHDX files containing LNK files
- Scripts executed via Git (legitimate tool) to evade detection

**Primary Targets:**
- Japan and East Asian regions
- Human resources personnel
- Fabricated resumes used as bait

**Malware Arsenal:**

1. **Downloader1:**
   - Communicates with statcounter for system identification
   - Uses volume serial numbers and computer names
   - Retrieves commands from GitHub-hosted text files

2. **SpyGlace RAT:**
   - Versions: 3.1.12 (June 27, 2025), 3.1.13 (July 3), 3.1.14 (July 16)
   - Modified RC4 encryption and AES-128-CBC for file downloads
   - Dynamic API resolution using ADD and XOR encoding

**TTPs:**
- GitHub repositories for C2 infrastructure
- COM hijacking for persistence
- XOR-based encoding with specific keys for payload obfuscation
- Decoy documents mimicking legitimate academic CVs

**Timeline:**
- June-July 2025: Progressive deployment of SpyGlace versions

## 受影響系統

- HR departments (Japan and East Asia)
- Windows systems (VHDX file execution)
- Organizations processing job applications

## 來源連結

- [Update on Attacks by Threat Group APT-C-60](https://blogs.jpcert.or.jp/en/2025/11/APT-C-60_update.html)

---
> 萃取時間：2026-01-27 UTC
> 資料來源：JPCERT/CC Blog jpcert-blog
