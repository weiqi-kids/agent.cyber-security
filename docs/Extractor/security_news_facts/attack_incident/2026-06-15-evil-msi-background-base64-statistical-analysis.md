# Evil MSI Background: BASE64 Statistical Analysis

| 項目 | 內容 |
|------|------|
| **日期** | 2026-06-15 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

攻擊者將 Windows 可執行 Payload 藏入 JPEG 圖片，採用字元替換加字串反轉的自訂 BASE64 編碼繞過自動化偵測工具。

## 事實內容

SANS ISC 研究員對先前由 handler Xavier 分析的惡意 MSI 背景圖片進行 BASE64 統計分析，揭露一種規避偵測的客製化編碼技術。

**技術細節**：
- 惡意 Payload 隱藏於 JPEG 圖片檔案中
- 自訂 BASE64 編碼方案：將字母 'A' 替換為 '#'，並對整個 BASE64 字串進行反轉，導致填充字元出現在字串開頭而非結尾
- 約 45.65% 的可疑 JPEG 內容由 BASE64 字元組成
- 最長的編碼字串長度接近 100 萬字元
- 反轉的 Payload 以 "==" 開頭（正常 BASE64 應以 "==" 結尾）
- 解碼後揭露 "TVq" 反轉形式（MZ 可執行檔標頭特徵）
- 該 hash 與 Xavier 先前分析萃取的檔案吻合
- 此客製化編碼成功躲過標準 BASE64 偵測工具

## 受影響系統

- Windows（PE/可執行檔目標）
- 依賴標準 BASE64 特徵偵測的安全工具

## 來源連結

- [Evil MSI Background: BASE64 Statistical Analysis](https://isc.sans.edu/diary/rss/33072)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：SANS ISC sans-isc
