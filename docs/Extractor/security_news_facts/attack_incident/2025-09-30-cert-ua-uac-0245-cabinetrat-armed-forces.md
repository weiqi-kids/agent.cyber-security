# UAC-0245 Using CABINETRAT Backdoor in Targeted Attacks Against Ukrainian Armed Forces (CERT-UA#17479)

| 項目 | 內容 |
|------|------|
| **日期** | 2025-09-30 |
| **來源** | CERT-UA |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要
CERT-UA reports that in spring 2025, UAC-0245 deployed malicious XLL files (Excel Add-in format) to compromise Ukrainian Armed Forces systems, delivering the CABINETRAT backdoor to establish persistent access.

## 事實內容
- **追蹤編號**: CERT-UA#17479
- **威脅行為者**: UAC-0245
- **攻擊時間**: Spring 2025
- **目標**: Ukrainian Armed Forces (СОУ)
- **攻擊手法**:
  - Malicious XLL files (Excel Add-in executables) with specific names including "Звернення УБД.xll" and "recept_ruslana_nekitenko.xll"
  - XLL files are PE (Portable Executable) format that can load as Excel Add-ins using exported "xlAutoOpen" function
  - Later, information was received about attempts to distribute via Signal messaging app as "500.zip" file disguised as a document about detention of persons attempting to cross the Ukrainian state border
- **惡意程式**: CABINETRAT (backdoor for persistent access)
- **技術細節**: XLL files compiled with PyInstaller from Python source code; CABINETRAT classified as malicious tool

## 受影響系統
- Ukrainian Armed Forces personnel computers
- Systems where Microsoft Excel is installed
- Devices using Signal messaging application

## 來源連結
- [CERT-UA - CABINETRAT used by UAC-0245 (CERT-UA#17479)](https://cert.gov.ua/article/6285549)

---
> 萃取時間：2026-03-13 UTC
> 資料來源：CERT-UA cert-ua
