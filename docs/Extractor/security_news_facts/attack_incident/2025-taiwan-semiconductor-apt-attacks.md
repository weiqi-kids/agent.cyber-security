---
title: "半導體戰略背後的網路戰–資安攻擊鎖定設計、生產與財經分析師"
date: 2025-08-28
source: TWCERT/CC
source_url: https://www.twcert.org.tw/tw/cp-104-10355-56906-1.html
feed_id: rss-104
category: attack_incident
confidence: 高
---

## 摘要

美國資安公司Proofpoint揭露,三個與中國有關聯的駭客組織於2025年3月至6月間,針對台灣半導體產業發動大規模網路攻擊。本次行動涉及的三個主要駭客組織分別為UNK_DropPitch、UNK_SparkyCarp與UNK_FistBump。攻擊規模與集中程度顯示,其戰略重心已轉向以台灣主要晶圓代工企業為核心的半導體生態系統。

## 駭客組織命名

**Proofpoint命名規則:**
- 尚未經長期觀察以確認身份前,以「UNK」為前綴命名
- 待身份確立後則改為「TAG」

## 攻擊手法

**主要技術:**
- 魚叉式釣魚(spear-phishing)郵件
- 利用擬真的履歷表、產業報告、薪資資訊或投資分析內容作為誘餌文件

**目標對象:**
- 台灣半導體公司內部的工程師
- 人資
- 財經分析師

**攻擊後果:**
- 一旦受害者開啟附檔或點擊連結,便可在目標電腦中植入多種遠端控制工具
- 包括Cobalt Strike beacon與罕見的Voldemort後門程式
- 維持長期潛伏並竊取敏感資料,實施間諜行為

## 三個駭客組織詳細分析

### UNK_FistBump

**攻擊時間:** 2025年5月至6月

**初始入侵:**
- 入侵台灣大學研究生的電子郵件帳號
- 冒用其身份向台灣半導體製造、封裝、測試及供應鏈相關企業的人力資源部門寄送多封釣魚郵件
- 偽稱為求職者以引誘收件人開啟附件

**惡意程式託管:**
- Zendesk
- Filemail

**使用的惡意程式:**
- Cobalt Strike Beacon
- Voldemort後門程式

**攻擊鏈特點:**
- 不同惡意程式所觸發的攻擊鏈有所差異
- 顯示該組織具備針對不同目標進行攻擊手法調整的能力

### UNK_DropPitch

**攻擊時間:** 2025年4月至5月

**攻擊目標:**
- 多家大型投資銀行
- 專門從事台灣半導體與科技產業金融投資分析的分析師

**攻擊手法:**
- 偽裝成虛構的金融投資公司
- 聲稱欲與目標合作投資
- 透過釣魚郵件引誘受害者開啟附件

**C2基礎設施:**
- api[.]moctw[.]info - 疑似偽造成「中華民國交通部」或「文化部」的官方API端點
- brilliant-bubblegum-137cfe[.]netlify[.]app - 濫用Netlify免費靜態網站服務

**使用的惡意DLL:**
- libcef.dll - 用於載入HealthKick後門程式
- pbvm90.dll - 另一個加載器

### UNK_SparkyCarp

**攻擊時間:** 2025年3月

**攻擊目標:**
- 一家台灣半導體公司

**攻擊手法:**
- 架設兩個C2網域:
  - accshieldportal[.]com
  - acesportal[.]com
- 偽造登入頁面以模仿企業內部系統
- 試圖誘使受害員工輸入帳號與密碼,以竊取憑證資訊

**攻擊特點:**
- 基礎設施佈署上具備針對性與客製化能力
- 以高仿真的社交工程手法提升攻擊成功率

## 攻擊組織比較表

| 項目 | UNK_FistBump | UNK_DropPitch | UNK_SparkyCarp |
|------|--------------|---------------|----------------|
| 攻擊時間 | 2025/05-2025/06 | 2025/04-2025/05 | 2025/03 |
| 攻擊初始方式 | 釣魚郵件 | 釣魚郵件 | 釣魚郵件 |
| 攻擊目標 | 台灣半導體公司 | 台灣半導體產業分析師 | 台灣半導體公司 |
| 釣魚信寄件者 | 入侵台大學生帳號 | 偽冒投資公司 | - |
| 惡意程式託管/C2 | Zendesk、Filemail | api[.]moctw[.]info、brilliant-bubblegum-137cfe[.]netlify[.]app | accshieldportal[.]com、acesportal[.]com |
| 使用的惡意程式 | Voldemort、Cobalt Strike Beacon | HealthKick | - |
| 使用的惡意DLL | - | libcef.dll、pbvm90.dll | - |
| 攻擊目的 | - | - | 獲取員工帳號密碼 |

## 時間軸

- 2025-03至2025-06: 三個駭客組織攻擊期間
- 2025-08-28: TWCERT/CC發布警訊

## 標籤

#半導體 #APT #UNK_FistBump #UNK_DropPitch #UNK_SparkyCarp #魚叉式釣魚 #Voldemort #CobaltStrike
