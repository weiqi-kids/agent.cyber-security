# New Rokarolla Android Malware Steals PINs, SMS Codes, and Crypto Wallet Funds

| 項目 | 內容 |
|------|------|
| **日期** | 2026-06-17 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Zimperium zLabs 記錄到新型 Android 銀行木馬 Rokarolla，針對 217 個銀行和加密貨幣應用程式，具備 137 個遠端指令，可竊取 PIN、SMS 及加密貨幣錢包資金。

## 事實內容

Zimperium 的 zLabs 安全研究人員記錄了一個新型 Android 銀行木馬 Rokarolla，針對 217 個銀行和加密貨幣應用程式，並配備 137 個遠端指令。

Rokarolla 的主要能力包括：
- 竊取螢幕鎖定 PIN
- 讀取和傳送 SMS
- 改寫剪貼簿以重新導向加密貨幣付款
- 關閉 Google Play Protect

Rokarolla 以其命令與控制（C2）伺服器命名，透過偽裝成知名應用程式（如 TikTok 和 Chrome）的惡意網站傳播。

感染流程：
1. 受害者安裝偽裝成 Google Play Protect 的投放器（dropper）
2. 投放器利用偽裝獲取安裝 payload 和無障礙功能（Accessibility）存取權
3. 惡意軟體運行後，其中一個指令關閉 Play Protect

## 受影響系統

- Android 裝置
- 217 個銀行和加密貨幣應用程式

## 來源連結

- [New Rokarolla Android Malware Steals PINs, SMS Codes, and Crypto Wallet Funds](https://thehackernews.com/2026/06/new-rokarolla-android-malware-steals.html)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
