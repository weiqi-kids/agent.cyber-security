# IntelMQ 3.2.1 bug fix released

| 項目 | 內容 |
|------|------|
| **日期** | 2023-08-29 |
| **來源** | CERT.at (Austria) |
| **分類** | other |
| **嚴重程度** | unknown |
| **信心水準** | high |

## 摘要
IntelMQ, an open-source security feeds processing tools, has just got a new release to fix two recently discovered bugs. One was introduced in the last 3.2.0 and prevents bots from stopping after bein...

## 事實內容
IntelMQ, an open-source security feeds processing tools, has just got a new release to fix two recently discovered bugs. One was introduced in the last 3.2.0 and prevents bots from stopping after being reloaded. As reloading is used in our default configuration for logrotate service, it affects most instances with the IntelMQ 3.2.0. If after the upgrade you still cannot stop your bot, please manually kill the bot's process and start it again. The second bug was discovered in the Reverse DNS Expert bot, which was incorrectly caching findings for one IP as if they were for the /24-prefixed subnet. As usuall, you can get the last IntelMQ from GitHub, PyPI, deb repository and Docker Hub. Unfortunately, the 3.2.x API package for Ubuntu 22.04 is still delayed. Do not hesitate to share your feedback with the IntelMQ Community on GitHub issues or the IntelMQ users mailing list. This blog post is part of a series of blog posts related to our 2020-AT-IA-0254 project, which also support our participation in the CSIRTs Network.

## 來源連結
- [IntelMQ 3.2.1 bug fix released](https://www.cert.at/en/blog/2023/8/intelmq-321-bug-fix-released)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：CERT.at (Austria) cert-at
