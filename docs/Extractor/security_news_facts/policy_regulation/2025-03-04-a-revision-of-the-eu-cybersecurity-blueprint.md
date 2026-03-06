# A Revision of the EU Cybersecurity Blueprint

| 項目 | 內容 |
|------|------|
| **日期** | 2025-03-04 |
| **來源** | CERT.at (Austria) |
| **分類** | policy_regulation |
| **嚴重程度** | medium |
| **信心水準** | 高 |

## 摘要
CERT.at 評論 EU 委員會發布的 EU 網路安全藍圖（2017 年版）修訂草案，提出對 DNS 過度強調、跨境依賴未充分考量等多項批評與改善建議。

## 事實內容
- **文件背景**：EU 網路安全藍圖（原文：2017 年 9 月 13 日委員會建議，"Commission Recommendation of 13.9.2017 on Coordinated Response to Large Scale Cybersecurity Incidents and Crises"）距今已近 7 年，委員會發布更新草案。
- **CERT.at 整體評估**：文件可讀性佳、篇幅簡潔，但參考資料的超連結使用不一致（部分腳注有 URL 但非可點擊連結）。
- **主要批評點**：
  - **DNS 被過度強調**：第 16 條文和第 15、16 點將 DNS 解析能力列為關鍵技術依賴，但 DNS 並非唯一關鍵依賴
  - **DNS4EU 的定位**：DNS4EU 是值得推動的 EU 倡議，但不應被提升為 EU 網路安全藍圖的核心元件
  - **其他被忽略的關鍵依賴**：
    - 網際網路路由基礎設施（含 BGP 安全機制 RPKI）
    - DNS 的權威端（不只解析端）
    - 內容交付網路（CDN，部分服務聲稱處理全球大量流量）
    - 大型電子郵件營運商
    - 超大型雲端服務（IaaS/PaaS/SaaS）
- **格式建議**：在正文中直接使用超連結，而非僅在腳注提供 URL，可提升數位版本的可及性。
- **意義**：此文件是 EU 應對大規模網路安全事件和危機的協調框架，修訂版將影響 EU 未來的多國網路事件回應機制。

## 受影響系統
- EU 各成員國大規模網路事件應急協調機制
- EU 關鍵網路基礎設施

## 來源連結
- [A Revision of the EU Cybersecurity Blueprint](https://www.cert.at/en/blog/2025/3/a-revision-of-the-eu-cybersecurity-blueprint)

---
> 萃取時間：2026-03-04 UTC
> 資料來源：CERT.at (Austria) cert-at
