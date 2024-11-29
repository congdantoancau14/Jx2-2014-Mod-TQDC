Include("\\script\\online\\201504_catch_fish\\head.lua")

function on_daily_clear()
end

function on_player_login()
	if is_in_activity_date() ~= 1 then
		return
	end
	CreateTrigger(0, 1374, 1374 * 2)
end

function on_server_start()
	if is_in_activity_date() ~= 1 then
		return
	end
	
	CreateNpcList({
		{"Chñ cÇm ®å T©y Nam", "Th­¬ng Nh©n H¶i S¶n", 100, 1527, 2868, "\\script\\online\\201504_catch_fish\\npc\\npc_seller.lua"},
		{"Ng­ d©n", "Ng­ Phñ", 103, 1817, 3350, "\\script\\online\\201504_catch_fish\\npc\\npc_fisher.lua"},
		{"TiÓu HiÖu Ph¸o §µi", "Ng­ D©n Thæ Ph¸o", 103, 1804, 3441, "\\script\\online\\201504_catch_fish\\npc\\npc_bomb.lua"},
		{"TiÓu HiÖu Ph¸o §µi", "Ng­ D©n Thæ Ph¸o", 103, 1814, 3463, "\\script\\online\\201504_catch_fish\\npc\\npc_bomb.lua"},
		{"TiÓu HiÖu Ph¸o §µi", "Ng­ D©n Thæ Ph¸o", 103, 1830, 3492, "\\script\\online\\201504_catch_fish\\npc\\npc_bomb.lua"},
		{"TiÓu HiÖu Ph¸o §µi", "Ng­ D©n Thæ Ph¸o", 103, 1857, 3480, "\\script\\online\\201504_catch_fish\\npc\\npc_bomb.lua"},
		{"TiÓu HiÖu Ph¸o §µi", "Ng­ D©n Thæ Ph¸o", 103, 1866, 3447, "\\script\\online\\201504_catch_fish\\npc\\npc_bomb.lua"},
		{"TiÓu HiÖu Ph¸o §µi", "Ng­ D©n Thæ Ph¸o", 103, 1873, 3415, "\\script\\online\\201504_catch_fish\\npc\\npc_bomb.lua"},
	});
	apply_server_counter()--¸üÐÂ·þÎñÆ÷¼ÆÊýÆ÷
end

function CreateNpcList(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		SetNpcScript(npc, tNpc[6] or "");
		if npc > 0 then
		else
			local idx = SubWorldID2Idx(tNpc[3])
			if idx and idx > 0 then
				local szMsg = format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or "")
				WriteLog(szMsg)
				print(szMsg)
			end
		end
	end
end