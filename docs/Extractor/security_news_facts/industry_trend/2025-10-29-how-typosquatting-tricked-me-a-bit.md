# How typosquatting tricked me (a bit)

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-29 |
| **來源** | CERT.at (Austria) |
| **分類** | industry_trend |
| **嚴重程度** | medium |
| **信心水準** | 高 |

## 摘要
CERT.at 分析師分享透過自動化 PyPI 套件監控系統發現仿冒套件（typosquatting）的實際案例，揭示攻擊者將惡意位元組碼（.pyc 檔案）藏匿於 `__pycache__` 目錄的新手法。

## 事實內容
- **攻擊手法**：Typosquatting——利用與知名套件相似的命名（如一個字母的差異）誘騙開發者安裝惡意套件。
- **發現機制**：CERT.at 建立的 PyPI 自動化分析系統，對新上傳套件進行自動化掃描。
- **案例技術細節**：
  - 可疑套件名稱為 `asynhttp`（明顯仿冒正常套件）
  - 異常點：套件包含 `__pycache__` 目錄，其中有預編譯的 Python 位元組碼（.pyc 檔案）
  - 通常 `__pycache__` 不應被包含在發布的套件中，因為 Python 直譯器在執行時會自動重新編譯
  - 這一異常隱藏技巧使惡意程式碼難以直接從原始碼審查中被發現
- **攻擊者意圖**：將惡意邏輯隱藏在預編譯的位元組碼中，避開靜態程式碼分析工具
- **偵測挑戰**：
  - 大腦的「模式匹配優化」傾向於將相似名稱視為已知套件
  - 位元組碼分析比原始碼分析更為困難，需要額外的反編譯步驟
- **PyPI 供應鏈安全意涵**：軟體供應鏈攻擊持續針對開發者工具鏈，監控 PyPI 等套件倉庫的新上傳是必要的防禦措施。

## 受影響系統
- Python Package Index (PyPI) 生態系
- Python 應用程式的軟體供應鏈
- 使用第三方 Python 套件的開發環境

## 來源連結
- [How typosquatting tricked me (a bit)](https://www.cert.at/en/blog/2025/10/how-typosquatting-tricked-me-a-bit)

---
> 萃取時間：2026-03-04 UTC
> 資料來源：CERT.at (Austria) cert-at
