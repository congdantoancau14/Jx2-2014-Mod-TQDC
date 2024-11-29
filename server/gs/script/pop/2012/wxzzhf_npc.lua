--ÎÞÏà×Ú×ó»¤·¨
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	tGtNpcMain:npc_main();
end

function OnDeath(nIdx)
	RemoveNpc(nIdx);
	local nNpcIdx = CreateNpc("V« T­¬ng T«ng-T¶ Hé Ph¸p","V« T­¬ng T«ng-T¶ Hé Ph¸p",604,1295,2908);
	if nNpcIdx ~= 0 then
		ChangeNpcToFight(nNpcIdx,0,6);
		AddUnitStates(nNpcIdx,8,-GetUnitBaseStates(nNpcIdx,8));
		SetNpcScript(nNpcIdx,"\\script\\pop\\2012\\wxzzhf_npc.lua")
	end
end