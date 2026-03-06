# Cobalt Strike C2 叢集：cs-watermark-987654321（AS138415 YANCYLIMITED-HK）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet_cc |
| **惡意程式家族** | Cobalt Strike |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

2026-03-03 UTC 發現一批 Cobalt Strike C2 伺服器，共 9 個 IP:port 組合，均帶有相同 watermark `987654321`，集中於 AS138415（YANCYLIMITED-AS-HK）及 AS8075（Microsoft）。由 DonPasci 透過 Censys 偵測回報。`is_compromised: false` 表示這些是攻擊者控制的基礎設施（非受害主機）。ThreatFox ID 範圍：1757568–1757637。

## IoC 指標

| 類型 | 值 | 端口 | ThreatFox ID |
|------|-----|------|--------------|
| ip:port | `23.226.58.108:3093` | 3093 | 1757636 |
| ip:port | `43.240.239.237:3093` | 3093 | 1757637 |
| ip:port | `156.234.21.207:3093` | 3093 | 1757632 |
| ip:port | `43.249.172.126:28711` | 28711 | 1757633 |
| ip:port | `23.226.48.196:3093` | 3093 | 1757634 |
| ip:port | `23.248.213.117:3093` | 3093 | 1757630 |
| ip:port | `43.240.239.228:3093` | 3093 | 1757631 |
| ip:port | `23.226.48.216:3093` | 3093 | 1757628 |
| ip:port | `23.248.213.102:3093` | 3093 | 1757629 |
| ip:port | `168.61.44.251:80` | 80 | 1757569 |
| ip:port | `23.226.56.197:3751` | 3751 | 1757568 |

## 關聯分析

- **共同 watermark**：cs-watermark-987654321 是已知追蹤標識，用於識別同一操作者部署的 Cobalt Strike beacon。
- **AS138415（YANCYLIMITED-AS-HK）**：多個 IP 集中在此 ASN，顯示可能使用同一香港主機商批量部署。
- **168.61.44.251** 屬 Microsoft Azure（AS8075），為雲端基礎設施濫用案例。
- 標籤含 `C2,censys,CobaltStrike`，由 Censys 掃描發現。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1757636/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
