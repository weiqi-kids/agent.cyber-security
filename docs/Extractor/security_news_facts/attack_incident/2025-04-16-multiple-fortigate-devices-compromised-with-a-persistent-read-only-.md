# Multiple FortiGate devices compromised with a persistent read-only access

| 項目 | 內容 |
|------|------|
| **日期** | 2025-04-16 |
| **來源** | CERT.at (Austria) |
| **分類** | attack_incident |
| **嚴重程度** | high |
| **信心水準** | 高 |

## 摘要
Fortinet 揭露攻擊者利用三個 SSL VPN 已知漏洞入侵 FortiGate 設備，並在檔案系統植入符號連結（symlink）以在修補後維持持久性唯讀存取，奧地利高峰期有多達 840 台設備受影響。

## 事實內容
- **CVE**：CVE-2022-42475、CVE-2023-27997、CVE-2024-21762（FortiOS SSL VPN 遠端程式碼執行漏洞）
- **攻擊手法（技術細節）**：
  1. 攻擊者利用上述三個已知 SSL VPN 漏洞取得初始存取，執行未授權程式碼
  2. 在 FortiOS 用於提供語言檔案的資料夾中植入**符號連結（symbolic link）**
  3. 語言檔案資料夾無需驗證即可存取，任何知道路徑的人都可取得唯讀的整個檔案系統存取權
  4. 可存取的內容包括：完整設備配置（含敏感設定和認證資訊）
- **最嚴重問題**：Fortinet 發布的漏洞修補程式**未移除已植入的符號連結**，導致即使修補了漏洞，攻擊者的後門仍持續存在
- **全球影響範圍**：ShadowServer Foundation 在全球識別出數千台受影響設備
- **奧地利影響**：
  - 高峰期：奧地利境內多達 840 台受影響設備
  - 目前數量略低於高峰期（報告撰寫時）
- **Fortinet 回應**：2025 年 4 月 10 日（週五）公開揭露此次大規模入侵事件
- **產品定位**：FortiGate 是企業 VPN 解決方案，提供 SSL VPN 功能，用於遠端存取企業系統

## 受影響系統
- Fortinet FortiGate（使用 SSL VPN 功能的所有版本）
- 受 CVE-2022-42475、CVE-2023-27997、CVE-2024-21762 影響的 FortiOS 版本

## 來源連結
- [Multiple FortiGate devices compromised with a persistent read-only access](https://www.cert.at/en/blog/2025/4/multiple-fortigate-devices-compromised-with-a-persistent-read-only-access)

---
> 萃取時間：2026-03-04 UTC
> 資料來源：CERT.at (Austria) cert-at
