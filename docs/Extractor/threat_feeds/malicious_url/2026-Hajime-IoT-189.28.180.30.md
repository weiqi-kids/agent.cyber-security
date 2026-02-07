# Hajime IoT 殭屍網路惡意軟體下載 URL

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | URLhaus |
| **分類** | malicious_url |
| **威脅類型** | botnet |
| **惡意程式家族** | Hajime |
| **狀態** | online |
| **威脅等級** | High |
| **信心水準** | High |

## 威脅描述

此 URL 託管 Hajime IoT 殭屍網路惡意軟體。Hajime 是一個針對 IoT 設備的蠕蟲，使用點對點（P2P）架構進行命令與控制。該 URL 於 2026 年 1 月 27 日被發現且仍在線上運作，託管 ELF 格式的惡意軟體（針對嵌入式 Linux 系統）。

## IoC 指標

| 類型 | 值 |
|------|-----|
| URL | `hxxp://189[.]28[.]180[.]30:26257/i` |
| IP Address | `189.28.180.30` |
| Port | `26257` |
| File Type | `ELF` |
| Threat Type | `malware_download` |

## 關聯分析

Hajime 是一個複雜的 IoT 殭屍網路，主要感染路由器、IP 攝影機和 DVR 等設備。與 Mirai 不同，Hajime 使用 P2P 架構而非集中式 C2 伺服器，使其更難以被移除。該惡意軟體透過 Censys 掃描被發現，使用非標準端口（26257）。建議 IoT 設備管理者更改預設憑證並隔離設備網路。

## 來源連結

- [URLhaus](https://urlhaus.abuse.ch/url/3764674/)

---
> 萃取時間：2026-01-28 UTC
> 資料來源：URLhaus ID:3764674
