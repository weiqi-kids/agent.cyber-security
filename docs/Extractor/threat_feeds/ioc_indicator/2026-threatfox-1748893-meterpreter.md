# ThreatFox IoC: Meterpreter

| 项目 | 内容 |
|------|------|
| **日期** | 2026-02-15 |
| **来源** | abuse.ch ThreatFox |
| **分类** | ioc_indicator |
| **威胁类型** | botnet_cc |
| **恶意程式家族** | Meterpreter |
| **状态** | online |
| **威胁等级** | Critical |
| **信心水准** | 高 |

## 威胁描述

Meterpreter 僵尸网络指挥控制（C2）服务器。Meterpreter 是 Metasploit Framework 的高级有效载荷，常被攻击者用于远程控制受害主机、执行后渗透操作。该 IP:Port 组合被识别为活跃的 C2 基础设施，位于 AWS（Amazon）云服务上。

## IoC 指标

| 类型 | 值 |
|------|-----|
| ip:port | `13.38.84[.]114:50001` |

## 额外资讯

- **标签**: AMAZON-02, AS16509, C2, censys, hacktool, MetaSploit, Meterpreter
- **参考链接**: https://search.censys.io/hosts/13.38.84.114

## 来源链接

- [ThreatFox](https://threatfox.abuse.ch/ioc/1748893/)

---
> 萃取时间：2026-02-16T00:00:00Z
> 资料来源：abuse.ch ThreatFox threatfox-recent
