# Lock the Ghost: PyPI Package Removal and Dependency Locking

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-10 |
| **來源** | CERT.at (Austria) |
| **分類** | industry_trend |
| **嚴重程度** | 低 |
| **信心水準** | 高 |

## 摘要

CERT.at published a technical analysis on how Python Package Index (PyPI) handles package removals and how developers can protect their projects by locking dependency versions in uv.lock files to prevent supply chain risks from "ghost" packages.

## 事實內容

- PyPI historically treated package lifecycle as binary (exists/does not exist); a "quarantine" status was later introduced to temporarily block package resolution during security investigations
- When a package is "removed" from PyPI, it may not truly be gone — this creates ambiguity and potential security risks for dependency resolution
- The article demonstrates how developers can use `uv.lock` files to pin exact package versions and cryptographic hashes, effectively "locking the ghost" and preventing unexpected package substitution or hijacking
- This technique is relevant to software supply chain security, particularly for organizations that rely on PyPI packages in production environments
- The advisory highlights that users may not intuitively understand the lifecycle states of PyPI packages, making proactive dependency locking essential

## 受影響系統

- Python/PyPI ecosystem
- Projects using `uv` package manager
- Any software supply chain relying on third-party Python packages

## 來源連結

- [Lock the Ghost](https://www.cert.at/en/blog/2026/3/lock-the-ghost)

---
> 萃取時間：2026-03-11 UTC
> 資料來源：cert-at
