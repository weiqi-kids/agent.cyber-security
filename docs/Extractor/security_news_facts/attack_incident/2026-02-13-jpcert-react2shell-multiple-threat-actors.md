# Multiple Threat Actors Rapidly Exploit React2Shell (CVE-2025-55182)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-13 |
| **來源** | JPCERT/CC (Japan) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

JPCERT/CC documented multiple threat actors rapidly exploiting CVE-2025-55182 (React2Shell) after its December 2025 disclosure.

## 事實內容

On December 3, 2025 (local time), a vulnerability allowing unauthenticated remote code execution in React Server Components (RSC) was disclosed as CVE-2025-55182. JPCERT/CC received multiple incident reports related to attacks exploiting this vulnerability. Among documented cases, one incident demonstrated the vulnerability being weaponized by multiple distinct threat actor groups simultaneously, making it a case study of rapid active compromise following public disclosure. The speed of exploitation underscores the operational maturity of threat actors in monitoring and weaponizing newly disclosed critical vulnerabilities. CVSS score: 10.0 (Critical).

## 受影響系統

- React Server Components (RSC)
- Applications using React and Next.js server-side rendering
- Web servers running React-based applications

## 來源連結

- [Multiple Threat Actors Rapidly Exploit React2Shell: A Case Study of Active Compromise](https://blogs.jpcert.or.jp/en/2026/02/multiple-threat-actors-rapidly-exploit-react2shell-a-case-study-of-active-compromise.html)

---
> 萃取時間：2026-03-11 UTC
> 資料來源：JPCERT/CC (Japan) jpcert-blog
