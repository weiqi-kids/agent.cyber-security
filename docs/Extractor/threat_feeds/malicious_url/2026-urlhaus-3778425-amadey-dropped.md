# Amadey 下载器投放恶意软体 (196.251.107.130)

| 项目 | 内容 |
|------|------|
| **日期** | 2026-02-15 |
| **来源** | abuse.ch URLhaus |
| **分类** | malicious_url |
| **威胁类型** | malware_download |
| **恶意程式家族** | Amadey |
| **状态** | online |
| **威胁等级** | High |
| **信心水准** | 高 |

## 威胁描述

侦测到由 Amadey 下载器投放的恶意软体，并被标记为 C2 监控系统自动侦测。该档案名称显示可能与 Docker BuildKit 相关工具伪装，用于混淆侦测。Amadey 常作为初始感染向量，用于下载并执行额外的恶意 payload。

## IoC 指标

| 类型 | 值 |
|------|-----|
| url | `hxxp://196.251.107.130/buildx_x64.exe` |
| filename | buildx_x64.exe |
| detection | c2-monitor-auto |

## 来源链接

- [URLhaus](https://urlhaus.abuse.ch/url/3778425/)

---
> 萃取时间：2026-02-16T00:00:00Z
> 资料来源：abuse.ch URLhaus urlhaus-recent
