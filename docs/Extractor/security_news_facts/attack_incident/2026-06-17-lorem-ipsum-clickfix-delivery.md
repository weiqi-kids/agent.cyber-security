# 'Lorem Ipsum' Malware Pivots to ClickFix Delivery

| 項目 | 內容 |
|------|------|
| **日期** | 2026-06-17 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

微軟打擊 Fox Tempest 惡意軟體簽署服務後，Lorem Ipsum shellcode 載入器操作者轉向使用 ClickFix 誘餌作為新的感染媒介。

## 事實內容

微軟上個月打擊惡意軟體簽署即服務提供商 Fox Tempest（又名 Forging Marauder），吊銷了超過 1,000 個詐騙取得的 Microsoft Trusted Signing 憑證，迫使 Lorem Ipsum shellcode 載入器和後門的操作者放棄透過木馬化 Microsoft Teams 安裝程式傳遞的方式。

BlueVoyant 研究人員自 2026 年 2 月起追蹤 Lorem Ipsum 活動，觀察到這次轉變發生在 2026 年 5 月下旬，即微軟摧毀 Fox Tempest 基礎設施後數天。儘管打擊可能暫時干擾了威脅行為者，但他們迅速轉移到可能更危險的 ClickFix 誘餌傳遞模式。

- 惡意軟體：Lorem Ipsum shellcode 載入器 + 後門
- 舊傳遞方式：木馬化 Microsoft Teams 安裝程式（透過 Fox Tempest 簽署）
- 新傳遞方式：ClickFix 誘餌
- 轉變時間：2026 年 5 月下旬

## 受影響系統

- Windows 系統（ClickFix 社交工程攻擊目標）

## 來源連結

- ['Lorem Ipsum' Malware Pivots to ClickFix Delivery](https://www.darkreading.com/cyberattacks-data-breaches/lorem-ipsum-malware-clickfix-delivery)

---
> 萃取時間：2026-06-17 00:00 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news
