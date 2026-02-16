# Operation WrtHug Global Campaign Targets ASUS Routers

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-25 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Global cyber threat campaign "Operation WrtHug" specifically targets ASUS routers, exploiting firmware vulnerabilities to compromise devices.

## 事實內容

Security researchers identified a coordinated global campaign named "Operation WrtHug" targeting ASUS router users.

**Attack Characteristics:**
- Targets specific ASUS router models with known firmware vulnerabilities
- Exploits weak default credentials and unpatched security flaws
- Compromised routers used for botnet operations and network infiltration
- Enables attackers to intercept traffic, modify DNS settings, and establish persistent access

**Targeted ASUS Router Models:**
Multiple ASUS consumer and small business router models identified as targets, particularly those running outdated firmware versions.

**Attack Objectives:**
1. Building distributed botnet infrastructure
2. Traffic interception and man-in-the-middle attacks
3. DNS hijacking to redirect users to malicious sites
4. Lateral movement into connected networks
5. Cryptomining malware deployment

**Mitigation Recommendations:**
1. **Immediate Firmware Update**: Update ASUS routers to latest firmware versions
2. **Change Default Credentials**: Replace factory default admin passwords with strong, unique passwords
3. **Disable Remote Management**: Turn off WAN-side remote administration unless absolutely necessary
4. **Network Segmentation**: Isolate IoT devices including routers from critical systems
5. **Enable Auto-Update**: Configure automatic firmware updates if available
6. **Regular Security Audits**: Periodically review router configuration and connected devices

## 受影響系統

- ASUS consumer routers (various models)
- ASUS small business routers
- Devices running outdated firmware
- Routers with default credentials

## 來源連結

- [全球網路威脅活動「Operation WrtHug」鎖定華碩 (ASUS) 路由器，呼籲用戶立即更新韌體](https://www.twcert.org.tw/tw/cp-104-10522-ff0b9-1.html)

---
> 萃取時間: 2026-02-16 00:00 UTC
> 資料來源: TWCERT/CC rss-104
> 備註: Original language: zh-TW (Traditional Chinese)
