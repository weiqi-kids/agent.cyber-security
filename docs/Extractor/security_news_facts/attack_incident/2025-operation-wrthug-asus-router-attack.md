# 全球網路威脅活動「Operation WrtHug」鎖定華碩 (ASUS) 路由器

| 項目 | 內容 |
|------|------|
| 事件日期 | 2025-11-25 |
| 來源 | TWCERT/CC |
| 分類 | attack_incident |
| 嚴重程度 | 高 |
| 信心水準 | 低 |

## 摘要

SecurityScorecard STRIKE 團隊揭露名為「Operation WrtHug」的大規模網路攻擊行動，鎖定全球華碩路由器，利用 AiCloud 服務的已知漏洞（CVE-2023-39780 相關）進行作業系統指令注入攻擊，植入後門程式，過去六個月已有超過 50,000 個 IP 設備被感染。

## 事實內容

1. **攻擊活動名稱**：Operation WrtHug，針對小型/家用路由器的持續性攻擊活動
2. **攻擊目標**：華碩（ASUS）品牌路由器，主要針對 AiCloud 服務
3. **攻擊手法**：利用已公開的作業系統指令注入（OS Command Injection）漏洞作為初始存取點
4. **相關 CVE**：CVE-2023-39780
5. **受影響產品型號**（8 款）：
   - 4G-AC55U
   - 4G-AC860U
   - DSL-AC68U
   - GT-AC5300
   - GT-AX11000
   - RT-AC1200HP
   - RT-AC1300GPLUS
   - RT-AC1300UHP
6. **攻擊結果**：植入後門程式，設備被加入全球感染網路，用於發動進一步網路威脅活動及間諜行動
7. **感染規模**：STRIKE 團隊在過去六個月中識別出全球超過 50,000 個 IP 設備被感染
8. **緩解措施**：
   - 執行韌體更新至最新版本
   - 汰換已終止支援（EoL）的舊款設備
   - 諮詢華碩官方產品安全建議

## 受影響系統

- **產品**：ASUS 無線路由器
- **型號**：4G-AC55U、4G-AC860U、DSL-AC68U、GT-AC5300、GT-AX11000、RT-AC1200HP、RT-AC1300GPLUS、RT-AC1300UHP
- **服務**：AiCloud 服務
- **漏洞類型**：作業系統指令注入（OS Command Injection）
- **相關 CVE**：CVE-2023-39780

## 來源連結

- [TWCERT/CC 原文](https://www.twcert.org.tw/tw/cp-104-10522-ff0b9-1.html)
- [ASUS 產品安全建議](https://www.asus.com/content/asus-product-security-advisory/)

---

**萃取時間**：2026-01-26 14:52 UTC
**文件 ID**：news-20251125-007
**資料來源**：security_news_facts Layer