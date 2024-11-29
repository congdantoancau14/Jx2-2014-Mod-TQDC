--ÑïÖÝÈÎÎñ·ÖÖ§
--created by lizhi
--2005-9-2 10:12

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

---------------------------------------ÑïÖÝ·ÖÖ§Èý-------------------------------------

function task_01_00()
    local szTalk = {
        "ThËt lµ xui xÎo!",
        "ChuyÖn g× vËy?",
        "MÊy ngµy tr­íc con trai ta tÐ bÞ th­¬ng ë ch©n, ta ®Þnh lªn {Vò Di s¬n} h¸i Ýt D­îc th¶o vÒ kÕt qu¶ bÞ ®¸m v­în tr¾ng, hå ly tÊn c«ng, ng­¬i gióp ta ®Õn ®ã mang {tay n¶i} vÒ ®­îc kh«ng?",
        "ChuyÖn nµy ®Ó t¹i h¹ lo liÖu!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    SetTask(TASK_YZ_THREE, 2);
    CreateTrigger(0,538,KILL_YZ_BG);
    Msg2Player("§Õn Vò Di s¬n t×m tay n¶i Tr­¬ng B¸ H¸n");
    TaskTip("§Õn Vò Di s¬n t×m tay n¶i Tr­¬ng B¸ H¸n");
end;

function task_02_00()
    local szMsg = {
        "Tay n¶i cña ta r¬i ë {Vò Di s¬n} phiÒn <sex> gióp ta lÊy vÒ!"
    }
    local szTalk = {
        "§óng nã råi! §a t¹! §a t¹!",
        "§¸m qu¸i nµy ë ®©u ra vËy?",
        "Sao ta biÕt? Ng­¬i thö ®Õn D­¬ng Ch©u t×m {Lý TiÕn Dòng}, ®­îc mÖnh danh ThiÕt Chñy, may ra sÏ gióp ®­îc cho ng­¬i!",
        "§Ó t¹i h¹ ®i hái thö!"
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
    Msg2Player("Hái Lý TiÕn Dòng chuyÖn Vò Di S¬n");
    TaskTip("Hái Lý TiÕn Dòng chuyÖn Vò Di S¬n");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi1")		--ÒìÊÞÏÖÊÀ1
end;

function task_03_00()
    local szTalk = {
        "GÇn ®©y Vò Di s¬n xuÊt hiÖn nhiÒu Th­¬ng Viªn vµ Ng©n Hå, tiªn sinh biÕt nguyªn nh©n kh«ng?",
        "Cã chuyÖn nµy n÷a sao? Th­¬ng Viªn xuÊt hiÖn b¸o hiÖu ®iÒm xÊu b¾t ®Çu.",
        "VËy ph¶i lµm sao?",
        "PhiÒn <sex> ®Õn Vò Di s¬n t×m tÊm da Th­¬ng Viªn vÒ!",
        "T¹i h¹ ®i ngay!"
    };
    TalkEx("task_03_01", szTalk);
end;

function task_03_01()
    SetTask(TASK_YZ_THREE, 4);
    CreateTrigger(0,539,KILL_YZ_CY);
    Msg2Player("§Õn Vò Di s¬n t×m tÊm da Th­¬ng Viªn vÒ cho Lý TiÕn Dòng");
    TaskTip("§Õn Vò Di s¬n t×m tÊm da Th­¬ng Viªn vÒ cho Lý TiÕn Dòng");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi2")		--ÒìÊÞÏÖÊÀ2
end;

function task_04_00()
    local szTalk = {
        "§óng lµ tÊm da nµy råi! ë ®©y muèn nãi s¾p cã th¶m häa chiÕn tranh, kÕt qu¶ th×……",
        "Rèt cuéc lµ g×?",
        "Lµ…Mµ ng­¬i nãi Vò Di s¬n cã Th­¬ng Viªn vµ Ng©n Hå ph¶i kh«ng?",
        "§óng råi! Cã ng©n hå n÷a!",
        "Th«i vËy ®i phiÒn <sex> ®Õn Vò Di s¬n mét chuyÕn lÊy l«ng ng©n hå vÒ ®©y!",
        "§­îc th«i! Hy väng lÇn nµy tiÒn bèi cã thÓ nãi ra nguyªn nh©n dÞ thó xuÊt hiÖn vµ chuyÖn g× s¾p x¶y ra."
    };
    local szMsg = {
        "PhiÒn <sex> ®Õn Vò Di s¬n t×m tÊm da Th­¬ng Viªn vÒ!"
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
    Msg2Player("§Õn Vò Di s¬n t×m 1 l«ng ng©n hå vÒ cho Lý TiÕn Dòng");
    TaskTip("§Õn Vò Di s¬n t×m 1 l«ng ng©n hå vÒ cho Lý TiÕn Dòng");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi3")		--ÒìÊÞÏÖÊÀ3
end;

function task_05_00()
    local szTalk = {
        "§óng lµ lo¹i l«ng nµy! ë ®©y chØ ®iÒm may, ng­¬i cã thÓ yªn t©m.",
        "Rèt cuéc lµ sao, tèt hay xÊu?",
        "C¸i nµy th×……ta kh«ng tiÖn nãi ra, ng­¬i thö t×m ng­êi b¹n L­u HuyÒn Thanh cña ta xem!",
        "Sao ph¶i hái anh ta?",
        "Phong thñy ë Vò Di s¬n ®Òu tËp trung ë L­ìng Thñy ®éng, ta nghi dÞ thó xuÊt hiÖn cã liªn quan ®Õn viÖc nµy mµ L­u HuyÒn Thanh ngµy ngµy ®Òu vµo ®éng luyÖn ®¬n, ng­¬i thö ®Õn D­¬ng Ch©u t×m anh ta xem!",
        "§Ó ta ®i hái thö xem!"
    };
    local szMsg = {
        "PhiÒn <sex> ®Õn Vò Di s¬n mang l«ng ng©n hå vÒ!"
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
    Msg2Player("T×m L­u HuyÒn Thanh hái chuyÖn L­ìng Thñy ®éng");
    TaskTip("T×m L­u HuyÒn Thanh hái chuyÖn L­ìng Thñy ®éng");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi4")		--ÒìÊÞÏÖÊÀ4
end;

function task_06_00()
    local szTalk = {
        "Nghe nãi tiÒn bèi biÕt ®­îc nguyªn nh©n xuÊt hiÖn dÞ thó, v·n bèi m¹o muéi ®Õn hái thö!",
        "ChuyÖn g× vËy? Sao l¹i phong táa cöa ®éng, cßn ®¸nh ng­êi bÞ th­¬ng n÷a, thËt kh«ng xem v­¬ng ph¸p ra chót nµo?",
        "Ng­¬i ®¸nh b¸i 30 tªn Th­¬ng thÇn ®Ó ta ngu«i c¬n giËn råi míi nãi!",
        "TiÒn bèi bít nãng, chuyÖn nµy kh«ng khã ®Ó t¹i h¹ lo liÖu."
    };
    TalkEx("task_06_01", szTalk);
end;

function task_06_01()
    CreateTrigger(0,541,KILL_YZ_QS);
    SetTask(TASK_YZ_THREE, 7);
    Msg2Player("Gióp L­u HuyÒn Thanh trõng trÞ 30 tªn Th­¬ng thÇn");
    TaskTip("Gióp L­u HuyÒn Thanh trõng trÞ 30 tªn Th­¬ng thÇn");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan1")		--Òì¶¯Ö®Ô´1
end;

function task_07_00()
    local szTalk = {
        "Ng­¬i nãi trõng trÞ 30 tªn Th­¬ng thÇn sao cßn ch­a lµm n÷a?"
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
        "T¹i h¹ ®· lµm xong viÖc tiÒn bèi giao.",
        "<sex> qu¶ nhiªn th©n thñ bÊt phµm, nãi vÒ L­ìng Thñy ®éng th× kh«ng ai hiÓu b»ng ta, n¬i ®ã chÝnh lµ ®iÓm tÝch tô linh khÝ cña Vò Di s¬n. 30 n¨m tr­íc ta vµ phu nh©n ngµy ngµy ®Òu ®Õn ®ã luyÖn ®¬n mong t×m ®­îc tr­êng sinh ®¬n. Kh«ng ngê ®· 10 n¨m.....",
        "10 n¨m tr­íc ®· x¶y ra chuyÖn g×?",
        "10 n¨m tr­íc trong mét lÇn luyÖn ®¬n gÆp sù cè do liÒu l­îng thuèc qu¸ nhiÒu dÉn ®Õn lß luyÖn næ tung ta may m¾n tho¸t chÕt nh­ng phu nh©n ta ®· kh«ng qua khái."
    };
    TalkEx("task_08_00_00", szTalk);
end;

function task_08_00_00()
    local szTalk = {
        "TiÒn bèi ®øng qu¸ ®au lßng!",
        "Kh«ng sao! KÓ tõ ®ã ta vÉn ë ®Êy luyÖn ®¬n ®Ó t­ëng nhí phu nh©n, ng­¬i gióp ta lµm mét chuyÖn n÷a ®­îc kh«ng, ta høa sÏ nãi hÕt nh÷ng g× ta biÕt.",
        "TiÒn bèi cø c¨n dÆn!",
        "ë ®©y cã chiÕc b×nh kh«ng ng­¬i vµo L­ìng Thñy ®éng tÇng 1 lÊy mét Ýt c¸t vÒ ®©y. Ta muèn dïng c¸t r¶i quanh nhµ ®Ó t­ëng nhí ng­êi qu¸ cè. MÊy ngµy nay ta míi tØnh ngé, phu nh©n chÕt råi, luyÖn tiªn ®¬n tr­êng sinh bÊt l·o ®Ó lµm g×!"
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    SetTask(TASK_YZ_THREE, 9);
    AddItem(2,0,147,1);
    Msg2Player("§em chiÕc b×nh kh«ng ®Õn L­ìng Thñy ®éng tÇng 1 lÊy mét Ýt c¸t vÒ");
    TaskTip("§em chiÕc b×nh kh«ng ®Õn L­ìng Thñy ®éng tÇng 1 lÊy mét Ýt c¸t vÒ");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan2")		--Òì¶¯Ö®Ô´2
end;

function task_09_00()
    local szTalk = {
        "PhiÒn <sex> qu¸! §Ó ta nãi ng­¬i nghe lÇn cuèi cïng vµo ®éng ta thÊy ®¸m ng­êi Xi Háa gi¸o ®å ®ang bµn kÕ ho¹ch g× ®ã ë tÇng 2. xem ra chóng cã liªn quan ®Õn dÞ thó ë Vò Di s¬n.",
        "LÇn tr­íc ngang qua Tóy Xu©n lÇu ta thÊy Thu Dung c« n­¬ng cã qua l¹i víi bän Xi Háa gi¸o ®å, ng­¬i ®Õn hái c« ta thö xem!",
        "§¹ t¹ tiÒn bèi, t¹i h¹ ®i ®©y!"
    };
    local szHaveNoBottle = {
        "ChiÕc b×nh kh«ng ta ®­a ng­¬i lµm mÊt råi µ? May ta cßn mÊy b×nh ®ùng ®¬n d­îc, chuyÖn nµy phiÒn <sex> vËy."
    }
    local szHaveBottle = {
        "ë ®©y cã chiÕc b×nh kh«ng ng­¬i vµo L­ìng Thñy ®éng tÇng 1 lÊy mét Ýt c¸t vÒ ®©y. Ta muèn dïng c¸t r¶i quanh nhµ ®Ó t­ëng nhí ng­êi qu¸ cè."
    };
    if GetItemCount(2,0,148) >= 1 then  --ÒÑ¾­ÓÐÄàÍÁÁË
        TalkEx("task_09_01", szTalk);
    else
        if GetItemCount(2,0,147) >= 1 then  --Ã»ÓÐÄàÍÁÓÐ¿ÕÆ¿×Ó
            TalkEx("", szHaveBottle);
        else                                --Ã»ÓÐÄàÍÁÒ²Ã»ÓÐÆ¿×Ó
            TalkEx("", szHaveNoBottle);
            AddItem(2,0,147,1);
        end;
    end;
end;

function task_09_01()
    SetTask(TASK_YZ_THREE, 10);
    DelItem(2,0,148,1);
    Msg2Player("§Õn Tóy Xu©n lÇu D­¬ng Ch©u t×m Thu Dung c« n­¬ng");
    TaskTip("§Õn Tóy Xu©n lÇu D­¬ng Ch©u t×m Thu Dung c« n­¬ng");
    GivePlayerAward("Level_45", "hard", "head", "Level_39");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan3")		--Òì¶¯Ö®Ô´3
end;

function task_10_00()
    local szTalk = {
        "Ta muèn hái th¨m c« n­¬ng mét sè chuyÖn vÒ ®¸m ng­êi Xi Háa gi¸o ®å.",
        "Ha! Ha! Sao ta ph¶i nãi cho ng­¬i nghe?",
        "T¹i h¹ gióp ®­îc g× cho c« n­¬ng kh«ng?",
        "Tóy Xu©n lÇu ta nÕu cã lo¹i phÊn ®ã th× kh¸ch sÏ ®Õn n­êm n­îp.",
        "Lo¹i phÊn ®ã tªn g×? Mua ë ®©u vËy?",
        "NÕu dÔ vËy ta mua tõ l©u råi, lo¹i phÊn ®ã tªn Thiªn H­¬ng phÊn chØ tiÖm phÊn T­ëng Duy ë D­¬ng Ch©u míi cã, ta ®Õn vµi lÇn nh­ng kh«ng mua ®­îc, ng­¬i gióp ta t×m mét c¸i ®­îc kh«ng?",
        "§­îc th«i!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    SetTask(TASK_YZ_THREE, 11);
    Msg2Player("§Õn D­¬ng Ch©u t×m T­ëng Duy hái Thiªn H­¬ng phÊn");
    TaskTip("§Õn D­¬ng Ch©u t×m T­ëng Duy hái Thiªn H­¬ng phÊn");
end;

function task_11_00()
    local szTalk = {
        "Nghe nãi tiÒn bèi lµm lo¹i phÊn tªn {Thiªn H­¬ng} kh«ng biÕt cã thÓ lµm cho t¹i h¹ mét hép ®­îc kh«ng?",
        "Kh«ng ph¶i ta kh«ng muèn lµm thùc chÊt nguyªn liÖu rÊt khã t×m, cÇn ®Õn Giang T©n Th«n t×m khãi ©m trªn ng­êi ¢m hån, chu sa trªn m×nh Heo rõng, tæ ong trªn ng­êi ong vµng lín vµ l­îc trang søc trªn ng­êi N÷ KiÕm Hµo, t×m ®ñ nguyªn liÖu ta sÏ gióp ng­¬i lµm.",
        "§Ó t¹i h¹ t×m thö!"
    };
    TalkEx("task_11_01", szTalk);
end;

function task_11_01()
    SetTask(TASK_YZ_THREE, 12);
    Msg2Player("§Õn Giang T©n Th«n t×m khãi ©m trªn ng­êi ¢m hån, chu sa trªn m×nh Heo rõng, t?ong trªn ong vµng v?l­îc trang søc trªn ng­êi N?KiÕm hµo cho T­ëng Duy.");
end;

--°µÑÌ	2,1,26
--Ò°Öí ÖìÉ° (2,2,30)
--´ó»Æ·ä ·ä³² (2,1,13)
--Å®½£ºÀ Êá×±Ï» (2,1,57)

function task_12_00()
    local szTalk = {
        "§óng lµ sè nguyªn liÖu nµy råi! §îi ta mét l¸t!",
        "……",
        "Thiªn H­¬ng phÊn ®©y! <sex> cÇm lÊy!",
        "§a t¹!"
    };
    local szMsg = {
        "Nh÷ng nguyªn liÖu nµy h¬i kh?nh? ph¶i ®Õn Giang T©n Th«n t×m khãi ©m trªn ng­êi ¢m hån, chu sa trªn m×nh Heo rõng, t?ong trªn ong vµng v?l­îc trang søc trªn ng­êi N?KiÕm hµo, t×m ®ñ nguyªn liÖu ta s?gióp ng­¬i lµm."
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
    Msg2Player("Mang Thiªn H­¬ng phÊn cho Thu Dung");
    TaskTip("Mang Thiªn H­¬ng phÊn cho Thu Dung");
    GivePlayerAward("Level_40", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou1")		--Á½Ë®ÒõÄ±
end;

function task_12_02()
    DelItem(2,1,26,1);
    DelItem(2,2,30,1);
    DelItem(2,1,13,1);
    DelItem(2,1,57,1);
    AddItem(2,0,149,1);
    SetTask(TASK_YZ_THREE, 13);
    Msg2Player("Mang Thiªn H­¬ng phÊn cho Thu Dung");
    TaskTip("Mang Thiªn H­¬ng phÊn cho Thu Dung");
end

function task_13_jw_00()
    local szMsg = {
        "<sex> muèn lµm Thiªn H­¬ng phÊn n÷a kh«ng? Ch?cÇn ®Õn Giang T©n Th«n t×m khãi ©m trªn ng­êi ¢m hån, chu sa trªn m×nh Heo rõng, t?ong trªn ong vµng v?l­îc trang søc trªn ng­êi N?KiÕm hµo, t×m ®ñ nguyªn liÖu ta s?gióp ng­¬i lµm."
    };
    local szElse = {
        "Phô n÷ chØ cÇn sèng kháe chø son phÊn sao s¸nh ®­îc víi c¸i ®Ñp tù nhiªn."
    };
    local szTalk = {
        "§óng lµ sè nguyªn liÖu nµy råi! §îi ta mét l¸t!",
        "……",
        "Thiªn H­¬ng phÊn ®©y! <sex> cÇm lÊy!",
        "§a t¹!"
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
        "Sao trÝ nhí kÐm vËy, ta nãi l¹i mét lÇn th«i ®ã Thiªn H­¬ng phÊn chØ cã T­ëng Duy ë D­¬ng Ch©u míi lµm ®­îc."
    };
    local szTalk = {
        "T×m ®­îc råi µ? Xem cã chót b¶n lÜnh! Mµ ta cßn chuyÖn muèn nhê <sex> gióp ®ì.",
        "C« n­¬ng cø nãi!",
        "Yªn t©m! ViÖc nµy lµ lÇn cuèi ta nhê ng­¬i, lÇn tr­íc bän ng­êi Xi Háa gi¸o ®Õn ®©y ®· lÊy c¾p Tö Phông kim thoa cña ta.",
        "§ã lµ vËt ®Þnh t×nh, ng­¬i gióp ta ®Õn L­ìng Thñy ®éng tÇng 2 ®¸nh Xi Háa gi¸o ®å lÊy Tö Phông kim thoa vÒ.",
        "T¹i h¹ lªn ®­êng ngay!"
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
    Msg2Player("Gióp Thu Dung ®Õn L­ìng Thñy ®éng tÇng 2 ®¸nh Xi Háa gi¸o ®å lÊy Tö Phông kim thoa");
    TaskTip("Gióp Thu Dung ®Õn L­ìng Thñy ®éng tÇng 2 ®¸nh Xi Háa gi¸o ®å lÊy Tö Phông kim thoa");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou2")		--Á½Ë®ÒõÄ±2
end;

function task_14_00()
    local szTalk = {
        "§óng lµ vËt nµy råi! §a t¹ <sex> gióp ®ì!",
        "Giê c« n­¬ng cã thÓ nãi cho t¹i h¹ nghe chuyÖn Xi Háa gi¸o ®å ch­a?",
        "LÇn tr­íc hä ®Õn ®©y uèng r­îu cã nh¾c ®Õn m¶nh S¬n Hµ X· T¾c cã thÓ triÖu gäi háa kú l©n trong L­ìng Thñy ®éng. Con vËt nµy nÕu qua 49 ngµy sÏ cã søc m¹nh thÇn kú, nuèt ®­îc c¶ nöa nhµ Tèng. Ta chØ biÕt vËy th«i!",
        "T¹i h¹ lËp tøc ®Õn {L­ìng Thñy ®éng tÇng 2} ng¨n c¶n bän chóng.",
        "§¸nh b¹i kú l©n nhí vÒ kÓ ta nghe nha!"
    };
    local szMsg = {"§¸m ng­êi Xi Háa gi¸o ®å ®ang trèn ë L­ìng Thñy ®éng tÇng 2. ng­¬i nhí gióp ta ®o¹t Tö Phông kim thoa vÒ!"};
    if GetItemCount(2,0,303) >= 1 then --×Ï·ï½ðîÎ
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
    DelItem(2,0,303,1);   --×Ï·ï½ðîÎ
    Msg2Player("§Õn L­ìng Thñy ®éng tÇng 2 ®¸nh b¹i Háa Kú l©n");
    TaskTip("§Õn L­ìng Thñy ®éng tÇng 2 ®¸nh b¹i Háa Kú l©n");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou3")		--Á½Ë®ÒõÄ±3
end;

function task_16_00()
    local szTalk = {
        "T¹i h¹ ®· ®¸nh b¹i háa kú l©n tr­íc thêi h¹n, c« n­¬ng cã thÓ yªn t©m!",
        "Nguy hiÓm l¾m! ChuyÖn lµ…",
        "Hay qu¸! Hay qu¸!",
        "Nh­ng m¶nh S¬n Hµ X· T¾c cßn trong tay Tr­êng Ca M«n sao l¹i r¬i vµo tay Xi Háa gi¸o? §óng råi! Ph¶i vÒ {§­êng M«n} gÆp {§­êng Xu©n} xem cã kÕt qu¶ gi¸m ®Þnh ¸m khÝ ch­a!"
    };
    TalkEx("task_16_01", szTalk);
end;

function task_16_01()
    SetTask(TASK_YZ_THREE, 17);
    SetTask(TASK_YZ_TWO, 4);
    GivePlayerAward("Level_50", "hell", "chest", "Level_44");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou4")		--Á½Ë®ÒõÄ±4
end;