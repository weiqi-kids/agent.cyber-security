---
title: "偽裝 PNG 的惡意投放器: zynova[.]infinityfree[.]me (URLhaus #3788927)"
date: 2026-03-03
source: urlhaus-recent
layer: threat_feeds
category: malicious_url
threat_type: malware_download
status: offline
urlhaus_ids:
  - "3788927"
reporter: JAMESWT_WT
tags: []
extraction_date: 2026-03-04
---

# 偽裝 PNG 的惡意投放器: zynova[.]infinityfree[.]me

## 基本資訊

| 欄位 | 值 |
|------|----|
| 來源 | abuse.ch URLhaus |
| 威脅類型 | malware_download |
| 報告者 | JAMESWT_WT |
| 首次發現 | 2026-03-03 07:14:09 UTC |
| 最後上線 | 2026-03-03 07:14:09 UTC |
| 狀態 | offline |

## 惡意 URL

| URLhaus ID | 脫敏 URL | 狀態 | 最後上線 |
|------------|----------|------|----------|
| 3788927 | hxxps://zynova[.]infinityfree[.]me/img_184335[.]png | offline | 2026-03-03 07:14:09 UTC |

## 技術分析

- **偽裝手法**：以 `.png` 副檔名偽裝為圖片，實為可執行載荷或腳本
- **托管平台**：InfinityFree（免費網頁托管服務），常被攻擊者利用規避封鎖
- **手法**：PNG Polyglot 技術——文件同時符合 PNG 格式和可執行格式，或含嵌入式惡意代碼

## 參考連結

- URLhaus #3788927: hxxps://urlhaus.abuse[.]ch/url/3788927/
