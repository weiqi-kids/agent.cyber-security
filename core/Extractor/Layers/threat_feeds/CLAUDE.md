# 威脅情報饋送層 (Threat Intelligence Feeds Layer)

## Layer 定義

| 項目 | 內容 |
|------|------|
| **Layer name** | 威脅情報饋送層 (Threat Intelligence Feeds Layer) |
| **Engineering function** | 收集 IoC（惡意 URL、惡意程式雜湊、C2 指標） |
| **Collectable data** | abuse.ch URLhaus、MalwareBazaar、ThreatFox、Feodo Tracker |
| **Automation level** | 90% — API 回應高度結構化 |
| **Output value** | IoC 清單、惡意程式分類、C2 追蹤 |
| **⚠️ Risk type** | IoC 時效性高，過期資料可能造成誤判 |
| **🛂 Reviewer persona** | 資料可信度審核員 + 自動化邊界審核員 |

## 來源對照表

| source_id | source 名稱 | 備註 |
|-----------|-------------|------|
| `urlhaus-recent` | abuse.ch URLhaus | 惡意 URL 資料庫（完全免費） |
| `malwarebazaar-recent` | abuse.ch MalwareBazaar | 惡意程式樣本資料庫（完全免費） |
| `threatfox-recent` | abuse.ch ThreatFox | IoC 分享平台（完全免費） |
| `feodo-c2` | abuse.ch Feodo Tracker | Feodo/Dridex/TrickBot C2 追蹤（完全免費） |

## 執行指令

1. 執行 `./fetch.sh` 擷取原始資料到 `docs/Extractor/threat_feeds/raw/`
2. 逐一處理 `docs/Extractor/threat_feeds/raw/*.jsonl` 中的所有 JSONL 檔案，每行一筆 JSON，每次只接收一筆 JSON 進行萃取
3. 萃取結果交由 `./update.sh` 處理

### 萃取邏輯

接收單一 JSON 項目及 `source_id` 資訊。不同來源的 JSON 結構不同：

- **URLhaus**：`{"id":"...","url":"...","url_status":"...","threat":"...","date_added":"...",...}`
- **MalwareBazaar**：`{"sha256_hash":"...","file_type":"...","signature":"...","first_seen":"...",...}`
- **ThreatFox**：`{"ioc":"...","threat_type":"...","malware":"...","confidence_level":"...",...}`
- **Feodo Tracker**：`{"ip_address":"...","port":0,"status":"...","hostname":"...","as_number":0,...}`

#### WebFetch 策略

所有 API 來源**不使用 WebFetch**——API 回應已包含完整結構化資料。

#### IoC 時效性規則

1. **標註擷取時間**：所有 IoC 必須標註擷取時間，供下游判斷是否仍有效
2. **狀態標註**：URLhaus URL 狀態（online/offline）、Feodo C2 狀態（online/offline）需如實記錄
3. **不做過期判定**：IoC 是否過期由下游使用者決定，本層僅負責如實記錄

#### 安全呈現規則

1. **URL 脫敏**：惡意 URL 使用 `hxxp://` 或 `hxxps://` 替代 `http://`/`https://`，防止誤點
2. **IP 不脫敏**：C2 IP 保持原樣（用於防火牆封鎖）
3. **雜湊值完整呈現**：SHA256/MD5/SHA1 雜湊值完整呈現（用於偵測規則）

萃取以下結構化資訊：

```json
{
  "id": "ioc-YYYYMMDD-NNN",
  "title": "IoC 描述標題",
  "date": "YYYY-MM-DD",
  "source": "依 source_id 對應的 source 名稱",
  "source_id": "來源 source_id",
  "category": "malicious_url | malware_sample | ioc_indicator | c2_infrastructure",
  "threat_type": "malware | botnet | phishing | ransomware | other",
  "malware_family": "惡意程式家族（若適用）",
  "ioc_value": "IoC 指標值（URL 需脫敏）",
  "ioc_type": "url | ip | domain | hash_sha256 | hash_md5 | hash_sha1",
  "status": "online | offline | unknown",
  "threat_level": "Critical | High | Medium | Low | 未評估",
  "confidence": "高 | 中 | 低",
  "notes": "額外備註"
}
```

### 分類規則（enum，僅限以下 4 個值）

| category 值 | 中文 | 判定條件 |
|-------------|------|----------|
| `malicious_url` | 惡意 URL | 惡意 URL（URLhaus） |
| `malware_sample` | 惡意程式樣本 | 惡意程式樣本（MalwareBazaar） |
| `ioc_indicator` | IoC 指標 | 其他 IoC 指標（ThreatFox） |
| `c2_infrastructure` | C2 基礎設施 | C2 伺服器/基礎設施（Feodo Tracker） |

> **嚴格限制：category 只能使用上述 4 個英文值，不可自行新增。**

### 輸出格式

每筆 IoC 輸出為一個 Markdown 檔案，存放於：

```
docs/Extractor/threat_feeds/{category}/{YYYY}-{唯一識別符}.md
```

#### 檔名生成規則（嚴格優先順序）

1. **有雜湊值（malware_sample）**：`{日期}-{hash_sha256前16位}.md`
   - 範例：`2026-02-15-a1b2c3d4e5f67890.md`
   - 使用 SHA256 的前 16 位作為唯一識別符

2. **有 URL/Domain（malicious_url）**：`{日期}-{標準化domain}.md`
   - 範例：`2026-02-15-evil-example-com.md`
   - 將 `.` 替換為 `-`，移除 TLD 後的路徑

3. **有 IP（c2_infrastructure）**：`{日期}-{ip格式化}.md`
   - 範例：`2026-02-15-192-168-1-1.md`
   - 將 `.` 替換為 `-`

4. **其他（ioc_indicator）**：`{日期}-{來源}-{標準化slug}.md`
   - 範例：`2026-02-15-threatfox-emotet-c2.md`
   - slug 標準化規則：全小寫、特殊字元轉 `-`

5. **重複處理**：若檔案已存在（透過索引檢查）
   - 若相同 IoC 已存在 → **跳過**，輸出「SKIP: {IoC} 已存在於 {路徑}」
   - 若為同一 IoC 的狀態更新 → 更新現有檔案而非新增

> **強制規則**：萃取 Task 必須先檢查傳入的索引，避免產生重複檔案。IoC 的唯一性由其指標值決定。

檔案格式：

```markdown
# {IoC 描述標題}

| 項目 | 內容 |
|------|------|
| **日期** | YYYY-MM-DD |
| **來源** | {source 名稱} |
| **分類** | {category} |
| **威脅類型** | {threat_type} |
| **惡意程式家族** | {malware_family} |
| **狀態** | {status} |
| **威脅等級** | {threat_level} |
| **信心水準** | {confidence} |

## 威脅描述

{結構化威脅描述}

## IoC 指標

| 類型 | 值 |
|------|-----|
| {ioc_type} | `{ioc_value}` |

## 關聯分析

{與其他 IoC 或惡意程式家族的關聯（若有）}

## 來源連結

- [{source 名稱}]({source_url})

---
> 萃取時間：YYYY-MM-DD HH:MM UTC
> 資料來源：{source 名稱} {source_id}
```

## 自我審核 Checklist

在輸出前，必須逐項確認：
- [ ] 資料來源是否為一手？（abuse.ch 官方 API）
- [ ] 惡意 URL 是否已脫敏？（hxxp/hxxps）
- [ ] IoC 指標值是否完整正確？
- [ ] 狀態（online/offline）是否如實記錄？
- [ ] 分類是否準確？（符合分類規則表）
- [ ] **檔名是否符合標準化規則？**（使用 hash/domain/IP 作為唯一識別符）
- [ ] **是否已檢查索引確認無重複？**（跳過已存在的相同 IoC）
- [ ] 不確定的部分是否有標註？
- [ ] source 欄位是否正確對應來源對照表？

### `[REVIEW_NEEDED]` 觸發規則

以下情況**必須**標記 `[REVIEW_NEEDED]`：
1. **IoC 指標值缺失**：無法取得有效的 URL/IP/雜湊值
2. **分類無法判定**：無法歸類到 4 個 category 中的任何一個
3. **威脅類型矛盾**：同一 IoC 在不同欄位的描述互相矛盾
4. **URL 脫敏失敗**：輸出中包含未脫敏的惡意 URL

以下情況**不觸發** `[REVIEW_NEEDED]`：
- ❌ 「惡意程式家族未知」 — 部分 IoC 確實無法歸類到已知家族
- ❌ 「狀態為 offline」 — IoC 下線是正常狀態轉換
- ❌ 「信心水準為低」 — 結構性限制
- ❌ 「關聯分析為空」 — 不是所有 IoC 都有可識別的關聯

> **原則**：`[REVIEW_NEEDED]` 代表「萃取結果可能有誤或涉及安全風險，需要人工確認」。IoC 的正常狀態變化不構成審核理由。
