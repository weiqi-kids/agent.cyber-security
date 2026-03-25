# Abuse.ch URLhaus is a new data feed for our notifications

| Item | Content |
|------|---------|
| **Date** | 2021-01-19 |
| **Source** | CERT.at (Austria) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |


## Summary
Since Wednesday January 13th, 2021 we are sending data of the URLhaus Feeds of the abuse.ch-project as part of our regular notifications to network...

## Factual Content
Since Wednesday January 13th, 2021 we are sending data of the URLhaus Feeds of the abuse.ch-project as part of our regular notifications to network owners. The feeds contain URLs to malware files of multiple malware families. To our knowledge, the feeds are of very high quality. Any feedback on the new data source, as well as our notifications in general is always welcome.
How the feeds can be added to an IntelMQ instance is described in IntelMQ's feeds documentation. We added a few extra processing steps in our IntelMQ-setup due to a few internal requirements. As these configurations might be of interest to you, we will briefly describe our setup in the following section.
We have two requirements which add some complexity:

The feeds contains the "Dateadded" column, which refers to the first time the malware has been hosted at the given URL (added to the data as "time.source" by the parser). However, we want the "time.source" field to reflect an approximation of the most recent time the malware was still hosted on that URL. Since the data is updated periodically in sufficiently short time intervals, we can apply the following logic (in pseudocode): time.source = time.observation - 1 hour whereas the time.observation refers to the time the data has been fetched by IntelMQ. This results timestamps from when the malware hosting URL was definitely still active.
We use both the Country-feed as well as the TLD-feed. As both feeds contain overlapping data, we need to deduplica

## Source Links
- [Abuse.ch URLhaus is a new data feed for our notifications](https://www.cert.at/en/blog/2021/1/abusech-urlhaus-new-data-feed-notifications)

---
> Extraction time: 2026-03-07 UTC
> Data source: CERT.at (Austria) 
