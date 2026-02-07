# OWASP 2025年Web應用安全十大威脅揭曉，存取控制漏洞位居榜首

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-11 |
| **來源** | TWCERT/CC |
| **分類** | industry_trend |
| **嚴重程度** | 中 |
| **信心水準** | 低 |

## 摘要
OWASP發布2025年Web應用程式安全十大風險清單，存取控制漏洞持續居首，安全配置錯誤與軟體供應鏈缺失躍升前三，新增「軟體供應鏈缺失」和「特殊情況處理不當」兩大類別，反映雲端架構與第三方組件管理面臨更大挑戰。

## 事實內容
- **發布組織**：OWASP（Open Web Application Security Project）
- **發布時間**：2025年12月
- **排名變化**：
  - A01: 存取控制漏洞（Broken Access Control）- 持續榜首
  - A02: 安全配置錯誤（Security Misconfiguration）- 躍升
  - A03: 軟體供應鏈缺失（Software Supply Chain Failures）- 新增，首次進入前三
  - A04: 加密機制失效（Cryptographic Failures）- 排名下降
  - A05: 注入攻擊（Injection）- 排名下降
  - A06: 不安全設計（Insecure Design）
  - A07: 身份驗證失敗（Authentication Failures）
  - A08: 軟體及資料完整性失效（Software or Data Integrity Failures）
  - A09: 日誌記錄與告警（Logging & Alerting Failures）
  - A10: 特殊情況處理不當（Mishandling of Exceptional Conditions）- 新增
- **重要更新**：伺服器端請求偽造（SSRF）合併至「存取控制漏洞」類別
- **趨勢觀察**：開源套件與第三方服務風險日益增加，AI驅動系統互連的風險逐漸上升

## 受影響系統
- Web應用程式
- 雲端架構系統
- 使用第三方組件與開源套件的應用系統
- AI驅動的互連系統

## 防護建議
1. 強化存取控制機制，採用最小權限原則，定期審查權限設定
2. 完整盤點第三方元件與供應商，建立SBOM追蹤機制
3. 定期執行弱點掃描、滲透測試等安全檢測
4. 增加多因子驗證（MFA），限制失敗登入嘗試次數
5. 建立產品應變團隊（PSIRT），建置異常處理與事件回應機制
6. 定期更新安全意識與技術訓練

## 來源連結
- [OWASP 2025年Web應用安全十大威脅揭曉，存取控制漏洞位居榜首](https://www.twcert.org.tw/tw/cp-104-10548-03edd-1.html)

---
> 萃取時間：2026-01-26 14:52 UTC
> 資料來源：TWCERT/CC RSS-104
