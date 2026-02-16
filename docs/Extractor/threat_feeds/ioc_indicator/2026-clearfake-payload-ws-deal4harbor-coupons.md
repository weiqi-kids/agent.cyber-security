# ClearFake 恶意软件载荷传递域名 ws.deal4harbor.coupons

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

检测到 ClearFake 恶意软件活动使用的载荷传递域名。ClearFake 是一种恶意软件分发活动，通常通过伪造的浏览器更新提示或系统通知诱骗用户下载并执行恶意软件。该域名使用看似合法的优惠券服务名称（deal4harbor.coupons）来迷惑受害者。

## IoC 指标

| 类型 | 值 |
|------|-----|
| domain | `ws.deal4harbor.coupons` |

## 关联分析

此域名与 ClearFake 恶意软件分发活动相关。ClearFake 活动通常涉及社会工程手段，通过伪造的系统提示诱骗用户下载恶意软件。该域名在 2026-02-15 18:56:48 至 18:56:54 期间活跃。域名使用 WebSocket（ws）协议前缀，可能用于建立持久连接以传递恶意载荷。

## 来源连结

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1748813/)

---
> 萃取时间：2026-02-15 18:56 UTC
> 资料来源：abuse.ch ThreatFox threatfox-recent
