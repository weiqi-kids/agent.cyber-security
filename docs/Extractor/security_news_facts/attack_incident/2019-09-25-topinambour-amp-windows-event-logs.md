# Topinambour &amp; Windows event logs

| Item | Content |
|------|---------|
| **Date** | 2019-09-25 |
| **Source** | CERT.at (Austria) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |


## Summary
TL;DR:

 	Block outgoing SMB traffic if you can.
 	Hunt or Monitor for event ID 106 in "Microsoft-Windows-TaskScheduler%4Operational.evtx".
 	Think...

## Factual Content
TL;DR:

 	Block outgoing SMB traffic if you can.
 	Hunt or Monitor for event ID 106 in "Microsoft-Windows-TaskScheduler%4Operational.evtx".
 	Think about enabling "Audit Process creation" in "Security.evtx" and command line logging.
 	Hunt or monitor for event ID 4688 in "Security.evtx".

While reading through the recent Kaspersky report on the renewed arsenal of the Turla group, I was first getting a little bit frustrated by the fact that it is still too easy for the attackers. After coming over this I focused on the question "How would I detect/hunt for it in Windows event logs?"First of all, according to the report outgoing SMB is used by the dropper to download the next stage. Blocking outgoing SMB is not a new recommendation and while this still fits the "too easy for attackers" category it has nothing to do with event logs and is not the reason behind this blog post. Accepting that security is not only about prevention but also about detection brings us back to the aforementioned question.The dropper function "make_some_noise" generates a new scheduled task on an infected machine to gain persistence. Focusing on Win7+ here, this generates the event ID 106 "Scheduled Task created" in "Microsoft-Windows-TaskScheduler%4Operational.evtx". This log entry includes the time when the task was added, which user added it and the name of the task. If you go hunting for this event ID, make sure you are looking into the right event log file; as far as I know there is no guarantee th

## Source Links
- [Topinambour &amp; Windows event logs](https://www.cert.at/en/blog/2019/7/blog-20190716140317-2501)

---
> Extraction time: 2026-03-07 UTC
> Data source: CERT.at (Austria) 
