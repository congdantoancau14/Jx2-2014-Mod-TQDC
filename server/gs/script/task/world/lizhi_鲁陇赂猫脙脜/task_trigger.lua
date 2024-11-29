--Œƒº˛Àµ√˜
--≥§∏Ë√≈»ŒŒÒ¥•∑¢∆˜Ω≈±æ
--created by lizhi
--2005-8-10 15:19

Include("\\script\\task\\world\\lizhi_≥§∏Ë√≈\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");

function Yzl_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,51,1);  --≥§∏Ë√≈»ÀŒÔ∆◊
    end;
    if GetItemCount(2,0,51) >= 9 then
    	Msg2Player("Thu thÀp xong Tr≠Íng M´n s∏ch");
    	TaskTip("Thu thÀp xong Tr≠Íng M´n s∏ch");
   	end;
end;

function Lbs_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,52,1);  --ÃÏ“ıΩÃ‘” È
    end;
    if GetItemCount(2,0,52) >= 9 then
    	Msg2Player("Thu thÀp xong Thi™n ¢m gi∏o tπp th≠");
    	TaskTip("Thu thÀp xong Thi™n ¢m gi∏o tπp th≠");
   	end;
end;

function Wmb_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,53,1);  --ÚøªΩÃ√ÒÀ◊
    end;
    if GetItemCount(2,0,53) >= 9 then
    	Msg2Player("Thu thÀp xong phong tÙc Xi H·a gi∏o");
    	TaskTip("Thu thÀp xong phong tÙc Xi H·a gi∏o");
   	end;
end;

function Mxsz_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,54,1);  --“ª∆∑Ã√“› ¬
    end;
    if GetItemCount(2,0,54) >= 9 then
    	Msg2Player("Thu thÀp xong vi÷c lµm cÒa Nh t Ph»m Æ≠Íng");
    	TaskTip("Thu thÀp xong vi÷c lµm cÒa Nh t Ph»m Æ≠Íng");
   	end;
end;

function Hl_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_FOUR, 3);
end;

--function Cgm_OnTimer()
--    RemoveTrigger(GetRunningTrigger());
--    SetTask(TASK_ONE, 110);
--end;

--function Leave_Game()
--    if GetTask(124) == 2 or GetTask(125) == 2 or GetTask(126) == 2 then
--        RemoveTrigger(GetRunningTrigger());
--        RemoveTrigger(GetTrigger(90));
--    end;
--end;