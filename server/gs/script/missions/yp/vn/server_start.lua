function on_server_start()
	Add_PopNpc()
	AddPVPNpc()
	--AddSanGuoNpc();
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

function Add_PopNpc()		--ÉíÍûnpc
	CreateNpcList({
		{"men6_fengyun_tayun", "NhÞ sø Lôc T¸n M«n §¹p V©n", 6300, 1413, 3252, "\\script\\pop\\ÁùÉÈÃÅ·çÔÆ¶þÊ¹Ö®Ì¤ÔÆ.lua"},
		--{"ÁéÏ¬½£Òà¿ÉÁê", "ÁéÏ¬½£Òà¿ÉÁê", 6300, 1475, 3228, "\\script\\pop\\npc_yikelin.lua"},
		--{"ÆÆ»êµ¶ÁÖ·å", "ÆÆ»êµ¶ÁÖ·å", 6300, 1358, 3385, "\\script\\pop\\npc_linfeng.lua"},
		--{"¹íÓ°±ÊÀîÖ¾½Ü", "¹íÓ°±ÊÀîÖ¾½Ü", 6300, 1283, 3236, "\\script\\pop\\npc_lizhijie.lua"},
		--{"ÎÞÇé×¦ÏôÇç", "ÎÞÇé×¦ÏôÇç", 6300, 1462, 3382, "\\script\\pop\\npc_xiaoqin.lua"},
		--{"Àî³¾·ç", "Àî³¾·ç", 6400, 1780, 3173, "\\script\\pop\\npc_lichenfeng.lua"};
	});

	local nNpcIdx = CreateNpc("Linh TÒ KiÕm DiÖc Kh¶ L¨ng","Linh TÒ KiÕm DiÖc Kh¶ L¨ng",6300,1475,3228)
	SetNpcScript(nNpcIdx,"\\script\\pop\\npc_yikelin.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Ph¸ Hån §ao L©m Phong", "Ph¸ Hån §ao L©m Phong", 6300, 1358, 3385)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_linfeng.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Quû ¶nh Bót Lý ChÝ KiÖt", "Quû ¶nh Bót Lý ChÝ KiÖt", 6300, 1283, 3236)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lizhijie.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("V« T×nh Tr¶o Tiªu Thanh", "V« T×nh Tr¶o Tiªu Thanh", 6300, 1462, 3382)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_xiaoqin.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Tiªu côc gian tÕ Lý TrÇn Phong", "Tiªu côc gian tÕ Lý TrÇn Phong", 6400, 1780, 3173)
	SetNpcScript("\\script\\pop\\npc_lichenfeng.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6);

	CreateNpc("zongbiaotou_yuntianqi", "Thiªn Hµnh tæng tiªu ®Çu Thiªn Khëi", 6300, 1349, 3258);
	CreateNpc("TriÒu ®×nh mËt th¸m ThÈm Trung", "TriÒu ®×nh mËt th¸m ThÈm Trung", 6400, 1722, 3275);
	CreateNpc("qianfuwren", "Chñ tiÒn trang V¹n gia TiÒn Phu Nh©n", 6300, 1372, 3297);
	CreateNpc("linjiacheng", "Phó Hµo Th­¬ng Héi L©m Gia Thµnh", 6300, 1386, 3296);
	CreateNpc("§oµn Tö KiÖt", "Danh Väng Th­¬ng Nh©n-§oµn Tö KiÖt", 6000, 1604, 2776);
	CreateNpc("Lý Ng¹o Thiªn", "Danh Väng Th­¬ng Nh©n-Lý Ng¹o Thiªn", 6200, 1443, 2597);
	CreateNpc("T¸t Giµ Minh Phñ", "Danh Väng Th­¬ng Nh©n-T¸t Giµ Minh Phñ", 6100, 1594, 3683);
end

function AddPVPNpc()
	CreateNpcList({
		{"§o¹n Hßa HuyÒn", "§o¹n Hßa HuyÒn", 425,1762,3205, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"C¸t Kh©m XÝch Ba", "C¸t Kh©m XÝch Ba", 425,1740,3175, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"Lý KÕ Tinh", "Lý KÕ Tinh", 425,1763,3184, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"Xa phu", "Xa Phu T©y Vùc", 425, 1744, 3204, "\\script\\missions\\yp\\cf_npc.lua"},
		{"Xa phu Trung Nguyªn","Xa Phu Vâ L©m Minh",425,1741,3232,"\\script\\tong\\npc_chehu.lua"},
	});
	SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","gameStart()");
end

function AddSanGuoNpc()
	-- local tScript = {
		-- "\\script\\missions\\yp\\tls\\mission.lua",
		-- "\\script\\missions\\yp\\hss\\mission.lua",
		-- "\\script\\missions\\yp\\mm\\mission.lua",
		-- "\\script\\missions\\yp\\qmy\\mission.lua",
		-- "\\script\\missions\\yp\\tysd\\mission.lua",
	-- }
	-- for i=1, getn(tScript) do
		-- SendScript2VM(tScript[i],"stageFight.init();");
	-- end
	
	SendScript2VM("\\script\\missions\\yp\\tls\\mission.lua","stageFight.init()");
	SendScript2VM("\\script\\missions\\yp\\hss\\mission.lua","stageFight.init()");
	SendScript2VM("\\script\\missions\\yp\\mm\\mission.lua","stageFight.init()");
	SendScript2VM("\\script\\missions\\yp\\qmy\\mission.lua","stageFight.init()");
	SendScript2VM("\\script\\missions\\yp\\tysd\\mission.lua","stageFight.init()");
end;