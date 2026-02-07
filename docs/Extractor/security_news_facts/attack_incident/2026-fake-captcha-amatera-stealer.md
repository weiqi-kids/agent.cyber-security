# Novel Fake CAPTCHA Chain Delivering  Amatera Stealer

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Blackpoint SOC identified fake CAPTCHA campaign using signed SyncAppvPublishingServer.vbs (App-V LOLBIN), Google Calendar C2 config, and PNG steganography for Amatera Stealer.

## 事實內容

Blackpoint Cyber SOC report on novel fake CAPTCHA campaign:

**Attack Chain Characteristics:**

**Initial Execution:**
- Leverages signed Microsoft Application Virtualization (App-V) script
- LOLBIN used: `SyncAppvPublishingServer.vbs`
- Proxies execution through legitimate Windows component
- Avoids PowerShell direct launch
- Controls execution beginning to avoid common detection paths

**Execution Validation:**
- Early stages designed to validate execution order and user behavior
- No vulnerability exploitation
- Progression gated on conditions from initial interaction
- Execution quietly stalls when expectations not met
- Delivery flow itself is core attack component

**Notable Pivots:**

1. **Google Calendar C2 Configuration:**
   - Pulls live configuration from public Google Calendar file
   - Example of living off someone else's infrastructure
   - Keeps delivery logic flexible

2. **PNG Steganography:**
   - Uses PNG-based steganography
   - Encrypted payload hidden inside image
   - Extracted and executed entirely in memory

**Payload:**
- Amatera Stealer (final payload)
- In-memory execution throughout multiple stages

**Attack Sophistication:**
- Multiple in-memory stages
- Avoids file-based detection
- Leverages legitimate Microsoft components
- Uses public infrastructure (Google Calendar)
- Advanced obfuscation (PNG steganography)

## 受影響系統

- Windows systems with App-V components
- Users encountering fake CAPTCHA prompts
- Systems vulnerable to in-memory malware execution

## 來源連結

- [Novel Fake CAPTCHA Chain Delivering  Amatera Stealer](https://blackpointcyber.com/blog/novel-fake-captcha-chain-delivering-amatera-stealer/)

---
> 萃取時間：2026-01-27 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
> 備註：原始來源為 Blackpoint Cyber，透過 NCSC-FI 聚合
