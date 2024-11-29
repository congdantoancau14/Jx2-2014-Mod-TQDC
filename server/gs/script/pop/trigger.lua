Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");

function OnLinCFTimer()
	local nIdx = CreateNpc("Thiªn ¢m Gi¸o Cuång §å", "Thiªn ¢m Gi¸o Cuång §å", GetWorldPos(), -1, 2);
	--ChangeNpcToFight(nIdx);
end