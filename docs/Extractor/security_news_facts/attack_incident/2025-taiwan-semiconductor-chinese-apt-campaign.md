# 半導體戰略背後的網路戰–資安攻擊鎖定設計、生產與財經分析師

| 項目 | 內容 |
|------|------|
| **事件日期** | 2025-03-01 至 2025-06-30 |
| **資料來源** | TWCERT/CC |
| **事件分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 低 |

## 摘要

三個與中國有關的駭客組織（UNK_FistBump、UNK_DropPitch、UNK_SparkyCarp）於2025年3-6月針對台灣半導體產業發動大規模網路攻擊，透過魚叉式釣魚郵件植入Cobalt Strike、Voldemort等後門程式，竊取先進製程技術與商業機密。

## 事實內容

1. **攻擊者識別**：Proofpoint揭露三個中國相關駭客組織UNK_FistBump、UNK_DropPitch、UNK_SparkyCarp於2025年3-6月攻擊台灣半導體產業

2. **攻擊手法**：
   - UNK_FistBump（5-6月）：入侵台大學生帳號，冒名向半導體公司人資部門寄送求職釣魚郵件，透過Zendesk/Filemail投遞Cobalt Strike Beacon與Voldemort後門
   - UNK_DropPitch（4-5月）：偽裝金融投資公司，針對半導體產業分析師發動釣魚攻擊，使用api[.]moctw[.]info偽造政府API端點，投遞HealthKick後門（透過libcef.dll、pbvm90.dll加載）
   - UNK_SparkyCarp（3月）：架設accshieldportal[.]com與acesportal[.]com偽造企業內部登入頁面，竊取員工憑證

3. **攻擊目標**：台灣半導體製造/封裝/測試企業工程師、人資、財經分析師、研究機構

4. **威脅情報指標（IoC）**：
   - C2網域：api[.]moctw[.]info、brilliant-bubblegum-137cfe[.]netlify[.]app、accshieldportal[.]com、acesportal[.]com
   - 惡意程式：Cobalt Strike Beacon、Voldemort、HealthKick
   - 惡意DLL：libcef.dll、pbvm90.dll
   - 檔案託管平台濫用：Zendesk、Filemail

5. **戰略意圖**：中國駭客戰略重心轉向台灣半導體生態系統，疑似取得先進製程技術或干擾技術封鎖應對策略

## 受影響的系統/組織/技術

- **組織類型**：台灣半導體製造/封裝/測試企業、投資銀行、研究機構
- **目標角色**：工程師、人資、財經分析師
- **受影響地區**：台灣
- **產業**：半導體產業
- **攻擊向量**：魚叉式釣魚郵件（spear-phishing）

## 來源連結

- [TWCERT/CC - 半導體戰略背後的網路戰](https://www.twcert.org.tw/tw/cp-104-10355-56906-1.html)

## 萃取時間

2026-01-26 14:53 UTC

---

**內部識別碼**: news-20250828-014