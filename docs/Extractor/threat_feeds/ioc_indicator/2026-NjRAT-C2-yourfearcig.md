# NjRAT C2 域名指標

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet |
| **惡意程式家族** | NjRAT |
| **狀態** | active |
| **威脅等級** | High |
| **信心水準** | 100% |

## 威脅描述

此域名被識別為 NjRAT（又稱 Bladabindi、Lime-Worm）殭屍網路的命令與控制（C2）伺服器。NjRAT 是一個功能豐富的遠端存取木馬，具有鍵盤記錄、遠端桌面、檔案管理和 DDoS 攻擊能力。該 IoC 於 2026 年 1 月 27 日首次被發現，信心水準為 100%。

## IoC 指標

| 類型 | 值 |
|------|-----|
| Domain | `yourfearcig.no-ip.biz` |
| IoC Type | `domain` |
| Threat Type | `botnet_cc` |
| Compromised | `No` |

## 關聯分析

NjRAT 是一個廣泛使用的 RAT，特別在中東地區流行。該域名使用 No-IP 動態 DNS 服務，這是威脅行為者常用的免費 DDNS 服務。該 IoC 由 Triage 沙箱分析系統發現並由 DonPasci 提交至 ThreatFox。建議在 DNS 層級和防火牆封鎖此域名，並監控任何嘗試連線此 C2 的端點。

## 來源連結

- [ThreatFox](https://threatfox.abuse.ch)
- [Triage 分析報告](https://tria.ge/260127-sfkmbacy6d)

---
> 萃取時間：2026-01-28 UTC
> 資料來源：ThreatFox IoC:yourfearcig.no-ip.biz
