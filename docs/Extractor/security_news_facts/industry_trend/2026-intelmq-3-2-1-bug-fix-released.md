| 欄位 | 內容 |
|------|------|
| **標題** | IntelMQ 3.2.1 bug fix released |
| **來源** | CERT.at (Austria) |
| **發布時間** | 2023-08-29T10:53:36Z |
| **信心度** | 中 |

## 摘要

IntelMQ, an open-source security feeds processing tools, has just got a new release to fix two recen...

## 事實內容

IntelMQ, an open-source security feeds processing tools, has just got a new release to fix two recently discovered bugs. One was introduced in the last 3.2.0 and prevents bots from stopping after being reloaded. As reloading is used in our default configuration for logrotate service, it affects most instances with the IntelMQ 3.2.0. If after the upgrade you still cannot stop your bot, please manually kill the bot's process and start it again. The second bug was discovered in the Reverse DNS Expert bot, which was incorrectly caching findings for one IP as if they were for the /24-prefixed subnet. As usuall, you can get the last IntelMQ from GitHub , PyPI , deb repository and Docker Hub . Unfortunately, the 3.2.x API package for Ubuntu 22.04 is still delayed. Do not hesitate to share your fe...

## 受影響系統

- 依內容而定（需參閱完整文章）

## 來源連結

- [CERT.at - IntelMQ 3.2.1 bug fix released](https://www.cert.at/en/blog/2023/8/intelmq-321-bug-fix-released)

## 萃取時間

2026-02-15T00:00:00+08:00
