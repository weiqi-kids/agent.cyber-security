# Ransomware gang abuses Microsoft Teams relays to hide malicious traffic

| 項目 | 內容 |
|------|------|
| **日期** | 2026-06-17 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

DragonForce 勒索軟體使用客製後門程式「Backdoor.Turn」，透過 Microsoft Teams TURN 協議中繼基礎設施隱藏 C2 流量。

## 事實內容

DragonForce 勒索軟體組織使用名為「Backdoor.Turn」的客製惡意軟體，將命令與控制（C2）流量隱藏在 Microsoft Teams 中繼基礎設施內。

該後門濫用 Microsoft Teams 使用的 TURN（Traversal Using Relays around NAT）協議，當客戶端無法建立直接連線（例如在私有網路中的客戶端）時，Teams 會使用此協議分發訊息。

DragonForce 是一個至少自 2023 年起活躍的勒索軟體組織，採用卡特爾式組織結構，並與惡名昭彰的 Scattered Spider 威脅組織有關聯。

- 威脅行為者：DragonForce（與 Scattered Spider 有關聯）
- 惡意軟體：Backdoor.Turn
- 攻擊手法：透過 Microsoft Teams TURN 協議中繼隱藏 C2 流量

## 受影響系統

- Microsoft Teams（TURN 協議被濫用為 C2 隱蔽通道）
- 企業組織網路

## 來源連結

- [Ransomware gang abuses Microsoft Teams relays to hide malicious traffic](https://www.bleepingcomputer.com/news/security/ransomware-gang-abuses-microsoft-teams-relays-to-hide-malicious-traffic/)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
