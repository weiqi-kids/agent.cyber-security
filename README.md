# 資訊安全產業智慧分析系統

> Industry Intelligence Architect — 資安領域實作

基於多角色協作架構（Architect / Extractor / Narrator / Reviewer），自動化擷取、萃取、分析資安情資，並產出結構化報告。

## 架構概覽

```
flowchart TB
  subgraph A[Architect]
    A1[定義資料來源與規格<br/>Schema / Prompt / 評估指標]
  end

  subgraph X[Extractor]
    X1[fetch.sh 擷取]
    X2[解析/清洗/去重]
    X3[L1 security_news_facts]
    X4[L2 vulnerability_tracking]
  end

  subgraph N[Narrator]
    N1[M1 threat_landscape]
    N2[M2 defense_advisory]
  end

  subgraph R[Reviewer]
    R1[一致性檢查<br/>引用/重複/時間線]
    R2[風險分級校正<br/>可行性/誤報]
    R3[發佈/存檔]
  end

  A1 --> X1 --> X2 --> X3
  X2 --> X4
  X3 --> N1
  X3 --> N2
  X4 --> N1
  X4 --> N2
  N1 --> R1 --> R2 --> R3
  N2 --> R1
```

## 資料來源

| 代號 | 來源 | 內容 | 對應 Layer |
|------|------|------|------------|
| RSS-104 | TWCERT/CC | 資安新聞 | L1 security_news_facts |
| RSS-132 | TWCERT/CC | TVN 漏洞公告（中文） | L2 vulnerability_tracking |
| RSS-139 | TWCERT/CC | TVN 漏洞公告（英文） | L2 vulnerability_tracking |

## 系統健康度

| Layer | 最後更新 | 資料筆數 | 狀態 |
|-------|----------|----------|------|
| 資安新聞事實層 | 尚未執行 | 0 | ⚠️ |
| 漏洞追蹤層 | 尚未執行 | 0 | ⚠️ |

| Mode | 最後產出 | 狀態 |
|------|----------|------|
| 威脅態勢分析模式 | 尚未產出 | ⚠️ |
| 防禦建議模式 | 尚未產出 | ⚠️ |

> 自動更新於系統初始化

## 版本紀錄

| 版本 | 日期 | 變更內容 |
|------|------|----------|
| v1.0 | 2026-01-26 | 初始版本：L1/L2 + M1/M2 架構建立 |
