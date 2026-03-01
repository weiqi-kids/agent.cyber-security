# StrelaStealer Payload Delivery Domain: montagnaitalia.it

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-01 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | other |
| **惡意程式家族** | StrelaStealer |
| **狀態** | unknown |
| **威脅等級** | 高 |
| **信心水準** | 100% |

## 威脅描述

abuse.ch ThreatFox 於 2026-03-01 回報此義大利域名（.it）為 StrelaStealer 惡意程式的 payload 投遞域名。此域名標記為已遭入侵（is_compromised: true），顯示這是一個被劫持的合法義大利山地主題網站，由研究員 threatcat_ch 回報。StrelaStealer 以竊取 Outlook 和 Thunderbird 電子郵件憑證著稱。

## IoC 指標

| 類型 | 值 |
|------|-----|
| domain | `montagnaitalia.it` |

## 關聯分析

此域名與 montagne-emotion.fr 名稱相似（同為山地主題），可能是同一攻擊者刻意選擇的目標模式，或係巧合。同批 StrelaStealer 活動中另有 monom.cc、monokerka.com、monnier.com.br 等域名（均由 threatcat_ch 回報）。攻擊者在短時間內（約 30 分鐘）提交多個遭入侵域名，顯示這是一次快速展開的惡意活動。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1756462/)

---
> 萃取時間：2026-03-02 UTC
> 資料來源：abuse.ch ThreatFox ID:1756462
