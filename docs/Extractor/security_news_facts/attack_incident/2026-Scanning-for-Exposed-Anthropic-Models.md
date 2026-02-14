# Scanning for Exposed Anthropic Models

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-02 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

單一 IP 位址透過 Tor 出口節點掃描多個感測器，尋找暴露的 Anthropic API 節點。

## 事實內容

2026年2月1日，單一 IP 位址（204.76.203.210）對多個安全感測器進行掃描，目標是尋找類似 Anthropic API 節點的服務。該 IP 位址已知為 Tor 出口節點。

此掃描活動顯示攻擊者正在積極尋找未受保護或錯誤配置的 AI API 端點。Anthropic 提供大型語言模型（如 Claude）的 API 服務，若這些 API 端點暴露在公開網路且缺乏適當的身份驗證，可能被濫用於：
- 未授權的 API 呼叫（產生成本）
- 資料竊取
- 服務濫用

使用 Tor 網路進行掃描表明攻擊者試圖隱藏其真實來源。組織應檢查其 API 端點的暴露情況，並確保實施適當的存取控制和監控機制。

## 受影響系統

- Anthropic API 部署
- AI/ML API 服務

## 來源連結

- [Scanning for exposed Anthropic Models, (Mon, Feb 2nd)](https://isc.sans.edu/diary/rss/32674)

---
> 萃取時間：2026-02-08 17:30 UTC
> 資料來源：SANS ISC sans-isc
