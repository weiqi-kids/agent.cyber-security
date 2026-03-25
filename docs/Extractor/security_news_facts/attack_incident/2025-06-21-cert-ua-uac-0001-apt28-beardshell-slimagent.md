# UAC-0001 (APT28) Attacks Against Ukrainian Government Using BEARDSHELL and SLIMAGENT

| 項目 | 內容 |
|------|------|
| **日期** | 2025-06-21 |
| **來源** | CERT-UA |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要
CERT-UA identified APT28 (UAC-0001, Russia GRU) cyberattack tools during Q1-Q2 2024 incident response on a Ukrainian central executive authority's ICS. Two malware tools were found: BEARDSHELL and SLIMAGENT, indicating a persistent APT28 intrusion into government information infrastructure.

## 事實內容
- **威脅行為者**: UAC-0001 (APT28 / Fancy Bear — Russia GRU)
- **攻擊時間**: Q1–Q2 2024 (reported June 2025)
- **目標**: Ukrainian central executive authority information-communication system (ІКС)
- **發現場景**: During incident response activities on a Windows server acting as file server
- **惡意工具**:
  - BEARDSHELL: Cyber threat implementation tool
  - SLIMAGENT: Second malware tool (companion to BEARDSHELL)
- **攻擊鏈**: Initial compromise of government ICS → Windows server infiltration → deployment of dual malware tools
- **歸因信心**: High — APT28 attribution confirmed by CERT-UA and corroborated by other intelligence sources (see related sednit-reloaded reports)

## 受影響系統
- Ukrainian central government authority information-communication infrastructure
- Windows Server environments in Ukrainian government networks

## 來源連結
- [CERT-UA - UAC-0001 (APT28) BEARDSHELL and COVENANT attacks](https://cert.gov.ua/article/6284080)

---
> 萃取時間：2026-03-13 UTC
> 資料來源：CERT-UA cert-ua
