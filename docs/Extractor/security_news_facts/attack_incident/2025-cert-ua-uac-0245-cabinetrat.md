# UAC-0245 Uses CABINETRAT Backdoor for Targeted Attacks Against Ukrainian Defense Forces

| 項目 | 內容 |
|------|------|
| **日期** | 2025-09-30 |
| **來源** | CERT-UA (Ukraine) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要

UAC-0245 deployed CABINETRAT backdoor against Ukrainian Defense Forces using XLL files disguised as legitimate documents distributed via Signal messaging app.

## 事實內容

In September 2025, CERT-UA discovered a series of malicious XLL files (Excel add-ins) with specific names such as "Звернення УБД.xll" and "recept_ruslana_nekitenko.xll". These files are portable executables (PE) that can be loaded by Excel's Add-in manager using the exported function "xlAutoOpen".

**Attack Details:**
- **Threat Actor:** UAC-0245
- **Malware Used:** CABINETRAT backdoor
- **File Format:** XLL (Excel add-in, PE executable)
- **Distribution Method:** Signal messaging app
- **Example Payloads:**
  - "Звернення УБД.xll" (Appeal from UBD)
  - "recept_ruslana_nekitenko.xll" (Recipe)
  - "500.zip" (disguised as document about border crossing detention)
- **Target:** Ukrainian Defense Forces personnel
- **Attack Method:** Social engineering via messaging app with malicious attachments

**Timeline:**
- September 2025: Attack campaign active
- September 30, 2025: CERT-UA public disclosure

**Technical Details:**
- XLL files use xlAutoOpen function for automatic execution
- Files distributed via Signal in ZIP archives
- Social engineering themes include military administrative topics and personal documents

## 受影響系統

- Microsoft Excel (XLL add-in functionality)
- Ukrainian Defense Forces systems
- Signal messaging app users

## 來源連結

- [CERT-UA Advisory #17479](https://cert.gov.ua/article/6285549)

---
> 萃取時間：2026-02-11 19:10 UTC
> 資料來源：CERT-UA (Ukraine) cert-ua
> Original language: Ukrainian (uk)
