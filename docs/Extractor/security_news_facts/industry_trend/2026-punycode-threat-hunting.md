# Add Punycode to your Threat Hunting Routine

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-20 |
| **來源** | SANS ISC |
| **分類** | industry_trend |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

SANS ISC recommends adding Punycode (IDN) detection to threat hunting via DNS log "xn--" prefix searches, citing spoofed domains using Unicode character substitution.

## 事實內容

SANS ISC guidance on Punycode in threat hunting routines:

**Attack Scenarios Using IDNs:**

Attackers exploit International Domain Names (IDNs) by:
- Substituting visually similar characters from different Unicode sets
- Example: Greek character 'o' replaces Latin 'o' in YouTube spoofs
- Domains appear legitimate to users at first glance

**Detection Methods:**

1. **DNS Log Analysis:**
   - Search logs for "xn--" prefix (appears in all Punycode-encoded domains)
   - Example detected: `in.xn--b1akcbzf.xn--90amc.xn--p1acf`

2. **Python Decoding:**
   ```python
   domain = "xn--yutube-wqf.com"
   decoded = domain.encode("ascii").decode("idna")
   ```

3. **Online Decoder Tools:**
   - Punycode decoders help analysts quickly assess suspicious domains

**Security Recommendations:**

- **Leverage DNS Data:**
  - Quote: "DNS is a goldmine for threat hunting"
  - DNS resolver log collection is essential

- **Monitor Anomalies:**
  - Not all IDNs are malicious
  - Rarity warrants investigation

- **Systematic Approach:**
  - Combine log searching with decoding capabilities
  - Identify obfuscated domain threats

**Reference:**
- RFC3490 (International Domain Names specification)

## 受影響系統

- DNS resolvers
- Threat hunting platforms
- Security monitoring systems

## 來源連結

- [Add Punycode to your Threat Hunting Routine](https://isc.sans.edu/diary/rss/32640)

---
> 萃取時間：2026-01-27 UTC
> 資料來源：SANS ISC sans-isc
