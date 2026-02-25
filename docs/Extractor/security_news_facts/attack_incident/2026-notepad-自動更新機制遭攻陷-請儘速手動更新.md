# Notepad++自動更新機制遭攻陷，請儘速手動更新

| 項目 | 內容 |
|------|------|
| **日期** | 2026-02-24 |
| **來源** | TWCERT/CC |
| **分類** | attack_incident |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要
近期資安研究團隊Rapid7 Labs與Rapid7 MDR聯合揭露一場針對知名開源文字編輯器「Notepad++」的複雜供應鏈攻擊。此攻擊由中國APT組織Lo...

## 事實內容
近期資安研究團隊Rapid7 Labs與Rapid7 MDR聯合揭露一場針對知名開源文字編輯器「Notepad++」的複雜供應鏈攻擊。此攻擊由中國APT組織Lotus Blossom(亦被追蹤為Violet Typhoon 或 Billbug)發起。攻擊者於2025年6 月至12月期間，成功攻陷Notepad++代管主機服務商的基礎設施。與傳統竄改軟體原始碼的手法不同，攻擊者係掌控了內部服務憑證，導致使用者執行內建更新程式(WinGUp)時，流量會被導向惡意伺服器並下載偽造的安裝套件。官方已緊急呼籲所有用戶立即停止使用自動更新功能，並務必透過官方網站手動下載安裝最新的v8.9.2版本。透過本次攻擊活動顯示威脅行為者具高度的技術與規避偵測能力，攻擊鏈始於惡意的NSIS安裝檔(update.exe)，利用DLL側載(DLL Sideloading)技術，透過合法的Bitdefender執行檔(被重新命名為BluetoothService.exe)載入惡意元件log.dll，進而解密並執行Shellcode，最終植入名為「Chrysalis」的客製化隱匿後門。惡意NSIS安裝檔(updata.exe)執行流程如圖1所示。圖1：updata.exe執行流程圖。圖片來源： Rapid7為規避EDR(端點偵測與回應)與網路流量分析，後門程式Chrysalis 採用多層次的防禦技術：C2通訊偽裝：透過HTTPS傳輸，其URL結構(如 /a/chat/s/{GUID})刻意模仿Deepseek API端點，並搭配合法的Chrome User Agent與 RC4 內容加密，使其流量在視覺與內容上皆隱匿於正常的AI應用與網頁瀏覽流量中。API Hashing：實現雙層防禦機制。載入器階段結合FNV-1a與MurmurHash演算法；主模組則進階採用自定義的多階段算術混合運算。這種動態解析Windows API的手法，大幅提升靜態分析與特徵碼偵測的難度。濫用 Microsoft Warbird：研究人員發現其載入器(Loader)濫用了微軟未公開的Warbird程式碼保護框架，透過NtQuerySystemInformation 系統調用中的SystemCodeFlowTransition(0xB9)類別，在合法的微軟簽章檔(clipc.dll)記憶體空間內執行惡意Shellcode。此外，卡巴斯基資安研究團隊發現，針對此次攻擊共有3種攻擊模式：攻擊鏈時間範圍惡意資源/下載位置主要行為/目的特色或重點第一個攻擊鏈2025.07~2025.08http://45.76.155[.]202/update/update.exe執行後建立 「%appdata%\ProShow」資料夾收集系統資訊（whoami、tasklist 等）並上傳放置多個執行檔並執行其中惡意程式視為較早期的惡意活動樣本使用舊有漏洞載入 payload第二個攻擊鏈2025.09http://45.76.155[.]202/update/update.exe同樣下載 update.exe收集更多系統資訊（加上 systeminfo、netstat）並上傳在 「%APPDATA%\Adobe\Scripts」放置多個檔案並執行惡意程式資料蒐集指令更完整，範圍擴大與第一個鏈相比更新目標資料位置第三個攻擊鏈2025.10http://45.32.144[.]255/update/update.exe下載後置放三個檔案到「%appdata%\Bluetooth\」：「BluetoothService.exe」(合法可執行檔)、「log.dll」(惡意 DLL)、「BluetoothService」(加密 shellcode)利用 DLL Hijacking 載入 「log.dll」並執行後門程式 Chrysalis典型 DLL Hijacking 技術最終植入後門程式 (Chrysalis)資料來源：TWCERT/CC團隊整理鑑於此攻擊潛伏期長且技術極其複雜，資安專家建議企業與個人用戶立即採取以下行動：立即手動修補：確認所有端點的Notepad++ 版本已更新至 v8.9.2。請勿信任軟體跳出的自動更新提示，應直接從官方網站下載安裝。企業防禦策略強化：透過GPO或MDM派送原則，暫時禁用非必要開源軟體自動更新功能。入侵指標(IoCs）清查：請依據下表盤點系統環境，若發現相符項目，應立即視為受駭事件並啟動緊急應變程序。以下是此次攻擊的入侵指標（IoCs）：惡意IP和網域(DN)：95[.]179[.]213[.]061[.]4[.]102[.]9759[.]110[.]7[.]32124[.]222[.]137[.]114api[.]skycloudcenter[.]comapi[.]wiresguard[.]com惡意檔案：檔名SHA-256 Hashupdate.exea511be5164dc1122fb5a7daa3eef9467e43d8458425b15a640235796006590c9NSIS.nsi8ea8b83645fba6e23d48075a0d3fc73ad2ba515b4536710cda4f1f232718f53eBluetoothService.exe2da00de67720f5f13b17e9d985fe70f10f153da60c9ab1086fe58f069a156924BluetoothService77bfea78def679aa1117f569a35e8fd1542df21f7e00e27f192c907e61d63a2elog.dll3bdc4c0637591533f1d4198a72a33426c01f69bd2e15ceee547866f65e26b7adu.bat9276594e73cda1c69b7d265b3f08dc8fa84bf2d6599086b9acc0bb3745146600conf.cf4d829739f2d6ba7e3ede83dad428a0ced1a703ec582fc73a4eee3df3704629alibtcc.dll4a52570eeaf9d27722377865df312e295a7a23c3b6eb991944c2ecd707cc9906admin831e1ea13a1bd405f5bda2b9d8f2265f7b1db6c668dd2165ccc8a9c4c15ea7ddloader10a9b8df968df41920b6ff07785cbfebe8bda29e6b512c94a3b2a83d10014d2fduffhxpSy4c2ea8193f4a5db63b897a2d3ce127cc5d89687f380b97a1d91e0c8db542e4f8loader2e7cd605568c38bd6e0aba31045e1633205d0598c607a855e2e1bca4cca1c6eda3yzr31vk078a9e5c6c787e5532a7e728720cbafee9021bfec4a30e3c2be110748d7c43c5ConsoleApplication2.exeb4169a831292e245ebdffedd5820584d73b129411546e7d3eccf4663d5fc5be3system7add554a98d3a99b319f2127688356c1283ed073a084805f14e33b4f6a6126fds047t5g.exefcc2765305bcd213b7558025b2039df2265c3e0b6401e4833123c461df2de51a

## 來源連結
- [Notepad++自動更新機制遭攻陷，請儘速手動更新](https://www.twcert.org.tw/tw/cp-104-10725-feaeb-1.html)

---
> 萃取時間：2026-02-25 UTC
> 資料來源：TWCERT/CC rss-104
