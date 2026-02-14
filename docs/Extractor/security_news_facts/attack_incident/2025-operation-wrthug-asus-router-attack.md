---
title: "全球網路威脅活動「Operation WrtHug」鎖定華碩(ASUS)路由器,呼籲用戶立即更新韌體"
date: 2025-11-25
source: TWCERT/CC
source_url: https://www.twcert.org.tw/tw/cp-104-10522-ff0b9-1.html
feed_id: rss-104
category: attack_incident
confidence: 高
---

## 摘要

資安廠商SecurityScorecard的STRIKE團隊近日發布重要報告,揭露代號為「Operation WrtHug」的大規模網路行動。此行動正鎖定全球華碩(ASUS)相關之路由器,利用已知漏洞將感染設備變成全球網路威脅活動的工具。過去六個月中,已識別出全球超過50,000個IP設備被感染。

## 攻擊目標

**受影響型號:**

| 型號 |
|------|
| ASUS Wireless Router 4G-AC55U |
| ASUS Wireless Router 4G-AC860U |
| ASUS Wireless Router DSL-AC68U |
| ASUS Wireless Router GT-AC5300 |
| ASUS Wireless Router GT-AX11000 |
| ASUS Wireless Router RT-AC1200HP |
| ASUS Wireless Router RT-AC1300GPLUS |
| ASUS Wireless Router RT-AC1300UHP |

## 攻擊手法

**初始入侵:**
- 主要針對華碩設備上的AiCloud服務
- 利用一系列已公開的作業系統指令注入(OS Command Injection)漏洞
- 例如與CVE-2023-39780相關的漏洞

**後續行動:**
- 植入後門程式
- 使設備加入一個龐大的全球感染網路
- 被用作發動進一步的網路威脅活動及間諜行動

**感染規模:**
- 過去六個月中已識別出全球超過50,000個IP設備被感染

## 關鍵緩解措施

由於攻擊者利用的都是已公開且已有修補程式的漏洞,請所有用戶立即採取以下三項關鍵行動:

1. **執行韌體更新**: 務必將您的路由器韌體更新到最新版本。這是修補已知漏洞、防止入侵的最直接方法

2. **檢查並汰換EoL設備**: 如果您使用的是已「終止支援」(End-of-Life, EoL)的舊款ASUS路由器,無法更新韌體,請考慮將這些老舊設備替換為官方仍持續支援的新產品

3. **諮詢官方資源**: 華碩安全團隊已針對Operation WrtHug中涉及的所有漏洞提供了官方緩解步驟(https://www.asus.com/content/asus-product-security-advisory/)。請用戶務必查閱ASUS產品安全建議或相關FAQ,以取得最準確的防護資訊

## 時間軸

- 2025-11-25: TWCERT/CC發布警訊

## 標籤

#OperationWrtHug #ASUS #路由器 #AiCloud #CVE-2023-39780 #韌體更新 #IoT安全
