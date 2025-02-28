Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\activity_head.lua")

GH_ACITIVITY_ID = 145;
GH_BUY_COST = 29;
GH_TRIGGER_ID = 1539;
GH_AC_TIMES = 8;
GH_TEAM_LIMIT = 5;

--任务变量处理
GH_TASK_GROUP = TaskManager:Create(7, 12)
GH_TASK_GROUP.DaySeq = 1;
GH_TASK_GROUP.DayTimes = 2;
GH_TASK_GROUP.AcIndex = 3;
GH_TASK_GROUP.Trigger = 4;
GH_TASK_GROUP.AcTime = 5; 
GH_TASK_GROUP.BoxAward = 6;

function VET_201501_AddGouHuoDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(GH_ACITIVITY_ID) == 1 then
		tinsert(tbSayDialog, "K輈h ho箃 L鯽 tr筰/Gh_Acivite")
		tinsert(tbSayDialog, "B竛 C駃 Kh�/Gh_Buy") 
	end
  return tbSayDialog, szSayHead 
end

function Gh_Acivite()
	gf_TeamOperateEX(GH_DailyReset);
	if GetCaptainName() ~= GetName() then
		Talk(1,"","Ch� c� i trng m韎 頲 k輈h ho箃 L鯽 tr筰!");
		return 0;
	end
	local nCamp, nPk = GetPKFlag();
	if nCamp == 0 and nPk == 0 then
		Talk(1,"","� tr筺g th竔 luy謓 c玭g kh玭g 頲 k輈h ho箃 L鯽 tr筰!");
		return 0;
	end
	local nTeamSize = GetTeamSize()
	if nTeamSize < GH_TEAM_LIMIT then
		Talk(1,"",format("S� ngi t� i kh玭g  %d ngi, kh玭g 頲 k輈h ho箃 L鯽 tr筰!", GH_TEAM_LIMIT));
		return 0;
	end
	local nMapID, nX, nY = GetWorldPos();
	if gf_MapIsAllow({100,150,200,300,350,400,500}, nMapID) == 1 then
		Talk(1,"","Kh玭g th� k輈h ho箃 L鯽 tr筰 t筰 th祅h th�!");
		return 0;
	end
	if GetTime() - GH_TASK_GROUP:GetTask(GH_TASK_GROUP.AcTime) < 30*10 then
		Talk(1,"","Hi謓 nay L鯽 tr筰 ch璦 k誸 th骳,kh玭g th� k輈h ho箃 l筰.")
		return 0;
	end
	if gf_CheckTeam(
		function ()
			if GetItemCount(2, 1, 30768) < 1 then
				return 0;
			end
			return 1;
		end, "Nh鱪g i vi猲 n祔 trong t骾 kh玭g c� c駃 kh�, kh玭g th� k輈h ho箃 L鯽 tr筰") ~= 1 then
			return 0;
	end
	if gf_CheckTeam(
		function ()
			if GH_TASK_GROUP:GetTask(GH_TASK_GROUP.DayTimes) >= GH_AC_TIMES then
				return 0;
			end
			return 1;
		end, format("Nh鱪g i vi猲 n祔 h玬 nay  nh薾 thng vt qua %d l莕, kh玭g th� k輈h ho箃 L鯽 tr筰", GH_AC_TIMES)) ~= 1 then
			return 0;
	end
	
	local nNpcIndex = CreateNpc("L鯽 tr筰", "L鯽 tr筰", nMapID, nX, nY);
	SetNpcLifeTime(nNpcIndex, 10*60);
	
	local oldPlayerIndex = PlayerIndex
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if DelItem(2, 1, 30768, 1) == 1 then
			Gh_CreateTrigger(nNpcIndex);
		end
	end
	PlayerIndex = oldPlayerIndex
	if GetCaptainName() == GetName() then
		if random(100) <= 15 then
			Gh_RandBoss();
		end
	end
	gf_Msg2Team("T� i  k輈h ho箃 th祅h c玭g L鯽 tr筰!");
end

function Gh_Buy()
	AskClientForNumber("Gh_Buy_Callback", 0, floor(GetItemCount(2, 1, 30230)/GH_BUY_COST), "H穣 nh藀 s� lng v祇", "");
end

function Gh_Buy_Callback(nNum)
	if nNum <= 0 then return end
	if gf_Judge_Room_Weight(nNum, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30230, nNum*GH_BUY_COST) ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 30768, nNum}, "C駃 Kh�", "Ho箃 ng ph� th竛g 1 n╩ 2015", "L鯽 tr筰", 24*3600, 1);
end

function GH_DailyReset()
	local nDate = gf_TodayDate();
	if GH_TASK_GROUP:GetTask(GH_TASK_GROUP.DaySeq) ~= nDate then
		GH_TASK_GROUP:SetTask(GH_TASK_GROUP.DayTimes, 0);
		GH_TASK_GROUP:SetTask(GH_TASK_GROUP.BoxAward, 0);
		GH_TASK_GROUP:SetTask(GH_TASK_GROUP.DaySeq, nDate);
	end	
end

function OnTimer()
	local nStep = GH_TASK_GROUP:GetTask(GH_TASK_GROUP.Trigger);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.Trigger, nStep + 1);
	local npcIndex = GH_TASK_GROUP:GetTask(GH_TASK_GROUP.AcIndex);
	if nStep + 1 >= 60 then
		Gh_RemoveTrigger(npcIndex)
		return 0;
	end
	if gf_GetTeamSize() < GH_TEAM_LIMIT then
		Gh_RemoveTrigger(npcIndex)
		return 0;
	end
	if GetTime() - GH_TASK_GROUP:GetTask(GH_TASK_GROUP.AcTime) >= 30*10 then
		Gh_RemoveTrigger(npcIndex)
		return 0;
	end
	local nPlayerDeathNum = 0;
	local oldPlayerIndex = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if IsPlayerDeath() == 1 then
			nPlayerDeathNum = nPlayerDeathNum + 1;
		end
	end
	PlayerIndex = oldPlayerIndex
	if nPlayerDeathNum == GetTeamSize() then
		Gh_RemoveTrigger(npcIndex)
		return 0;
	end		
	local npcMap, npcX, npcY = GetNpcWorldPos(npcIndex);
	local nMapID, nX, nY = GetWorldPos();
	if npcMap == nMapID and gf_GetDistance(npcX, npcY, nX, nY) <= 18 then
		gf_ModifyExp(750000);
	end
end

function Gh_CreateTrigger(nNpcIndex)
	local nTrigger = CreateTrigger(1, GH_TRIGGER_ID, GH_TRIGGER_ID*2);
	ContinueTimer(nTrigger);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.DayTimes, GH_TASK_GROUP:GetTask(GH_TASK_GROUP.DayTimes)+1);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.AcIndex, nNpcIndex);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.Trigger, 0);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.AcTime, GetTime());
	ForbidChangePK(1);
	SetCreateTeam(1);
end

function Gh_RemoveTrigger(npcIndex)
	RemoveTrigger(GetTrigger(GH_TRIGGER_ID*2));
	if GetNpcName(npcIndex) == "L鯽 tr筰" then
		SetNpcLifeTime(npcIndex, 0);
	end
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.AcIndex, 0);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.Trigger, 0);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.AcTime, 0)
	ForbidChangePK(0);
	SetCreateTeam(0);
end

function Gh_RandBoss()
	local tBoss = {
		{"Th� Huy誸 Ma Nh﹏", "shixuemoren"},
		{"C� Th筩h H醓 Nh﹏", "jushihuoren"},
		{"To祅 Chuy觧 C玭 Nh﹏", "xuanzhuangunren"},
		{"Thi猲 Ni猲 H醓 K� L﹏", "qiannianhuoqilin"},
		{"Чi Ng� Qu竔", "dayuguai"},
		{"S竧 Ph� Lang", "S竧 Ph� Lang"}
	};
	local nRand = random(getn(tBoss));
	local npcBoss = CreateNpc(tBoss[nRand][2], tBoss[nRand][1], GetWorldPos());
	SetNpcLifeTime(npcBoss, 20*60);
	SetNpcDeathScript(npcBoss, "\\script\\online_activites\\201501\\gouhuo.lua");
	gf_Msg2Team(format("T� i %s  chi猽 g鋓 ra [%s] ", GetName(), tBoss[nRand][1]));
end

function OnDeath(id, f, x)
	local npcIndex = CreateNpc("jinbaoxiang", "Rng Ho祅g Kim B秓 B鑙", GetNpcWorldPos(id));
	SetNpcLifeTime(npcIndex, 90);
	SetNpcTempData(npcIndex, 1, GetTeamID());
	SetNpcScript(npcIndex, "\\script\\online_activites\\201501\\gouhuo.lua");
	SetNpcLifeTime(id, 0);
end

function main()
	local npcIndex = GetTargetNpc()
	if GetNpcName(npcIndex) ~= "Rng Ho祅g Kim B秓 B鑙" then
		return 0;
	end
	local nTeamID = GetTeamID();
	if GetNpcTempData(npcIndex, 1) ~= nTeamID or nTeamID == 0 then
		Talk(1,"","B秓 rng kh玭g thu閏 t� i c馻 ngi, kh玭g 頲 nh薾 thng!");
		return 0;
	end
	if GH_TASK_GROUP:GetTask(GH_TASK_GROUP.BoxAward) ~= 0 then
		Talk(1,"","Ngi  nh薾 ph莕 thng b秓 rng, ng祔 mai n l筰!");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.BoxAward, 1);
	local tAward = {
		{2, 2000, 5000000, 1},
		{2, 1500, 10000000, 1},	
		{1, 1000, "B筩h C﹗ Ho祅", {2, 1, 270, 1, 4}, 7 * 24 * 3600},
		{1, 700, "Чi B筩h C﹗ ho祅", {2, 1, 1007, 1, 4}, 7 * 24 * 3600},
		{1, 700, "Чi Nh﹏ s﹎", {2, 0, 553, 1, 4}, 7 * 24 * 3600},
		{1, 1000, "Qu﹏ C玭g Chng", {2, 1, 9999, 1, 4}, 7 * 24 * 3600},
		{1, 400, "Qu﹏ C玭g Чi", {2, 1, 9998, 1, 4}, 7 * 24 * 3600},
		{1, 100, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1, 4}, 7 * 24 * 3600},
		{1, 300, "Thi猲 Ki猽 L謓h", {2, 97, 236, 1, 4}, 0},
		{1, 1000, "B╪g th筩h", {2, 1, 149, 1}, 0},
		{1, 100, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1, 4}, 7 * 24 * 3600},
		{1, 100, "B祅 Long b輈h", {2, 1, 1000, 1, 4}, 0},
		{1, 100, "Chuy觧 Sinh Кn ", {2, 1, 30345, 1}, 30 * 24 * 3600},
		{1, 10, "Bao Thi猲 Ki猽 L謓h Nh�", {2, 95, 2086, 1}, 0},
		{31, 990, "ahf_GetLevel3JSEquip()", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho箃 ng ph� th竛g 1 n╩ 2015", "L鯽 tr筰");
end