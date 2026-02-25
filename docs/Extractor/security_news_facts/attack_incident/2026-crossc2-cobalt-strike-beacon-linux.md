# CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks

| 項目 | 內容 |
|------|------|
| **日期** | 2025-08-14 |
| **來源** | JPCERT/CC Blog |
| **分類** | attack_incident |
| **嚴重程度** | high |
| **信心水準** | high |

## 摘要
JPCERT/CC 確認多起使用 CrossC2 擴展 Cobalt Strike Beacon 至 Linux 平台的攻擊事件。

## 事實內容
2024 年 9 月至 12 月期間，JPCERT/CC 確認多起涉及 CrossC2 的事件。CrossC2 是一個擴展工具，用於為 Linux 作業系統建立 Cobalt Strike Beacon。

攻擊活動特徵：
- 使用 CrossC2 擴展 Cobalt Strike 至 Linux 環境
- 攻擊者同時使用多種工具：
  - PsExec（橫向移動）
  - Plink（SSH 通道）
  - Cobalt Strike（命令與控制）
- 顯示跨平台攻擊能力（Windows + Linux）
- 攻擊者具備較高的技術能力

這顯示 Cobalt Strike 這個原本以 Windows 為主的滲透測試工具，透過 CrossC2 擴展後，已成為跨平台攻擊的有力工具。攻擊者能夠在混合環境中維持持久性並進行橫向移動。

## 來源連結
- [CrossC2 Expanding Cobalt Strike Beacon to Cross-Platform Attacks](https://blogs.jpcert.or.jp/en/2025/08/crossc2.html)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：JPCERT/CC Blog jpcert-blog
