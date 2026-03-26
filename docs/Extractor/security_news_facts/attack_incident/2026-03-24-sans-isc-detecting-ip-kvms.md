# Detecting IP KVMs — Rogue Devices Used by Criminals for Remote Access

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-24 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

SANS ISC diary covers the emerging threat of rogue IP KVMs used by criminals (including North Korean operatives) for unauthorized remote access to corporate systems, and methods to detect them.

## 事實內容

SANS ISC published a diary on detecting IP KVMs (IP-based Keyboard-Video-Mouse devices) in corporate environments:

Key threat scenario:
- Rogue IP KVMs are used by criminals to gain physical-like remote access to computers
- North Koreans used IP KVMs to connect remotely to laptops sent to them by employers; the laptops were physically located in the US while the North Korean workers connected remotely
- IP KVMs can be used to access office PCs for undetected "work from home" scenarios
- Threat actors can install IP KVMs on-site to maintain persistent physical-level remote access

Context:
- Eclypsium recently published a report on IP KVM vulnerabilities
- SANS previously covered how to use IP KVMs securely; this extends that to detection of rogue use

Attack method: Physical device installation (insider threat or onsite access) + remote control via IP KVM

The diary emphasizes the need for network detection of IP KVM devices as they can bypass traditional software-based security controls.

## 受影響系統

- Corporate networks where IP KVM devices may be installed
- Remote worker laptop environments
- Organizations hiring remote workers (particularly in technology sectors)

## 來源連結

- [Detecting IP KVMs, (Tue, Mar 24th)](https://isc.sans.edu/diary/rss/32824)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：SANS ISC sans-isc
