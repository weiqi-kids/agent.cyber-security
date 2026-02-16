# ClearFake 恶意软件载荷传递域名 internal-promo-zone.perkparcel.coupons

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

检测到 ClearFake 恶意软件活动使用的载荷传递域名。ClearFake 是一种恶意软件分发活动，通常通过伪造的浏览器更新提示或系统通知诱骗用户下载并执行恶意软件。该域名使用看似合法的优惠券服务名称（perkparcel.coupons）和内部促销区域子域名来迷惑受害者。

## IoC 指标

| 类型 | 值 |
|------|-----|
| domain | `internal-promo-zone.perkparcel.coupons` |

## 关联分析

此域名与 ClearFake 恶意软件分发活动相关，与 edge-cache2.perkparcel.coupons 属于同一基础域名（perkparcel.coupons）的不同子域名，显示攻击者建立了多个载荷传递节点以提高可靠性。该域名在 2026-02-15 18:37:54 至 18:39:06 期间活跃。域名使用 "internal-promo-zone" 前缀，试图模仿内部促销系统以增加可信度。

## 来源连结

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1748808/)

---
> 萃取时间：2026-02-15 18:37 UTC
> 资料来源：abuse.ch ThreatFox threatfox-recent
