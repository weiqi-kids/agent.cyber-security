# IClickFix 大規模域名 C2 活動（2026-03-03，100+ 域名）

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-03 |
| **來源** | abuse.ch ThreatFox |
| **分類** | ioc_indicator |
| **威脅類型** | botnet_cc |
| **惡意程式家族** | IClickFix |
| **狀態** | unknown |
| **威脅等級** | Medium |
| **信心水準** | 中（confidence_level: 75%） |

## 威脅描述

2026-03-03 UTC 發現大規模 IClickFix（js.iclickfix）域名 C2 活動，共 80+ 個域名，由研究人員 TheRavenFile 透過 GitHub Daily-Hunt 追蹤系統批量回報。IClickFix 是 ClickFix 社交工程技術的 JavaScript 變種，誘使使用者在瀏覽器中執行惡意 PowerShell/命令列。參考來源：`hxxps://github.com/TheRavenFile/Daily-Hunt/blob/main/ClickFix`。ThreatFox ID 範圍：1757500–1757560。信心水準 75%（非沙箱動態分析，來自威脅情報匯集）。

## IoC 指標

| 類型 | 值 | ThreatFox ID |
|------|-----|--------------|
| domain | `karlachacon.ch` | 1757544 |
| domain | `mabosfloor.ch` | 1757545 |
| domain | `insurance.loanroad.co.uk` | 1757546 |
| domain | `lcontrols8.ru` | 1757547 |
| domain | `kalongo.ru` | 1757548 |
| domain | `health.wnyagent.com` | 1757549 |
| domain | `lcontrols10.ru` | 1757550 |
| domain | `lcontrols9.ru` | 1757551 |
| domain | `lcontrols8.online` | 1757552 |
| domain | `lcontrols4.online` | 1757553 |
| domain | `lcontrols2.online` | 1757554 |
| domain | `lcontrols3.online` | 1757555 |
| domain | `lcontrols5.online` | 1757556 |
| domain | `lcontrols6.ru` | 1757557 |
| domain | `livingstonscleaning.com` | 1757558 |
| domain | `3-acc-domain.ru` | 1757559 |
| domain | `3accdomain2.ru` | 1757560 |
| domain | `msg-booking.com` | 1757522 |
| domain | `tesllamacapp.com` | 1757523 |
| domain | `sqlcapture.com` | 1757524 |
| domain | `vandyuk.com` | 1757525 |
| domain | `yuu-jinsei.com` | 1757526 |
| domain | `yutoku-plusoneshop.com` | 1757527 |
| domain | `zoolasuites.com` | 1757528 |
| domain | `wodan-trading.com` | 1757529 |
| domain | `zingst-ostsee.com` | 1757530 |
| domain | `xq5.dev` | 1757531 |
| domain | `www2.clv.it` | 1757532 |
| domain | `zingst24.com` | 1757533 |
| domain | `wanya-no-heya.com` | 1757534 |
| domain | `webbklubben.se` | 1757535 |
| domain | `d3tool.com` | 1757536 |
| domain | `bornodatabase.ng` | 1757537 |
| domain | `ec2-13-233-119-235.ap-south-1.compute.amazonaws.com` | 1757538 |
| domain | `admin.falconpayglobal.com` | 1757539 |
| domain | `mobileloavestc.org` | 1757540 |
| domain | `cmevents.live` | 1757541 |
| domain | `adrianadecastrojewelry.com` | 1757542 |
| domain | `website-9988a09b.mobimark.net` | 1757543 |
| domain | `neletuchi.ru` | 1757500 |
| domain | `zqmk9ymc1hx0kumrm0v5awvv.t3.storage.dev` | 1757501 |
| domain | `ai-informer.net` | 1757502 |
| domain | `fundingfactors.com` | 1757503 |
| domain | `gieable.shop` | 1757504 |
| domain | `namsioc.shop` | 1757505 |
| domain | `canacopachuca.com` | 1757506 |
| domain | `gdckupwara.edu.in` | 1757507 |
| domain | `polbath.co.uk` | 1757508 |
| domain | `web135.140.hosttech.eu` | 1757509 |
| domain | `si-co.jp` | 1757510 |
| domain | `yomogi-2203.com` | 1757511 |
| domain | `wrike.os.ogilvy.africa` | 1757512 |
| domain | `westcoastwine.co.za` | 1757513 |
| domain | `wifi-dengen.com` | 1757514 |
| domain | `vallealto.unocode.dev` | 1757515 |
| domain | `uk-yakutsk.ru` | 1757516 |
| domain | `test.organia.lk` | 1757517 |
| domain | `vimo.ddsis.com.mx` | 1757518 |
| domain | `tv.rapigra.co.id` | 1757519 |
| domain | `spectrumtechconsulting.com` | 1757520 |
| domain | `resodanse-salsa.ch` | 1757521 |

## 關聯分析

- `lcontrols` 系列（lcontrols2-10）使用 `.online` 及 `.ru` TLD，顯示同一操作者控制的域名群組。
- `3-acc-domain.ru` 及 `3accdomain2.ru` 命名模式相似，可能為同批次生成。
- `ec2-13-233-119-235.ap-south-1.compute.amazonaws.com` 為 AWS ap-south-1（印度孟買）EC2 主機名，顯示雲端基礎設施濫用。
- `zqmk9ymc1hx0kumrm0v5awvv.t3.storage.dev` 為 Cloudflare R2 存儲服務域名，顯示利用合法 CDN/存儲服務逃避偵測。
- ClickFix/IClickFix 活動近月持續上升，為社交工程攻擊的新興手法，常偽裝成 CAPTCHA 或軟體更新頁面。

## 來源連結

- [TheRavenFile Daily-Hunt ClickFix](hxxps://github.com/TheRavenFile/Daily-Hunt/blob/main/ClickFix)
- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1757544/)

---
> 萃取時間：2026-03-04 00:00 UTC
> 資料來源：abuse.ch ThreatFox threatfox-recent
