Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main(nNpcIdx)
	if tGtCondition:check_taskid(854, 2) ~= nil then
		nNpcIdx = GetTargetNpc();
		ChangeNpcToFight(nNpcIdx);
	end
end

function OnDeath(npc)
	SetNpcLifeTime(tonumber(npc), 10);
end

function OnRemove(nRemoveIdx)
	SetNpcRemoveScript(nRemoveIdx,"");
	local nNpcIdx = CreateNpc("Tiªu côc gian tÕ Lý TrÇn Phong", "Tiªu côc gian tÕ Lý TrÇn Phong", 6400, 1780, 3173)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lichenfeng.lua")
	SetNpcRemoveScript(nNpcIdx, "\\script\\pop\\npc_lichenfeng.lua");
	ChangeNpcToFight(nNpcIdx, 0, 6);
end
