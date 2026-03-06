---
title: "IPFS 分散式托管 PureLogs Stealer (URLhaus #3788921, #3788923)"
date: 2026-03-03
source: urlhaus-recent
layer: threat_feeds
category: malicious_url
threat_type: malware_download
status: mixed
urlhaus_ids:
  - "3788923"
  - "3788921"
reporter: abuse_ch
tags:
  - PureLogsStealer
  - ascii
  - Encoded
  - rev-base64-loader
extraction_date: 2026-03-04
---

# IPFS 分散式托管 PureLogs Stealer

## 基本資訊

| 欄位 | 值 |
|------|----|
| 來源 | abuse.ch URLhaus |
| 威脅類型 | malware_download |
| 惡意軟體 | PureLogs Stealer（編碼版） |
| 報告者 | abuse_ch |
| 首次發現 | 2026-03-03 07:11:08–07:12:08 UTC |
| 狀態 | online/offline（混合） |

## 惡意 URL

| URLhaus ID | 脫敏 URL | 狀態 | 最後上線 |
|------------|----------|------|----------|
| 3788923 | hxxps://gateway[.]lighthouse[.]storage/ipfs/bafkreie6p54rcmqgnunlyhyxuekt7sskt63wruvz5gsioyxom5g2u7j7yq | online | 2026-03-03 20:47:38 UTC |
| 3788921 | hxxps://gateway[.]lighthouse[.]storage/ipfs/bafybeigq6iohqop4lt5ynsuok4pflhoirsrtwxljecye4nzzgtl4dshyx4 | offline | 2026-03-03 14:52:31 UTC |

## 技術分析

- **分發平台**：Lighthouse.storage（去中心化 IPFS 文件存儲）
  - IPFS 內容不可被傳統方式下架，具高可用性和抗審查特性
  - 攻擊者利用 IPFS 確保惡意載荷持久可存取

- **惡意軟體**：PureLogs Stealer
  - 商業資訊竊取器（售價約 $99/月）
  - 竊取：瀏覽器密碼/Cookie、加密貨幣錢包、VPN 憑證、Discord Token

- **載荷混淆**：
  - #3788923：`ascii` + `Encoded` + `rev-base64-loader` — 逆向 Base64 編碼的 ASCII 載荷，需解碼後執行
  - #3788921：`PureLogsStealer` 直接標記

- **威脅評估**：利用 IPFS 分發惡意軟體為新興趨勢，傳統 URL 封鎖機制無效；#3788923 截至報告時仍在線

## 參考連結

- URLhaus #3788923: hxxps://urlhaus.abuse[.]ch/url/3788923/
- URLhaus #3788921: hxxps://urlhaus.abuse[.]ch/url/3788921/
