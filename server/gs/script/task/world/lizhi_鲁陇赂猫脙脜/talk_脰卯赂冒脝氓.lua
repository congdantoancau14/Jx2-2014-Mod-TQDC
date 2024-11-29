--ÎÄ¼şËµÃ÷
--ÓëÖî¸ğÆå¶Ô»°´¥·¢µÄ½Å±¾
--created by lizhi
--2005-8-11 17:16

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_³¤¸èÃÅ\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function talk_one()

    local szMsg = {
        "V·n bèi phông mÖnh TriÖu Diªn Niªn tiÒn bèi th«ng b¸o tiÒn bèi cÇn ®Ò phßng bän dŞ téc vâ sÜ .",
        "Haha! §a t¹ <sex>, kh«ng biÕt tµi ch¬i cê cña hä thÕ nµo?"
    };
    
    RemoveTrigger(GetRunningTrigger());
    
    if GetTask(TASK_ONE) == 110 then
        GivePlayerAward("Level_20", "easy", "weapon", "Level_22");
    elseif GetTask(TASK_ONE) == 102 then
        GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
    end;
    
    SetTask(126, 2);
    if GetTask(125) == 2 and GetTask(124) == 2 then
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
        "H¹ HÇu CÇm nhê v·n bèi ®Õn th«ng b¸o vÒ m¶nh S¬n Hµ X· T¾c cã kh¶ n¨ng r¬i vµo tay Xi Háa gi¸o, xin tiÒn bèi xem qua th­ nµy!",
        "§a t¹ anh hïng!",
        "Cßn nhiÒu ng­êi cÇn ph¶i th«ng b¸o n÷a, v·n bèi ®i ®©y!"
    };
    local nStep = 0;
    nStep = GetTask(TASK_FIVE);
    if nStep >= 2 and nStep < 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(128,2);
        DelItem(2,0,41,1);
        TalkEx("", szMsg);
        return
    end;
end;