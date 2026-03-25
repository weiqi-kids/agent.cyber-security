# GSocket Backdoor Delivered Through Bash Script

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-20 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

SANS ISC discovered a malicious Bash script that installs a GSocket backdoor on victim computers; delivery mechanism and initial infection vector are unknown but the malicious script was directly analyzed.

## 事實內容

A SANS ISC handler discovered a malicious Bash script that installs a GSocket backdoor on the victim's computer. GSocket (Global Socket) is a legitimate network tool that allows two hosts behind NAT/firewall to communicate; it is being abused here as a persistent backdoor.

**Key details:**
- **Malware:** GSocket backdoor installed via malicious Bash script
- **Delivery method:** Unknown — the source of the script and how it reaches victims has not been determined
- **Analysis:** The malicious Bash script was directly analyzed by SANS ISC

**Attack significance:** GSocket-based backdoors are stealthy because GSocket uses legitimate infrastructure and is designed to bypass firewalls and NAT, making detection and blocking more difficult than traditional backdoor tools.

## 受影響系統

- Linux/Unix systems (GSocket is a Linux tool)
- Systems reachable by Bash scripts

## 來源連結

- [GSocket Backdoor Delivered Through Bash Script - SANS ISC](https://isc.sans.edu/diary/rss/32816)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：SANS ISC sans-isc
