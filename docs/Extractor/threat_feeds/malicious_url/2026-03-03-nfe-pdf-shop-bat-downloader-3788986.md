---
title: "偽裝 Adobe PDF 的 BAT 下載器: nfe-pdf[.]shop (URLhaus #3788986)"
date: 2026-03-03
source: urlhaus-recent
layer: threat_feeds
category: malicious_url
threat_type: malware_download
status: offline
urlhaus_ids:
  - "3788986"
reporter: BlinkzSec
tags: []
extraction_date: 2026-03-04
---

# 偽裝 Adobe PDF 的 BAT 下載器: nfe-pdf[.]shop

## 基本資訊

| 欄位 | 值 |
|------|----|
| 來源 | abuse.ch URLhaus |
| 威脅類型 | malware_download |
| 報告者 | BlinkzSec |
| 首次發現 | 2026-03-03 10:21:08 UTC |
| 最後上線 | N/A |
| 狀態 | offline |

## 惡意 URL

| URLhaus ID | 脫敏 URL | 狀態 | 最後上線 |
|------------|----------|------|----------|
| 3788986 | hxxps://adobe-reader-pdf-visualizer-nota-eletronica[.]nfe-pdf[.]shop/dv/zjp[.]bat | offline | N/A |

## 技術分析

- **偽裝手法**：域名偽裝為 Adobe Reader PDF 工具（`adobe-reader-pdf-visualizer-nota-eletronica`），目標為巴西（`nota-eletronica` 為巴西電子發票術語）
- **載荷類型**：BAT 批次腳本，可能用於初始下載、執行次級載荷或建立持久化
- **社交工程**：針對巴西用戶的 NFe（Nota Fiscal Eletrônica，電子發票）相關誘餌，為已知巴西 banking trojan 常用手法
- **威脅評估**：BAT 腳本+偽裝域名組合常見於 Mekotio、Grandoreiro 等拉丁美洲 banking trojan 分發鏈

## 參考連結

- URLhaus #3788986: hxxps://urlhaus.abuse[.]ch/url/3788986/
