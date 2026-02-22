# Japanese-Language Phishing Emails

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-21 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

SANS ISC documented a phishing campaign targeting Japanese-speaking users, impersonating ANA, DHL, and myTOKYOGAS. All emails share common X-mailer signature and use .cn domains.

## 事實內容

### 攻擊概述

Brad Duncan from SANS Internet Storm Center documented a year-long phishing campaign targeting Japanese-speaking users. The campaign impersonates three legitimate Japanese businesses:

1. **All Nippon Airways (ANA)** - Japanese airline
2. **DHL** - Shipping/logistics company
3. **myTOKYOGAS** - Utilities company

Despite targeting Japanese recipients, the campaign casts a "wide net that reaches non-Japanese speakers."

### 攻擊手法

**Common Technical Indicators:**
- All emails use `.cn` (China) top-level domains for both sending addresses and phishing URLs
- Identical X-mailer signature: "Foxmail 6, 13, 102, 15 [cn]"
- Timestamps showing +0800 timezone offset
- Author noted these are "easily caught by spam filters"

### 技術細節

**Example 1 (ANA impersonation):**
- Source: ncqjw[.]cn (150.5.129[.]136)
- Phishing URL: hxxps[:]//branchiish.aayjlc[.]cn/amcmembr_Loginam/

**Example 2 (DHL impersonation):**
- Source: obpwnrl[.]cn (101.47.78[.]193)  
- Phishing URL: hxxps[:]//decideosity.ykdyrkye[.]cn/portal_login_exp/getQuoteTab/

**Example 3 (myTOKYOGAS impersonation):**
- Source: cwqfvzp[.]cn (150.5.130[.]42)
- Phishing URL: hxxps[:]//impactish.rexqm[.]cn/mtgalogin/

### 關鍵發現

The X-mailer header is identified as "the most telling indicator" linking all emails to a single threat group. The researcher expressed curiosity about campaign effectiveness given the targeting approach.

## 受影響系統

- Japanese-speaking users
- Customers of ANA, DHL, and myTOKYOGAS

## IOCs (Indicators of Compromise)

**Sending Domains:**
- ncqjw[.]cn (150.5.129[.]136)
- obpwnrl[.]cn (101.47.78[.]193)
- cwqfvzp[.]cn (150.5.130[.]42)

**Phishing URLs:**
- branchiish.aayjlc[.]cn
- decideosity.ykdyrkye[.]cn
- impactish.rexqm[.]cn

**X-mailer Signature:**
- Foxmail 6, 13, 102, 15 [cn]

## 來源連結

- [Japanese-Language Phishing Emails](https://isc.sans.edu/diary/rss/32734)

---
> 萃取時間：2026-02-22 00:30 UTC  
> 資料來源：SANS ISC (sans-isc)  
> 補充方式：WebFetch
