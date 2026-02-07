# What to do when your organization has been compromised by a cyber attack (ITSAP.00.009)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-21 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | industry_trend |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Canadian Cyber Centre releases guidance on immediate actions after cyber attack detection, emphasizing forensic evidence preservation and legal notification requirements.

## 事實內容

The Canadian Centre for Cyber Security published ITSAP.00.009 providing guidance on actions to take in the critical moments after a compromise is detected.

**Immediate Actions Upon Detection:**

**Preserve Forensic Evidence:**
"Do NOT shut down the system" or reboot it - this destroys volatile data stored in RAM. Keep compromised system powered on and locked. Avoid logging out the current user, as disconnecting power eliminates critical forensic information.

**Verify the Incident:**
Contact IT department with the following details:
- Time of suspected compromise
- Affected devices and systems
- Personnel with access to compromised resources
- Last update timestamps
- Types of data potentially exposed
- Number of affected individuals and their contact details
- Organization's designated incident contact and forensic investigation authority

**Containment Measures:**
Isolate compromised systems using:
- Quarantine devices from the network
- Segment into separate virtual networks
- Deactivate network interface cards
- Disconnect Wi-Fi or physical network cables
- Revoke third-party app and service access
- Review and restrict user access privileges

**Notification Requirements (Legal Obligations):**
Private sector organizations must comply with PIPEDA by:
- Reporting breaches involving personal information that pose significant harm to Privacy Commissioner of Canada
- Notifying affected individuals
- Maintaining breach records

**Forensics and Evidence Collection:**
Establish dedicated forensics workstation to prevent contamination. Obtain proper authorization before investigating.

**Evidence Types:**
- **Volatile Evidence (RAM):** Collect while system is powered on; store on external devices
- **Non-Volatile Evidence:** Acquire disk images (bit-by-bit data copies)
- **BitLocker Encryption:** Have recovery keys available when collecting encrypted data

The guidance emphasizes that proper evidence preservation is critical for forensic investigation and potential legal proceedings.

## 受影響系統

- Compromised organizational systems and devices
- Network infrastructure (during containment)
- Systems with BitLocker encryption
- Third-party applications and services (access revocation)
- Personal information databases (PIPEDA compliance)

## 來源連結

- [What to do when your organization has been compromised by a cyber attack (ITSAP.00.009)](https://cyber.gc.ca/en/guidance/what-do-when-your-organization-has-been-compromised-cyber-attack-itsap00009)

---
> 萃取時間: 2026-02-06 00:00 UTC
> 資料來源: Canadian Centre for Cyber Security ca-news
