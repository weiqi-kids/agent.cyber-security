---
title: "XWorm 編碼載荷: pngup[.]com & adraaltinoluk[.]com (URLhaus #3788920, #3788922)"
date: 2026-03-03
source: urlhaus-recent
layer: threat_feeds
category: malicious_url
threat_type: malware_download
status: offline
urlhaus_ids:
  - "3788922"
  - "3788920"
reporter: abuse_ch
tags:
  - xworm
  - ascii
  - Encoded
extraction_date: 2026-03-04
---

# XWorm 編碼載荷

## 基本資訊

| 欄位 | 值 |
|------|----|
| 來源 | abuse.ch URLhaus |
| 威脅類型 | malware_download |
| 惡意軟體 | XWorm RAT |
| 報告者 | abuse_ch |
| 首次發現 | 2026-03-03 07:10:12–07:11:25 UTC |
| 狀態 | offline |

## 惡意 URL

| URLhaus ID | 脫敏 URL | 狀態 | 最後上線 |
|------------|----------|------|----------|
| 3788922 | hxxps://pngup[.]com/XRhs/MSI_PRO_with_b64[.]png | offline | 2026-03-03 08:45:44 UTC |
| 3788920 | hxxps://adraaltinoluk[.]com/arquivo_20260303102246[.]txt | offline | 2026-03-03 07:10:12 UTC |

## 技術分析

- **惡意軟體**：XWorm — 全功能 .NET RAT，提供遠端桌面/鍵盤記錄/憑證竊取/DDoS/勒索功能

- **混淆手法**：
  - #3788922：`MSI_PRO_with_b64.png` — PNG 格式內嵌 Base64 編碼的 XWorm 載荷，利用圖片格式規避過濾
  - #3788920：`arquivo_20260303102246.txt` — ASCII 編碼文字檔（`ascii`+`Encoded`），TXT 格式規避 exe 過濾

- **域名特徵**：
  - `pngup.com`：圖片分享服務，被利用托管偽裝圖片的惡意載荷
  - `adraaltinoluk.com`：疑似土耳其域名，可能遭入侵或為攻擊者控制

- **威脅評估**：XWorm 以低廉價格（$20-200）在地下市場銷售，廣泛用於 BEC 和間諜活動

## 參考連結

- URLhaus #3788922: hxxps://urlhaus.abuse[.]ch/url/3788922/
- URLhaus #3788920: hxxps://urlhaus.abuse[.]ch/url/3788920/
