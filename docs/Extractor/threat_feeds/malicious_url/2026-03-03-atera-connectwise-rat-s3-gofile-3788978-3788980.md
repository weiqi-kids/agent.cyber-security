---
title: "AteraAgent / ConnectWise RAT 分發 (URLhaus #3788978, #3788980)"
date: 2026-03-03
source: urlhaus-recent
layer: threat_feeds
category: malicious_url
threat_type: malware_download
status: offline
urlhaus_ids:
  - "3788980"
  - "3788978"
reporter: juroots
tags:
  - AteraAgent
  - connectwise
extraction_date: 2026-03-04
---

# AteraAgent / ConnectWise RAT 分發

## 基本資訊

| 欄位 | 值 |
|------|----|
| 來源 | abuse.ch URLhaus |
| 威脅類型 | malware_download |
| 惡意軟體 | AteraAgent、ConnectWise（合法 RMM 工具濫用） |
| 報告者 | juroots |
| 首次發現 | 2026-03-03 10:16:11–10:16:16 UTC |
| 狀態 | offline |

## 惡意 URL

| URLhaus ID | 脫敏 URL | 狀態 | 最後上線 |
|------------|----------|------|----------|
| 3788980 | hxxps://agreement4565[.]s3[.]us-east-2[.]amazonaws[.]com/agreement03022026[.]msi | offline | 2026-03-03 14:26:37 UTC |
| 3788978 | hxxps://store3[.]gofile[.]io/download/direct/fa73b75c-8406-4049-8783-07a8d17d27cc/Mr3!26[.]msi | offline | 2026-03-03 10:16:12 UTC |

## 技術分析

- **惡意軟體類型**：
  - **AteraAgent**（#3788980）：合法遠端管理工具（RMM）被惡意部署為 RAT，透過 AWS S3 分發（`agreement03022026.msi` — 偽裝合約文件）
  - **ConnectWise**（#3788978）：另一合法 RMM 工具，透過 GoFile 分發（`Mr3!26.msi`）
- **分發平台**：
  - AWS S3（`agreement4565.s3.us-east-2.amazonaws.com`）— 利用合法雲端服務繞過過濾
  - GoFile（`store3.gofile.io`）— 匿名檔案分享服務
- **攻擊手法**：BYOT（Bring Your Own Tool）— 使用合法 RMM 工具進行未授權遠端存取，規避 EDR 偵測
- **威脅評估**：此類攻擊手法被 BEC/勒索軟體組織廣泛使用，合法工具難以被安全工具阻擋

## 參考連結

- URLhaus #3788980: hxxps://urlhaus.abuse[.]ch/url/3788980/
- URLhaus #3788978: hxxps://urlhaus.abuse[.]ch/url/3788978/
