# Operation WrtHug Targets ASUS Routers Globally via AiCloud Vulnerabilities

| 項目 | 內容 |
|------|------|
| **日期** | 2025-11-25 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | High |
| **信心水準** | 中 |

## 摘要
SecurityScorecard's STRIKE team disclosed "Operation WrtHug," a large-scale campaign targeting ASUS routers worldwide by exploiting known OS command injection vulnerabilities in AiCloud services. Over 50,000 IP-addressed devices have been compromised globally in the past six months and recruited into a botnet for further cyber operations.

## 事實內容
- **攻擊活動代號**: Operation WrtHug
- **發現者**: SecurityScorecard STRIKE team
- **目標**: ASUS routers with AiCloud service enabled
- **利用漏洞**: Known OS command injection vulnerabilities (e.g., CVE-2023-39780)
- **受影響型號** (8 models identified):
  1. ASUS 4G-AC55U
  2. ASUS 4G-AC860U
  3. ASUS DSL-AC68U
  4. ASUS GT-AC5300
  5. ASUS GT-AX11000
  6. ASUS RT-AC1200HP
  7. ASUS RT-AC1300GPLUS
  8. ASUS RT-AC1300UHP
- **感染規模**: Over 50,000 IP devices compromised globally in past 6 months
- **攻擊後果**: Backdoor implantation; compromised devices join a global botnet used for further cyber threat operations and espionage
- **緩解措施**:
  1. Immediately update router firmware to latest version
  2. Replace end-of-life (EoL) routers that can no longer receive updates
  3. Consult ASUS Product Security Advisory at https://www.asus.com/content/asus-product-security-advisory/

## 受影響系統
- ASUS routers (8 specific models listed above)
- Any ASUS router with AiCloud service enabled

## 來源連結
- [全球網路威脅活動「Operation WrtHug」鎖定華碩路由器](https://www.twcert.org.tw/tw/cp-104-10522-ff0b9-1.html)

---
> 萃取時間：2026-03-10 UTC
> 資料來源：TWCERT/CC rss-104
