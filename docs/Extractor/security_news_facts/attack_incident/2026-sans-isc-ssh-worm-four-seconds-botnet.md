# Four Seconds to Botnet - SSH Worm with Cryptographically Signed C2

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-12 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Self-propagating SSH worm compromises Raspberry Pi devices in four seconds using credential brute-forcing, automated lateral movement via Zmap/sshpass, and IRC-based C2 with RSA signature verification.

## 事實內容

A guest researcher from the SANS.edu BACS program analyzed a self-propagating SSH worm that achieved complete system compromise in approximately four seconds. The attack timeline demonstrates extreme automation efficiency:

**Infection Timeline:**
- 08:24:13 – Initial connection
- 08:24:14 – Credential brute-force success (pi/raspberryraspberry993311)
- 08:24:15 – Malware upload via SCP (4.7 KB bash script)
- 08:24:16 – Execution and persistence establishment
- 08:24:17 – C2 check-in and scanning initiation

**Attack Method:**
The worm employs credential brute-forcing against SSH services using default/weak passwords. Once authenticated, it uploads a 4.7 KB bash script that establishes persistence through cron jobs and kills competing malware processes. The malware uses Zmap and sshpass for automated lateral movement, scanning 100,000 random IP addresses for open SSH ports and attempting two credential sets:
- pi / raspberry
- pi / raspberryraspberry993311

**C2 Infrastructure:**
Uses IRC-based command and control across six networks on channel #biret, with an embedded RSA key used to verify digitally signed commands from operators, ensuring only legitimate operator commands are executed.

## 受影響系統

- Raspberry Pi devices with default credentials enabled
- Systems with SSH services exposed to internet
- Devices without SSH key authentication configured

## 來源連結

- [Four Seconds to Botnet - Analyzing a Self Propagating SSH Worm with Cryptographically Signed C2 [Guest Diary]](https://isc.sans.edu/diary/rss/32708)

---
> 萃取時間：2026-02-15 15:49 UTC
> 資料來源：SANS ISC sans-isc
