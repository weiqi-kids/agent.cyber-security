# GSocket Backdoor Delivered Through Bash Script

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-20 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

惡意 Bash 腳本被用於在受害者電腦上安裝 GSocket 後門，攻擊者藉此建立持久性遠端存取。

## 事實內容

- 發現一個惡意 Bash 腳本，執行後會自動安裝 GSocket 後門程式
- GSocket（Global Socket）是一種合法的網路工具，被攻擊者濫用於建立隱蔽的反向 shell 連線
- 攻擊者透過 Bash 腳本封裝安裝流程，降低被偵測的機率
- 此類攻擊手法常見於針對 Linux 伺服器的入侵活動

## 受影響系統

- Linux 伺服器（執行惡意 Bash 腳本的系統）
- 任何可執行 Bash 腳本的 Unix-like 系統

## 來源連結

- [GSocket Backdoor Delivered Through Bash Script, (Fri, Mar 20th)](https://isc.sans.edu/diary/rss/32816)

---
> 萃取時間：2026-03-22 UTC
> 資料來源：SANS ISC sans-isc
