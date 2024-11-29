Include("\\script\\function\\honor_tong\\ht_head.lua")

function OnUse(nItem)
	local tSay = {
		"G�i boss th� gi�i/AddWorldBoss",
		"Tri�u t�p boss t�ng h�p/BossTongHop",
		"Tri�u h�i ��ng Ph��ng b�t b�i (tan v� 1 l�nh b�i)/"..format("#createDongPhuong(%d)",nItem),
	}
	tinsert(tSay, "T�m ch�a tri�u t�p/nothing");
	Say("",getn(tSay),tSay);
end;

function nothing()
end;

function AddWorldBoss(nVar1)
	local map_ID,att_X,att_Y = GetWorldPos();
	
	local nNpcIndex = CreateNpc("WorldBoss_rwx", "BOSS Th� Gi�i", map_ID, att_X, att_Y);
	SetNpcLifeTime(nNpcIndex,1000);
	--SetNpcDeathScript(nNpcIndex, );
end

function BossTongHop()
	local tSay = {}

	tinsert(tSay, format("%s/Boss_LucLam", "B�c L�c L�m Minh Ch�"))
	tinsert(tSay, format("%s/Boss_ThuongThan", "Th��ng Th�n Doanh Thi�n"))
	tinsert(tSay, format("%s/Boss_HuongLang", "L�nh H��ng L�ng"))
	tinsert(tSay, format("%s/Boss_LanHoa", "Lan Hoa"))
	tinsert(tSay, format("%s/Boss_AnhTu", "Anh T�"))
	tinsert(tSay, format("%s/Boss_PhuThuy", "Ph� th�y b�ng gi�"))
	tinsert(tSay, format("%s/Boss_LuongSon", "H�o h�n L��ng S�n"))
	tinsert(tSay, format("%s/Boss_W1", "��o Hoa ��o Ch� Ho�ng Long"))
	tinsert(tSay, format("%s/Boss_W2", "T�y V�c Th��ng Lang B� V��ng"))
	tinsert(tSay, format("%s/Boss_W3", "Ng�c S�n Chi Linh Thi�n C�u"))
	tinsert(tSay, format("%s/Boss_W4", "U Tr�ch Chi �nh Minh V�"))
	tinsert(tSay, format("%s/Boss_TuLinh", "T� Linh"))
	tinsert(tSay, format("%s/Boss_NienThu", "��i Ni�n Th�"))
	tinsert(tSay, format("%s/Boss_ThitNuong", "Y�n ti�c Th�t N��ng"))
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say("Ng��i c�n g�i boss g�?", getn(tSay), tSay);
end

function Boss_LucLam()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("S�n T�c ��u M�c","B�c L�c L�m Minh Ch�", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe n�i minh ch� l�c l�m �ang � t�y Tuy�n Ch�u 191/192, ch�c �ang c� �m m�u!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_ThuongThan()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("Huy�n V� Th�ong","Th��ng Th�n Doanh Thi�n", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe n�i th� v� th�n t�n c�a T�n Th�y Ho�ng �ang � t�y Tuy�n Ch�u 189/192, v� l�m s�p c� m�t tr�n h�o ki�p!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_HuongLang()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("Nghi�t H�n","L�nh H��ng L�ng", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe n�i L�nh H��ng L�ng  �ang � t�y Tuy�n Ch�u 186/194, mau ��n �� xem th� dung nhan ki�u di�m c�a n�ng!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_LanHoa()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("lanhua_viet","Lan Hoa", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("C� ng��i nh�n th�y Lan Hoa �ang � t�y Tuy�n Ch�u 181/190, mau ��n �� xem!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")

end

function Boss_AnhTu()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("yingzi_viet","Anh T�", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("C� ng��i nh�n th�y Anh T�  �ang � t�y Tuy�n Ch�u 179/192, mau ��n �� xem!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")

end


function Boss_ThitNuong()

	--Msg2Global("C� ng��i nh�n th�y Y�n ti�c Th�t N��ng �ang � t�y Tuy�n Ch�u 181/188, mau ��n tham d�!")
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
	local nMap,nX,nY = GetWorldPos();			
	for i = 1, 20 do
		nAddX = random(-70, 70)
		nAddY = random(-70, 70)		
		nTargetNpc = CreateNpc("M�m c�", "Th�t N��ng", nMap, nX + nAddX,  nY + nAddY)
		SetNpcLifeTime(nTargetNpc, 130)
		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\2\\pangtuzi_baoguo.lua")
end

end

function Boss_PhuThuy()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIndex = 0
	local nNpcIndex = CreateNpc("Ph� th�y b�ng gi�", "Ph� th�y b�ng gi�", nMap, nX + 2, nY + 2);
	SetNpcLifeTime(nNpcIndex, 7200);
	SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\3\\death_binglengwushi.lua");
	--Msg2Global("C� ng��i nh�n th�y Ph� th�y b�ng gi�  �ang � t�y Tuy�n Ch�u 192/188, mau ��n �� xem!")


end

function Boss_LuongSon()

	local nNpcIndex = 0
	local nMap,nX,nY = GetWorldPos();
	local n = gf_GetRandItemByTable(LSB_NPC_GOLD_BOSS, 1000, 1) or 1;
	local nNpcIndex = CreateNpc(LSB_NPC_GOLD_BOSS[n][1],LSB_NPC_GOLD_BOSS[n][3],  nMap, nX + 2, nY + 2);
		SetNpcLifeTime(nNpcIndex,7200);
		SetNpcDeathScript(nNpcIndex,"\\script\\online\\liangshanboss\\npc\\gld_boos_death.lua");
		SetNpcRemoveScript(nNpcIndex,"\\script\\online\\liangshanboss\\npc\\gld_boss_remove.lua");
	--Msg2Global("C� ng��i ph�t hi�n H�o h�n L��ng S�n  �ang � t�y Tuy�n Ch�u 191/187, mau ��n �� xem!")

end

LSB_NPC_GOLD_BOSS = {
	{"yangxiong", 165, "B�nh Quan S�c D��ng H�ng", 30 * 60},
	{"linchong", 167, "B�o T� ��u L�m Xung", 30 * 60},
	{"luzhishen", 167, "Hoa H�a Th��ng L� Tr� Th�m", 30 * 60},
	{"likui", 167, "H�c To�n Phong L� Qu�", 30 * 60},
	{"husanliang", 167, "Nh�t Tr��ng Thanh H� Tam N��ng", 30 * 60},
	{"shixiu", 167, "Phanh M�nh Tam Lang Th�ch T�", 30 * 60},
	{"C�p Th�i V� T�ng Giang", 167, "C�p Th�i V� T�ng Giang", 30 * 60},
	{"Tri �a Tinh Ng� D�ng", 167, "Tri �a Tinh Ng� D�ng", 30 * 60},
	{"C�u V�n Long S� Ti�n", 167, "C�u V�n Long S� Ti�n", 30 * 60},
	{"Ti�u Tuy�n Phong S�i Ti�n", 167, "Ti�u Tuy�n Phong S�i Ti�n", 30 * 60},
	{"��i �ao Quan Th�ng", 167, "��i �ao Quan Th�ng", 30 * 60},
	{"Nh�p V�n Long C�ng T�n Th�ng", 167, "Nh�p V�n Long C�ng T�n Th�ng", 30 * 60},
	{"B�o T� ��u L�m Xung", 167, "B�o T� ��u L�m Xung", 30 * 60},
	{"Hoa H�a Th��ng L� Tr� Th�m", 167, "Hoa H�a Th��ng L� Tr� Th�m", 30 * 60},
	{"H�nh Gi� V� T�ng", 167, "H�nh Gi� V� T�ng", 30 * 60},
	{"T�y B�n Ti�n Phong Nh�t Ph�m", 167, "T�y B�n Ti�n Phong Nh�t Ph�m", 30 * 60},
	{"B�nh Quan S�c D��ng H�ng", 167, "B�nh Quan S�c D��ng H�ng", 30 * 60},
	{"Phanh M�nh Tam Lang Th�ch T�", 167, "Phanh M�nh Tam Lang Th�ch T�", 30 * 60},
	{"Nh�t Tr��ng Thanh H� Tam N��ng", 167, "Nh�t Tr��ng Thanh H� Tam N��ng", 30 * 60},
	{"Song Th��ng T��ng ��ng B�nh", 167, "Song Th��ng T��ng ��ng B�nh", 30 * 60},
	{"Thanh Di�n Th� D��ng Tr�", 167, "Thanh Di�n Th� D��ng Tr�", 30 * 60},
	{"T�ch L�ch H�a T�n Minh", 167, "T�ch L�ch H�a T�n Minh", 30 * 60},
	{"Song Ti�n H� Di�n Ch��c", 167, "Song Ti�n H� Di�n Ch��c", 30 * 60},
	{"H�c To�n Phong L� Qu�", 167, "H�c To�n Phong L� Qu�", 30 * 60},
};

function Boss_W1()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_HL", "��o Hoa ��o Ch� Ho�ng Long", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W2()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_CLBZ", "T�y V�c Th��ng Lang B� V��ng", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W3()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_TJ", "Ng�c S�n Chi Linh Thi�n C�u", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W4()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_MW", "U Tr�ch Chi �nh Minh V�", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end

function Thuong_LuongSon()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
			local nNpcIdx = CreateNpc(IBbaoxiang, "R��ng H�o H�n", nMap, nX + 2, nY + 2);
			SetNpcLifeTime(nNpcIdx, 3 * 60);
			SetNpcScript(nNpcIdx,"\\script\\online\\liangshanboss\\npc\\box\\box_e.lua");

end

function Boss_TuLinh()

	local nNpcIndex = 0
	local nMap,nX,nY = GetWorldPos();
	local n = gf_GetRandItemByTable(TuLinh_BOSS_LIST, 1000, 1) or 1;
	local nNpcIndex = CreateNpc(TuLinh_BOSS_LIST[n][1],TuLinh_BOSS_LIST[n][3],  nMap, nX + 2, nY + 2);
		SetNpcLifeTime(nNpcIndex,7200);
		SetNpcDeathScript(nNpcIndex,"\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua");

end

TuLinh_BOSS_LIST = {
	{"Long T�", 165, "Long Th�n H�a Th�n", 30 * 60},
	{"Ph�ng T�", 167, "Ph�ng Th�n H�a Th�n", 30 * 60},
	{"H� T�", 165, "H� Th�n H�a Th�n", 30 * 60},
	{"�ng T�", 167, "�ng Th�n H�a Th�n", 30 * 60},
}

function Boss_NienThu()

	local nNpcIndex = 0
	local nMap,nX,nY = GetWorldPos();
	local nNpcIndex = CreateNpc("��i Ni�n Th�","Th�n th� ngh�n n�m",  nMap, nX + 2, nY + 2);
		SetNpcLifeTime(nNpcIndex,7200);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_03\\boss\\npc\\bigboss.lua");

end




function createDongPhuong(nItem)
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= 108 then
		Talk(1,"","H�y ��n B�c Tuy�n Ch�u d�ng V� L�m Hi�u Tri�u L�nh tri�u h�i ��ng Ph��ng B�t B�i!");
		return 0;
	end
	if GetTongDuty() ~= 1 then
		Talk(1,"","Ch� c� bang ch� m�i c� th� d�ng V� L�m Hi�u Tri�u L�nh!");
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local npcIndex = CreateNpc("��ng Ph��ng B�t B�i", "��ng Ph��ng B�t B�i", nMapId, nX, nY);
	if npcIndex <= 0 then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 30*60);
	SetNpcDeathScript(npcIndex, "\\script\\function\\honor_tong\\ht_extend.lua");
	SetNpcTempData(npcIndex, 1, GetTongID()); --���ɹ���
	SetNpcTempData(npcIndex, 2, gf_GetTaskByte(HT_TASK_1, 2));  --�Ƿ��ǵ�һ������
	Msg2Tong(format("Bang ch� %s � B�c Tuy�n Ch�u d�ng V� L�m Hi�u Tri�u L�nh tri�u h�i BOSS ��ng Ph��ng B�t B�i, c�c v� h�y nhanh ch�ng �i khi�u chi�n BOSS �� nh�n ph�n th��ng phong ph� n�o!", GetName()));
end

function OnDeath(id, f, x)
	local nTargetTong = GetNpcTempData(id, 1);
	local bRankOne = GetNpcTempData(id, 2);
	local nMapID, nX, nY = GetNpcWorldPos(id);
	SetNpcLifeTime(id, 0);
	local npcIndex = CreateNpc("jinbaoxiang", "R��ng V�ng Bang Ph�i", nMapID, nX, nY);
	SetNpcScript(npcIndex, "\\script\\function\\honor_tong\\ht_extend.lua");
	SetNpcLifeTime(npcIndex, 10*60);
	SetNpcTempData(npcIndex, 1, nTargetTong); --���ɹ���
	SetNpcTempData(npcIndex, 2, bRankOne);  --�Ƿ��ǵ�һ������
end

function main()
	if gf_GetTaskByte(HT_TASK_1, 3) ~= 0 then
		Talk(1,"",format("%s �� nh�n ph�n th��ng r��ng, kh�ng th� nh�n l�i!", gf_GetPlayerSexName()));
		return 0;
	end
	
	local nTargetNpc = GetTargetNpc();
	local nTargetTong = GetNpcTempData(nTargetNpc, 1);
	if nTargetTong ~= GetTongID() then
		Talk(1,"","Ch� c� th�nh vi�n c�a bang h�i m�i c� th� nh�n th��ng!");
		return 0;
	end
	local nJoinTime = GetJoinTongTime();
	if nJoinTime <= 0 or GetTime() - nJoinTime < 7 * 24 * 3600 then
		Talk(1,"",HT_NPC..format("%s ch�a gia nh�p bang h�i ho�c th�i gian gia nh�p kh�ng �� %d ng�y", gf_GetPlayerSexName(), 7));
		return 0;
	end
	
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	
	if gf_Check55HaveSkill() ~= 1 then
		Talk(1,"",HT_NPC.."C�c h� ch�a h�c skill 55. Kh�ng th� nh�n th��ng!")
		return 0;
	end
	
	local nRankone = GetNpcTempData(nTargetNpc, 2);
	local nTongDuty = GetTongDuty();
	if nTongDuty == 1 then --����
		if GetNpcTempData(nTargetNpc, 3) ~= 0 then
			Talk(1,"","Bang ch� �� nh�n th��ng r�i, kh�ng th� nh�n l�i!");
			return 0;
		end
		if gf_Judge_Room_Weight(15, 100,1) ~= 1 then
			Talk(1,"",szMsgHead.."H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i h�nh trang!");
			return 0;
		end
		gf_SetTaskByte(HT_TASK_1, 3, 1, TASK_ACCESS_CODE_HONOR_TONG);
		gf_ModifyExp(10000000);
		gf_AddItemEx2({2, 1, 1210, 3}, "B�o r��ng T�i nguy�n", "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 3600 * 24, 1);
		hte_RandBook();
		gf_AddItemEx2({2, 1, 30844, 1, 4}, "R��ng H�a Ph�ng", "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 0, 1);
		if nRankone == 1 then --��������
			gf_AddItemEx2({0, 105, 10112, 1, 4, -1, -1, -1, -1, -1, -1}, "T� Ng�c Tr��ng Phong", "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 7*24*3600, 1);
			gf_AddItemEx2({2, 1, 1210, 5}, "B�o r��ng T�i nguy�n", "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 0, 1);
			for i = 1, 2 do
				hte_RandBook();
			end
			gf_AddItemEx2({2, 1, 30844, 2, 4}, "R��ng H�a Ph�ng", "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 0, 1);
		end
		SetNpcTempData(nTargetNpc, 3, 1); --��ǰ�������
	else --����
		gf_SetTaskByte(HT_TASK_1, 3, 1, TASK_ACCESS_CODE_HONOR_TONG);
		gf_ModifyExp(10000000);
		gf_EventGiveCustomAward(5, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
		gf_EventGiveCustomAward(9, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
		gf_EventGiveCustomAward(12, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
		if nRankone == 1 then --��������
			gf_ModifyExp(10000000);
			gf_EventGiveCustomAward(5, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
			gf_EventGiveCustomAward(9, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
			gf_EventGiveCustomAward(12, 4*60, 1, "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i");
		end
	end
end

function hte_RandBook()
	local tAward = {
		{0, 107, 30001, "Kim Cang B�t Nh� Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30002, "Ti�m Long T�c Di�t Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30003, "V� Tr�n B� �� Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30004, "Thi�n La Li�n Ch�u Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30005, "Nh� � Kim ��nh Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30006, "B�ch H�i Tuy�t �m Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30007, "H�n ��n Tr�n Nh�c Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30008, "Qu� Thi�n Du Long Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30009, "Huy�n �nh M� T�ng Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30010, "Qu�n T� ��i Phong Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30011, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30012, "Xuy�n V�n L�c H�ng Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30013, "Huy�n Minh Phong Ma Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30014, "Linh C� Huy�n T� Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30015, "C�u Thi�n Phong L�i Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30016, "H�ng Tr�n T�y M�ng Ch�n Quy�n (Cao c�p)"},
		{0, 107, 30017, "Phong Hoa Thi�n Di�p Ch�n Quy�n (Cao c�p)"},
	}
	local nIndex = random(getn(tAward));
	gf_AddItemEx2({tAward[nIndex][1], tAward[nIndex][2], tAward[nIndex][3], 1}, tAward[nIndex][4], "Bang H�i Vinh Danh", "R��ng V�ng Bang Ph�i", 0, 1);
end