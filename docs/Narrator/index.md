---
layout: default
title: Narrator
nav_exclude: true
has_children: true
permalink: /docs/Narrator/
---

# Narrator 報告層

基於 Extractor 萃取的資料，綜合分析產出可行動的資安報告。

---

## 報告類型

| Mode | 說明 | 更新頻率 |
|:-----|:-----|:---------|
| [threat_landscape](threat_landscape/) | 威脅態勢分析 | 每週 |
| [defense_advisory](defense_advisory/) | 防禦建議 | 每週 |

---

## 威脅態勢分析 (Threat Landscape)

提供資安人員當前威脅態勢摘要，輔助防禦策略制定。

### 報告內容
- 近期重大資安事件
- 漏洞趨勢分析
- 活躍利用與 PoC 動態
- 攻擊手法歸納
- 新興威脅識別

---

## 防禦建議 (Defense Advisory)

提供 IT/資安管理人員可執行的防禦行動建議。

### 報告內容
- 優先修補清單
- 安全控制建議
- 緩解策略
- 注意事項與限制

---

## 資料來源

報告使用「兩者並用」策略：

| 查詢目的 | 使用來源 |
|:---------|:---------|
| 列舉所有項目 | `docs/` 檔案系統 |
| 統計數量 | `docs/` 檔案系統 |
| 語意搜尋 | Qdrant 向量資料庫 |
| 跨 Layer 關聯 | Qdrant 向量資料庫 |
| 相似案例探索 | Qdrant 向量資料庫 |
