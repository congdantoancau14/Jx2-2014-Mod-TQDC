--ÎÄ¼şËµÃ÷
--Óë¹«ËïÊé¶Ô»°´¥·¢µÄ½Å±¾
--created by lizhi
--2005-8-11 17:16

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_³¤¸èÃÅ\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function talk_one()
    local szMsg = {
        "Ta phông mÖnh TriÖu Diªn Niªn th«ng b¸o cho tiÒn bèi cÇn ®Ò phßng bän dŞ téc vâ sÜ",
        "§a t¹ <sex>, nÕu thËt chóng ®Õn ta sÏ d¹y cho bµi häc."
    };
    RemoveTrigger(GetRunningTrigger());
    if GetTask(TASK_ONE) == 110 then
        GivePlayerAward("Level_20", "easy", "legs", "Level_23");
    elseif GetTask(TASK_ONE) == 102 then
        GivePlayerAward("Level_20", "hard", "legs", "Level_23");
    end;
    
    SetTask(125, 2);
    if GetTask(124) == 2 and GetTask(126) == 2 then
        RemoveTrigger(GetTrigger(90));
        SetTask(111, 111);
    else
        RemoveTrigger(GetTrigger(90));
        CreateTrigger(1, 201, 90);
        ContinueTimer(GetTrigger(90));
    end;
    TalkEx("", szMsg);
end;

function talk_five()
    local szMsg = {
        "H¹ HÇu CÇm b¶o v·n bèi ®Õn th«ng b¸o vÒ m¶nh S¬n Hµ X· T¾c cã kh¶ n¨ng r¬i vµo tay Xi Háa gi¸o, ®©y lµ th­ cña «ng ta, mêi tiÒn bèi xem qua!",
        "§a t¹ tiÓu huynh ®Ö!",
        "Cßn nhiÒu ng­êi cÇn ph¶i th«ng b¸o n÷a, v·n bèi ®i ®©y!"
    };
    local nStep = 0;
    nStep = GetTask(TASK_FIVE);
    if nStep >= 2 and nStep < 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(129,2);
        DelItem(2,0,42,1);
        TalkEx("", szMsg);
    end;
end;