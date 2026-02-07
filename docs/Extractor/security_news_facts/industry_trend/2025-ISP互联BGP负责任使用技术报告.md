# Technical report: Responsible use of the Border Gateway Protocol (BGP) for ISP interworking

| 项目 | 内容 |
|------|------|
| **日期** | 2025-03-12 |
| **来源** | UK NCSC |
| **分类** | industry_trend |
| **严重程度** | 中 |
| **信心水准** | 高 |

## 摘要

NCSC发布ISP互联中BGP负责任使用的最佳实践技术报告。

## 事实内容

英国国家网络安全中心（NCSC）发布了关于互联网服务提供商（ISP）互联中边界网关协议（Border Gateway Protocol, BGP）负责任使用的技术报告。该报告提供了这一基础数据路由协议的最佳实践指南。

BGP是互联网的核心路由协议，负责在自治系统（AS）之间交换路由信息。然而，BGP设计时缺乏安全机制，容易受到路由劫持、路由泄露等攻击：

主要内容可能包括：
- BGP安全配置最佳实践
- 路由过滤和验证机制
- RPKI（资源公钥基础设施）部署建议
- 异常检测和监控
- BGP会话安全（如MD5认证、TCP-AO）
- 事件响应和协作机制

该报告对ISP、网络运营商和关键基础设施提供商具有重要参考价值，有助于提升互联网路由安全性。

## 受影响系统

- ISP和网络运营商的BGP路由器
- 互联网交换点（IXP）
- 自治系统（AS）边界设备
- 核心路由基础设施
- 全球互联网路由系统

## 来源链接

- [Technical report: Responsible use of the Border Gateway Protocol (BGP) for ISP interworking](https://www.ncsc.gov.uk/report/responsible-use-of-bgp-for-isp-interworking)

---
> 萃取时间：2026-02-06 UTC
> 数据来源：UK NCSC uk-ncsc
