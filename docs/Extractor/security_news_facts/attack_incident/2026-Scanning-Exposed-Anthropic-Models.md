---
title: "Scanning for exposed Anthropic Models"
source: "SANS ISC"
feed_id: "sans-isc"
link: "https://isc.sans.edu/diary/rss/32674"
published: "2026-02-02"
confidence: "high"
category: "attack_incident"
---

# Scanning for exposed Anthropic Models

**來源**: SANS 網際網路風暴中心
**發布日期**: 2026-02-02
**原文連結**: [https://isc.sans.edu/diary/rss/32674](https://isc.sans.edu/diary/rss/32674)

## 摘要

單一 IP 位址 (204.76.203.210) 掃描多個感測器，尋找看似 Anthropic API 節點的目標。該 IP 位址已知為 Tor 出口節點。

## 關鍵要點

- 特定 IP 進行針對性掃描
- 目標：暴露的 Anthropic API 節點
- 來源：Tor 出口節點 (204.76.203.210)
- 影響多個感測器

## 技術細節

- **攻擊 IP**: 204.76.203.210
- **來源類型**: Tor 出口節點
- **掃描目標**: Anthropic API 節點
- **攻擊方式**: 網路掃描

## 影響範圍

部署 Anthropic AI 模型 API 的組織，特別是未妥善保護 API 端點的系統。

## 備註

此掃描活動顯示攻擊者對 AI 模型 API 的興趣，可能目的包括：
1. 尋找未受保護的 API 以進行濫用
2. 嘗試存取或竊取 AI 模型
3. 探測潛在的安全弱點

使用 Tor 網路表明攻擊者試圖隱藏其真實身份。建議組織確保 AI API 端點受到適當的身份驗證和存取控制保護。
