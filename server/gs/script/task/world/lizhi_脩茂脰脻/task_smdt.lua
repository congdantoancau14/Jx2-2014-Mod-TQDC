--ÉñÃØµØÍ¼
--created by lizhi
--2005-9-1 20:05

Include("\\script\\task\\world\\task_award.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function OnUse()
    if GetTask(TASK_FIVE) == 25 and GetItemCount(0,200,13) >= 1 then
        local nMapid, nX, nY = GetWorldPos();
        local nDist = DistanceBetweenPoints(nMapid, nX, nY, 107, 1337, 3132);
        if nDist >= 0 and nDist <= 16 then
            AddItem(2,0,106,1);
            DelItem(2,0,105,1);
            DelItem(0,200,13,1);
            SetTask(TASK_FIVE, 26);
            Msg2Player("Mang b¶o vËt thÇn bÝ cho H¹ HÇu CÇm");
            TaskTip("Mang b¶o vËt thÇn bÝ cho H¹ HÇu CÇm");
        else
            Msg2Player("Theo chØ dÉn cña b¶n ®å gÇn tÊm bia ë Vò Di s¬n");
            TaskTip("Theo chØ dÉn cña b¶n ®å gÇn tÊm bia ë Vò Di s¬n");
        end;
    else
        Msg2Player("§Õn T¹p hãa mua Cuèc tr­íc ®·!");
        TaskTip("§Õn T¹p hãa mua Cuèc tr­íc ®·!");
    end;
end;