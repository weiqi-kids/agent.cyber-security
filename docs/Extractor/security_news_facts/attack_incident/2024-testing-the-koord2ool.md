---
title: "Testing the Koord2ool"
source: "CERT.at (Austria)"
feed_id: "cert-at"
link: "https://www.cert.at/en/blog/2024/11/testing-the-koord2ool"
pub_date: "Mon, 11 Nov 2024 15:51:52 GMT+0100"
category: "attack_incident"
confidence: "高"
tags: ["AI", "CERT", "Phishing", "SSO"]
---

## 摘要

As part of the EU-funded project “AWAKE”, we built the Koord2ool, which is a tool that allowed us to track the state of an incident across our constituency over time.

## 詳細內容

As part of the EU-funded project “AWAKE”, we built the Koord2ool, which is a tool that allowed us to track the state of an incident across our constituency over time. We implemented this application as an extension to LimeSurvey (an Open Source survey tool) which generates a dashboard to visualize the state of the answers over time. For this to work, the survey needs to have the following properties: We must identify participants in order to track their responses over the time. In LimeSurvey parlance, this is called “Closed Mode”: There is a database of participants, which also contains a unique token for each e-mail address. This token is sent in the invitation mail sent to each participant and is used for access control and user tracking. A participant must be able to repeatedly fill out the survey. This is controlled by the “Allow multiple responses or update responses with one access code:” setting. I recommend to also set “Enable participant-based response persistence“ to „On“. This helps with the consistency of the answers. The code is here: https://github.com/ait-cs-IaaS/koord2ool Last week, we participated in a national cyber exercise that was organised by the KSÖ with AIT as the technology partner. This year, I focussed on getting the Koord2ool up and running and see how the concept performs during the exercise. This blogpost documents my experience. I used the “introduction day” to test the installation of the Koord2ool inside AIT’s cyber range. It took us a bit of time to correctly configure the email settings – LimeSurvey needs to be able to send out the invitations, and to prepare a basic survey with all the right settings and test the procedure of adding new questions to an existing survey – see below for details. At the start of the exercise, I had a basic survey ready with two parts: A “Meta” group to ask questions about the exercise itself: are you having fun? Do the tools work? Etc. A “Status” group where I started with a basic “What is the status of your fictional company?” question. As the game progressed, I added more and more questions and sent our reminder emails to the players to keep filling out our survey. Results: The Koord2ool use wasn’t officially announced by the exercise moderator, and the invitations were sent only to the official “office@” email-address of the virtual companies. Maybe some players thought that this was a phishing inject, it took us some time to get answers from every company. Over the time, this looked like this: The y-axis are the participants, the x-axis is the time. The dots are answers. So, from the 6 virtual companies, we got both one, two and three answers from two each. Regrettably, this was not enough to really track the state of the game over the full exercise. This resulted in the following graph describing the status of the companies: Lessons Learned We really need to make answering the survey an official part of the exercise with regular announcements by the organizers to fill out the survey at predefined intervals. I’m not 100% sure that we really managed to squash all bugs regarding the data processing. (but maybe it’s just the CERT.at installation which I use right now to look at the exported/imported survey data) The process of adding questions is a bit cumbersome, it needs the following steps: Stop / Deactive the survey Edit the structure of the survey – add new questions Activate survey, choose “closed mode” and select “restore participants” In the responses tab, use “import” to restore previously archived answers LimeSurvey tries to be clever by not allowing invitations / reminders to be sent to participants who already have received an invitaion or have submitted in a response respectively. This makes a lot of sense for “normal” surveys, but not for our use-case where we need multiple answers from participants. The way to work around this feature is to use the “Bulk Edit” functionality in the participant management to reset the “Invitation sent” and “response received” columns for all respondents. Let's see how Koord2ool will work in future exercises and real world incidents.

## 來源資訊

- **來源**: CERT.at (Austria)
- **連結**: https://www.cert.at/en/blog/2024/11/testing-the-koord2ool
- **發布時間**: Mon, 11 Nov 2024 15:51:52 GMT+0100
