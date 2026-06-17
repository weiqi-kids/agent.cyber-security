# 資料源探索紀錄

## 已採用

| 資料源 | 類型 | 對應 Layer | feed_id / source_id | 採用日期 | 備註 |
|--------|------|------------|---------------------|----------|------|
| TWCERT/CC 資安新聞 RSS (RSS-104) | RSS | L1 security_news_facts | rss-104 | 2026-01-26 | 每日更新，資安新聞與事件 |
| TWCERT/CC TVN 漏洞公告中文 RSS (RSS-132) | RSS | L2 vulnerability_tracking | rss-132 | 2026-01-26 | 每日更新，台灣漏洞公告中文版 |
| TWCERT/CC TVN 漏洞公告英文 RSS (RSS-139) | RSS | L2 vulnerability_tracking | rss-139 | 2026-01-26 | 每日更新，台灣漏洞公告英文版 |
| CISA (USA) | RSS | L1 security_news_facts | cisa | 2026-01-27 | 美國 CISA 公告 |
| Canadian Centre for Cyber Security - News | Atom | L1 security_news_facts | ca-news | 2026-01-27 | 加拿大新聞（Atom 格式） |
| Canadian Centre for Cyber Security - Alerts | Atom | L2 vulnerability_tracking | ca-alerts | 2026-01-27 | 加拿大安全警報（Atom 格式） |
| CERT.at (Austria) | RSS | L1 security_news_facts | cert-at | 2026-01-27 | 奧地利 CERT Blog |
| CERT.LV (Latvia) | RSS | L1 security_news_facts | cert-lv | 2026-01-27 | 拉脫維亞 CERT |
| JPCERT/CC Blog (Japan) | Atom | L1 security_news_facts | jpcert-blog | 2026-01-27 | 日本 JPCERT Blog（Atom 格式） |
| JPCERT/CC (Japan) | RDF/RSS | L2 vulnerability_tracking | jpcert | 2026-01-27 | 日本 JPCERT 漏洞公告（RDF 格式） |
| NCSC-FI (Finland) | RSS | L1 security_news_facts | ncsc-fi | 2026-01-27 | 芬蘭 NCSC |
| NCSC-FI Daily News (Finland) | RSS | L1 security_news_facts | ncsc-fi-news | 2026-01-27 | 芬蘭 NCSC 每日新聞 |
| NCSC-FI Security Now! (Finland) | RSS | L1 security_news_facts | ncsc-fi-secnow | 2026-01-27 | 芬蘭 NCSC Security Now |
| NCSC-FI Vulnerabilities (Finland) | RSS | L2 vulnerability_tracking | ncsc-fi-vulns | 2026-01-27 | 芬蘭 NCSC 漏洞公告 |
| SANS ISC | RSS | L1 security_news_facts | sans-isc | 2026-01-27 | SANS 網際網路風暴中心 |
| UK NCSC | RSS | L1 security_news_facts | uk-ncsc | 2026-01-27 | 英國國家網路安全中心 |
| CERT.br (Brazil) | RSS | L1 security_news_facts | cert-br | 2026-01-27 | 巴西 CERT（葡萄牙文） |
| CERT-EE (Estonia) | RSS | L1 security_news_facts | cert-ee | 2026-01-27 | 愛沙尼亞 CERT（愛沙尼亞文） |
| CERT-FR (France) | RSS | L1 security_news_facts | cert-fr | 2026-01-27 | 法國 CERT（法文） |
| CERT.hr (Croatia) | RSS | L1 security_news_facts | cert-hr | 2026-01-27 | 克羅埃西亞 CERT（克羅埃西亞文） |
| CERT-SE (Sweden) | RSS | L1 security_news_facts | cert-se | 2026-01-27 | 瑞典 CERT（瑞典文） |
| CERT-UA (Ukraine) | RSS | L1 security_news_facts | cert-ua | 2026-01-27 | 烏克蘭 CERT（烏克蘭文） |
| CERT.RO (Romania) | RSS | L1 security_news_facts | cert-ro | 2026-01-27 | 羅馬尼亞 CERT（羅馬尼亞文） |
| CNCS Portugal | RSS | L1 security_news_facts | cncs-pt | 2026-01-27 | 葡萄牙 CNCS（葡萄牙文） |
| NSM NCSC (Norway) | RSS | L1 security_news_facts | nsm-ncsc | 2026-01-27 | 挪威 NSM NCSC（挪威文） |
| NUKIB (Czech Republic) | RSS | L1 security_news_facts | nukib | 2026-01-27 | 捷克 NUKIB（捷克文） |
| SK-CERT (Slovakia) | RSS | L1 security_news_facts | sk-cert | 2026-01-27 | 斯洛伐克 CERT（斯洛伐克文） |
| CERT.PL (Poland) | RSS | L2 vulnerability_tracking | cert-pl | 2026-01-27 | 波蘭 CERT |
| GovCERT.HK (Hong Kong) | RSS | L2 vulnerability_tracking | govcert-hk | 2026-01-27 | 香港政府 CERT |
| HKCERT (Hong Kong) | RSS | L2 vulnerability_tracking | hkcert | 2026-01-27 | 香港電腦保安事故協調中心 |
| Microsoft MSRC RSS | RSS | L2 vulnerability_tracking | msrc | 2026-01-27 | 微軟安全更新指南 |
| NCSC-NL (Netherlands) | RSS | L2 vulnerability_tracking | ncsc-nl | 2026-01-27 | 荷蘭 NCSC 安全建議 |
| NIST NVD CVE API | API | L2 vulnerability_tracking | nvd-cve | 2026-01-27 | 最近 7 天修改的 CVE |
| FIRST EPSS | API | L2 vulnerability_tracking | epss-top | 2026-01-27 | 今日 EPSS Top 100 |
| GitHub Security Advisories | API | L2 vulnerability_tracking | gh-advisories | 2026-01-27 | 最近更新的安全建議 |
| Exploit-DB | RSS | L3 exploit_intelligence | exploit-db | 2026-01-27 | 公開漏洞利用程式碼 |
| CISA KEV (USA) | JSON | L3 exploit_intelligence | cisa-kev | 2026-01-27 | 美國已知被利用漏洞清單（免費） |
| PoC-in-GitHub | API | L3 exploit_intelligence | poc-github | 2026-01-27 | GitHub 公開 PoC 追蹤（nomi-sec） |
| Nuclei Templates | API | L3 exploit_intelligence | nuclei-templates | 2026-01-27 | ProjectDiscovery 漏洞偵測模板 |
| VulnCheck KEV | API | L3 exploit_intelligence | vulncheck-kev | 2026-01-27 | 已知被利用漏洞清單（需 API key） |
| abuse.ch URLhaus | API | L4 threat_feeds | urlhaus-recent | 2026-01-27 | 惡意 URL 資料庫 |
| abuse.ch MalwareBazaar | API | L4 threat_feeds | malwarebazaar-recent | 2026-01-27 | 惡意程式樣本 |
| abuse.ch ThreatFox | API | L4 threat_feeds | threatfox-recent | 2026-01-27 | IoC 分享平台 |
| abuse.ch Feodo Tracker | API | L4 threat_feeds | feodo-c2 | 2026-01-27 | C2 伺服器追蹤 |

## 評估中

> 由 GitHub Action 每日自動檢查連線狀態。連續失敗 30 天標記為「待排除」，由 Claude CLI 執行排除。

| 資料源 | 類型 | URL | 語言 | 發現日期 | 狀態 | 最後檢查 | 連續失敗 | 最後成功 |
|--------|------|-----|------|----------|------|----------|----------|----------|
| AusCERT (Australia) | RSS | https://auscert.org.au/rss/bulletins/ | EN | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| BGD e-GOV CIRT (Bangladesh) | RSS | https://www.cirt.gov.bd/feed/ | EN | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| CERT.BE (Belgium) | RSS | https://cert.be/en/rss | EN | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| DKCERT (Denmark) | RSS | https://www.cert.dk/nyheder/rss | 非英文 | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| CERT-EU (EU) | RSS | https://cert.europa.eu/cert/Data/newsletter/reviewlatest-SecurityBulletins.xml | EN | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| NCSC Hungary (Hungary) | RSS | https://nki.gov.hu/figyelmeztetesek/riasztas/feed/ | 非英文 | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| CERT-IL (Israel) | RSS | https://www.gov.il/he/api/PublicationApi/rss/4bcc13f5-fed6-4b8c-b8ee-7bf4a6bc81c8 | 非英文 | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| CSIRT Italia (Italy) | RSS | https://csirt.gov.it/data/indexer/rss | 非英文 | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| NISSA (Libya) | RSS | https://nissa.gov.ly/ | 非英文 | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| NCSC NL News (Netherlands) | RSS | https://feeds.english.ncsc.nl/news.rss | EN | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| SingCERT (Singapore) | RSS | https://www.csa.gov.sg/Content/RSS-Feed | EN | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| CCN-CERT News (Spain) | RSS | https://www.ccn-cert.cni.es/component/obrss/rss-noticias.feed | 非英文 | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| CCN-CERT Vulns (Spain) | RSS | https://www.ccn-cert.cni.es/component/obrss/rss-ultimas-vulnerabilidades.feed | EN | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| Swiss GovCERT (Switzerland) | RSS | https://www.govcert.ch/blog/rss.xml | EN | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |
| Swiss GovCERT Whitepapers (Switzerland) | RSS | https://www.govcert.ch/whitepapers/rss.xml | EN | 2026-01-27 | 連線失敗 | 2026-04-04 | 2 | 從未 |

## 已排除

| 資料源 | 類型 | 排除原因 | 排除日期 | 重新評估時間 |
|--------|------|----------|----------|--------------|
| DZ-CERT (Algeria) | RSS | 最新資料為 2015 年，已停止更新 | 2026-01-27 | 2026-07-27 |
| EG-CERT (Egypt) | RSS | Feed 存在但 0 筆資料 | 2026-01-27 | 2026-07-27 |
| SI-CERT (Slovenia) | RSS | 最新資料為 2021 年，已停止更新 | 2026-01-27 | 2026-07-27 |
| Microsoft MSRC Security Update Guide (Web) | Web | 已被 MSRC RSS 覆蓋（L2 msrc） | 2026-01-27 | — |
| NIST NVD Data Feeds | JSON Feed | 已被 NVD CVE API 覆蓋（L2 nvd-cve） | 2026-01-27 | — |
| VulnCheck KEV Community | API | 已被 VulnCheck KEV API 覆蓋（L3 vulncheck-kev） | 2026-01-27 | — |
| abuse.ch URLhaus Feeds | Feed | 已被 URLhaus API 覆蓋（L4 urlhaus-recent） | 2026-01-27 | — |
| Spamhaus DROP | Blocklist | IP blocklist 純文字格式，非 RSS/API，需另建解析機制，優先級低 | 2026-01-27 | 2026-07-27 |
| OSV (Open Source Vulnerabilities) | API | 需 POST query 查詢，無「最近更新」端點，整合成本高 | 2026-01-27 | 2026-07-27 |
| OSV REST API | API | 與 OSV API 重複，擇一即可 | 2026-01-27 | — |
