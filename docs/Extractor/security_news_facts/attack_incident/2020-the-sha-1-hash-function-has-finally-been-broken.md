# The SHA-1 hash function has finally been broken

| 項目 | 內容 |
|------|------|
| **日期** | 2020-02-06 |
| **來源** | NCSC-FI Security Now! |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

Information technology uses various checksums to verify data integrity. For example, when an operating system update file is downloaded to a computer, its checksum is verified before installation. This occurs several times automatically without the user even noticing. Checksums are generated using cryptographic hash functions. There are different kinds of...

## 事實內容

Information technology uses various checksums to verify data integrity. For example, when an operating system update file is downloaded to a computer, its checksum is verified before installation. This occurs several times automatically without the user even noticing. Checksums are generated using cryptographic hash functions. There are different kinds of hash functions. One of these is SHA-1 (Secure Hash Algorithm 1), which has been widely used in digital signatures since 1995. A practical attack against the SHA-1 hash function has been released, and therefore it should no longer be used to verify integrity.

## 受影響系統

- General systems

## 來源連結

- [The SHA-1 hash function has finally been broken](https://www.kyberturvallisuuskeskus.fi/en/news/sha-1-hash-function-has-finally-been-broken)

---
> 萃取時間：2026-01-27 04:07 UTC
> 資料來源：NCSC-FI Security Now! (ncsc-fi-secnow)
