# CobaltStrike 惡意軟體下載 URL

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | URLhaus |
| **分類** | malicious_url |
| **威脅類型** | malware |
| **惡意程式家族** | CobaltStrike |
| **狀態** | online |
| **威脅等級** | High |
| **信心水準** | High |

## 威脅描述

此 URL 託管 CobaltStrike Beacon 惡意軟體下載。CobaltStrike 是一個合法的滲透測試工具，但經常被威脅行為者（包括 APT 團體和勒索軟體組織）濫用進行後滲透活動。該 URL 於 2026 年 1 月 27 日被發現且仍在線上運作。

## IoC 指標

| 類型 | 值 |
|------|-----|
| URL | `hxxp://111[.]92[.]243[.]40:8080/02.08.2022.exe` |
| IP Address | `111.92.243.40` |
| Port | `8080` |
| File Name | `02.08.2022.exe` |
| Threat Type | `malware_download` |

## 關聯分析

CobaltStrike Beacon 是最常見的後滲透工具之一，被多個勒索軟體集團和 APT 組織使用，包括 Conti、LockBit 和 APT29。該 URL 透過 Censys 掃描被發現，使用非標準端口（8080）託管惡意軟體。檔名使用日期格式可能是為了偽裝成合法文件。建議立即在防火牆和網路閘道封鎖此 IP 和 URL。

## 來源連結

- [URLhaus](https://urlhaus.abuse.ch/url/3764679/)

---
> 萃取時間：2026-01-28 UTC
> 資料來源：URLhaus ID:3764679
