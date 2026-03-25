# Detecting IP KVMs - Security Risks and Detection of Rogue Devices

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-24 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

SANS ISC analysis of IP KVM security risks and detection methods, noting their abuse by threat actors including North Korean operatives who used IP KVMs to remotely access employer-provided laptops located in the US.

## 事實內容

SANS ISC published a diary entry on detecting IP KVMs (Keyboard, Video, Mouse over IP) devices and their security risks. While previously covering how to use IP KVMs securely, the author addresses a distinct threat: rogue IP KVMs deployed by malicious actors.

**Key security concerns:**

1. **North Korean threat actor abuse:** North Korean workers used IP KVMs to remotely connect to laptops sent to them by US employers. The laptops were physically located in the US, and the IP KVMs enabled remote access from overseas, bypassing location-based controls.

2. **Threat actor access vector:** IP KVMs can be installed on office PCs by threat actors who gain physical access, enabling:
   - Undetected "work from home" scenarios
   - Persistent remote access after physical installation

**Detection guidance:** The diary references Eclypsium's research on IP KVM vulnerabilities and provides methods to detect unauthorized IP KVM devices on networks.

## 受影響系統

- Corporate networks with physical access exposure
- Employer-issued laptops and office workstations
- Organizations with remote work policies

## 來源連結

- [Detecting IP KVMs - SANS ISC](https://isc.sans.edu/diary/rss/32824)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：SANS ISC sans-isc
