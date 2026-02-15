| 欄位 | 內容 |
|------|------|
| **標題** | Topinambour &amp; Windows event logs |
| **來源** | CERT.at (Austria) |
| **發布時間** | 2019-09-25T13:41:44Z |
| **信心度** | 中 |

## 摘要

TL;DR: Block outgoing SMB traffic if you can. Hunt or Monitor for event ID 106 in "Microsoft-Windows...

## 事實內容

TL;DR: Block outgoing SMB traffic if you can. Hunt or Monitor for event ID 106 in "Microsoft-Windows-TaskScheduler%4Operational.evtx". Think about enabling "Audit Process creation" in "Security.evtx" and command line logging. Hunt or monitor for event ID 4688 in "Security.evtx". While reading through the recent Kaspersky report on the renewed arsenal of the Turla group, I was first getting a little bit frustrated by the fact that it is still too easy for the attackers. After coming over this I focused on the question "How would I detect/hunt for it in Windows event logs?" First of all, according to the report outgoing SMB is used by the dropper to download the next stage. Blocking outgoing SMB is not a new recommendation and while this still fits the "too easy for attackers" category it ha...

## 受影響系統

- 依內容而定（需參閱完整文章）

## 來源連結

- [CERT.at - Topinambour &amp; Windows event logs](https://www.cert.at/en/blog/2019/7/blog-20190716140317-2501)

## 萃取時間

2026-02-15T00:00:00+08:00
