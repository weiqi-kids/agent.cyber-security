# SSHDKit 後門惡意軟體下載 URL

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | URLhaus |
| **分類** | malicious_url |
| **威脅類型** | malware |
| **惡意程式家族** | SSHDKit |
| **狀態** | online |
| **威脅等級** | High |
| **信心水準** | High |

## 威脅描述

此 URL 託管 SSHDKit 後門惡意軟體。SSHDKit 是一個 SSH 後門工具包，允許攻擊者在受感染的 Linux 系統上建立持久性遠端存取。該樣本為 ELF 格式（Linux 可執行檔），於 2026 年 1 月 27 日被發現且仍在線上運作。

## IoC 指標

| 類型 | 值 |
|------|-----|
| URL | `hxxp://181[.]200[.]14[.]44:8080/sshd` |
| IP Address | `181.200.14.44` |
| Port | `8080` |
| File Type | `ELF` |
| File Name | `sshd` |
| Threat Type | `malware_download` |

## 關聯分析

SSHDKit 偽裝成合法的 SSH 守護程式（sshd），但實際上是一個後門程式，允許攻擊者繞過正常的身份驗證機制。此類後門常用於 APT 攻擊和伺服器入侵後的持久性維持。該 URL 透過 Censys 掃描被發現。建議 Linux 系統管理者檢查 sshd 二進位檔的完整性並監控異常的 SSH 連線。

## 來源連結

- [URLhaus](https://urlhaus.abuse.ch/url/3764663/)

---
> 萃取時間：2026-01-28 UTC
> 資料來源：URLhaus ID:3764663
