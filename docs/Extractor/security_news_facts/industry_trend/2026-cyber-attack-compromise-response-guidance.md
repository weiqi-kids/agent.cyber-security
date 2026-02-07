# What to do when your organization has been compromised by a cyber attack (ITSAP.00.009)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-21 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

Canadian Cyber Centre publishes guidance on responding to cyber attack compromise, emphasizing evidence preservation and structured incident response.

## 事實內容

The Canadian Centre for Cyber Security released updated guidance (ITSAP.00.009) on organizational response to cyber attack compromise.

**Immediate Actions:**

**Evidence Preservation:**
Keep compromised systems powered on to preserve volatile evidence stored in RAM. Lock the system but avoid shutting down, rebooting, or logging out, as these actions destroy forensic data critical for investigation and attribution.

**Verification:**
Contact IT security team to confirm the compromise and gather critical information:
- When the compromise was detected
- Affected devices and systems
- Access details and entry vectors
- System update history
- Types of data stolen or accessed
- Affected individuals or departments

**IT Response Framework:**

**Containment:**
- Isolate compromised devices using quarantine tools
- Implement network segmentation with separate VLANs
- Disconnect affected systems from network if necessary
- Prevent lateral movement while preserving forensic state

**Stakeholder Notification:**
- Inform relevant internal parties (executives, legal, HR)
- Notify affected service providers and partners
- Consult legal counsel before external communications
- Prepare public disclosure if required

**Evidence Collection:**
- Use dedicated forensics workstation (never compromised systems)
- Acquire volatile data (RAM) before non-volatile evidence
- Create disk images for analysis
- Secure BitLocker recovery keys if applicable
- Maintain chain of custody documentation

**Legal Compliance:**

Private sector organizations in Canada must:
- Report breaches to Canada's Privacy Commissioner
- Notify affected individuals per PIPEDA (Personal Information Protection and Electronic Documents Act) requirements
- Document incident timeline and response actions
- Preserve evidence for potential legal proceedings

**Implication:**
The guidance emphasizes structured response over reactive actions that could destroy evidence or escalate damage.

## 受影響系統

- Organizations subject to Canadian privacy law (PIPEDA)
- Incident response teams
- IT security infrastructure
- Forensics and evidence collection systems

## 來源連結

- [What to do when your organization has been compromised by a cyber attack (ITSAP.00.009)](https://cyber.gc.ca/en/guidance/what-do-when-your-organization-has-been-compromised-cyber-attack-itsap00009)

---
> 萃取時間: 2026-01-27 00:00 UTC
> 資料來源: Canadian Centre for Cyber Security ca-news
