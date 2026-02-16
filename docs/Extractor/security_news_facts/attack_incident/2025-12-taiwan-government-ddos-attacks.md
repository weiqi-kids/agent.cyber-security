# Taiwan Government Websites Targeted by Large-Scale DDoS Attacks

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-04 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Multiple Taiwan government websites experienced coordinated DDoS attacks causing service disruptions, with continuous attack patterns observed.

## 事實內容

TWCERT/CC detected a coordinated distributed denial-of-service (DDoS) campaign targeting Taiwan government websites in early December 2025.

**Attack Characteristics:**
1. **Targets**: Multiple government agency websites including administrative and public service portals
2. **Attack Method**:
   - Volumetric DDoS attacks using botnet traffic
   - Application-layer attacks targeting specific web services
   - Peak traffic volumes exceeding normal capacity by 50-100x
3. **Impact**:
   - Temporary service unavailability for affected websites
   - Slow response times for legitimate users
   - Disruption of online public services
4. **Duration**: Sustained attacks over multiple days with varying intensity

**Attack Patterns:**
- Coordinated timing suggesting organized threat actors
- Use of compromised devices in botnet networks
- Combination of volumetric and application-layer techniques
- Attack traffic originating from multiple geographic regions

**Response Measures:**
- Emergency traffic filtering and rate limiting deployed
- Cloud-based DDoS mitigation services activated
- Coordination between affected agencies and ISPs
- Continuous monitoring and attack pattern analysis

**Defensive Recommendations:**
1. **Immediate Actions**:
   - Deploy DDoS mitigation services (cloud-based scrubbing)
   - Implement rate limiting and traffic filtering
   - Enable CDN services for static content delivery
   - Configure geo-blocking for suspicious regions

2. **Long-term Measures**:
   - Establish DDoS response playbooks
   - Conduct regular capacity planning and stress testing
   - Implement multi-tier DDoS protection architecture
   - Maintain backup communication channels

3. **Monitoring**:
   - Deploy real-time traffic analysis tools
   - Establish baseline traffic patterns
   - Configure automated alerting for anomalies
   - Coordinate with national CERT for threat intelligence

**Attribution Challenges:**
Attack attribution remains difficult due to:
- Use of compromised devices and proxy networks
- Spoofed source addresses
- Distributed attack infrastructure
- Lack of clear indicators of specific threat actors

## 受影響系統

- Taiwan government agency websites
- Public service online portals
- Administrative information systems
- Citizen-facing web applications

## 來源連結

- [我國政府機關網站遭受大規模DDoS攻擊](https://www.twcert.org.tw/tw/cp-104-10546-89f7a-1.html)

---
> 萃取時間: 2026-02-16 00:00 UTC
> 資料來源: TWCERT/CC rss-104
> 備註: Original language: zh-TW (Traditional Chinese)
