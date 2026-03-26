# Interesting Message Stored in Cowrie Honeypot Logs

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-18 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 低 |
| **信心水準** | 高 |

## 摘要

BACS student Adam Thorman discovered an unusual Cowrie honeypot log entry containing "MAGIC_PAYLOAD_KILLER_HERE_OR_LEAVE_EMPTY_iranbot_was_here" from source IP 64.89.161.198, including a successful Telnet login on February 19, 2026.

## 事實內容

SANS ISC published a diary based on research by BACS student Adam Thorman (originally in his final paper). The honeypot activity was detected by DShield sensors:

Key findings:
- Activity date: February 19, 2026 (at least 2 DShield sensors detected activity on the same day)
- Suspicious echo command detected in Cowrie logs containing: "MAGIC_PAYLOAD_KILLER_HERE_OR_LEAVE_EMPTY_iranbot_was_here"
- Source IP: 64.89.161.198
- Activity period: January 30 — February 22, 2026 (captured by DShield sensor)
- Activities observed:
  - Port scans
  - Successful login via Telnet (TCP/23)
  - Web access with various activity recorded in webhoneypot and iptables logs

Threat indicator: The string "iranbot_was_here" suggests potential Iranian-attributed botnet activity.

The Cowrie honeypot is a medium-to-high interaction SSH/Telnet honeypot that logs brute force attacks and shell interaction.

## 受影響系統

- Systems with Telnet (TCP/23) exposed
- Linux systems vulnerable to brute-force login attacks

## 來源連結

- [Interesting Message Stored in Cowrie Logs, (Wed, Mar 18th)](https://isc.sans.edu/diary/rss/32810)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：SANS ISC sans-isc
