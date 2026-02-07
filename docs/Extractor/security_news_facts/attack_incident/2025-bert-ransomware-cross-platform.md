# 從Windows到Linux勒索軟體BERT的演化與擴散

| 項目 | 內容 |
|------|------|
| **日期** | 2025-07-23 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要
BERT (Water Pombero) ransomware discovered April 2025 with cross-platform capabilities targeting Windows and Linux, focusing on Asia and Europe.

## 事實內容
BERT (also called Water Pombero by Trend Micro) discovered in April 2025 is a ransomware with cross-platform capabilities primarily targeting Windows and Linux environments. Attack activities mainly concentrated in Asia and Europe regions, victims primarily in healthcare, technology companies, and incident management services sectors. BERT initially targeted Windows platform launching attacks through PowerShell Loader (like start.ps1) obtaining initial access, then elevating system privileges and disabling Windows Defender, firewall, and UAC, downloading and executing ransomware from remote IP addresses, then encrypting files adding ".encryptedbybert" extension while leaving decryption notice. Recently BERT ransomware further improved launching new variants targeting Linux systems. This version shows over 80% code similarity with known ransomware Revil (Sodinokibi), indicating close technical source and evolution lineage. BERT technical features include simultaneously launching 50 CPU threads to enhance encryption efficiency, reducing detection or interruption risks. Additionally forcibly shuts down target virtual machine operations ensuring encryption process integrity. After completing encryption all files appended with extension ".encrypted_by_bert". BERT ransomware program internally contains JSON configuration file including public key (pk), Base64 encoded ransom note and detailed data, a common classic characteristic of modern ransomware.

## 受影響系統
- Windows systems (multiple versions)
- Linux systems
- Healthcare, technology, incident management sectors

## 來源連結
- [從Windows到Linux勒索軟體BERT的演化與擴散](https://www.twcert.org.tw/tw/cp-104-10281-cc0a3-1.html)

---
> 萃取時間：2026-01-27 10:00 UTC
> 資料來源：TWCERT/CC rss-104
> Original language: Chinese (TWCERT/CC)
