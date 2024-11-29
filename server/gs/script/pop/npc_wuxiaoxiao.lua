--²âÊÔÓÃ½Å±¾
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\pop\\fire.lua");

g_NpcName = "<color=green>Lôc PhiÕn M«n-Ph¶n §å Ng« TiÓu TiÓu<color>: ";

TMain = {};
TMain.msg = g_NpcName.."Hõm, t¹i sao l¹i lµ ng­¬i? Tiªu Tinh kh«ng tù ®Õn ®©y ®Ó lÊy thuèc gi¶i sao?";
TMain.sel = {
	{"Ta kh«ng biÕt, h¾n chØ nhê ta ®­a th­ cho ng­¬i, cßn l¹i kh«ng nãi g× c¶.", "Change"},
}

function main()
	--if tGtCondition:check_taskid(484, 2) ~= nil then
end

function OnDeath(nNpcIdx)
	--if BigGetItemCount(2, 96, 33) == 0 and DelItem(2,96,31,1) == 1 then
		--gf_AddItemEx({2, 96, 33, 1}, "ÆßÃðº®ÐÇÕÆ½âÒ©");
	--end

	SetNpcLifeTime(nNpcIdx,10);
end
