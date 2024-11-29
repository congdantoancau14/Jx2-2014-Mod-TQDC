Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\activity_head.lua")

GH_ACITIVITY_ID = 145;
GH_BUY_COST = 29;
GH_TRIGGER_ID = 1539;
GH_AC_TIMES = 8;
GH_TEAM_LIMIT = 5;

--ÈÎÎñ±äÁ¿´¦Àí
GH_TASK_GROUP = TaskManager:Create(7, 12)
GH_TASK_GROUP.DaySeq = 1;
GH_TASK_GROUP.DayTimes = 2;
GH_TASK_GROUP.AcIndex = 3;
GH_TASK_GROUP.Trigger = 4;
GH_TASK_GROUP.AcTime = 5; 
GH_TASK_GROUP.BoxAward = 6;

function VET_201501_AddGouHuoDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(GH_ACITIVITY_ID) == 1 then
		tinsert(tbSayDialog, "KÝch ho¹t Löa tr¹i/Gh_Acivite")
		tinsert(tbSayDialog, "B¸n Cñi Kh«/Gh_Buy") 
	end
  return tbSayDialog, szSayHead 
end

function Gh_Acivite()
	gf_TeamOperateEX(GH_DailyReset);
	if GetCaptainName() ~= GetName() then
		Talk(1,"","ChØ cã ®éi tr­ëng míi ®­îc kÝch ho¹t Löa tr¹i!");
		return 0;
	end
	local nCamp, nPk = GetPKFlag();
	if nCamp == 0 and nPk == 0 then
		Talk(1,"","ë tr¹ng th¸i luyÖn c«ng kh«ng ®­îc kÝch ho¹t Löa tr¹i!");
		return 0;
	end
	local nTeamSize = GetTeamSize()
	if nTeamSize < GH_TEAM_LIMIT then
		Talk(1,"",format("Sè ng­êi tæ ®éi kh«ng ®ñ %d ng­êi, kh«ng ®­îc kÝch ho¹t Löa tr¹i!", GH_TEAM_LIMIT));
		return 0;
	end
	local nMapID, nX, nY = GetWorldPos();
	if gf_MapIsAllow({100,150,200,300,350,400,500}, nMapID) == 1 then
		Talk(1,"","Kh«ng thÓ kÝch ho¹t Löa tr¹i t¹i thµnh thÞ!");
		return 0;
	end
	if GetTime() - GH_TASK_GROUP:GetTask(GH_TASK_GROUP.AcTime) < 30*10 then
		Talk(1,"","HiÖn nay Löa tr¹i ch­a kÕt thóc,kh«ng thÓ kÝch ho¹t l¹i.")
		return 0;
	end
	if gf_CheckTeam(
		function ()
			if GetItemCount(2, 1, 30768) < 1 then
				return 0;
			end
			return 1;
		end, "Nh÷ng ®éi viªn nµy trong tói kh«ng cã cñi kh«, kh«ng thÓ kÝch ho¹t Löa tr¹i") ~= 1 then
			return 0;
	end
	if gf_CheckTeam(
		function ()
			if GH_TASK_GROUP:GetTask(GH_TASK_GROUP.DayTimes) >= GH_AC_TIMES then
				return 0;
			end
			return 1;
		end, format("Nh÷ng ®éi viªn nµy h«m nay ®· nhËn th­ëng v­ît qua %d lÇn, kh«ng thÓ kÝch ho¹t Löa tr¹i", GH_AC_TIMES)) ~= 1 then
			return 0;
	end
	
	local nNpcIndex = CreateNpc("Löa tr¹i", "Löa tr¹i", nMapID, nX, nY);
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
	gf_Msg2Team("Tæ ®éi ®· kÝch ho¹t thµnh c«ng Löa tr¹i!");
end

function Gh_Buy()
	AskClientForNumber("Gh_Buy_Callback", 0, floor(GetItemCount(2, 1, 30230)/GH_BUY_COST), "H·y nhËp sè l­îng vµo", "");
end

function Gh_Buy_Callback(nNum)
	if nNum <= 0 then return end
	if gf_Judge_Room_Weight(nNum, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30230, nNum*GH_BUY_COST) ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 30768, nNum}, "Cñi Kh«", "Ho¹t ®éng phô th¸ng 1 n¨m 2015", "Löa tr¹i", 24*3600, 1);
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
	if GetNpcName(npcIndex) == "Löa tr¹i" then
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
		{"ThÞ HuyÕt Ma Nh©n", "shixuemoren"},
		{"Cù Th¹ch Háa Nh©n", "jushihuoren"},
		{"Toµn ChuyÓn C«n Nh©n", "xuanzhuangunren"},
		{"Thiªn Niªn Háa Kú L©n", "qiannianhuoqilin"},
		{"§¹i Ng­ Qu¸i", "dayuguai"},
		{"S¸t Ph¸ Lang", "S¸t Ph¸ Lang"}
	};
	local nRand = random(getn(tBoss));
	local npcBoss = CreateNpc(tBoss[nRand][2], tBoss[nRand][1], GetWorldPos());
	SetNpcLifeTime(npcBoss, 20*60);
	SetNpcDeathScript(npcBoss, "\\script\\online_activites\\201501\\gouhuo.lua");
	gf_Msg2Team(format("Tæ ®éi %s ®· chiªu gäi ra [%s] ", GetName(), tBoss[nRand][1]));
end

function OnDeath(id, f, x)
	local npcIndex = CreateNpc("jinbaoxiang", "R­¬ng Hoµng Kim B¶o Bèi", GetNpcWorldPos(id));
	SetNpcLifeTime(npcIndex, 90);
	SetNpcTempData(npcIndex, 1, GetTeamID());
	SetNpcScript(npcIndex, "\\script\\online_activites\\201501\\gouhuo.lua");
	SetNpcLifeTime(id, 0);
end

function main()
	local npcIndex = GetTargetNpc()
	if GetNpcName(npcIndex) ~= "R­¬ng Hoµng Kim B¶o Bèi" then
		return 0;
	end
	local nTeamID = GetTeamID();
	if GetNpcTempData(npcIndex, 1) ~= nTeamID or nTeamID == 0 then
		Talk(1,"","B¶o r­¬ng kh«ng thuéc tæ ®éi cña ng­¬i, kh«ng ®­îc nhËn th­ëng!");
		return 0;
	end
	if GH_TASK_GROUP:GetTask(GH_TASK_GROUP.BoxAward) ~= 0 then
		Talk(1,"","Ng­¬i ®· nhËn phÇn th­ëng b¶o r­¬ng, ngµy mai ®Õn l¹i!");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.BoxAward, 1);
	local tAward = {
		{2, 2000, 5000000, 1},
		{2, 1500, 10000000, 1},	
		{1, 1000, "B¹ch C©u Hoµn", {2, 1, 270, 1, 4}, 7 * 24 * 3600},
		{1, 700, "§¹i B¹ch C©u hoµn", {2, 1, 1007, 1, 4}, 7 * 24 * 3600},
		{1, 700, "§¹i Nh©n s©m", {2, 0, 553, 1, 4}, 7 * 24 * 3600},
		{1, 1000, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1, 4}, 7 * 24 * 3600},
		{1, 400, "Qu©n C«ng §¹i", {2, 1, 9998, 1, 4}, 7 * 24 * 3600},
		{1, 100, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1, 4}, 7 * 24 * 3600},
		{1, 300, "Thiªn Kiªu LÖnh", {2, 97, 236, 1, 4}, 0},
		{1, 1000, "B¨ng th¹ch", {2, 1, 149, 1}, 0},
		{1, 100, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1, 4}, 7 * 24 * 3600},
		{1, 100, "Bµn Long bÝch", {2, 1, 1000, 1, 4}, 0},
		{1, 100, "ChuyÓn Sinh §¬n ", {2, 1, 30345, 1}, 30 * 24 * 3600},
		{1, 10, "Bao Thiªn Kiªu LÖnh Nhá", {2, 95, 2086, 1}, 0},
		{31, 990, "ahf_GetLevel3JSEquip()", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho¹t ®éng phô th¸ng 1 n¨m 2015", "Löa tr¹i");
end