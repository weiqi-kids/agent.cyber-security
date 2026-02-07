# How We Cover Your Back

| 項目 | 內容 |
|------|------|
| **日期** | 2024-06-10 |
| **來源** | CERT.at (Austria) |
| **分類** | industry_trend |
| **嚴重程度** | 未評估 |
| **信心水準** | 高 |

## 摘要

CERT.at explains operational approach to proactive threat notification, processing 90,000 daily events to send 3,000-4,000 monthly security alerts.

## 事實內容

CERT.at protects Austrian organizations through proactive notification of security threats identified through partner data feeds and incident reports.

**Operational Scale:**
- Processes approximately 90,000 daily security events from partner organizations
- Sends 3,000-4,000 notifications monthly via email to affected organizations
- Primary data partner: ShadowServer Foundation and other trusted security researchers

**Technical Infrastructure:**

**IntelMQ Platform:**
CERT.at uses IntelMQ, an open-source automated data processing platform, to standardize and deduplicate security alerts from multiple sources. This enables efficient handling of high-volume security data.

**Data Sources:**
CERT.at does not independently scan internet-facing devices due to resource constraints and legal complexities. Instead, they rely on partner organizations conducting legally-compliant scans under established frameworks.

**Workflow:**

**Coordination Team:**
Evaluates urgent incidents reported by security researchers and determines appropriate response actions.

**Analysis Team:**
Assesses data relevance, identifies affected device operators through RIPE Database lookups, and maintains internal contact lists for notification delivery.

**Notification Process:**
Affected organizations receive email notifications with technical details prompting patching or access restrictions. Follow-up notifications sent every 30 days for unresolved issues.

**Emerging Infrastructure:**

**Constituency Portal:**
CERT.at is developing a self-service portal enabling organizations to:
- Manage abuse contact information
- Customize notification preferences
- Track historical security alerts
- Improve reachability when RIPE Database contact information is outdated

**Key Principle:**
CERT.at emphasizes that constituents remain ultimately responsible for their services' security. CERT.at provides information and guidance; organizations must implement fixes.

This operational model balances automation (handling high volumes) with human expertise (evaluating complex incidents).

## 受影響系統

- Austrian organizations with internet-facing systems
- IntelMQ platform (open-source)
- RIPE Database for contact lookups
- CERT.at Constituency Portal (in development)

## 來源連結

- [How We Cover Your Back](https://www.cert.at/en/blog/2024/6/how-we-cover-your-back)

---
> 萃取時間: 2026-01-27 00:00 UTC
> 資料來源: CERT.at (Austria) cert-at
