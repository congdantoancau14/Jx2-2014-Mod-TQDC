--扬州任务分支
--created by lizhi
--2005-9-2 10:12

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

---------------------------------------扬州分支三-------------------------------------

function task_01_00()
    local szTalk = {
        "Th藅 l� xui x蝟!",
        "Chuy謓 g� v藋?",
        "M蕐 ng祔 trc con trai ta t� b� thng � ch﹏, ta nh l猲 {V� Di s琻} h竔 輙 Dc th秓 v� k誸 qu� b� m vn tr緉g, h� ly t蕁 c玭g, ngi gi髉 ta n  mang {tay n秈} v� 頲 kh玭g?",
        "Chuy謓 n祔  t筰 h� lo li謚!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    SetTask(TASK_YZ_THREE, 2);
    CreateTrigger(0,538,KILL_YZ_BG);
    Msg2Player("дn V� Di s琻 t譵 tay n秈 Trng B� H竛");
    TaskTip("дn V� Di s琻 t譵 tay n秈 Trng B� H竛");
end;

function task_02_00()
    local szMsg = {
        "Tay n秈 c馻 ta r琲 � {V� Di s琻} phi襫 <sex> gi髉 ta l蕐 v�!"
    }
    local szTalk = {
        "ng n� r錳!  t�!  t�!",
        "Цm qu竔 n祔 � u ra v藋?",
        "Sao ta bi誸? Ngi th� n Dng Ch﹗ t譵 {L� Ti課 D騨g}, 頲 m謓h danh Thi誸 Ch駓, may ra s� gi髉 頲 cho ngi!",
        "в t筰 h� 甶 h醝 th�!"
    };
    if GetItemCount(2,0,144) >= 1 then
        TalkEx("task_02_01", szTalk);
    else
        TalkEx("task_02_02", szMsg);
    end;
end;

function task_02_02()
    if GetTask(KILL_YZ_BG) == 0 then
        CreateTrigger(0,538,KILL_YZ_BG);
    end;
end;

function task_02_01()
    RemoveTrigger(GetTrigger(KILL_YZ_BG));
    SetTask(TASK_YZ_THREE, 3);
    DelItem(2,0,144,1);
    Msg2Player("H醝 L� Ti課 D騨g chuy謓 V� Di S琻");
    TaskTip("H醝 L� Ti課 D騨g chuy謓 V� Di S琻");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi1")		--异兽现世1
end;

function task_03_00()
    local szTalk = {
        "G莕 y V� Di s琻 xu蕋 hi謓 nhi襲 Thng Vi猲 v� Ng﹏ H�, ti猲 sinh bi誸 nguy猲 nh﹏ kh玭g?",
        "C� chuy謓 n祔 n鱝 sao? Thng Vi猲 xu蕋 hi謓 b竜 hi謚 甶襪 x蕌 b総 u.",
        "V藋 ph秈 l祄 sao?",
        "Phi襫 <sex> n V� Di s琻 t譵 t蕀 da Thng Vi猲 v�!",
        "T筰 h� 甶 ngay!"
    };
    TalkEx("task_03_01", szTalk);
end;

function task_03_01()
    SetTask(TASK_YZ_THREE, 4);
    CreateTrigger(0,539,KILL_YZ_CY);
    Msg2Player("дn V� Di s琻 t譵 t蕀 da Thng Vi猲 v� cho L� Ti課 D騨g");
    TaskTip("дn V� Di s琻 t譵 t蕀 da Thng Vi猲 v� cho L� Ti課 D騨g");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi2")		--异兽现世2
end;

function task_04_00()
    local szTalk = {
        "ng l� t蕀 da n祔 r錳! � y mu鑞 n鉯 s緋 c� th秏 h鋋 chi課 tranh, k誸 qu� th讌�",
        "R鑤 cu閏 l� g�?",
        "L祬M� ngi n鉯 V� Di s琻 c� Thng Vi猲 v� Ng﹏ H� ph秈 kh玭g?",
        "ng r錳! C� ng﹏ h� n鱝!",
        "Th玦 v藋 甶 phi襫 <sex> n V� Di s琻 m閠 chuy課 l蕐 l玭g ng﹏ h� v� y!",
        "Л頲 th玦! Hy v鋘g l莕 n祔 ti襫 b鑙 c� th� n鉯 ra nguy猲 nh﹏ d� th� xu蕋 hi謓 v� chuy謓 g� s緋 x秠 ra."
    };
    local szMsg = {
        "Phi襫 <sex> n V� Di s琻 t譵 t蕀 da Thng Vi猲 v�!"
    };
    if GetItemCount(2,0,145) >= 1 then
        TalkEx("task_04_01", szTalk);
    else
        TalkEx("task_04_02", szMsg);
    end;
end;

function task_04_02()
    if GetTrigger(KILL_YZ_CY) == 0 then
        CreateTrigger(0,539,KILL_YZ_CY);
    end;
end;

function task_04_01()
    RemoveTrigger(GetTrigger(KILL_YZ_CY));
    DelItem(2,0,145,1);
    SetTask(TASK_YZ_THREE, 5);
    CreateTrigger(0,540,KILL_YZ_YH);
    Msg2Player("дn V� Di s琻 t譵 1 l玭g ng﹏ h� v� cho L� Ti課 D騨g");
    TaskTip("дn V� Di s琻 t譵 1 l玭g ng﹏ h� v� cho L� Ti課 D騨g");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi3")		--异兽现世3
end;

function task_05_00()
    local szTalk = {
        "ng l� lo筰 l玭g n祔! � y ch� 甶襪 may, ngi c� th� y猲 t﹎.",
        "R鑤 cu閏 l� sao, t鑤 hay x蕌?",
        "C竔 n祔 th讌卼a kh玭g ti謓 n鉯 ra, ngi th� t譵 ngi b筺 L璾 Huy襫 Thanh c馻 ta xem!",
        "Sao ph秈 h醝 anh ta?",
        "Phong th駓 � V� Di s琻 u t藀 trung � Lng Th駓 ng, ta nghi d� th� xu蕋 hi謓 c� li猲 quan n vi謈 n祔 m� L璾 Huy襫 Thanh ng祔 ng祔 u v祇 ng luy謓 n, ngi th� n Dng Ch﹗ t譵 anh ta xem!",
        "в ta 甶 h醝 th� xem!"
    };
    local szMsg = {
        "Phi襫 <sex> n V� Di s琻 mang l玭g ng﹏ h� v�!"
    };
    if GetItemCount(2,0,146) >= 1 then
        TalkEx("task_05_01", szTalk);
    else
        TalkEx("task_05_02", szMsg);
    end;
end;

function task_05_02()
    if GetTask(KILL_YZ_YH) == 0 then
        CreateTrigger(0,540,KILL_YZ_YH);
    end;
end;

function task_05_01()
    RemoveTrigger(GetTrigger(KILL_YZ_YH));
    DelItem(2,0,146,1);
    SetTask(TASK_YZ_THREE, 6);
    Msg2Player("T譵 L璾 Huy襫 Thanh h醝 chuy謓 Lng Th駓 ng");
    TaskTip("T譵 L璾 Huy襫 Thanh h醝 chuy謓 Lng Th駓 ng");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi4")		--异兽现世4
end;

function task_06_00()
    local szTalk = {
        "Nghe n鉯 ti襫 b鑙 bi誸 頲 nguy猲 nh﹏ xu蕋 hi謓 d� th�, v穘 b鑙 m筼 mu閕 n h醝 th�!",
        "Chuy謓 g� v藋? Sao l筰 phong t醓 c鯽 ng, c遪 nh ngi b� thng n鱝, th藅 kh玭g xem vng ph竝 ra ch髏 n祇?",
        "Ngi nh b竔 30 t猲 Thng th莕  ta ngu玦 c琻 gi薾 r錳 m韎 n鉯!",
        "Ti襫 b鑙 b韙 n鉵g, chuy謓 n祔 kh玭g kh�  t筰 h� lo li謚."
    };
    TalkEx("task_06_01", szTalk);
end;

function task_06_01()
    CreateTrigger(0,541,KILL_YZ_QS);
    SetTask(TASK_YZ_THREE, 7);
    Msg2Player("Gi髉 L璾 Huy襫 Thanh tr鮪g tr� 30 t猲 Thng th莕");
    TaskTip("Gi髉 L璾 Huy襫 Thanh tr鮪g tr� 30 t猲 Thng th莕");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan1")		--异动之源1
end;

function task_07_00()
    local szTalk = {
        "Ngi n鉯 tr鮪g tr� 30 t猲 Thng th莕 sao c遪 ch璦 l祄 n鱝?"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    if GetTrigger(KILL_YZ_QS) == 0 then
        CreateTrigger(0,541,KILL_YZ_QS);
    end;
end;

function task_08_00()
    local szTalk = {
        "T筰 h�  l祄 xong vi謈 ti襫 b鑙 giao.",
        "<sex> qu� nhi猲 th﹏ th� b蕋 ph祄, n鉯 v� Lng Th駓 ng th� kh玭g ai hi觰 b籲g ta, n琲  ch輓h l� 甶觤 t輈h t� linh kh� c馻 V� Di s琻. 30 n╩ trc ta v� phu nh﹏ ng祔 ng祔 u n  luy謓 n mong t譵 頲 trng sinh n. Kh玭g ng�  10 n╩.....",
        "10 n╩ trc  x秠 ra chuy謓 g�?",
        "10 n╩ trc trong m閠 l莕 luy謓 n g苝 s� c� do li襲 lng thu鑓 qu� nhi襲 d蒼 n l� luy謓 n� tung ta may m緉 tho竧 ch誸 nh璶g phu nh﹏ ta  kh玭g qua kh醝."
    };
    TalkEx("task_08_00_00", szTalk);
end;

function task_08_00_00()
    local szTalk = {
        "Ti襫 b鑙 ng qu� 產u l遪g!",
        "Kh玭g sao! K� t�  ta v蒼 � y luy謓 n  tng nh� phu nh﹏, ngi gi髉 ta l祄 m閠 chuy謓 n鱝 頲 kh玭g, ta h鴄 s� n鉯 h誸 nh鱪g g� ta bi誸.",
        "Ti襫 b鑙 c� c╪ d苙!",
        "� y c� chi誧 b譶h kh玭g ngi v祇 Lng Th駓 ng t莕g 1 l蕐 m閠 輙 c竧 v� y. Ta mu鑞 d飊g c竧 r秈 quanh nh�  tng nh� ngi qu� c�. M蕐 ng祔 nay ta m韎 t豱h ng�, phu nh﹏ ch誸 r錳, luy謓 ti猲 n trng sinh b蕋 l穙  l祄 g�!"
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    SetTask(TASK_YZ_THREE, 9);
    AddItem(2,0,147,1);
    Msg2Player("m chi誧 b譶h kh玭g n Lng Th駓 ng t莕g 1 l蕐 m閠 輙 c竧 v�");
    TaskTip("m chi誧 b譶h kh玭g n Lng Th駓 ng t莕g 1 l蕐 m閠 輙 c竧 v�");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan2")		--异动之源2
end;

function task_09_00()
    local szTalk = {
        "Phi襫 <sex> qu�! в ta n鉯 ngi nghe l莕 cu鑙 c飊g v祇 ng ta th蕐 m ngi Xi H醓 gi竜  產ng b祅 k� ho筩h g�  � t莕g 2. xem ra ch髇g c� li猲 quan n d� th� � V� Di s琻.",
        "L莕 trc ngang qua T髖 Xu﹏ l莡 ta th蕐 Thu Dung c� nng c� qua l筰 v韎 b鋘 Xi H醓 gi竜 , ngi n h醝 c� ta th� xem!",
        "Ч t� ti襫 b鑙, t筰 h� 甶 y!"
    };
    local szHaveNoBottle = {
        "Chi誧 b譶h kh玭g ta a ngi l祄 m蕋 r錳 �? May ta c遪 m蕐 b譶h ng n dc, chuy謓 n祔 phi襫 <sex> v藋."
    }
    local szHaveBottle = {
        "� y c� chi誧 b譶h kh玭g ngi v祇 Lng Th駓 ng t莕g 1 l蕐 m閠 輙 c竧 v� y. Ta mu鑞 d飊g c竧 r秈 quanh nh�  tng nh� ngi qu� c�."
    };
    if GetItemCount(2,0,148) >= 1 then  --已经有泥土了
        TalkEx("task_09_01", szTalk);
    else
        if GetItemCount(2,0,147) >= 1 then  --没有泥土有空瓶子
            TalkEx("", szHaveBottle);
        else                                --没有泥土也没有瓶子
            TalkEx("", szHaveNoBottle);
            AddItem(2,0,147,1);
        end;
    end;
end;

function task_09_01()
    SetTask(TASK_YZ_THREE, 10);
    DelItem(2,0,148,1);
    Msg2Player("дn T髖 Xu﹏ l莡 Dng Ch﹗ t譵 Thu Dung c� nng");
    TaskTip("дn T髖 Xu﹏ l莡 Dng Ch﹗ t譵 Thu Dung c� nng");
    GivePlayerAward("Level_45", "hard", "head", "Level_39");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan3")		--异动之源3
end;

function task_10_00()
    local szTalk = {
        "Ta mu鑞 h醝 th╩ c� nng m閠 s� chuy謓 v� m ngi Xi H醓 gi竜 .",
        "Ha! Ha! Sao ta ph秈 n鉯 cho ngi nghe?",
        "T筰 h� gi髉 頲 g� cho c� nng kh玭g?",
        "T髖 Xu﹏ l莡 ta n誹 c� lo筰 ph蕁  th� kh竎h s� n nm np.",
        "Lo筰 ph蕁  t猲 g�? Mua � u v藋?",
        "N誹 d� v藋 ta mua t� l﹗ r錳, lo筰 ph蕁  t猲 Thi猲 Hng ph蕁 ch� ti謒 ph蕁 Tng Duy � Dng Ch﹗ m韎 c�, ta n v礽 l莕 nh璶g kh玭g mua 頲, ngi gi髉 ta t譵 m閠 c竔 頲 kh玭g?",
        "Л頲 th玦!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    SetTask(TASK_YZ_THREE, 11);
    Msg2Player("дn Dng Ch﹗ t譵 Tng Duy h醝 Thi猲 Hng ph蕁");
    TaskTip("дn Dng Ch﹗ t譵 Tng Duy h醝 Thi猲 Hng ph蕁");
end;

function task_11_00()
    local szTalk = {
        "Nghe n鉯 ti襫 b鑙 l祄 lo筰 ph蕁 t猲 {Thi猲 Hng} kh玭g bi誸 c� th� l祄 cho t筰 h� m閠 h閜 頲 kh玭g?",
        "Kh玭g ph秈 ta kh玭g mu鑞 l祄 th鵦 ch蕋 nguy猲 li謚 r蕋 kh� t譵, c莕 n Giang T﹏ Th玭 t譵 kh鉯 ﹎ tr猲 ngi  h錸, chu sa tr猲 m譶h Heo r鮪g, t� ong tr猲 ngi ong v祅g l韓 v� lc trang s鴆 tr猲 ngi N� Ki誱 H祇, t譵  nguy猲 li謚 ta s� gi髉 ngi l祄.",
        "в t筰 h� t譵 th�!"
    };
    TalkEx("task_11_01", szTalk);
end;

function task_11_01()
    SetTask(TASK_YZ_THREE, 12);
    Msg2Player("дn Giang T﹏ Th玭 t譵 kh鉯 ﹎ tr猲 ngi  h錸, chu sa tr猲 m譶h Heo r鮪g, t?ong tr猲 ong v祅g v?lc trang s鴆 tr猲 ngi N?Ki誱 h祇 cho Tng Duy.");
end;

--暗烟	2,1,26
--野猪 朱砂 (2,2,30)
--大黄蜂 蜂巢 (2,1,13)
--女剑豪 梳妆匣 (2,1,57)

function task_12_00()
    local szTalk = {
        "ng l� s� nguy猲 li謚 n祔 r錳! ьi ta m閠 l竧!",
        "厖",
        "Thi猲 Hng ph蕁 y! <sex> c莔 l蕐!",
        " t�!"
    };
    local szMsg = {
        "Nh鱪g nguy猲 li謚 n祔 h琲 kh?nh? ph秈 n Giang T﹏ Th玭 t譵 kh鉯 ﹎ tr猲 ngi  h錸, chu sa tr猲 m譶h Heo r鮪g, t?ong tr猲 ong v祅g v?lc trang s鴆 tr猲 ngi N?Ki誱 h祇, t譵  nguy猲 li謚 ta s?gi髉 ngi l祄."
    };
    if GetItemCount(2,1,26) >= 1 and GetItemCount(2,2,30) >= 1 and GetItemCount(2,1,13) >= 1 and GetItemCount(2,1,57) >= 1 then
        TalkEx("task_12_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_12_01()
    DelItem(2,1,26,1);
    DelItem(2,2,30,1);
    DelItem(2,1,13,1);
    DelItem(2,1,57,1);
    AddItem(2,0,149,1);
    SetTask(TASK_YZ_THREE, 13);
    Msg2Player("Mang Thi猲 Hng ph蕁 cho Thu Dung");
    TaskTip("Mang Thi猲 Hng ph蕁 cho Thu Dung");
    GivePlayerAward("Level_40", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou1")		--两水阴谋
end;

function task_12_02()
    DelItem(2,1,26,1);
    DelItem(2,2,30,1);
    DelItem(2,1,13,1);
    DelItem(2,1,57,1);
    AddItem(2,0,149,1);
    SetTask(TASK_YZ_THREE, 13);
    Msg2Player("Mang Thi猲 Hng ph蕁 cho Thu Dung");
    TaskTip("Mang Thi猲 Hng ph蕁 cho Thu Dung");
end

function task_13_jw_00()
    local szMsg = {
        "<sex> mu鑞 l祄 Thi猲 Hng ph蕁 n鱝 kh玭g? Ch?c莕 n Giang T﹏ Th玭 t譵 kh鉯 ﹎ tr猲 ngi  h錸, chu sa tr猲 m譶h Heo r鮪g, t?ong tr猲 ong v祅g v?lc trang s鴆 tr猲 ngi N?Ki誱 h祇, t譵  nguy猲 li謚 ta s?gi髉 ngi l祄."
    };
    local szElse = {
        "Ph� n� ch� c莕 s鑞g kh醗 ch� son ph蕁 sao s竛h 頲 v韎 c竔 p t� nhi猲."
    };
    local szTalk = {
        "ng l� s� nguy猲 li謚 n祔 r錳! ьi ta m閠 l竧!",
        "厖",
        "Thi猲 Hng ph蕁 y! <sex> c莔 l蕐!",
        " t�!"
    };
    if GetItemCount(2,0,149) >= 1 then
        TalkEx("", szElse);
    else
        if GetItemCount(2,1,26) >= 1 and GetItemCount(2,2,30) >= 1 and GetItemCount(2,1,13) >= 1 and GetItemCount(2,1,57) >= 1 then
            TalkEx("task_12_02", szTalk);
        else
            TalkEx("", szMsg);
        end;
    end;
end;

function task_13_qr_00()
    local szMsg = {
        "Sao tr� nh� k衜 v藋, ta n鉯 l筰 m閠 l莕 th玦  Thi猲 Hng ph蕁 ch� c� Tng Duy � Dng Ch﹗ m韎 l祄 頲."
    };
    local szTalk = {
        "T譵 頲 r錳 �? Xem c� ch髏 b秐 l躰h! M� ta c遪 chuy謓 mu鑞 nh� <sex> gi髉 .",
        "C� nng c� n鉯!",
        "Y猲 t﹎! Vi謈 n祔 l� l莕 cu鑙 ta nh� ngi, l莕 trc b鋘 ngi Xi H醓 gi竜 n y  l蕐 c緋 T� Ph鬾g kim thoa c馻 ta.",
        "с l� v藅 nh t譶h, ngi gi髉 ta n Lng Th駓 ng t莕g 2 nh Xi H醓 gi竜  l蕐 T� Ph鬾g kim thoa v�.",
        "T筰 h� l猲 阯g ngay!"
    };
    if GetItemCount(2,0,149) >= 1 then
        TalkEx("task_13_qr_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_13_qr_01()
    SetTask(TASK_YZ_THREE, 14);
    DelItem(2,0,149,1);
    CreateTrigger(0,542,KILL_YZ_JT);
    Msg2Player("Gi髉 Thu Dung n Lng Th駓 ng t莕g 2 nh Xi H醓 gi竜  l蕐 T� Ph鬾g kim thoa");
    TaskTip("Gi髉 Thu Dung n Lng Th駓 ng t莕g 2 nh Xi H醓 gi竜  l蕐 T� Ph鬾g kim thoa");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou2")		--两水阴谋2
end;

function task_14_00()
    local szTalk = {
        "ng l� v藅 n祔 r錳!  t� <sex> gi髉 !",
        "Gi� c� nng c� th� n鉯 cho t筰 h� nghe chuy謓 Xi H醓 gi竜  ch璦?",
        "L莕 trc h� n y u鑞g ru c� nh綾 n m秐h S琻 H� X� T綾 c� th� tri謚 g鋓 h醓 k� l﹏ trong Lng Th駓 ng. Con v藅 n祔 n誹 qua 49 ng祔 s� c� s鴆 m筺h th莕 k�, nu鑤 頲 c� n鯽 nh� T鑞g. Ta ch� bi誸 v藋 th玦!",
        "T筰 h� l藀 t鴆 n {Lng Th駓 ng t莕g 2} ng╪ c秐 b鋘 ch髇g.",
        "Цnh b筰 k� l﹏ nh� v� k� ta nghe nha!"
    };
    local szMsg = {"Цm ngi Xi H醓 gi竜  產ng tr鑞 � Lng Th駓 ng t莕g 2. ngi nh� gi髉 ta 畂箃 T� Ph鬾g kim thoa v�!"};
    if GetItemCount(2,0,303) >= 1 then --紫凤金钗
        TalkEx("task_14_01", szTalk);
    else
        TalkEx("task_14_02", szMsg);
    end;
end;

function task_14_02()
    if GetTrigger(KILL_YZ_JT) == 0 then
        CreateTrigger(0,542,KILL_YZ_JT);
    end;
end;

function task_14_01()
    RemoveTrigger(GetTrigger(KILL_YZ_JT));
    SetTask(TASK_YZ_THREE, 15);
    DelItem(2,0,303,1);   --紫凤金钗
    Msg2Player("дn Lng Th駓 ng t莕g 2 nh b筰 H醓 K� l﹏");
    TaskTip("дn Lng Th駓 ng t莕g 2 nh b筰 H醓 K� l﹏");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou3")		--两水阴谋3
end;

function task_16_00()
    local szTalk = {
        "T筰 h�  nh b筰 h醓 k� l﹏ trc th阨 h筺, c� nng c� th� y猲 t﹎!",
        "Nguy hi觤 l緈! Chuy謓 l祬",
        "Hay qu�! Hay qu�!",
        "Nh璶g m秐h S琻 H� X� T綾 c遪 trong tay Trng Ca M玭 sao l筰 r琲 v祇 tay Xi H醓 gi竜? ng r錳! Ph秈 v� {Л阯g M玭} g苝 {Л阯g Xu﹏} xem c� k誸 qu� gi竚 nh 竚 kh� ch璦!"
    };
    TalkEx("task_16_01", szTalk);
end;

function task_16_01()
    SetTask(TASK_YZ_THREE, 17);
    SetTask(TASK_YZ_TWO, 4);
    GivePlayerAward("Level_50", "hell", "chest", "Level_44");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou4")		--两水阴谋4
end;