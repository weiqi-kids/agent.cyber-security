# LockBit 5.0 勒索軟體再度活躍,展現更高技術複雜度與跨平台攻擊能力

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-28 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 中 |

## 摘要
LockBit 5.0 ransomware resurfaces with technical upgrades, demonstrating enhanced cross-platform capabilities for Windows, Linux, and VMware ESXi.

## 事實內容
LockBit 5.0 ransomware recently resurfaced with multiple technical upgrades, showing this ransomware family maintains high activity and influence in the ransomware ecosystem. LockBit 5.0 not only strengthens code obfuscation and reverse analysis defense mechanisms but further enhances cross-platform operation capabilities.

According to Trend Micro research team sample analysis, LockBit 5.0 has variants that can operate on Windows, Linux, and VMware ESXi system environments, allowing attackers to impact hybrid cloud or virtualized environments with a single attack action, causing broader impact on enterprise operations.

Windows platform binary files use extensive obfuscation and packing techniques, utilizing multiple anti-analysis techniques including bypassing Event Tracing for Windows (ETW) and terminating security-related services, loading malicious payloads through DLL reflection. Linux version continues similar attack methods, adding command-line options for specific directories and file types to increase attack precision.

The ESXi variant for VMware virtualization environments can encrypt entire virtual machine infrastructure in a single attack, further expanding operational disruption risks.

## 受影響系統
- Windows systems (multiple versions)
- Linux systems
- VMware ESXi virtualization infrastructure

## 來源連結
- [LockBit 5.0 勒索軟體再度活躍,展現更高技術複雜度與跨平台攻擊能力](https://www.twcert.org.tw/tw/cp-104-10458-ee4fb-1.html)

---
> 萃取時間：2026-01-27 10:00 UTC
> 資料來源：TWCERT/CC rss-104
> Original language: Chinese (TWCERT/CC)
