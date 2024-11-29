--ÎÄ¼şËµÃ÷
--ÓëÏÄºîÇÙ¶Ô»°´¥·¢µÄ½Å±¾
-- created by lizhi
-- 2005-8-11 14:07

Include("\\script\\task\\world\\lizhi_³¤¸èÃÅ\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function talk_one()

    local szTalk = {
        "Ta phông mÖnh TriÖu Diªn Niªn tiÒn bèi th«ng b¸o cho c« n­¬ng cÇn ®Ò phßng bän dŞ téc vâ sÜ",
        "§a t¹ <sex>, ta sÏ ®Ò phßng."
    }
    
    RemoveTrigger(GetRunningTrigger());
    if GetTask(TASK_ONE) == 110 then
        GivePlayerAward("Level_20", "easy");
    elseif GetTask(TASK_ONE) == 102 then
        GivePlayerAward("Level_20", "hard");
    end;
    
    SetTask(124, 2);
    if GetTask(125) == 2 and GetTask(126) == 2 then
        RemoveTrigger(GetTrigger(90));
        SetTask(111, 111);
    else
        RemoveTrigger(GetTrigger(90));
        CreateTrigger(1, 201, 90);
        ContinueTimer(GetTrigger(90));
    end;
    TalkEx("", szTalk);
end;

function talk_five()

    local szTaskThreeTalk = {
        "C« n­¬ng cã ph¶i lµ H¹ HÇu CÇm?",
        "Ta ngµy ngµy ngåi g·y ®µn, nµo ph¶i n÷ hiÖp g× ®©u?",
        "Ta võa ®¸nh b¹i Ch­¬ng VÜ C­¬ng, ®o¹t ®­îc mËt hµm bªn trong ghi chuyÕn hµng ®· ®­îc chuyÓn ®i n¬i kh¸c, ngoµi ra cßn ®Ò cËp c« chİnh lµ ng­êi liªn l¹c víi {Tr­êng Ca M«n}, cÇn ph¶i trõ khö!",
        "VËy µ? Ng­¬i cã ®em mËt hµm tíi kh«ng? ChuyÒn hµng ®ã rèt cuéc lµ g×?",
        "§©y! Mêi c« xem qua! Theo t¹i h¹ ®­îc biÕt chuyÕn hµng ®ã nghe ®©u cã liªn quan ®Õn m¶nh S¬n Hµ X· T¾c.",
        "Cã chuyÖn ®¹i sù thËt råi, ®a t¹ ®· <sex> th«ng b¸o. §©y chót t¹ lÔ, xin nhËn lÊy!"
    };
    local szTaskFourTalk = {
        "Thùc ra ta chİnh lµ ng­êi liªn l¹c víi {Tr­êng Ca M«n}, chuyÖn nµy b¾t ®Çu tõ ngµy khai quèc. Lóc ®ã Th¸i Tæ {b×nh ®Şnh giang s¬n}, c¸c vŞ t­íng nh­ Th¹ch Thñ Tİn, Cao Hoµi §øc, Tr­¬ng LÖnh Phong, {TriÖu Ng¹n Huy} ®Òu c¸o l·o håi h­¬ng, an d­ìng tuæi giµ. §¸ng tiÕc TriÖu Ng¹n Huy ®¹i nh©n kh«ng chŞu næi sù c« ®¬n bÌn liªn l¹c mét sè b¹n bÌ giang hå, ng©m th¬, tû vâ nghÖ.",
        "VÒ sau nh÷ng vŞ b»ng h÷u nµy thµnh lËp thµnh mét m«n ph¸i. Lóc ®ã trong ph¸i nhiÒu ng­êi s¸ng t¸c nh¹c lµm th¬ cho nªn míi cã tªn {Tr­êng Ca M«n}.",
        "Ta cã thÓ gióp ®­îc g× cho c« n­¬ng ®©y."
    };

    local szFinished = {
        "<sex> qu¶ nhiªn th©n thñ bÊt phµm! Chót quµ män xin nhËn lÊy!"
    };
    local szTaskFiveTalk = {
        "Hy väng <sex> cã thÓ gióp ta th«ng b¸o cho nh÷ng ng­êi liªn l¹c kh¸c trong {Tr­êng Ca M«n}, lµ {C«ng T«n Th­} (T­¬ng D­¬ng), {TriÖu Diªn Niªn} (BiÖn Kinh), {Gia C¸t Kú} (Giang T©n Th«n).",
        "Ta sÏ ®i ngay!"
    };
    local szTaskFiveFinished = {
        "Ta ®· hoµn thµnh nhiÖm vô c« n­¬ng yªu cÇu!",
        "§a t¹ <sex>, ®©y lµ chót quµ män, xin nhËn lÊy!"
    };

    
    if GetTask(TASK_THREE) == 1 then
        TalkEx("task_four_00", szTaskThreeTalk);
        return
    end;
    
    local nStep = GetTask(TASK_FOUR);
    if nStep == 1 then
        TalkEx("task_four_01", szTaskFourTalk);
        return
    elseif nStep == 2 then
        Talk(1, "", "PhiÒn b»ng h÷u ®Õn Long TuyÒn th«n giÕt 20 con hå ly.");
        return
    elseif nStep == 3 then
        TalkEx("task_four_03", szFinished);
        return
    end;
    
    nStep = GetTask(TASK_FIVE);
    if nStep == 1 then
        TalkEx("task_five_00", szTaskFiveTalk);
        return
    elseif nStep == 2 then
        Talk(1, "", "Mau th«ng b¸o cho nh÷ng ng­êi trong Tr­êng Ca M«n biÕt");
        return
    elseif nStep == 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, 6);
        GivePlayerAward("Level_18", "hard", "head", "Level_21");
		GivePlayerExp(SkeyQZWangyewei,"xiahouqindekaoyan")		--ÏÄºîÇÙµÄ¿¼Ñé
        TalkEx("", szTaskFiveFinished);
        return
    end;
        
end;

function task_four_00()
    SetTask(TASK_THREE, 2);
    SetTask(TASK_FOUR, 1);
    DelItem(2, 0, 40, 1);
    GivePlayerAward("Level_18", "hard");
	GivePlayerExp(SkeyQZWangyewei,"zhangweigangdemihan")		--ÕÂÎ°¸ÕµÄÃÜº¯
end;

function task_four_01()
    local szTalkFourTalk2 = {
        "Th©n phËn ta ®· bŞ ng­êi {Xi Háa gi¸o} ph¸t hiÖn, ng­¬i mau gióp ta ®Õn {Long TuyÒn Th«n} giÕt 20 con {hå ly} vÒ ®©y!",
        "§­îc! Ta ®i ngay!"
    };
    TalkEx("task_four_02", szTalkFourTalk2);
end;

function task_four_02()
    SetTask(TASK_FOUR, 2);
    RemoveTrigger(GetTrigger(99));
    CreateTrigger(0,506,99);
    Msg2Player("GiÕt 20 con hå ly ë Long TuyÒn Th«n");
    TaskTip("GiÕt 20 con hå ly ë Long TuyÒn Th«n");
end;

function task_four_03()
    SetTask(TASK_FOUR, 4);
    SetTask(TASK_FIVE, 1);
    GivePlayerAward("Level_18", "hard");
	GivePlayerExp(SkeyQZWangyewei,"lianluochanggemen")		--ÏÄºîÇÙµÄ¿¼Ñé
end;

function task_five_00()
    CreateTrigger(4, 208, 150);    --talk to ÕÔÑÓÄê
    SetTask(127,1);
    CreateTrigger(4, 210, 151);    --talk to Öî¸ğÆå
    SetTask(128,1);
    CreateTrigger(4, 211, 152);    --talk to ¹«ËïÊé
    SetTask(129,1);
    
    AddItem(2, 0, 41, 1);   --Öî¸ğÆåµÄĞÅ
    AddItem(2, 0, 42, 1);   --¹«ËïÊéµÄĞÅ
    AddItem(2, 0, 43, 1);   --ÕÔÑÓÄêµÄĞÅ
    
    Msg2Player("Liªn l¹c 3 víi 3 ng­êi cßn l¹i trong Tr­êng Ca M«n");
    TaskTip("Liªn l¹c 3 víi 3 ng­êi cßn l¹i trong Tr­êng Ca M«n");
    
    SetTask(TASK_FIVE, 2);
end;