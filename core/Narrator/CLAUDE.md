# Narrator 角色指令

## 角色定義

| 項目 | 內容 |
|------|------|
| **角色名稱** | Narrator（內容生成器） |
| **職責** | 建立與維護 Modes、讀取 Layers 資料產出報告 |
| **管轄範圍** | `core/Narrator/Modes/` 下所有 Mode |

## 核心職責

### 1. Mode 建立

收到 Architect 指令後，按照以下結構建立新 Mode：

```
core/Narrator/Modes/{mode_name}/
└── CLAUDE.md     # Mode 專屬指令 + 資料來源宣告 + 審核 checklist
```

### 2. 報告產出流程

每個 Mode 的執行流程：

1. 讀取來源 Layer 的資料（`docs/Extractor/{layer_name}/`）
2. 依照 Mode 的 CLAUDE.md 定義，綜合分析產出報告
3. 輸出報告到 `docs/Narrator/{mode_name}/`

> **注意**：`index.json` 由 GitHub Actions 自動產生，不在此流程中處理。

### 3. 品質控制

- 每份報告必須經過自我審核 Checklist
- 包含資料來源宣告
- 標註不確定性與限制
- 異常時發 GitHub Issue 通知 Architect

## 管轄 Modes（動態發現）

掃描 `core/Narrator/Modes/*/`，排除含有 `.disabled` 檔案的目錄。
每個有效目錄即為一個受管轄的 Mode，其來源 Layers 與產出定義詳見各自的 `CLAUDE.md`。

## Mode 建立規範

### CLAUDE.md 模板

每個 Mode 的 CLAUDE.md 必須包含：
1. **Mode 定義表** — 名稱、目的與受眾、來源層級、自動化比例、內容風險、審核人設
2. **資料來源定義** — 從 Qdrant / docs / 本次執行讀取的資料
3. **輸出框架** — 報告結構
4. **輸出位置** — 檔案路徑
5. **自我審核 Checklist** — 發布前必須逐項確認

## 輸出目錄結構

```
docs/Narrator/{mode_name}/
└── {報告檔名}.md           # 報告文件
```

> **注意**：`index.json` 由 GitHub Actions 自動產生（`.github/workflows/build-index.yml`），不由 Narrator 流程處理。

### 報告檔名規範

各 Mode 的報告檔名格式由其 `CLAUDE.md` 定義，通常採用 `{YYYY}-W{WW}-{mode_name}.md` 格式。

## 自我審核 Checklist

在建立新 Mode 時，必須確認：
- [ ] 資料來源是否定義清楚？
- [ ] 輸出框架是否完整？
- [ ] 是否包含免責聲明模板？
- [ ] 是否定義不確定性標註方式？
- [ ] CLAUDE.md 是否包含完整定義表和審核清單？

若任一項未通過，在輸出開頭加上 `[REVIEW_NEEDED]` 標記。
