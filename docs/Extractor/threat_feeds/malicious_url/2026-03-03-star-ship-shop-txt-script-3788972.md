---
title: "惡意腳本文字檔: star-ship-shop[.]site (URLhaus #3788972)"
date: 2026-03-03
source: urlhaus-recent
layer: threat_feeds
category: malicious_url
threat_type: malware_download
status: offline
urlhaus_ids:
  - "3788972"
reporter: juroots
tags: []
extraction_date: 2026-03-04
---

# 惡意腳本文字檔: star-ship-shop[.]site

## 基本資訊

| 欄位 | 值 |
|------|----|
| 來源 | abuse.ch URLhaus |
| 威脅類型 | malware_download |
| 報告者 | juroots |
| 首次發現 | 2026-03-03 10:16:08 UTC |
| 最後上線 | N/A |
| 狀態 | offline |

## 惡意 URL

| URLhaus ID | 脫敏 URL | 狀態 | 最後上線 |
|------------|----------|------|----------|
| 3788972 | hxxps://star-ship-shop[.]site/script%20gokil[.]txt | offline | N/A |

## 技術分析

- **載荷類型**：TXT 格式惡意腳本（`script gokil.txt`）
- **語言特徵**：`gokil` 為印尼語俚語（「瘋狂/強大」），可能指向印尼語系惡意軟體社群
- **手法**：以 `.txt` 副檔名偽裝無害文字檔，內容可能為 PowerShell/VBScript 等腳本代碼
- **域名特徵**：`star-ship-shop.site` 為低信任度短期域名

## 參考連結

- URLhaus #3788972: hxxps://urlhaus.abuse[.]ch/url/3788972/
