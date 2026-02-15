# Four Seconds to Botnet - Analyzing a Self Propagating SSH Worm with Cryptographically Signed C2

| 屬性 | 值 |
|------|-----|
| 發布日期 | 2026-02-12 |
| 來源 | SANS ISC |
| 分類 | attack_incident |
| 嚴重程度 | High |
| 信心水準 | High |

## 摘要

SANS ISC 客座分析師分析一種自我傳播的 SSH 蠕蟲，具有加密簽章的 C2 通訊機制，感染速度極快。

## 事實內容

SANS ISC 發布由實習生 Johnathan Husch 撰寫的客座分析文章，深入分析一種自我傳播的 SSH 蠕蟲惡意軟體。此蠕蟲具有以下特徵：
1. 極快的感染速度（「四秒內形成殭屍網路」）
2. 使用加密簽章的指揮與控制（C2）通訊
3. 透過 SSH 協定自我傳播

文章提供技術分析，包括感染機制、傳播演算法、C2 基礎架構等細節。

## 受影響系統

- SSH 伺服器（特別是弱密碼或暴露於網際網路的系統）
- Linux 伺服器

## 來源連結

- [原始分析](https://isc.sans.edu/diary/rss/32708)

---

*萃取時間：2026-02-15T00:00:00Z*
