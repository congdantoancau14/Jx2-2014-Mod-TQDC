--  Œƒº˛Àµ√˜
--  »™÷›µƒÀ˘”–¥•∑¢∆˜ ¬º˛
--  Created by lizhi
--  2005-8-3 15:05

Include("\\script\\task\\world\\lizhi_»™÷›\\task_head.lua");
Include("\\script\\task\\world\\lizhi_≥§∏Ë√≈\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");

function Wl_Killed()    --…±À¿Œﬁ¿µ

    local nStep = 0;

    RemoveTrigger(GetRunningTrigger());
    
    nStep = GetTask(TASK_LEV_12_ID);
    SetTask(TASK_LEV_12_ID, nStep + 1);
    
    if (nStep == 2) then
        TaskTip("ß∑ Æ∏nh bπi 10 t™n l≠u manh vµ 10 t™n C´n ÆÂ, v“ t◊m Hπ Ki÷t");
    end;
end;

function Lm_Killed_1()
    local nItemCount = GetItemCount(2, 1, 154); 
    if nItemCount >= 20 then
        TaskTip("ß∑ thu thÀp ÆÒ 20 Ng‰c kh›");
    end;
    
    if g_probability(40, 100) then
        AddItem(2,1,154,1);
    end;
end;

function Lm_Killed_10()    --…±À¿¡˜√•

    local nStep = 0;
    
    RemoveTrigger(GetRunningTrigger());

    nStep = GetTask(TASK_LEV_12_ID);
    SetTask(TASK_LEV_12_ID, nStep + 1);
    
    if (nStep == 2) then
        TaskTip("ß∑ Æ∏nh bπi 10 t™n l≠u manh vµ 10 t™n C´n ÆÂ, v“ t◊m Hπ Ki÷t");
    end;
end;

function Yc_Killed()    --…±À¿≤›“©

    local nType = 0;
    local nTrigger = 0;
    local nQingCount = 0;
    local nGeCount = 0;
    local nPeiCount = 0;
    local nLianCount = 0;
    local nJinCount = 0;
    
    nQingCount = GetItemCount(2, 0, 33);    --«‡›Ô
    nGeCount = GetItemCount(2, 0, 34);      --∏∏˘
    nPeiCount = GetItemCount(2, 0, 35);     --≈Â¿º
    nLianCount = GetItemCount(2, 0, 36);    --¡¨«Ã
    nJinCount = GetItemCount(2, 0, 37);     --Ω“¯ª®
    
    if ((nQingCount >= 3) and (nGeCount >= 3) and (nPeiCount >= 3) and (nLianCount >= 3) and (nJinCount >= 3)) then
        Msg2Player("Thu thÀp Æ≠Óc t t c∂ d≠Óc li÷u");
    end;
    
    nType = random(0, 4);

    if (nType == 0) then
        AddItem(2, 0, 33, 1);   --«‡›Ô
    elseif (nType == 1) then
        AddItem(2, 0, 34, 1);   --∏∏˘
    elseif (nType == 2) then
        AddItem(2, 0, 35, 1);   --≈Â¿º
    elseif (nType == 3) then
        AddItem(2, 0, 36, 1);   --¡¨«Ã
    elseif (nType == 4) then
        AddItem(2, 0, 37, 1);   --Ω“¯ª®
    end;
end;

function Yz_Killed()    --…±À¿“∞÷Ì
    
    if g_probability(5, 100) then
        AddItem(2, 0, 39, 1);
    end;
end;

function Leave_Game()
    RemoveTrigger(GetRunningTrigger());
    --RemoveTrigger(GetTrigger(88));
    RemoveTrigger(GetTrigger(86));
    if GetTask(TASK_LEV_18_ID) == 2 then
        KillFollower();
        SetTask(TASK_LEV_18_ID, 1);
    end;
end;

function Zs_OnTimer()
    
    local nStep = 0;
    
    RemoveTrigger(GetRunningTrigger());
    RemoveTrigger(GetTrigger(87));
    --RemoveTrigger(GetTrigger(88));
    KillFollower();
    nStep = GetTask(TASK_LEV_18_ID);
    
    if (nStep == 2) then
        SetTask(TASK_LEV_18_ID, 1);
        Msg2Player("Trong thÍi gian quy Æﬁnh ch≠a lµm xong, nhi÷m vÙ th t bπi");
        TaskTip("Trong thÍi gian quy Æﬁnh ch≠a lµm xong, nhi÷m vÙ th t bπi");
        --CreateTrigger(0, 195, 85); --‘Ÿ…±“ª¥Œ’¬Œ∞∏’
    end;
end;

--function Enter_Map()
--    RemoveTrigger(GetTrigger(86));
--    RemoveTrigger(GetTrigger(87));
--    RemoveTrigger(GetRunningTrigger());
--    
--    Talk(2,"","<color=green>÷” œ<color>£∫∂‡–ª<sex>œ‡æ»£¨œ÷‘⁄“—æ≠µΩ»™÷›≥«¡À£¨æÕ≤ª¿Õ∑≥<sex>¡À°£<sex>»Áπ˚”– ±º‰¿¥º“¿Ôø¥ø¥∞°°£");
--end;