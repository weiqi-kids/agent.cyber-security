# Google Presentations Abused for Phishing

| 项目 | 内容 |
|------|------|
| **日期** | 2026-01-30 |
| **来源** | SANS ISC |
| **分类** | attack_incident |
| **严重程度** | 中 |
| **信心水准** | 高 |

## 摘要

攻击者利用 Google Slides 的"发布"功能创建钓鱼页面，绕过 Google 的安全警告页脚，针对 Vivaldi Webmail 用户。

## 事实内容

一场钓鱼活动通过利用 Google Presentations 的发布功能针对 Vivaldi Webmail 用户，成功绕过了标准的安全警告机制。

**攻击概述**：

攻击者通过欺骗性电子邮件链接到看似合法的服务来针对 Vivaldi Webmail 用户。该攻击利用了 Google Presentations 的发布功能来绕过安全警告。

**技术方法**：

攻击者使用了 Google Slides 的"发布"功能而非标准共享选项。根据文章："要删除页脚，幻灯片必须被'发布'，并且必须共享生成的链接。"这种方法消除了 Google 在共享文档上通常出现的钓鱼警告页脚。

发布的演示文稿使用 URL 参数来控制行为：
- `start=false` 防止自动播放
- `loop=false` 禁用循环
- `delayms=30000` 将幻灯片推进延迟 30 秒

这创建了一个令人信服的单幻灯片界面，模仿合法的登录页面。

**目标用户**：

Vivaldi Webmail 服务用户收到了钓鱼电子邮件，这表明攻击者拥有来自 Vivaldi 或其他地方数据泄露的用户信息。

**凭据窃取基础设施**：

该攻击将受害者重定向到托管在 Weebly 上的钓鱼表单，使用欺骗域名，并利用 Square 的支付处理集成来捕获凭据。

**安全影响**：

这表明了当攻击者利用为合法用例设计的发布功能时，如何将合法云服务重新用于凭据收集。

**攻击指标**：
- 攻击向量：Google Slides 发布功能
- 托管平台：Weebly
- 支付集成：Square
- 目标服务：Vivaldi Webmail

## 受影响系统

- Vivaldi Webmail 用户
- 使用 Google Slides 的组织
- 依赖云服务安全控制的用户

## 来源链接

- [Google Presentations Abused for Phishing](https://isc.sans.edu/diary/rss/32668)

---
> 萃取时间：2026-02-06T00:00:00Z
> 数据来源：SANS ISC sans-isc
