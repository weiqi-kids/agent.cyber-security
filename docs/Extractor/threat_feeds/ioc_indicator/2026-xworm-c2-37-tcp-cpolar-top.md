# XWorm RAT 僵尸网络 C2 域名 37.tcp.cpolar.top

| 项目 | 内容 |
|------|------|
| **日期** | 2026-02-15 |
| **来源** | abuse.ch ThreatFox |
| **分类** | ioc_indicator |
| **威胁类型** | botnet |
| **恶意程序家族** | XWorm |
| **状态** | online |
| **威胁等级** | Critical |
| **信心水准** | 高 |

## 威胁描述

检测到 XWorm 远程访问木马（RAT）使用的僵尸网络 C2 域名。XWorm 是一种恶意软件，具备远程控制能力。该域名使用 cpolar.top 服务，这是一个常被恶意软件用于建立 C2 通道的内网穿透服务。

## IoC 指标

| 类型 | 值 |
|------|-----|
| domain | `37.tcp.cpolar.top` |

## 关联分析

此域名与 XWorm 恶意程序家族相关，属于远程访问木马（RAT）类别。攻击者使用内网穿透服务（cpolar.top）来建立 C2 通道，这种手法可以绕过某些网络安全控制。根据 Triage 沙箱分析，该样本在 2026-02-15 19:01:54 至 19:47:02 期间活跃。

## 来源连结

- [abuse.ch ThreatFox](https://threatfox.abuse.ch/ioc/1748815/)
- [Triage 沙箱分析](https://tria.ge/260215-xl26rsat7f)

---
> 萃取时间：2026-02-15 19:01 UTC
> 资料来源：abuse.ch ThreatFox threatfox-recent
