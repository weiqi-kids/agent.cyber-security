# LockBit 5.0 Ransomware Resurfaces with Enhanced Cross-Platform Attack Capabilities

| 項目 | 內容 |
|------|------|
| **日期** | 2025-10-28 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | Critical |
| **信心水準** | 中 |

## 摘要
LockBit 5.0 ransomware has resurfaced with significant technical upgrades including enhanced obfuscation, anti-analysis defenses, and cross-platform variants targeting Windows, Linux, and VMware ESXi environments. The ESXi variant can encrypt entire virtual machine infrastructures in a single attack.

## 事實內容
- **威脅**: LockBit 5.0 ransomware, latest evolution of the LockBit family
- **發現者**: Trend Micro research team
- **跨平台變種**:
  - **Windows**: Heavy obfuscation and packing; bypasses ETW (Event Tracing for Windows); terminates security services; uses reflective DLL loading for payload delivery
  - **Linux**: Similar attack methodology with added command-line options for targeting specific directories and file types
  - **VMware ESXi**: Can encrypt entire virtual machine infrastructure at hypervisor level, causing mass operational disruption
- **技術特徵**:
  - Encrypted file extensions use random 16-character strings
  - Built-in chat interface for ransom negotiation
  - Geopolitical evasion: stops execution when detecting Russian-language systems or Russian geographic location
  - Clean CLI help interface (`-h` parameter) providing flexible attacker configuration
- **影響**: Single-attack capability to disrupt entire virtualized environments; particularly dangerous for organizations running mixed cloud or virtualized infrastructure
- **防護建議**:
  1. Regularly update and patch all operating systems and applications
  2. Deploy behavioral analysis and anomaly monitoring tools
  3. Strengthen security awareness training against ransomware social engineering
  4. Implement strict access controls and isolation policies to limit lateral movement
  5. Regular backups with tested disaster recovery procedures

## 受影響系統
- Windows operating systems
- Linux operating systems
- VMware ESXi hypervisors
- Virtualized infrastructure environments

## 來源連結
- [LockBit 5.0 勒索軟體再度活躍](https://www.twcert.org.tw/tw/cp-104-10458-ee4fb-1.html)

---
> 萃取時間：2026-03-10 UTC
> 資料來源：TWCERT/CC rss-104
