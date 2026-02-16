# ThreatFox IoC: AsyncRAT

| 项目 | 内容 |
|------|------|
| **日期** | 2026-02-15 |
| **来源** | abuse.ch ThreatFox |
| **分类** | ioc_indicator |
| **威胁类型** | botnet_cc |
| **恶意程式家族** | AsyncRAT |
| **状态** | online |
| **威胁等级** | Critical |
| **信心水准** | 高 |

## 威胁描述

AsyncRAT 僵尸网络指挥控制（C2）服务器。AsyncRAT 是一款开源远程访问木马（RAT），常被攻击者用于窃取敏感资讯、执行远程指令、部署额外恶意程式。该 IP:Port 组合被识别为活跃的 C2 基础设施，托管于 Contabo 服务提供商。

## IoC 指标

| 类型 | 值 |
|------|-----|
| ip:port | `217.216.48[.]9:7707` |

## 额外资讯

- **标签**: AS40021, AsyncRAT, C2, censys, CONTABO-40021, RAT
- **参考链接**: https://search.censys.io/hosts/217.216.48.9

## 来源链接

- [ThreatFox](https://threatfox.abuse.ch/ioc/1748891/)

---
> 萃取时间：2026-02-16T00:00:00Z
> 资料来源：abuse.ch ThreatFox threatfox-recent
