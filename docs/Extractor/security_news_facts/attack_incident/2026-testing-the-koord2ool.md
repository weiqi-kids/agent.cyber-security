| 欄位 | 內容 |
|------|------|
| **標題** | Testing the Koord2ool |
| **來源** | CERT.at (Austria) |
| **發布時間** | 2024-11-11T15:51:52Z |
| **信心度** | 中 |

## 摘要

As part of the EU-funded project “AWAKE”, we built the Koord2ool, which is a tool that allowed us to...

## 事實內容

As part of the EU-funded project “AWAKE”, we built the Koord2ool, which is a tool that allowed us to track the state of an incident across our constituency over time. We implemented this application as an extension to LimeSurvey (an Open Source survey tool) which generates a dashboard to visualize the state of the answers over time. For this to work, the survey needs to have the following properties: We must identify participants in order to track their responses over the time. In LimeSurvey parlance, this is called “Closed Mode”: There is a database of participants, which also contains a unique token for each e-mail address. This token is sent in the invitation mail sent to each participant and is used for access control and user tracking. A participant must be able to repeatedly fill out...

## 受影響系統

- 依內容而定（需參閱完整文章）

## 來源連結

- [CERT.at - Testing the Koord2ool](https://www.cert.at/en/blog/2024/11/testing-the-koord2ool)

## 萃取時間

2026-02-15T00:00:00+08:00
