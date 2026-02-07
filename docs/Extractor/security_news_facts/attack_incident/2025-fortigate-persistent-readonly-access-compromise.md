# Multiple FortiGate devices compromised with a persistent read-only access

| 項目 | 內容 |
|------|------|
| **日期** | 2025-04-16 |
| **來源** | CERT.at (Austria) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Threat actors exploited FortiGate SSL VPN vulnerabilities to deploy persistent read-only access via symbolic links, affecting several thousand devices worldwide.

## 事實內容

Threat actors exploited three known SSL VPN vulnerabilities (CVE-2022-42475, CVE-2023-27997, CVE-2024-21762) to gain initial access to FortiGate devices, then deployed symbolic links in folders used to serve language files for persistent read-only access.

**Attack Mechanism:**
The symbolic link enabled unauthenticated file system access, including device configurations. This persistence mechanism survived reboots and allowed ongoing data exfiltration without authentication.

**Scale of Compromise:**
Several thousand devices were compromised worldwide, with up to 840 affected Austrian devices identified at peak. CERT.at monitored and alerted affected organizations since February 2025.

**Timeline:**
Attacks possibly began in 2023, with the persistence mechanism deployed after initial exploitation of SSL VPN vulnerabilities.

**Affected Versions:**
FortiOS versions vulnerable to CVE-2022-42475, CVE-2023-27997, and CVE-2024-21762.

**Patches and Mitigation:**
Fortinet released patches (FortiOS 7.6.2, 7.4.7, 7.2.11, 7.0.17, 6.4.16) that automatically remove malicious artifacts during upgrade. Additional mitigation steps:
- Deploy IPS signatures detecting the symbolic link exploitation
- Consider migrating from SSL VPN to IPSec or dial-up VPN alternatives
- Update firmware immediately to remove persistence mechanisms

**Note:** Original analysis by Kamil Mankowski (CERT.at), published by Alexander Riepl.

## 受影響系統

- Fortinet FortiGate devices with SSL VPN enabled
- FortiOS versions vulnerable to CVE-2022-42475, CVE-2023-27997, CVE-2024-21762
- Several thousand devices worldwide (840+ in Austria)

## 來源連結

- [Multiple FortiGate devices compromised with a persistent read-only access](https://www.cert.at/en/blog/2025/4/multiple-fortigate-devices-compromised-with-a-persistent-read-only-access)

---
> 萃取時間: 2026-01-27 00:00 UTC
> 資料來源: CERT.at (Austria) cert-at
