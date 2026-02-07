# 全球網路威脅活動「Operation WrtHug」鎖定華碩路由器

| 欄位 | 內容 |
|------|------|
| **日期** | 2025-11-25 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 低 |

## 摘要

大規模網路攻擊「Operation WrtHug」利用已知漏洞入侵華碩路由器,全球超過5萬個設備被感染並植入後門程式。

## 事實內容

1. **攻擊行動名稱與來源**
   - 代號：Operation WrtHug
   - 發現者：SecurityScorecard STRIKE 團隊
   - 攻擊目標：華碩 (ASUS) 品牌路由器

2. **攻擊手法**
   - 主要針對華碩設備上的 AiCloud 服務
   - 利用作業系統指令注入（OS Command Injection）漏洞作為初始存取點
   - 相關漏洞編號：CVE-2023-39780
   - 成功入侵後植入後門程式，將設備加入全球感染網路

3. **感染規模**
   - STRIKE 團隊在過去六個月中識別出全球超過 50,000 個 IP 設備被感染

4. **攻擊影響**
   - 被感染設備被用作發動進一步的網路威脅活動及間諜行動

5. **建議緩解措施**
   - 執行韌體更新到最新版本
   - 檢查並汰換 EoL（終止支援）設備
   - 查閱華碩產品安全建議（https://www.asus.com/content/asus-product-security-advisory/）

## 受影響系統

### 受影響產品型號（共8款）

1. ASUS Wireless Router 4G-AC55U
2. ASUS Wireless Router 4G-AC860U
3. ASUS Wireless Router DSL-AC68U
4. ASUS Wireless Router GT-AC5300
5. ASUS Wireless Router GT-AX11000
6. ASUS Wireless Router RT-AC1200HP
7. ASUS Wireless Router RT-AC1300GPLUS
8. ASUS Wireless Router RT-AC1300UHP

### 漏洞資訊

- CVE-2023-39780（作業系統指令注入漏洞）
- 攻擊目標：AiCloud 服務

## 來源連結

- TWCERT/CC 通報：https://www.twcert.org.tw/tw/cp-104-10522-ff0b9-1.html
- 華碩產品安全建議：https://www.asus.com/content/asus-product-security-advisory/

---

**萃取時間**：2026-01-27
**資料來源**：TWCERT/CC RSS-104
