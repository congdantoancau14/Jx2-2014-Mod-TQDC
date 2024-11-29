--ÉñÃØÑÌ»ð
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	if tGtCondition:check_taskid(483, 2) ~= nil then
		Talk(1, "", "Nghe nãi trªn th­ cã ®éc, hay lµ mang th­ giao cho §¹p V©n xem tr­íc, sau ®ã míi ®i t×m Ng« TiÓu TiÓu.");
		return
	end

	if tGtCondition:check_taskid(484, 2) ~= nil and BigGetItemCount(2, 96, 31) == 0 then
		Talk(1, "", "ThiÕu hiÖp kh«ng cã <color=yellow>mËt th­ chÆn b¾t ®­îc<color>!");
		return
	end

	if tGtCondition:check_taskid(484, 2) ~= nil or tGtCondition:check_taskid(851, 2) ~= nil then
		local mapID, mapX, mapY = GetWorldPos();

		--³Ç½¼£¡£¡£¡£¡
		local tMap = {6300};
		local bFound = 0;

		for i = 1, getn(tMap) do
			if tMap[i] == mapID then
				bFound = 1;
				break;
			end
		end

		if bFound == 1 then
			if GetFightState() ~= 1 then
				Talk(1,"","Kh«ng thÓ ë khu vùc hßa b×nh dïng Ph¸o Hoa ThÇn BÝ!");
				return nil;
			end
			local tTalk = {
				"<color=green>Ng« TiÓu TiÓu<color>: Ng­¬i lµ ai? Sao d¸m dïng ®éc ®Ó h¹i ta?",
				"<color=green>Ng­êi ch¬i<color>: Ta ®­îc NhÞ sø Lôc T¸n M«n §¹p V©n ñy th¸c, ®Õn lÊy BÝch H¶i Lam vÒ!",
				"<color=green>Ng« TiÓu TiÓu<color>: Ng­¬i biÕt hÕt c¶ råi? Xem ra kh«ng thÓ ®Ó ng­¬i sèng sãt trë vÒ råi!",
			};

			TalkEx("ChangeWXX", tTalk);
			return
		else
			Talk(1, "", "ChØ ®­îc ë ThÊt L¹c Nhai dïng Ph¸o Hoa ThÇn BÝ!");
			return nil;
		end
	end

	Talk(1, "", "HÖ thèng bÞ lçi.");
	return
end

function ChangeWXX()
		local nRet = 2;

		local nGtask = 484;
		local nTimeTaskID = TASK_WXX_TIME;

		if tGtCondition:check_taskid(484, 2) == nil then
			nGtask = 851
			nTimeTaskID = TASK_WXX_DAILY_TIME;
		end

		local tNpc = {
			"men6_pt_wuxiaoxiao",
			"Lôc PhiÕn M«n-Ph¶n §å Ng« TiÓu TiÓu",
			1,
			"\\script\\pop\\npc_wuxiaoxiao.lua",
			2,
			5 * 60,
		};
		nRet = UseItemToCallNpc(nItemIndex, nGtask, nTimeTaskID, tNpc);

		if nRet == 2 then
			Talk(1, "", "Kú l¹, ng­¬i ch­a nhËn nhiÖm vô, sao l¹i cã ®¹o cô nµy?");
		elseif nRet == 3 then
			Talk(1, "", "Ph¶i mét lóc sau míi dïng tiÕp ®­îc. (Gi·n c¸ch sö dông: 2 phót)");
		elseif nRet == 4 then
			Talk(1, "", "Chóc mõng ®· hoµn thµnh h·y ®i giao nhiÖm vô.");
		end
end
