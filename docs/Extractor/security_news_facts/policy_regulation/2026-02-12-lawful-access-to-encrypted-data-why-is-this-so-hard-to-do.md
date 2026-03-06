# Lawful access to encrypted data: why is this so hard to do?

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-12 |
| **來源** | CERT.at (Austria) |
| **分類** | policy_regulation |
| **嚴重程度** | medium |
| **信心水準** | 高 |

## 摘要
CERT.at 分析師（EU 加密專家組成員）解析現代 OTT 通訊服務的合法監聽為何比傳統電話監聽困難，從技術和法律管轄權兩個維度提供深度分析。

## 事實內容
- **核心問題**：執法機構在舊式電話網路中可輕易實施監聽，但在現代網際網路通訊服務中卻極度困難。
- **傳統電話監聽的優勢條件**：
  - 電話系統有實體銅線，連接固定的電話交換機和用戶端
  - 雙方位於同一法律管轄區
  - 法院命令可直接要求本地電信業者（如維也納法院命令奧地利 PTT）執行
- **現代 OTT 服務的困境（4 個核心因素）**：
  1. **管轄權/位置問題**：Signal 或 WhatsApp 等服務的伺服器可能在不同國家，通訊雙方也遍及全球，難以定義單一管轄權。
  2. **端對端加密**：訊息在傳輸過程中完全加密，服務營運商本身也無法解讀內容。
  3. **開源軟體問題**：即使強制主流平台實施後門，仍有無數開源替代方案可供使用。
  4. **去中心化架構**：部分服務使用無中心伺服器的對等架構，根本沒有單一合規義務主體。
- **技術層面的挑戰**：帶內信令（In-Band signalling）問題——控制信號與資料混雜傳輸的結構性問題，類似於 2600Hz 電話駭客攻擊的現代版本。
- **作者身分**：EU 加密政策專家組成員，具有直接政策制定參與經驗。

## 受影響系統
- OTT 通訊服務（WhatsApp、Signal、iMessage 等）
- EU 執法機構資料存取框架

## 來源連結
- [Lawful access to encrypted data: why is this so hard to do?](https://www.cert.at/en/blog/2026/2/lawful-access-to-encrypted-data-why-is-this-so-hard-to-do)

---
> 萃取時間：2026-03-04 UTC
> 資料來源：CERT.at (Austria) cert-at
