---
title: "CountLoader HTA 下載器: explorer[.]vg (URLhaus #3788912)"
date: 2026-03-03
source: urlhaus-recent
layer: threat_feeds
category: malicious_url
threat_type: malware_download
status: offline
urlhaus_ids:
  - "3788912"
reporter: abuse_ch
tags:
  - ascii
  - CountLoader
  - hta
  - ua-mshta
extraction_date: 2026-03-04
---

# CountLoader HTA 下載器: explorer[.]vg

## 基本資訊

| 欄位 | 值 |
|------|----|
| 來源 | abuse.ch URLhaus |
| 威脅類型 | malware_download |
| 惡意軟體 | CountLoader（HTA 版） |
| 報告者 | abuse_ch |
| 首次發現 | 2026-03-03 07:01:09 UTC |
| 最後上線 | N/A |
| 狀態 | offline |

## 惡意 URL

| URLhaus ID | 脫敏 URL | 狀態 | 最後上線 |
|------------|----------|------|----------|
| 3788912 | hxxps://explorer[.]vg/ | offline | N/A |

## 技術分析

- **惡意軟體**：CountLoader — 計數型下載器，可追蹤感染數量（常用於 Pay-Per-Install 平台）
- **執行機制**：
  - `ua-mshta`：透過 mshta.exe（Microsoft HTML Application Host）執行 HTA 腳本
  - `hta`：HTML Application，可執行 VBScript/JScript，規避應用白名單
  - `ascii`+`Encoded`：載荷以 ASCII 編碼混淆
- **域名特徵**：`explorer.vg`（.vg 為英屬維爾京群島域名），短期惡意基礎設施
- **威脅評估**：CountLoader 常見於 PPI（Pay-Per-Install）惡意軟體生態，為後續多種惡意載荷的入口

## 參考連結

- URLhaus #3788912: hxxps://urlhaus.abuse[.]ch/url/3788912/
