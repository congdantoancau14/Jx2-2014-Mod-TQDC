--������1
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\class\\clause3.lua")

Include("\\script\\missions\\taiyi\\head.lua")
Include("\\script\\missions\\taiyi\\tyfunctions.lua")

Include("\\script\\online_activites\\head\\activity_normal_head.lua")

--S� Ki�n
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");

MV_WHO_IS_DAYE = tTY.mv_35;
MV_LOOT_ID = tTY.mv_36;
LOG_TITLE = "Ph�n Thi�n L�m-Th�i Nh�t Th�p";
NEED_ROOM = 2;
OPEN_BOX_NEED = {"Thi�n Ki�u L�nh", 2, 97, 236, 1};
msg = "Ch�c m�ng $n trong Ph�n Thi�n L�m-Th�i Nh�t Th�p m� b�o r��ng nh�n ���c $i";

thisFilePath = "\\script\\missions\\taiyi\\box\\yin_box_1.lua"

tAward = {
	randMulti = 1,
	subclauses = {
		{ {"C� Linh Th�ch", {2,1,30368,2}}, 7000},
		{ {"C� Linh Ng�c", {2,1,30369,2}}, 6000},
		{ {"C� Linh Th�ch", {2,1,30368,100}}, 500},
		{ {"C� Linh Ng�c", {2,1,30369,100}}, 500},
        {{"Hu�n ch��ng anh h�ng"    ,{2,1,30499,2,4}},8000},
        {{"Hu�n ch��ng anh h�ng"    ,{2,1,30499,100,4}},500},
        {{"Th�i Nh�t L�nh"    	,{2,1,30687,5},msg},7000},
        {{"Th�i Nh�t L�nh"    	,{2,1,30687,20},msg},2000},
        {{"Th�i Nh�t L�nh"    	,{2,1,30687,100},msg},300},
	},
	giveClause = ClauseRandom.giveClause,
	give = ClauseRandom.giveClause,
}

function main()
	local npcIdx = GetTargetNpc();
	if GetMissionV(MV_WHO_IS_DAYE) == 0 then
		Say("M� [R��ng B�c] c�n 1 [Thi�n Ki�u L�nh] (Ng� C�c c� b�n).",
			2,
			"\n x�c nh�n m�/#IamDaye("..npcIdx..")",
			"\n h�y m�/nothing");
		return
	else
		speLoot(npcIdx);
	end
end

function IamDaye(npcIdx)
	local daye = GetMissionV(MV_WHO_IS_DAYE);

	if 0 ~= daye then
		Talk(1, "", "�� c� ng��i m� r��ng n�y r�i");
		return 0;
	end

	if DelItem(OPEN_BOX_NEED[2],OPEN_BOX_NEED[3],OPEN_BOX_NEED[4],OPEN_BOX_NEED[5]) == 1 then
		SetMissionV(MV_WHO_IS_DAYE, PlayerIndex);
		speLoot(npcIdx);
		AddRuntimeStat(18, 5, GetMissionV(2)-1, (OPEN_BOX_NEED[5] or 1));
		
		local tClause = getLootSeting();
		local nLootItemId = GetMissionV(MV_LOOT_ID);
		if nLootItemId > 0 and nLootItemId <= getn(tClause) then
			local tItem = tClause[nLootItemId][1];
		end
		
		EventAddPhoBan(20);
		
		--cdkey
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", format("_ck_SetCostIB(%d)", OPEN_BOX_NEED[5]));	
		vaf_award_api("tTYTYinBox")
	else
		Talk(1, "", "Tr�n ng��i kh�ng c� [Thi�n Ki�u L�nh], kh�ng th� m� <color=green>R��ng B�c<color>. [Thi�n Ki�u L�nh] c� th� mua trong <color=yellow>Ng� C�c<color>");
	end
end

function getLootSeting()
	return tAward.subclauses;
end

function getLootItem()
	local tClause = getLootSeting();

	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i, tClause[i][1];
		end
	end
	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
	assert();
end

function speLoot(npcIdx)
	local daye = GetMissionV(MV_WHO_IS_DAYE);
	if daye == 0 then
		return 0;
	end
	local tSel = {
			"K�t th�c ��i tho�i/nothing",
		}
	local OldPlayerIndex = PlayerIndex;
	if daye == PlayerIndex then
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= OldPlayerIndex then
				player_name = GetName();
				player_name = zgc_pub_name_replace(player_name,"/","-");
				player_name = zgc_pub_name_replace(player_name,"|","-");
				player_name = zgc_pub_name_replace(player_name,":","-");
				tinsert(tSel, 1, "Ta c�n mang ph�n th��ng ph�n cho "..player_name.."/#lootAwardOther("..PlayerIndex..","..npcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "Ta mu�n nh�n ph�n th��ng/#lootAward("..PlayerIndex..","..npcIdx..")");
	end


	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem();
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end

	local tClause = getLootSeting();
	local tLootItem = tClause[nLootItemId][1];
	local nCount = 1;
	if tLootItem[2] and type(tLootItem[2]) == "table" then
		nCount = tLootItem[2][4];
	end
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>B�o r��ng<color>: � ��y c�"..msg, getn(tSel), tSel);
end

function lootAwardOther(player_index, box_index)
	local player_index_save = PlayerIndex
	--�жϸ������Ƿ����ڸö�����
	local index_chg_chk_flag = 0
	local team_size = GetTeamSize()
	if team_size ~= 0 then
		index_chg_chk_flag = zgc_pub_same_team_chk(player_index)
	else
		index_chg_chk_flag = 1
	end
	if index_chg_chk_flag ~= 1 then
		Talk(1,"","<color=green>Ch� �<color>: Xin m�i h�y ki�m tra l�i nh�ng ng��i m� b�n ph�n chia c� ph�i c� c�ng <color=yellow>t� ��i<color> v�i b�n!")
		return
	end
	--�������Ŀռ为�ؼ��
	PlayerIndex = player_index
	local s_palyer_name = GetName()
	if GetFreeItemRoom()  < NEED_ROOM then
		Talk(1,"","<color=green>Th�ng b�o<color>: <color=yellow>H�nh trang<color> c�c h� kh�ng ��!")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>Th�ng b�o<color>: : <color=green>"..s_palyer_name.."<color><color=yellow>H�nh trang<color> �� ��y, kh�ng th� ph�n ph�i!")
		return
	end

	PlayerIndex = player_index_save
	lootAward(player_index, box_index)
end

function lootAward(player_index, box_index)
	local player_index_save = PlayerIndex

	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(NEED_ROOM, 100, "") ~= 1 then return end
	PlayerIndex = player_index_save;

	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem();
	end
	local tLoot = getLootSeting()[nLootItemId][1];
	SetMissionV(MV_LOOT_ID, 0);
	SetMissionV(MV_WHO_IS_DAYE, 0);
	SetNpcLifeTime(box_index, 0);
	PlayerIndex = player_index;
	gf_SetLogCaption(LOG_TITLE);
	Clause3.giveClause(tLoot);
	gf_SetLogCaption("");
	
	PlayerIndex = player_index_save;
end