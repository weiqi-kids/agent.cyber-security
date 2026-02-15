# Operation WrtHug: Global Campaign Targeting ASUS Routers

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-25 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

SecurityScorecard STRIKE team revealed Operation WrtHug campaign targeting ASUS routers globally, exploiting known vulnerabilities to infect 50,000+ devices for botnet operations.

## 事實內容

SecurityScorecard's STRIKE team released an important report revealing "Operation WrtHug," a large-scale network operation targeting ASUS-related routers globally. The campaign exploits known vulnerabilities to turn infected devices into tools for global network threat activities.

**Attack Target:**
Primarily focuses on small/home routers, currently observed concentrating on ASUS brand. Attackers target ASUS devices' AiCloud service, exploiting a series of publicly disclosed OS Command Injection vulnerabilities (e.g., related to CVE-2023-39780) as initial access points.

**Affected ASUS Router Models (8 total):**
1. ASUS Wireless Router 4G-AC55U
2. ASUS Wireless Router 4G-AC860U
3. ASUS Wireless Router DSL-AC68U
4. ASUS Wireless Router GT-AC5300
5. ASUS Wireless Router GT-AX11000
6. ASUS Wireless Router RT-AC1200HP
7. ASUS Wireless Router RT-AC1300GPLUS
8. ASUS Wireless Router RT-AC1300UHP

**Attack Impact:**
Once routers successfully compromised, hackers plant backdoor programs, making devices join a massive global infection network used for launching further network threat activities and espionage operations. STRIKE team identified over 50,000 infected IP devices globally in past six months.

**Key Security Considerations:**
Attackers exploit publicly known vulnerabilities with available patches. Since all exploited vulnerabilities are publicly disclosed with patches available, ensuring device security is crucial.

**Recommended Mitigations (3 Critical Steps):**
1. **Firmware Updates Are Critical:** Update router firmware to latest version immediately. This is most direct method to patch known vulnerabilities and prevent intrusion.
2. **Check and Replace EoL Devices:** If using "End-of-Life" (EoL) old ASUS routers that cannot update firmware, consider replacing these legacy devices with officially supported new products.
3. **Consult Official Resources:** ASUS security team provided official mitigation steps for all vulnerabilities involved in Operation WrtHug (https://www.asus.com/content/asus-product-security-advisory/). Users must review ASUS Product Security Advisory or relevant FAQs for most accurate protection information.

## 受影響系統

- ASUS 4G-AC55U, 4G-AC860U routers
- ASUS DSL-AC68U router
- ASUS GT-AC5300, GT-AX11000 routers
- ASUS RT-AC1200HP, RT-AC1300GPLUS, RT-AC1300UHP routers
- ASUS AiCloud service

## 來源連結

- [全球網路威脅活動「Operation WrtHug」鎖定華碩 (ASUS) 路由器，呼籲用戶立即更新韌體](https://www.twcert.org.tw/tw/cp-104-10522-ff0b9-1.html)

---
> 萃取時間: 2026-02-15 23:32 UTC
> 資料來源: TWCERT/CC rss-104
