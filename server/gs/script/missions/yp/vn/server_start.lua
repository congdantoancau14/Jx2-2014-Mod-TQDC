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

function Add_PopNpc()		--����npc
	CreateNpcList({
		{"men6_fengyun_tayun", "Nh� s� L�c T�n M�n ��p V�n", 6300, 1413, 3252, "\\script\\pop\\�����ŷ��ƶ�ʹ̤֮��.lua"},
		--{"��Ϭ�������", "��Ϭ�������", 6300, 1475, 3228, "\\script\\pop\\npc_yikelin.lua"},
		--{"�ƻ굶�ַ�", "�ƻ굶�ַ�", 6300, 1358, 3385, "\\script\\pop\\npc_linfeng.lua"},
		--{"��Ӱ����־��", "��Ӱ����־��", 6300, 1283, 3236, "\\script\\pop\\npc_lizhijie.lua"},
		--{"����צ����", "����צ����", 6300, 1462, 3382, "\\script\\pop\\npc_xiaoqin.lua"},
		--{"���", "���", 6400, 1780, 3173, "\\script\\pop\\npc_lichenfeng.lua"};
	});

	local nNpcIdx = CreateNpc("Linh T� Ki�m Di�c Kh� L�ng","Linh T� Ki�m Di�c Kh� L�ng",6300,1475,3228)
	SetNpcScript(nNpcIdx,"\\script\\pop\\npc_yikelin.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Ph� H�n �ao L�m Phong", "Ph� H�n �ao L�m Phong", 6300, 1358, 3385)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_linfeng.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Qu� �nh B�t L� Ch� Ki�t", "Qu� �nh B�t L� Ch� Ki�t", 6300, 1283, 3236)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lizhijie.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("V� T�nh Tr�o Ti�u Thanh", "V� T�nh Tr�o Ti�u Thanh", 6300, 1462, 3382)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_xiaoqin.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Ti�u c�c gian t� L� Tr�n Phong", "Ti�u c�c gian t� L� Tr�n Phong", 6400, 1780, 3173)
	SetNpcScript("\\script\\pop\\npc_lichenfeng.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6);

	CreateNpc("zongbiaotou_yuntianqi", "Thi�n H�nh t�ng ti�u ��u Thi�n Kh�i", 6300, 1349, 3258);
	CreateNpc("Tri�u ��nh m�t th�m Th�m Trung", "Tri�u ��nh m�t th�m Th�m Trung", 6400, 1722, 3275);
	CreateNpc("qianfuwren", "Ch� ti�n trang V�n gia Ti�n Phu Nh�n", 6300, 1372, 3297);
	CreateNpc("linjiacheng", "Ph� H�o Th��ng H�i L�m Gia Th�nh", 6300, 1386, 3296);
	CreateNpc("�o�n T� Ki�t", "Danh V�ng Th��ng Nh�n-�o�n T� Ki�t", 6000, 1604, 2776);
	CreateNpc("L� Ng�o Thi�n", "Danh V�ng Th��ng Nh�n-L� Ng�o Thi�n", 6200, 1443, 2597);
	CreateNpc("T�t Gi� Minh Ph�", "Danh V�ng Th��ng Nh�n-T�t Gi� Minh Ph�", 6100, 1594, 3683);
end

function AddPVPNpc()
	CreateNpcList({
		{"�o�n H�a Huy�n", "�o�n H�a Huy�n", 425,1762,3205, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"C�t Kh�m X�ch Ba", "C�t Kh�m X�ch Ba", 425,1740,3175, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"L� K� Tinh", "L� K� Tinh", 425,1763,3184, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"Xa phu", "Xa Phu T�y V�c", 425, 1744, 3204, "\\script\\missions\\yp\\cf_npc.lua"},
		{"Xa phu Trung Nguy�n","Xa Phu V� L�m Minh",425,1741,3232,"\\script\\tong\\npc_chehu.lua"},
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