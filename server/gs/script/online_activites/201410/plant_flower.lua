Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online_activites\\activity_head.lua")

VET_201410_LOG_TITLE = "Hoat Dong Hoa Hong";

VET_201410_TB_LOG_ACTION_LIST = {
    [1] = "Mua M莔 Hoa",
    [2] = "K輈h ho箃 tr錸g hoa",
};

VET_201410_STRING_LIST = {
    [1] = "K輈h ho箃 tr錸g hoa",
    [2] = "Mua M莔 Hoa (1 M莔 Hoa = 29 xu v藅 ph萴)",
    [3] = "K誸 th骳 i tho筰",
    [4] = "XU c馻 i hi謕 kh玭g .",
    [5] = "Ch� c� i trng m韎 c� th� k輈h ho箃 tr錸g hoa.",
    [6] = "C莕 t� i tr猲 2 ngi, m韎 c� th� k輈h ho箃 tr錸g hoa.",
    [7] = "襲 ki謓 tr錸g hoa l鏸.",
    [8] = "T� i th祅h vi猲 m鏸 ngi c莕 mang theo 1 m莔 hoa m韎 c� th� k輈h ho箃 tr錸g hoa.",
    [9] = "M鏸 ng祔 m鏸 ngi ch琲 gi韎 h筺 mua 1 m莔 hoa.",
    [10] = "Nh﹏ v藅 c蕄 77 tr� l猲,  gia nh藀 m玭 ph竔 v� luy謓 頲 k� n╪g c蕄 55 m韎 c� th� tham gia ho箃 ng",
    [11] = "M鏸 ng祔 m鏸 nh﹏ v藅 ch� 頲 tham gia ho箃 ng %d l莕.",
    [12] = "Ch� c� th� k輈h ho箃 tr錸g hoa � b猲 ngo礽 c竎 th祅h th� (Йng Bi謓 Kinh, T﹜ Bi謓 Kinh, Nam Bi謓 Kinh,B綾 Th祅h Й,Nam Th祅h Й,T﹜ Th祅h Й,B綾 Thuy襫 Ch﹗,T﹜ Thuy襫 Ch﹗,B綾 Phng Tng,Nam Phng Tng)",
		[13] = "Ch� c� th� c飊g l骳 k輈h ho箃 1 m莔 hoa.",
		[14] = "чi vi猲 kh玭g c� b猲 c筺h, kh玭g th� k輈h ho箃 tr錸g hoa."
};

VET_201410_TB_ITEM_LIST = {
    [1] = {"M莔 hoa ",2,1,30739},
};

VET_201410_TB_MAPID = {
    205,203,201,308,304,301,108,105,504,501,
}

VET_201410_TB_NPCS = {
	[1] = {"Hoa h錸g ","Hoa h錸g "},    
	[2] = {"Hoa h錸g v祅g","Hoa h錸g v祅g"},
};

VET_201410_EXP_TABLE = {
	[2] = {400000,600000},
	[3] = {420000,630000},
	[4] = {440000,660000},	
	[5] = {460000,690000},
	[6] = {480000,720000},
	[7] = {520000,780000},
	[8] = {640000,960000},
}

VET_201410_ROSE_ACTIVITY_ID = 137	--活动ID
VET_201410_TIME_TB_DEFINE = 1537 	--时间触发器表内ID
VET_201410_TIME_USER_DEFINE = VET_201410_TIME_TB_DEFINE*2 	--时间触发器自定义ID
VET_201410_ROSE_SEED_COST = 29  	--花苗价格XU
VET_201410_MAX_TIMES = 8  				--每人最多参与活动8次
VET_201410_ROSE_LIFE = 5*60      --花朵npc存活时间
--VET_ADDIONAL_EXP = 19000000 --最后一次额外奖励
VET_201410_BOSS_NPC = {
	{"shixuemoren", "Th� Huy誸 Ma Nh﹏"},
	{"jushihuoren", "C� Th筩h H醓 Nh﹏"},
	{"xuanzhuangunren", "To祅 Chuy觧 C玭 Nh﹏"},
	{"qiannianhuoqilin", "Thi猲 Ni猲 H醓 K� L﹏"},
	{"dayuguai", "Чi Ng� Qu竔"},
}
VET_201410_GOLD_BOX = "Rng Ho祅g Kim B秓 B鑙";
VET_201410_PICK_BOX = 1;

--任务变量处理
VET_201410_ROSE_TaskGroup = TaskManager:Create(6, 13)
VET_201410_ROSE_TaskGroup.Rose_Times = 1
VET_201410_ROSE_TaskGroup.Time_End = 2
VET_201410_ROSE_TaskGroup.Npc_Index = 3
VET_201410_ROSE_TaskGroup.Date = 4
VET_201410_ROSE_TaskGroup.TeamSize = 5
VET_201410_ROSE_TaskGroup.PickBox = 6

function VET_201410_AdditionDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201410_ROSE_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog, VET_201410_STRING_LIST[1].."/active_fire_for_warm_201410")
		tinsert(tbSayDialog, VET_201410_STRING_LIST[2].."/buy_match_201410") 
	end
  return tbSayDialog, szSayHead 
end

--激活玫瑰花
function active_fire_for_warm_201410()
    local nTeamSize = GetTeamSize()
    if nTeamSize < 2 then
        Talk(1, "", VET_201410_STRING_LIST[6])
        return
    end
    if GetCaptainName() ~= GetName() then
        Talk(1, "", VET_201410_STRING_LIST[5])
        return
    end
    if Check_team_member_201410(nTeamSize) == 0 then
        return 0 
    end
    to_set_fire_now_201410(nTeamSize)
end

function buy_match_201410()
    if GetItemCount(2, 1, 30230) < VET_201410_ROSE_SEED_COST then
        Talk(1, "", VET_201410_STRING_LIST[4])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if DelItem(2, 1, 30230, VET_201410_ROSE_SEED_COST) == 1 then
        local tbItemIds = {VET_201410_TB_ITEM_LIST[1][2],VET_201410_TB_ITEM_LIST[1][3],VET_201410_TB_ITEM_LIST[1][4],1}
        gf_AddItemEx2(tbItemIds, VET_201410_TB_ITEM_LIST[1][1],VET_201410_LOG_TITLE,VET_201410_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function Is_In_City_Map_201410()
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201410_TB_MAPID) do
        if nMapId == VET_201410_TB_MAPID[i] then
            bMapIsOk = 1 
            break
        end
    end
    if bMapIsOk == 0 then
        return 0 
    end
end

function Check_team_member_201410(nTeamSize)
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
      PlayerIndex = GetTeamMember(i)
      if PlayerIndex <= 0 then
        Talk(1, "", VET_201410_STRING_LIST[7]) 
      	return 0 
    	end
    	local szCurrName = GetName();
			local nDate = zgc_pub_day_turn()
			if VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Date) ~= nDate then
				VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Date,nDate)
				VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Rose_Times,0)
				VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.PickBox,0)
			end
      if Is_In_City_Map_201410() == 0 then
        PlayerIndex = nOldPlayer  --这个消息告诉队长就行了
        Talk(1, "", VET_201410_STRING_LIST[12]) 
        return 0;
      end
      if (GetLevel() < 77 and gf_GetPlayerRebornCount() == 0) or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
          PlayerIndex = nOldPlayer  --这个消息告诉队长就行了
          Talk(1, "", VET_201410_STRING_LIST[10]..format("\n<color=red>%s<color>", szCurrName)) 
          return 0 
      end
      if GetItemCount(VET_201410_TB_ITEM_LIST[1][2],VET_201410_TB_ITEM_LIST[1][3],VET_201410_TB_ITEM_LIST[1][4]) < 1 then
          PlayerIndex = nOldPlayer  --这个消息告诉队长就行了
          Talk(1, "", VET_201410_STRING_LIST[8]..format("\n<color=red>%s<color>", szCurrName)) 
          return 0 
      end
      local nTimes = VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Rose_Times)
      if not nTimes or nTimes >= VET_201410_MAX_TIMES then
          Talk(1, "", format(VET_201410_STRING_LIST[11], VET_201410_MAX_TIMES));
          PlayerIndex = nOldPlayer
          Talk(1, "", format(VET_201410_STRING_LIST[11], VET_201410_MAX_TIMES)..format("\n<color=red>%s<color>", szCurrName));
          return 0;
      end
			--只能同时激活一个花苗信息
			local nTime = tonumber(GetTime())
			if nTime < VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Time_End) then
				Talk(1, "",VET_201410_STRING_LIST[13])
				if PlayerIndex ~= nOldPlayer then
					PlayerIndex = nOldPlayer --一并告诉队长
					Talk(1, "",VET_201410_STRING_LIST[13]..format("\n<color=red>%s<color>", szCurrName))
				end
				return 0
			end
    end
    PlayerIndex = nOldPlayer
end

function to_set_fire_now_201410(nTeamSize)
	--判断队友是否在身边24尺
	local nMapId1,nX1,nY1=GetWorldPos()
	nOldPlayer = PlayerIndex
	local nMapId2,nX2,nY2
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
		nMapId2,nX2,nY2 = GetWorldPos()
		local nDis = DistanceBetweenPoints_201410(nMapId1,nX1,nY1,nMapId2,nX2,nY2)
    if  nDis < 0 or nDis > 24 then
      PlayerIndex = nOldPlayer
			Talk(1, "", VET_201410_STRING_LIST[14])
		  return
    end
  end
	--是否在线并删除物品
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
    if PlayerIndex <= 0 then
      Talk(1, "", VET_201410_STRING_LIST[7])
			PlayerIndex = nOldPlayer
      return
    end
    if DelItem(VET_201410_TB_ITEM_LIST[1][2],VET_201410_TB_ITEM_LIST[1][3],VET_201410_TB_ITEM_LIST[1][4],1) ~= 1 then
			PlayerIndex = nOldPlayer
    	return
    end
  end
  PlayerIndex = nOldPlayer
	local nNpcIndex
	local nResult = random(100)
	local nKind = 0;
	if  nResult < 70 then
		nNpcIndex = CreateNpc(VET_201410_TB_NPCS[1][1],VET_201410_TB_NPCS[1][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_201410_ROSE_LIFE)
		nKind = 1;
	else
		nNpcIndex = CreateNpc(VET_201410_TB_NPCS[2][1],VET_201410_TB_NPCS[2][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_201410_ROSE_LIFE)
		nKind = 2;
	end
	local nTag = 1;
  local nOldPlayer = PlayerIndex
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
    if PlayerIndex <= 0 then
      Talk(1, "", VET_201410_STRING_LIST[7])
			PlayerIndex = nOldPlayer
      return
    end
    VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Time_End, GetTime() + VET_201410_ROSE_LIFE + 20)     --触发器终止时间，防止NPC意外丢失。触发器将在NPC时限10秒后消失
    CreateTrigger(1, VET_201410_TIME_TB_DEFINE, VET_201410_TIME_USER_DEFINE) 
    ContinueTimer(GetTrigger(VET_201410_TIME_USER_DEFINE)) 
    gf_WriteLogEx(VET_201410_LOG_TITLE,VET_201410_TB_LOG_ACTION_LIST[2])
    VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Npc_Index,nNpcIndex) 
    local roseTime = VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Rose_Times);
    VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Rose_Times, roseTime + 1)
    if roseTime + 1 ~= VET_201410_MAX_TIMES then
    	nTag = nil;
    end
    VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.TeamSize,nTeamSize) 
  	add_pet_lingli_value_201410(nKind);
  end
  PlayerIndex = nOldPlayer
  
	if 1 == nTag and 8 == nTeamSize then
		local tNpc = VET_201410_BOSS_NPC[random(getn(VET_201410_BOSS_NPC))];
		local npcIndex = CreateNpc(tNpc[1], tNpc[2], GetWorldPos());
		if npcIndex > 0 then
			SetNpcDeathScript(npcIndex, "\\script\\online_activites\\201410\\plant_flower.lua");
			SetNpcLifeTime(npcIndex, 10 * 60);
			Msg2Team(format("Mang theo %s - BOSS %s  頲 t筼 m韎!", VET_201410_GOLD_BOX, tNpc[2]), 2);
		end
	end
end

--判断举例
function DistanceBetweenPoints_201410(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
    if MapID1 ~= MapID2 then
      return -1
    else
			local dx = MapX2 - MapX1
		  local dy = MapY2 - MapY1
		  local nDist = (dx * dx + dy * dy)^(1/2)
		  return nDist
    end;
end

function OnTimer()
	print("plant_flower >> OnTimer");
  local nTeamSize = GetTeamSize() or 0;
  nTeamSize = min(VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.TeamSize), nTeamSize);
  if not VET_201410_EXP_TABLE[nTeamSize] then
  	RemoveTrigger(GetTrigger(VET_201410_TIME_USER_DEFINE))
  	VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Time_End, GetTime())
    return 0
  end
  VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.TeamSize, nTeamSize);
  local nTime = tonumber(GetTime())
  if nTime >= VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Time_End) then
  	--最后一次额外奖励
  	--if VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Rose_Times) >= VET_201410_MAX_TIMES then
  	--	gf_ModifyExp(VET_ADDIONAL_EXP);
  	--end
    RemoveTrigger(GetTrigger(VET_201410_TIME_USER_DEFINE))
    VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.Time_End, GetTime())
    return 0
  end
  local nRoseIndex = VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.Npc_Index)
  local nIndex = 1;
  if GetNpcName(nRoseIndex) == VET_201410_TB_NPCS[2][2] then
  	nIndex = 2;
  end
  local nExpNum = VET_201410_EXP_TABLE[nTeamSize][nIndex];
  if not nExpNum then return end
  local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nRoseIndex)
  local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
  local nDist = DistanceBetweenPoints_201410(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
  if nDist >= 0 and nDist <= 18 then
		ModifyExp(nExpNum)
  	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
  end
end

function OnDeath(id, f, x)
	local npcIndex = CreateNpc("huangjin_box", VET_201410_GOLD_BOX, GetNpcWorldPos(id));
	SetNpcScript(npcIndex, "\\script\\online_activites\\201410\\plant_flower.lua");
	SetNpcLifeTime(npcIndex, 90);
	SetNpcTempData(npcIndex, 1, PlayerIndex);
	Msg2Team(format("BOSS %s  b� nh b筰, r琲 ra 1 %s.", GetNpcName(id), VET_201410_GOLD_BOX), 1);
	SetNpcLifeTime(id, 0);
end

function main()
	local npcIndex = GetTargetNpc();
	if GetNpcName(npcIndex) ~= VET_201410_GOLD_BOX then
		return 0;
	end
	local pickedTimes = GetNpcTempData(npcIndex, 2);
	if pickedTimes >= 8 then
		SetNpcLifeTime(npcIndex, 0);
		return 0;
	end
	local pIdx = GetNpcTempData(npcIndex, 1);
	local canPick = nil;
	for i = 1, GetTeamSize() do
		if GetTeamMember(i) == pIdx then
			canPick = 1;
			break;
		end
	end
	if not canPick then
		Say("B筺 kh玭g th� nh苩 ph莕 thng Rng Ho祅g Kim B秓 B鑙 n祔!", 0);
		return 0;
	end
	if VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.PickBox) >= VET_201410_PICK_BOX then
		Say(format("M鏸 ng祔 ch� 頲 nh苩 t鑙 產 %d l莕 Rng Ho祅g Kim B秓 B鑙", VET_201410_PICK_BOX), 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	VET_201410_ROSE_TaskGroup:SetTask(VET_201410_ROSE_TaskGroup.PickBox, VET_201410_ROSE_TaskGroup:GetTask(VET_201410_ROSE_TaskGroup.PickBox) + 1)
	SetNpcTempData(npcIndex, 2, pickedTimes + 1);
	local tAward = {
		{1, 250, "Hoa h錸g", {2, 1, 30736, 1000}, 0},
		{1, 70, "B筩h C﹗ Ti猲 n", {2, 1, 1008, 1, 4}, 7 * 24 * 3600},
		{1, 70, "Tam Thanh Ti猲 n", {2, 1, 1099, 1, 4}, 7 * 24 * 3600},
		{1, 70, "L鬰 Th莕 Ti猲 n", {2, 1, 1066, 1, 4}, 7 * 24 * 3600},
		{1, 70, "Th莕 N玭g Кn", {2, 1, 343, 1, 4}, 7 * 24 * 3600},
		{1, 70, "B祅 Long b輈h", {2, 1, 1000, 1, 4}, 7 * 24 * 3600},
		{1, 100, "Qu﹏ C玭g Chng", {2, 1, 9999, 1, 4}, 7 * 24 * 3600},
		{1, 40, "Qu﹏ C玭g Чi", {2, 1, 9998, 1, 4}, 7 * 24 * 3600},
		{1, 30, "Thi猲 Ki猽 L謓h", {2, 97, 236, 1, 4}, 0},
		{1, 10, "L╪g Ba Vi B�", {0, 112, 78, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "L╪g Ba Vi B� to祅 t藀", {0, 112, 158, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 109, "B╪g th筩h", {2, 1, 149, 1}, 0},
		{1, 10, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1, 4}, 7 * 24 * 3600},
		{31, 100, "ahf_GetLevel3JSEquip()", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, VET_201410_LOG_TITLE, VET_201410_GOLD_BOX);
end

--complete by veit（pet value）
function add_pet_lingli_value_201410(nKind)
	if 1 == nKind then
		--add pet value : 5 points
	elseif 2 == nKind  then
		--add pet value : 10 points
	end
end