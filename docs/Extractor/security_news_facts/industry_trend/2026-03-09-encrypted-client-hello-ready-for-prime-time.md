# Encrypted Client Hello: Ready for Prime Time?

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-09 |
| **來源** | SANS ISC |
| **分類** | industry_trend |
| **嚴重程度** | 資訊 |
| **信心水準** | 高 |

## 摘要

SANS ISC diary entry discussing the publication of two related RFCs for Encrypted Client Hello (ECH), a TLS extension that encrypts the ClientHello message to prevent passive observation of the Server Name Indication (SNI) field, enhancing privacy for HTTPS connections.

## 事實內容

On March 9, 2026, SANS ISC published a diary entry discussing two newly released RFCs related to Encrypted Client Hello (ECH). ECH is a TLS extension designed to encrypt the initial ClientHello handshake message, which traditionally exposes the target hostname (SNI) in plaintext.

ECH has significant implications for:
- **Privacy**: Prevents ISPs, network middleboxes, and passive observers from seeing which specific website a user connects to.
- **Network security monitoring**: Challenges traditional TLS inspection and domain-based filtering approaches.
- **Enterprise security**: May require updates to security tools that rely on SNI visibility for policy enforcement.

The publication of formal RFCs signals that ECH is moving toward broader production deployment.

## 受影響系統

- TLS-based communication systems
- Network monitoring and inspection tools
- DNS infrastructure (ECH relies on DNS HTTPS records)

## 來源連結

- [Encrypted Client Hello: Ready for Prime Time?](https://isc.sans.edu/diary/rss/32778)

---
> 萃取時間：2026-03-10 UTC
> 資料來源：SANS ISC sans-isc
