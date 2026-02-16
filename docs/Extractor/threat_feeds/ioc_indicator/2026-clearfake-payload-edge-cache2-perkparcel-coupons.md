# ClearFake 恶意软件载荷传递域名 edge-cache2.perkparcel.coupons

| 项目 | 内容 |
|------|------|
| **日期** | 2026-02-15 |
| **来源** | abuse.ch ThreatFox |
| **分类** | ioc_indicator |
| **威胁类型** | malware |
| **恶意程序家族** | ClearFake |
| **状态** | online |
| **威胁等级** | High |
| **信心水准** | 高 |

## 威胁描述

检测到 ClearFake 恶意软件活动使用的载荷传递域名。ClearFake 是一种恶意软件分发活动，通常通过伪造的浏览器更新提示或系统通知诱骗用户下载并执行恶意软件。该域名使用看似合法的优惠券服务名称（perkparcel.coupons）和边缘缓存子域名来迷惑受害者。

## IoC 指标

| 类型 | 值 |
|------|-----|
| domain | `edge-cache2.perkparcel.coupons` |

## 关联分析

此域名与 ClearFake 恶意软件分发活动相关。域名使用 "edge-cache" 前缀，试图模仿合法的内容分发网络（CDN）命名惯例，以增加可信度。该域名在 2026-02-15 18:49:16 至 18:50:28 期间活跃。

## 来源连结

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1748812/)

---
> 萃取时间：2026-02-15 18:49 UTC
> 资料来源：abuse.ch ThreatFox threatfox-recent
