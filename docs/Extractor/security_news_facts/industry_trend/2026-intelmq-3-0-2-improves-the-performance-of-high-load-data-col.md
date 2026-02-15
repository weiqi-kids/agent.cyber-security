| 欄位 | 內容 |
|------|------|
| **標題** | IntelMQ 3.0.2 improves the performance of high-load data collection |
| **來源** | CERT.at (Austria) |
| **發布時間** | 2021-09-13T08:02:03Z |
| **信心度** | 中 |

## 摘要

Shortly after the 3.0.1 release, an IntelMQ user reported general performance issues, which we inves...

## 事實內容

Shortly after the 3.0.1 release, an IntelMQ user reported general performance issues, which we investigated over the following days. We identified two causes for them at the heart of IntelMQ: As it turned out, they just affected the data feed-collection components "collectors" with high load (streaming data or just a few big reports were not a problem) or those which use threading (receiving API collector and STOMP collector ). Due to the nature of these bugs they were imminent only in bigger and/or more complex setups. Both issues stemmed from complex overhauls in IntelMQ's core in IntelMQ 3.0 . The new version 3.0.2 was released last Friday, September 10th, and is available on GitHub , PyPI , in the deb/rpm repositories and on DockerHub . This blog post is part of a series of blog posts ...

## 受影響系統

- 依內容而定（需參閱完整文章）

## 來源連結

- [CERT.at - IntelMQ 3.0.2 improves the performance of high-load data collection](https://www.cert.at/en/blog/2021/9/intelmq-302-improves-the-performance-of-high-load-data-collection)

## 萃取時間

2026-02-15T00:00:00+08:00
