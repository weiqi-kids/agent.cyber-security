| 欄位 | 內容 |
|------|------|
| **標題** | IntelMQ Manager release 2.1.1 fixes critical security issue |
| **來源** | CERT.at (Austria) |
| **發布時間** | 2020-04-28T14:34:25Z |
| **信心度** | 中 |

## 摘要

The IntelMQ Manager version 2.1.1 released yesterday fixes a Remote Code Execution flaw ( CWE-78 : '...

## 事實內容

The IntelMQ Manager version 2.1.1 released yesterday fixes a Remote Code Execution flaw ( CWE-78 : 'OS Command Injection'). The documentation for version 2.1.1 and installation instructions can be found on our GitHub repository . Always run IntelMQ Manager instances in private networks with proper authentication & TLS. Further, restrict access to the tool to web-browsers which can only access internal web-sites, as workaround for existing CSRF issues. See also our security considerations with more details. The issue was discovered by Bernhard Herzog ( Intevation ) during work sponsored by SUNET to fix the missing CSRF protection and migrate the application backend to Python . Update 2020-04-30: This vulnerability has been assigned CVE-2020-11016. This blog post is part of a series of blog ...

## 受影響系統

- 依內容而定（需參閱完整文章）

## 來源連結

- [CERT.at - IntelMQ Manager release 2.1.1 fixes critical security issue](https://www.cert.at/en/blog/2020/4/intelmq-manager-release-211-fixes-critical-security-issue)

## 萃取時間

2026-02-15T00:00:00+08:00
