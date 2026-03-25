# Hobby hunter notes: PyPI under attack

| Item | Content |
|------|---------|
| **Date** | 2024-03-28 |
| **Source** | CERT.at (Austria) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |


## Summary
When I wrap up at CERT.at, where I mostly work on our notification system (if you&rsquo;re a network operator in Austria and got a misassigned...

## Factual Content
When I wrap up at CERT.at, where I mostly work on our notification system (if you&rsquo;re a network operator in Austria and got a misassigned notification about some security issues &ndash; I might have been involved in that), I sometimes change my hat and explore other &ldquo;cyber&rdquo;-security areas, especially looking for malicious packages in PyPI, a standard Python package repository. The short summary is: there are a lot of them &ndash; but also, don&rsquo;t panic.
It&rsquo;s happening now
Let&rsquo;s start with a rough analysis of a recent campaign that could be named &ldquo;funcaptcha.&rdquo; According to records I was able to access, it started the day before yesterday (26th March) with a package called &ldquo;schubismomv3&rdquo;, but a post on Twitter [0] suggests there might have already been more by the time this gained my attention.
As per my findings, the first version of the package was published around 18:00 on March&nbsp;26th (all timestamps are UTC+1), starting&nbsp;without any active malicious content, but included hate speech and used the name of a well-known security researcher [0].

A sample from first version of &ldquo;schubismomv3&rdquo; package
Over multiple iterations with an apparently &ldquo;trial and error&rdquo; approach (Have you heard about testing your software locally? Or a test environment? No? Sorry, I might be biased. I&rsquo;m primarily a developer.) we ended up with version 1.10.0 published around 20:30. It used classic methods

## Source Links
- [Hobby hunter notes: PyPI under attack](https://www.cert.at/en/blog/2024/3/hobby-hunter-notes-pypi-under-attack)

---
> Extraction time: 2026-03-07 UTC
> Data source: CERT.at (Austria) 
