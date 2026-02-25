# Abuse.ch URLhaus is a new data feed for our notifications

| 項目 | 內容 |
|------|------|
| **日期** | 2021-01-19 |
| **來源** | CERT.at (Austria) |
| **分類** | attack_incident |
| **嚴重程度** | low |
| **信心水準** | high |

## 摘要
Since Wednesday January 13th, 2021 we are sending data of the URLhaus Feeds of the abuse.ch-project as part of our regular notifications to network owners. The feeds contain URLs to malware files of m...

## 事實內容
Since Wednesday January 13th, 2021 we are sending data of the URLhaus Feeds of the abuse.ch-project as part of our regular notifications to network owners. The feeds contain URLs to malware files of multiple malware families. To our knowledge, the feeds are of very high quality. Any feedback on the new data source, as well as our notifications in general is always welcome. How the feeds can be added to an IntelMQ instance is described in IntelMQ's feeds documentation. We added a few extra processing steps in our IntelMQ-setup due to a few internal requirements. As these configurations might be of interest to you, we will briefly describe our setup in the following section. We have two requirements which add some complexity: The feeds contains the "Dateadded" column, which refers to the first time the malware has been hosted at the given URL (added to the data as "time.source" by the parser). However, we want the "time.source" field to reflect an approximation of the most recent time the malware was still hosted on that URL. Since the data is updated periodically in sufficiently short time intervals, we can apply the following logic (in pseudocode): time.source = time.observation - 1 hour whereas the time.observation refers to the time the data has been fetched by IntelMQ. This results timestamps from when the malware hosting URL was definitely still active. We use both the Country-feed as well as the TLD-feed. As both feeds contain overlapping data, we need to deduplicate it. For the first requirement, two steps are needed as it is currently not possible to achieve this with a single IntelMQ bot. First, we use a modify expert with the following configuration: [ { "rulename": "set time.source to time.observation", "if": {}, "then": { "time.source": "{msg[time.observation]}" } } ] Then we use an additional sieve expert, with the following configuration: if :exists time.source { add! time.source -= '1 hour'} Mathematical operation on datetime objects will be supported in the upcoming IntelMQ release 2.3.0. To deduplicate the combined feeds of country code and TLD, we use the following parameters: filter_keys is set to raw,time.source,time.observation,feed.url filter_type is blacklist With a redis_cache_ttl slightly lower than one day: 82800 seconds Both feeds are collected once per day, initiated by systemd timers. We are using the scheduled run mode and the&nbsp;systemd service generator for this purpose. In summary, the order of bots is as following: Abuse.ch URLhaus Country Feed Collector and Abuse.ch URLhaus TLD Feed Collector Abuse.ch URLhaus Parser Modify Expert Sieve Expert Deduplicator Expert Further processing steps This blog post is part of a series of blog posts related to our&nbsp;CEF Telecom 2018-AT-IA-0111 project, which also supports our participation in the CSIRTs Network.

## 來源連結
- [Abuse.ch URLhaus is a new data feed for our notifications](https://www.cert.at/en/blog/2021/1/abusech-urlhaus-new-data-feed-notifications)

---
> 萃取時間：2026-02-24 UTC
> 資料來源：CERT.at (Austria) cert-at
