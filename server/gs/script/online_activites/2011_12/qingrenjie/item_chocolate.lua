--巧克力使用脚本
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua")

VET_201112_USED_MAX = 10 --使用次数10次
VET_201112_EXP = 680000 --每15秒获得的经验
VET_201112_EXP_ALL = 272000000

VET_201112_CHOCOLATE_TASK = TaskManager:Create(8,14);
VET_201112_CHOCOLATE_TASK.Num = 1;
VET_201112_CHOCOLATE_TASK.IsUsed = 2;
VET_201112_CHOCOLATE_TASK.TriggerTime = 3;
VET_201112_CHOCOLATE_TASK.DaySeq = 4;
VET_201112_CHOCOLATE_TASK.TotalIndex = 5;
VET_201112_CHOCOLATE_TASK.TotalMaxExp = 6;

VET_201112_AWARD_TABLE = {
   	{3, 200, 14020000, 1},
	{1, 1420, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1}, 0},
   	{1, 1420, "Nh蒼 kim cng", {0, 102, 104, 1, 1}, 0},
   	{1, 1420, "Nh蒼 kim cng", {0, 102, 105, 1, 1}, 0},
   	{1, 2100, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 2}, 0},
   	{31, 3440,"give_201112_award()",""},
}

function give_201112_award()
	ModifyReputation(14, 1);
	SetTask(336, GetTask(336) + 14);
	Msg2Player("C竎 h� nh薾 頲 14 甶觤 S� M玭 v� 14 甶觤 Danh V鋘g.");
end

function OnUse(ItemIndex)
	--是否在活动期间
	if gf_CheckEventDateEx(53) == 0 then
		Talk(1,"","V藅 ph萴  qu� h筺 s� d鬾g!");
		return 0;
	end
	--是否是队长
  if GetCaptainName() ~= GetName() then
    Talk(1, "", "Ch� c� i trng c� quy襫 k輈h ho箃 s� d鬾g.");
    return 0;
  end
  --队内人数
  local nTeamSize = GetTeamSize();
	if nTeamSize ~= 2 then
  	Talk(1, "","C莕 t� i 2 ngi  k輈h ho箃 s� d鬾g Socola.");
  	return 0;
  end	
  --判断是否已激活了一个巧克力
	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.IsUsed) == 1 then
		Talk(1,"","M鏸 l莕 ch� 頲 k輈h ho箃 1 Socola");
		return 0;
	end
	--玩家79级以上、已加入流派学会1套55级技能才可以参加活动
	local nOldPlayer,i;
	nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel()
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh﹏ v藅 c蕄 79 tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 1 k� n╪g c蕄 55 m韎 c� th� tham gia")
			local sName = GetName();
			PlayerIndex = nOldPlayer;
			Talk(1,"",format("%s ch璦 th醓 甶襲 ki謓 y猽 c莡, nh﹏ v藅 c蕄 79 tr� l猲,  gia nh藀 m玭 ph竔 v� h鋍 頲 1 k� n╪g c蕄 55 m韎 c� th� tham gia",sName));
			return 0;
		end
	end
	PlayerIndex = nOldPlayer;
	--是否在主城
	nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if Is_In_City_Map() == 0 then
			Talk(1,"","Ch� c� th� s� d鬾g Socola t筰 7 th祅h th� l韓.");
			local sName = GetName();
			PlayerIndex = nOldPlayer;
			Talk(1,"",format("%s ch璦 th醓 甶襲 ki謓 y猽 c莡, ch� c� th� s� d鬾g Socola t筰 7 th祅h th� l韓.",sName));
			return 0;
		end
  end
  PlayerIndex = nOldPlayer;
  --判断是否是一男一女你懂得的
  local nSex1,nSex2;
  nOldPlayer = PlayerIndex;
  PlayerIndex = GetTeamMember(1);
  nSex1 = GetSex();
  PlayerIndex = GetTeamMember(2);
  nSex2 = GetSex();
  PlayerIndex = nOldPlayer;
  if nSex1 == nSex2 then
  	Talk(1,"","C莕 t� i 1 nam 1 n�  s� d鬾g Socola t譶h nh﹏.")
  	return 0;
  end
  --隔天清除使用次数
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
		if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.DaySeq) ~= zgc_pub_day_turn() then
			VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.DaySeq,zgc_pub_day_turn());
			VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.Num,0);
		end
	end
	PlayerIndex = nOldPlayer;
  --判断是否都有巧克力
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if GetItemCount(2,1,30356) < 1 then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Th祅h vi猲 trong i <color=green>%s<color> kh玭g mang theo Socola, kh玭g th� k輈h ho箃.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  
    --max 甶觤 exp to祅 chng tr譶h
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalMaxExp) * VET_201112_EXP * 4 >= VET_201112_EXP_ALL then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Th祅h vi猲 trong i <color=green>%s<color>  t gi韎 h筺 甶觤 kinh nghi謒 trong to祅 chng tr譶h n猲 kh玭g th� k輈h ho箃 Socola.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  
  --是否到了使用上限10次
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.Num) >= VET_201112_USED_MAX then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Th祅h vi猲 trong i <color=green>%s<color>  t gi韎 h筺 s� l莕 s� d鬾g Socola, kh玭g th� k輈h ho箃.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  --判断队友是否在身边18尺
  nOldPlayer = PlayerIndex;
  PlayerIndex = GetTeamMember(1);
	local nMapId1,nX1,nY1 = GetWorldPos();
	PlayerIndex = GetTeamMember(2);
	local nMapId2,nX2,nY2 = GetWorldPos();
	local nDis = DistanceBetweenPoints(nMapId1,nX1,nY1,nMapId2,nX2,nY2)
  if  nDis < 0 or nDis > 18 then
  	local sName = GetName();
   	PlayerIndex = nOldPlayer
		Talk(1, "",format("Th祅h vi猲 trong i <color=green>%s<color> ngo礽 ph筸 vi 18 thc, k輈h ho箃 th蕋 b筰.",sName))
		return 0;
  end
  PlayerIndex = nOldPlayer
  --背包空间不足，悲剧了
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
		if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
			local sName = GetName();
   		PlayerIndex = nOldPlayer
			Talk(1, "",format("Th祅h vi猲 trong i <color=green>%s<color> kh玭g gian h祅h trang kh玭g  � ch鴄, k輈h ho箃 th蕋 b筰.",sName));
      return 0
		end
  end
  PlayerIndex = nOldPlayer;
  --删除每个人身上的巧克力
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if DelItem(2,1,30356,1) == 0 then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Th祅h vi猲 trong i <color=green>%s<color> s� d鬾g Socola c� hi謓 tng b蕋 thng, k輈h ho箃 th蕋 b筰.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  --累加标记
  for i = 1,nTeamSize do
  	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TotalIndex,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalIndex)+tonumber(GetTeamMember(i)));
  end
  --队长创建触发器
  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.IsUsed,1);
  --时间触发器
  CreateTrigger(1,1519,1519*2);
  ContinueTimer(GetTrigger(1519*2));
  --登出触发器
  CreateTrigger(3,3006,3006*2);
  --友情提示
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);	
  	Talk(1,"","Х k輈h ho箃 Socola, h穣 m b秓 ph筸 vi hi謚 鴑g, kh玭g n猲 r阨 kh醝 i ng� (<color=red>kh玭g 頲 m阨 th猰 th祅h vi猲<color>)")
  end	
  PlayerIndex = nOldPlayer
  --使用次数加一和给最终奖励
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);	
  	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.Num,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.Num)+1);
  	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TotalMaxExp,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalMaxExp)+1);
  	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.Num) == VET_201112_USED_MAX then
	  	gf_EventGiveRandAward(VET_201112_AWARD_TABLE,10000,1,"L� valentine 2012","Ph莕 thng l� t譶h nh﹏");
	  end
	end
	PlayerIndex = nOldPlayer;
end

--在7大主城1是0否
function Is_In_City_Map()
	local tbMapId = {100,150,200,300,350,400,500,}
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(tbMapId) do
        if nMapId == tbMapId[i] then
            bMapIsOk = 1 
            break
        end
    end
    if bMapIsOk == 0 then
        return 0 
    end
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
	local i;
	local nCount = 0;
	local nMapId1,nX1,nY1 = GetWorldPos();
	local nTeamSize = GetTeamSize();
	local nOldPlayer = PlayerIndex;
	for i = 1,nTeamSize do
	  PlayerIndex = GetTeamMember(i);
	  nCount = nCount + tonumber(PlayerIndex);
	end
	PlayerIndex = nOldPlayer;
	--删除触发器
	if nTeamSize ~= 2 or nCount ~= VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalIndex) or VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TriggerTime) >= 4 then
		RemoveTrigger(GetRunningTrigger());
		RemoveTrigger(GetTrigger(3006*2));
	  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TriggerTime,0);
	  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.IsUsed,0);
	  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TotalIndex,0);
	  return 1;
	end
	--给经验
	nOldPlayer = PlayerIndex;
	for i = 1,nTeamSize do
	  PlayerIndex = GetTeamMember(i);
	  local nMapId2,nX2,nY2 = GetWorldPos();
	  local nDis = DistanceBetweenPoints(nMapId1,nX1,nY1,nMapId2,nX2,nY2);
		if  nDis >= 0 and nDis <= 18 then
			gf_Modify("Exp",VET_201112_EXP);
		end
	end
	PlayerIndex = nOldPlayer;
	--触发次数加一
	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TriggerTime,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TriggerTime)+1);
	return 0;
end

function Leave_Game()
	RemoveTrigger(GetRunningTrigger());
	RemoveTrigger(GetTrigger(1519*2));
	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TriggerTime,0);
	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.IsUsed,0);
end