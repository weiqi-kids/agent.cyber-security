# Malicious Script Delivering More Maliciousness

| 项目 | 内容 |
|------|------|
| **日期** | 2026-02-05 |
| **来源** | SANS ISC |
| **分类** | attack_incident |
| **严重程度** | 高 |
| **信心水准** | 高 |

## 摘要

恶意批处理文件通过多阶段感染链传递 XWorm V7.0/7.1 木马，使用混淆 PowerShell 和 .NET 负载进行数据窃取。

## 事实内容

一封包含恶意附件的电子邮件传递了 XWorm 木马。批处理文件看似基于 GitHub 上的 Chrome 加密绕过工具，但在正常执行完成后包含额外的恶意功能。

**感染链**：

**阶段 1 - 批处理脚本**：
批处理文件包含通过 PowerShell 执行的混淆 Base64 编码数据，包含"垃圾字符"用于混淆目的。

**阶段 2 - 远程负载获取**：
PowerShell 从 `hxxps://uniworldrivercruises-co[.]uk/optimized_MSI.png` 检索包含嵌入式 shellcode 的图像文件，shellcode 由 "BaseStart-" 和 "-BaseEnd" 标签分隔。

**阶段 3 - Shellcode 执行**：
Shellcode 从 `hxxp://178[.]16[.]53[.]209/buildingmoney.txt` 获取另一个负载，包含反转的十六进制编码二进制数据。

**阶段 4 - .NET 恶意软件**：
解码后的负载（SHA256: d99318c9b254b4fa5bf6f1dd15996dd50be0676dd84e822503fd273316eb9ba7）是一个实现持久性和命令控制的 .NET 可执行文件。

**持久性机制**：
计划任务创建：`schtasks.exe /create /f /sc minute /mo 1 /tn "Chromiumx2"` 从 AppData\Roaming 执行。

**命令与控制**：
Telegram bot API 端点：`hxxps://api[.]telegram[.]org/bot7409572452:AAGp8Ak5bqZu2IkEdggJaz2mnMYRTkTjv-U/sendMessage`

**威胁指标（IOCs）**：
- 恶意域名：uniworldrivercruises-co[.]uk
- 负载服务器：178[.]16[.]53[.]209
- SHA256：d99318c9b254b4fa5bf6f1dd15996dd50be0676dd84e822503fd273316eb9ba7
- Telegram Bot Token：7409572452:AAGp8Ak5bqZu2IkEdggJaz2mnMYRTkTjv-U
- Telegram Chat ID：6870183115

**关键词**：XWorm, 木马, 数据窃取器, Shellcode, 混淆

## 受影响系统

- Windows 系统
- Chrome 浏览器用户
- 电子邮件客户端用户

## 来源链接

- [Malicious Script Delivering More Maliciousness](https://isc.sans.edu/diary/rss/32682)

---
> 萃取时间：2026-02-06T00:00:00Z
> 数据来源：SANS ISC sans-isc
