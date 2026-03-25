# SmartApeSG Campaign Pushes Remcos RAT, NetSupport RAT, StealC, and Sectop RAT (ArechClient2)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-25 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

SANS ISC reports on the SmartApeSG campaign distributing multiple malware families including Remcos RAT, NetSupport RAT, StealC infostealer, and Sectop RAT (ArechClient2) targeting victims for remote access and credential theft.

## 事實內容

SANS ISC published a diary entry analyzing the SmartApeSG campaign, a threat actor campaign distributing multiple malware families simultaneously. The campaign pushes:

- **Remcos RAT** — Remote access trojan enabling full system control
- **NetSupport RAT** — Legitimate remote support tool abused as a RAT
- **StealC** — Information stealer targeting credentials, browser data, and cryptocurrency wallets
- **Sectop RAT (ArechClient2)** — Remote access trojan with information stealing capabilities

The SmartApeSG campaign is notable for its multi-payload delivery strategy, increasing the chances of successful compromise and enabling various post-exploitation activities including remote access, credential theft, and data exfiltration.

**Notes:** Full technical details available at the SANS ISC diary entry link below. RSS description was minimal; confidence set to medium.

## 受影響系統

- Windows systems (primary targets)
- Browser-stored credentials and cryptocurrency wallets (StealC targets)

## 來源連結

- [SmartApeSG campaign pushes Remcos RAT, NetSupport RAT, StealC, and Sectop RAT (ArechClient2) - SANS ISC](https://isc.sans.edu/diary/rss/32826)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：SANS ISC sans-isc
