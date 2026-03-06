# LLMs as Lossy Compression of Information

| 項目 | 內容 |
|------|------|
| **日期** | 2025-01-22 |
| **來源** | CERT.at (Austria) |
| **分類** | industry_trend |
| **嚴重程度** | low |
| **信心水準** | 高 |

## 摘要
CERT.at 從資訊理論角度分析大型語言模型（LLM）的本質，將其定位為有損壓縮演算法，探討此視角對資安領域 AI 應用的意涵。

## 事實內容
- **核心論點**：LLM 在功能上等同於「有損壓縮（lossy compression）」，將訓練資料壓縮為模型參數，但無法完整還原原始資訊。
- **資訊理論背景**：
  - 傳統無損壓縮（如 Huffman 編碼、LZW 演算法）：壓縮過程完全內容無關，不需要語意知識
  - 有損壓縮（如 JPEG、MP3）：針對人類感知特性，可丟棄不影響理解的細節
  - LLM 類似有損壓縮：保留訓練資料的語意模式，但無法精確重現原始文字
- **LLM 的資安意涵**：
  - LLM 因其有損特性，無法被可靠地用於精確的事實查詢（如漏洞 CVE 編號、修補時程）
  - LLM 生成的「幻覺」（hallucination）是有損壓縮的必然結果，而非可完全消除的缺陷
  - 對資安工具整合 AI 的影響：需要在 LLM 輸出上添加事實驗證層
- **與傳統壓縮的對比**：
  - 傳統壓縮：演算法完全不了解資料語意
  - LLM：在訓練過程中建立了「語意知識庫」（類似領域特定壓縮），可在壓縮時利用語意模式
  - 例外：HTTP/2 或 SIP header 壓縮等領域特定壓縮確實使用語意知識

## 受影響系統
- 企業 AI/LLM 應用整合
- 資安分析工具中的 AI 輔助功能

## 來源連結
- [LLMs as Lossy Compression of Information](https://www.cert.at/en/blog/2025/1/llms-as-lossy-compression-of-information)

---
> 萃取時間：2026-03-04 UTC
> 資料來源：CERT.at (Austria) cert-at
