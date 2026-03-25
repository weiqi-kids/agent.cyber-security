# Interesting Message Stored in Cowrie Logs

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-18 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 低 |
| **信心水準** | 高 |

## 摘要

BACS 學生 Adam Thorman 在作業中發現 Cowrie 蜜罐日誌中儲存了異常訊息，揭示攻擊者行為模式。

## 事實內容

- 由 BACS（資安學程）學生 Adam Thorman 在課程作業中發現
- 在 Cowrie SSH 蜜罐的日誌中發現攻擊者存入的特殊訊息
- Cowrie 是廣泛使用的 SSH/Telnet 蜜罐，用於記錄攻擊者行為
- 此發現有助於了解攻擊者在入侵後的行為模式及通訊手法
- 攻擊者可能使用蜜罐環境進行測試或留下標記

## 受影響系統

- Cowrie SSH/Telnet 蜜罐系統
- Linux 伺服器（SSH 開放服務）

## 來源連結

- [Interesting Message Stored in Cowrie Logs, (Wed, Mar 18th)](https://isc.sans.edu/diary/rss/32810)

---
> 萃取時間：2026-03-22 UTC
> 資料來源：SANS ISC sans-isc
