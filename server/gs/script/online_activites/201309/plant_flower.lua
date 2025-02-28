Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_LOG_TITLE = "Hoat Dong Hoa Hong Thang 9/2013";

VET_TB_LOG_ACTION_LIST = {
    [1] = "Mua M莔 Hoa",
    [2] = "K輈h ho箃 tr錸g hoa",
};

VET_STRING_LIST = {
    [1] = "K輈h ho箃 tr錸g hoa",
    [2] = "Mua M莔 Hoa (1 M莔 Hoa = 19 v祅g)",
    [3] = "K誸 th骳 i tho筰",
    [4] = "Ti襫 v祅g i hi謕 mang theo kh玭g .",
    [5] = "Ch� c� i trng m韎 c� th� k輈h ho箃 tr錸g hoa.",
    [6] = "C莕 t� i tr猲 2 ngi, m韎 c� th� k輈h ho箃 tr錸g hoa.",
    [7] = "襲 ki謓 tr錸g hoa l鏸.",
    [8] = "T� i th祅h vi猲 m鏸 ngi c莕 mang theo 1 m莔 hoa m韎 c� th� k輈h ho箃 tr錸g hoa.",
    [9] = "M鏸 ng祔 m鏸 ngi ch琲 gi韎 h筺 mua 1 m莔 hoa.",
    [10] = "Nh﹏ v藅 c蕄 77 tr� l猲,  gia nh藀 m玭 ph竔 v� luy謓 頲 k� n╪g c蕄 55 m韎 c� th� tham gia ho箃 ng",
    [11] = "M鏸 ng祔 m鏸 nh﹏ v藅 ch� 頲 tham gia ho箃 ng %d l莕.",
    [12] = "Ch� 頲 k輈h ho箃 tr錸g hoa t筰 c竎 th祅h th� l韓 (Bi謓 Kinh, Th祅h Й, Tuy襫 Ch﹗, Tng Dng, Dng Ch﹗, Чi L�, Phng Tng).",
		[13] = "Ch� c� th� c飊g l骳 k輈h ho箃 1 m莔 hoa.",
		[14] = "чi vi猲 kh玭g c� b猲 c筺h, kh玭g th� k輈h ho箃 tr錸g hoa."
};

VET_TB_ITEM_LIST = {
    [1] = {"M莔 Hoa h錸g",2,1,30289},
};

VET_TB_MAPID = {
    100,150,200,300,350,400,500,
}

VET_TB_NPCS = {
	[1] = {"Hoa h錸g ","Hoa h錸g "},    
	[2] = {"Hoa h錸g v祅g","Hoa h錸g v祅g"},
};

VET_EXP_TABLE = {
	[2] = {100000,200000},
	[3] = {105000,210000},
	[4] = {110000,220000},	
	[5] = {115000,230000},
	[6] = {120000,240000},
	[7] = {130000,260000},
	[8] = {160000,320000},
}

VET_ROSE_ACTIVITY_ID = 100	--活动ID
VET_TIME_TB_DEFINE = 1532 	--时间触发器表内ID
VET_TIME_USER_DEFINE = VET_TIME_TB_DEFINE*2 	--时间触发器自定义ID
VET_ROSE_SEED_COST = 190000  	--花苗价格
VET_MAX_TIMES = 8  				--每人最多参与活动4次
VET_ROSE_LIFE = 10*60      --花朵npc存活时间
VET_ADDIONAL_EXP = 19000000 --最后一次额外奖励

--任务变量处理
VET_ROSE_TaskGroup = TaskManager:Create(10,13)
VET_ROSE_TaskGroup.Rose_Times = 1
VET_ROSE_TaskGroup.Time_End = 2
VET_ROSE_TaskGroup.Npc_Index = 3
VET_ROSE_TaskGroup.Date = 4
VET_ROSE_TaskGroup.TeamSize = 5

function VET_201309_AdditionDialog() --tbSayDialog, szSayHead
local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th玭g tin chi ti誸 c竎 ho箃 ng ng o c� th� xem tr猲 trang ch� <color=green>http://volam2.zing.vn<color>."
	if gf_CheckEventDateEx(VET_ROSE_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog, VET_STRING_LIST[1].."/active_fire_for_warm")
		tinsert(tbSayDialog, VET_STRING_LIST[2].."/buy_match") 
		tinsert(tbSayDialog, "Tho竧/do_nothing");
	end
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

--激活玫瑰花
function active_fire_for_warm()
    local nTeamSize = GetTeamSize()
    if nTeamSize < 2 then
        Talk(1, "", VET_STRING_LIST[6])
        return
    end
    if GetCaptainName() ~= GetName() then
        Talk(1, "", VET_STRING_LIST[5])
        return
    end
    if Check_team_member(nTeamSize) == 0 then
        return 0 
    end
    to_set_fire_now(nTeamSize)
end

function buy_match()
    if GetCash() < VET_ROSE_SEED_COST then
        Talk(1, "", VET_STRING_LIST[4])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if Pay(VET_ROSE_SEED_COST) == 1 then
        local tbItemIds = {VET_TB_ITEM_LIST[1][2],VET_TB_ITEM_LIST[1][3],VET_TB_ITEM_LIST[1][4],1}
        gf_AddItemEx2(tbItemIds, VET_TB_ITEM_LIST[1][1],VET_LOG_TITLE,VET_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function Is_In_City_Map()
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_TB_MAPID) do
        if nMapId == VET_TB_MAPID[i] then
            bMapIsOk = 1 
            break
        end
    end
    if bMapIsOk == 0 then
        return 0 
    end
end

function Check_team_member(nTeamSize)
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
      PlayerIndex = GetTeamMember(i)
      if PlayerIndex <= 0 then
        Talk(1, "", VET_STRING_LIST[7]) 
      	return 0 
    	end
    	local szCurrName = GetName();
			local nDate = zgc_pub_day_turn()
			if VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Date) ~= nDate then
				VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Date,nDate)
				VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Rose_Times,0)
			end
      if Is_In_City_Map() == 0 then
        PlayerIndex = nOldPlayer  --这个消息告诉队长就行了
        Talk(1, "", VET_STRING_LIST[12]) 
        return 0;
      end
      local nLevel = GetLevel()
      if nLevel < 77 or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
          Talk(1, "", VET_STRING_LIST[10]) 
          PlayerIndex = nOldPlayer  --这个消息告诉队长就行了
          Talk(1, "", VET_STRING_LIST[10]..format("\n<color=red>%s<color>", szCurrName)) 
          return 0 
      end
      if GetItemCount(VET_TB_ITEM_LIST[1][2],VET_TB_ITEM_LIST[1][3],VET_TB_ITEM_LIST[1][4]) < 1 then
          PlayerIndex = nOldPlayer  --这个消息告诉队长就行了
          Talk(1, "", VET_STRING_LIST[8]..format("\n<color=red>%s<color>", szCurrName)) 
          return 0 
      end
      local nTimes = VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Rose_Times)
      if not nTimes or nTimes >= VET_MAX_TIMES then
          Talk(1, "", format(VET_STRING_LIST[11], VET_MAX_TIMES));
          PlayerIndex = nOldPlayer
          Talk(1, "", format(VET_STRING_LIST[11], VET_MAX_TIMES)..format("\n<color=red>%s<color>", szCurrName));
          return 0;
      end
			--只能同时激活一个花苗信息
			local nTime = tonumber(GetTime())
			if nTime < VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Time_End) then
				Talk(1, "",VET_STRING_LIST[13])
				if PlayerIndex ~= nOldPlayer then
					PlayerIndex = nOldPlayer --一并告诉队长
					Talk(1, "",VET_STRING_LIST[13]..format("\n<color=red>%s<color>", szCurrName))
				end
				return 0
			end
    end
    PlayerIndex = nOldPlayer
end

function to_set_fire_now(nTeamSize)
	--判断队友是否在身边24尺
	local nMapId1,nX1,nY1=GetWorldPos()
	nOldPlayer = PlayerIndex
	local nMapId2,nX2,nY2
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
		nMapId2,nX2,nY2 = GetWorldPos()
		local nDis = DistanceBetweenPoints(nMapId1,nX1,nY1,nMapId2,nX2,nY2)
    if  nDis < 0 or nDis > 24 then
      PlayerIndex = nOldPlayer
			Talk(1, "", VET_STRING_LIST[14])
		  return
    end
  end
	--是否在线并删除物品
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
    if PlayerIndex <= 0 then
      Talk(1, "", VET_STRING_LIST[7])
			PlayerIndex = nOldPlayer
      return
    end
    if DelItem(VET_TB_ITEM_LIST[1][2],VET_TB_ITEM_LIST[1][3],VET_TB_ITEM_LIST[1][4],1) ~= 1 then
			PlayerIndex = nOldPlayer
    	return
    end
  end
  PlayerIndex = nOldPlayer
	local nNpcIndex
	local nResult = random(100)
	if  nResult < 61 then
		nNpcIndex = CreateNpc(VET_TB_NPCS[1][1],VET_TB_NPCS[1][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_ROSE_LIFE)
	else
		nNpcIndex = CreateNpc(VET_TB_NPCS[2][1],VET_TB_NPCS[2][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_ROSE_LIFE)
	end
  local nOldPlayer = PlayerIndex
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
    if PlayerIndex <= 0 then
      Talk(1, "", VET_STRING_LIST[7])
			PlayerIndex = nOldPlayer
      return
    end
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Time_End, GetTime() + VET_ROSE_LIFE + 20)     --触发器终止时间，防止NPC意外丢失。触发器将在NPC时限10秒后消失
    CreateTrigger(1, VET_TIME_TB_DEFINE, VET_TIME_USER_DEFINE) 
    ContinueTimer(GetTrigger(VET_TIME_USER_DEFINE)) 
    gf_WriteLogEx(VET_LOG_TITLE,VET_TB_LOG_ACTION_LIST[2])
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Npc_Index,nNpcIndex) 
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Rose_Times,VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Rose_Times) + 1)
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.TeamSize,nTeamSize) 
  end
  PlayerIndex = nOldPlayer
end

--判断举例
function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
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
  local nTeamSize = GetTeamSize() or 0;
  nTeamSize = min(VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.TeamSize), nTeamSize);
  if not VET_EXP_TABLE[nTeamSize] then
  	RemoveTrigger(GetTrigger(VET_TIME_USER_DEFINE))
  	VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Time_End, GetTime())
    return 0
  end
  VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.TeamSize, nTeamSize);
  local nTime = tonumber(GetTime())
  if nTime >= VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Time_End) then
  	--最后一次额外奖励
  	if VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Rose_Times) >= VET_MAX_TIMES then
  		gf_ModifyExp(VET_ADDIONAL_EXP);
  	end
    RemoveTrigger(GetTrigger(VET_TIME_USER_DEFINE))
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Time_End, GetTime())
    return 0
  end
  local nRoseIndex = VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Npc_Index)
  local nIndex = 1;
  if GetNpcName(nRoseIndex) == VET_TB_NPCS[2][2] then
  	nIndex = 2;
  end
  local nExpNum = VET_EXP_TABLE[nTeamSize][nIndex];
  if not nExpNum then return end
  local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nRoseIndex)
  local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
  local nDist = DistanceBetweenPoints(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
  if nDist >= 0 and nDist <= 18 then
		ModifyExp(nExpNum)
  	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
  end
end
function do_nothing()

end