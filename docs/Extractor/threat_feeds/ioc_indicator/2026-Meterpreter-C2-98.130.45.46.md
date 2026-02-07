# Meterpreter C2 伺服器指標

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | malware |
| **惡意程式家族** | Meterpreter |
| **狀態** | active |
| **威脅等級** | High |
| **信心水準** | 100% |

## 威脅描述

此 IP 和端口組合被識別為 Meterpreter 命令與控制（C2）伺服器。Meterpreter 是 Metasploit Framework 的標準負載，是一個合法的滲透測試工具，但經常被威脅行為者濫用進行後滲透活動。該 IoC 於 2026 年 1 月 27 日首次被發現，託管於 Amazon AWS 雲端服務，信心水準為 100%。

## IoC 指標

| 類型 | 值 |
|------|-----|
| IP Address | `98.130.45.46` |
| Port | `17738` |
| IoC Type | `ip:port` |
| Threat Type | `botnet_cc` |
| AS Number | `AS16509 (Amazon)` |
| Compromised | `No` |

## 關聯分析

Meterpreter 是最廣泛使用的後滲透工具之一，提供遠端命令執行、檔案操作、權限提升和橫向移動等功能。該 C2 伺服器託管於 Amazon AWS（AS16509），顯示攻擊者濫用合法雲端基礎設施。該 IoC 透過 Censys 掃描被發現並由 DonPasci 提交至 ThreatFox。建議監控與此 IP 和端口的連線，並在網路邊界封鎖此 IoC。

## 來源連結

- [ThreatFox](https://threatfox.abuse.ch)
- [Censys 掃描結果](https://search.censys.io/hosts/98.130.45.46)

---
> 萃取時間：2026-01-28 UTC
> 資料來源：ThreatFox IoC:98.130.45.46:17738
