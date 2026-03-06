# Don't say "Jehova" to an LLM

| 項目 | 內容 |
|------|------|
| **日期** | 2025-12-02 |
| **來源** | CERT.at (Austria) |
| **分類** | industry_trend |
| **嚴重程度** | medium |
| **信心水準** | 高 |

## 摘要
CERT.at 深度分析 LLM（大型語言模型）的 prompt injection 安全問題，從帶內信令（in-band signalling）的歷史脈絡探討「資料被誤解為指令」這一核心安全挑戰的現代形態。

## 事實內容
- **核心主題**：LLM 的 prompt injection 攻擊——攻擊者在資料中嵌入指令，使 AI 系統將資料誤讀為控制指令。
- **歷史類比（帶內信令問題）**：
  - 美國電話網路曾使用 2600Hz 音調作為狀態控制信號，駭客可利用吹奏相同音調進行電話欺詐
  - 此問題本質是「控制信號與資料混雜在同一通道傳輸」的結構性缺陷
  - LLM 的 prompt injection 是同一問題的現代版本
- **LLM 特有的安全語意挑戰**：
  - LLM 在設計上需要理解並執行指令，這使得「區分資料與指令」成為根本性困難
  - 與傳統代碼注入（SQL injection、XSS）類似，但 LLM 的語境更難以精確界定邊界
  - 引用哲學問題：引用某段文字與真正「說出」那段文字，在 LLM 的語境中是否有本質差異？
- **AI agent 安全意涵**：隨著 LLM 被賦予更多自主行動能力（如執行程式碼、發送郵件），prompt injection 的危害程度將顯著提升
- **Monty Python 引用**：標題引用「生命中的布萊恩」橋段，說明語意層次混淆的哲學問題。

## 受影響系統
- 所有基於 LLM 的 AI 系統
- AI Agent 框架
- 整合 LLM 的企業應用

## 來源連結
- [Don't say "Jehova" to an LLM](https://www.cert.at/en/blog/2025/12/dont-say-jehova-to-an-llm)

---
> 萃取時間：2026-03-04 UTC
> 資料來源：CERT.at (Austria) cert-at
