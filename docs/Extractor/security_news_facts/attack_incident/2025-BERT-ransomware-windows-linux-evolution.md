# 從Windows到Linux勒索軟體BERT的演化與擴散

| 欄位 | 內容 |
|------|------|
| 日期 | 2025-07-23 |
| 來源 | TWCERT/CC |
| 分類 | attack_incident |
| 嚴重程度 | 高 |
| 信心水準 | 低 |

## 摘要

BERT勒索軟體於2025年4月首次發現,具跨平台能力,從Windows擴展至Linux,攻擊亞洲與歐洲醫療、科技產業,與Revil程式碼相似度達80%。

## 事實內容

BERT(又稱Water Pombero)是一種跨平台勒索軟體,於2025年4月首次被發現,主要針對Windows和Linux環境發動攻擊。攻擊活動集中在亞洲與歐洲地區,受害對象以醫療產業、科技公司及事件管理服務為主。

**Windows版本攻擊手法:**
- 透過PowerShell Loader(start.ps1)取得初始存取
- 提升系統權限並停用Windows Defender、防火牆及UAC
- 從遠端IP下載並執行勒索軟體
- 加密檔案後加上「.encryptedbybert」副檔名

**Linux版本技術特色:**
- 與Revil(Sodinokibi)勒索軟體程式碼相似度高達80%
- 可同時啟動50個CPU執行緒提升加密效率
- 強制關閉目標虛擬機確保加密完整性
- 加密後檔案副檔名為「.encrypted_by_bert」
- 內部包含JSON配置檔,含公鑰(pk)、Base64編碼勒索信等資料

**防範措施建議:**
1. 定期備份資料並隔離儲存
2. 保持系統與應用程式最新版本
3. 提升使用者安全意識訓練
4. 落實最小權限原則
5. 部署多層次資安防護(防毒軟體、防火牆、IDS)
6. 建立資安事件應變計畫並定期演練

## 受影響系統

- Windows系統
- Linux系統
- 主要受害產業:醫療產業、科技公司、事件管理服務
- 主要受害地區:亞洲、歐洲

## 來源連結

- [TWCERT/CC原文](https://www.twcert.org.tw/tw/cp-104-10281-cc0a3-1.html)

---

**萃取時間:** 2026-01-27
**資料來源:** RSS-104, Line 19
**IoC提供:** 趨勢科技

**IoC清單:**
```
1ef6c1a4dfdc39b63bfe650ca81ab89510de6c0d3d7c608ac5be80033e559326
70211a3f90376bbc61f49c22a63075d1d4ddd53f0aefa976216c46e6ba39a9f4
75fa5b506d095015046248cf6d2ec1c48111931b4584a040ceca57447e9b9d71
8478d5f5a33850457abc89a99718fc871b80a8fb0f5b509ac1102f441189a311
b2f601ca68551c0669631fd5427e6992926ce164f8b3a25ae969c7f6c6ce8e4f
bd2c2cf0631d881ed382817afcce2b093f4e412ffb170a719e2762f250abfea4
c7efe9b84b8f48b71248d40143e759e6fc9c6b7177224eb69e0816cc2db393db
hxxp://185[.]100[.]157[.]74/payload[.]exe
```