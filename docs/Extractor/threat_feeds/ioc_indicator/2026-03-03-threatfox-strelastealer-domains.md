# StrelaStealer 惡意程式域名指標（2026-03-03）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | payload_delivery |
| **惡意程式家族** | StrelaStealer |
| **狀態** | unknown |
| **威脅等級** | High |
| **信心水準** | 高 |

## 威脅描述

2026-03-03 UTC 發現 StrelaStealer 資訊竊取木馬的多個 payload delivery 域名，均標記為 `is_compromised: true`，表示這些是被入侵的合法網站（而非攻擊者自行註冊的域名）被用作分發平台。StrelaStealer 主要針對電子郵件客戶端（如 Outlook、Thunderbird）竊取憑證。由 threatcat_ch 回報。ThreatFox ID 範圍：1757562–1757625。

## IoC 指標

| 類型 | 值 | 是否被入侵 | ThreatFox ID |
|------|-----|-----------|--------------|
| domain | `loureiroeazevedo.adv.br` | 是（被入侵） | 1757625 |
| domain | `manoumanwell.info` | 是（被入侵） | 1757620 |
| domain | `lp.novoselementos.com.br` | 是（被入侵） | 1757616 |
| domain | `lhcom.j-hodgson.co.uk` | 是（被入侵） | 1757605 |
| domain | `lp.espacosparaeventos.com.br` | 是（被入侵） | 1757599 |
| domain | `lp.adlersocial.com` | 是（被入侵） | 1757595 |
| domain | `marceloubaldo.com.br` | 是（被入侵） | 1757584 |
| domain | `marcavalado.anavalado.com` | 是（被入侵） | 1757562 |

## 關聯分析

- 多數域名為巴西（`.com.br`）及英國（`.co.uk`）合法網站，被入侵後用於分發 StrelaStealer。
- `is_compromised: true` 代表這些是供應鏈受害主機，原域名擁有者可能不知情。
- StrelaStealer 於 2022 年首次出現，持續以電子郵件附件（.zip/.img）作為感染向量。
- 信心水準 100%，由專業威脅研究員 threatcat_ch 回報。

## 來源連結

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1757625/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
