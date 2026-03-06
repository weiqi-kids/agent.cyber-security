# Incident Reporting: EU-Wide Statistics

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-22 |
| **來源** | CERT.at (Austria) |
| **分類** | industry_trend |
| **嚴重程度** | low |
| **信心水準** | 高 |

## 摘要
CERT.at 分析師批評 ENISA 發布的 EU 事件通報統計方法存在圖表呈現缺陷，並提出更清晰的資料視覺化建議。

## 事實內容
- **背景**：在 CSIRTs Network 會議上，ENISA 展示其透過 CIRAS（https://ciras.enisa.europa.eu/）發布的 EU 事件統計圖表。
- **主要問題**：
  - **坐標軸非線性**：大部分直條圖涵蓋一年期間，但最後 4 個直條只涵蓋季度，使圖表直觀理解產生混淆，讀者無法直接比較前後數值。
  - **「其他」類別過度主導**：前 8 年的資料幾乎僅涵蓋「other」類別的事件，無法呈現各產業分布。
  - **資料解讀困難**：最近幾個季度的數據因時間跨度不一致，不宜與過去年度數據直接比較。
- **CERT.at 建議的改善方式**：
  - 為長期趨勢提供純年度圖（若最後一年尚未完整，可加陰影標示預估值）
  - 另提供月度圖（涵蓋近 6-18 個月），以展示近期詳細趨勢
- **意義**：此評論反映 EU 各 CSIRT 對 ENISA 統計品質與透明度的關注，影響 EU 資安事件趨勢分析的可靠性。

## 受影響系統
- ENISA CIRAS 統計平台
- EU 資安事件通報機制

## 來源連結
- [Incident Reporting: EU-Wide Statistics](https://www.cert.at/en/blog/2026/2/incident-reporting-eu-wide-statistics)

---
> 萃取時間：2026-03-04 UTC
> 資料來源：CERT.at (Austria) cert-at
