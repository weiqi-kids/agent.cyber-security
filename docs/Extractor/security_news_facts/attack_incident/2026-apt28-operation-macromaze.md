# Operation MacroMaze: new APT28 campaign using basic tooling and legit infrastructure

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-24 |
| **來源** | NCSC-FI (Finland) |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要
LAB52 發現 APT28（Fancy Bear）發起的 Operation MacroMaze 活動，使用基礎工具和合法基礎設施針對歐洲目標進行魚叉式釣魚攻擊。

## 事實內容

### 活動概述
- **活動名稱**：Operation MacroMaze
- **歸因**：APT28（別名：Fancy Bear、Forest Blizzard、FROZENLAKE）
- **活動時間**：2025 年 9 月至 2026 年 1 月
- **目標地區**：西歐與中歐特定實體
- **發現者**：LAB52

### 攻擊手法
- 使用基礎工具（basic tooling）
- 利用合法服務作為基礎設施和資料滲漏管道
- 採用巨集文件（macro-enabled documents）進行魚叉式釣魚

### 誘餌文件特徵
- 多份含有略微不同巨集的文件被發現
- 特定案例：偽裝成西班牙政府文件
  - 聲稱是西班牙總統府、司法與法院關係部於 2025 年 9 月 18 日發布的議程
  - 刻意製作並修改，複製自 La Moncloa 官網 2025 年 9 月 23 日的正式決議內容
  - 利用合法政府網站內容增加可信度

### 戰術特點
- 使用低複雜度工具，降低偵測門檻
- 利用合法基礎設施，逃避安全監控
- 針對性強，目標明確

## 來源連結
- [Operation MacroMaze: new APT28 campaign using basic tooling and legit infrastructure](https://lab52.io/blog/operation-macromaze-new-apt28-campaign-using-basic-tooling-and-legit-infrastructure/)

---
> 萃取時間：2026-02-25 UTC
> 資料來源：NCSC-FI (Finland) ncsc-fi-news
