Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")

SD_TASK_GROUP = TaskManager:Create(10, 13);
SD_TASK_GROUP.DaySeq = 1;
SD_TASK_GROUP.ThsDrop = 2; --ÌÒ»¨Ê÷µôÂä
SD_TASK_GROUP.ThsChickTime = 3; --ÌÒ»¨Ê÷µã»÷Ê±¼ä¼ä¸ô
SD_TASK_GROUP.WpgCount = 4; --ÎåÅÌ¹ûÉÏ½»´ÎÊý
SD_TASK_GROUP.YearBoss = 5; --ÐÂÄêBOSS

function sd_CreateDecorateNpc()
	if gf_CheckEventDateEx(147) ~= 1 then
		return 0;
	end
	if SubWorldID2Idx(200) ~= -1 then
		local tPos = {
			{200,1380,2815},{200,1339,2887},
			{200,1399,2831},{200,1326,2868},
			{200,1418,2849},{200,1346,2849},
			{200,1432,2866},{200,1362,2830},
			{200,1420,2879},{200,1224,2687},
			{200,1408,2892},{200,1212,2699},
			{200,1392,2908},{200,1550,3024},
			{200,1375,2923},{200,1540,3036},
			{200,1355,2904},{200,1221,3019},
			{200,1229,3028},           
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end
	if SubWorldID2Idx(150) ~= -1 then
		local tPos = {
			{150,1689,3112},{150,1783,3211},
			{150,1645,3155},{150,1774,3220},
			{150,1686,3194},{150,1758,3035},
			{150,1728,3152},{150,1767,3046},
			{150,1606,3004},{150,1602,3222},
			{150,1595,3015},{150,1596,3212},
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end
	if SubWorldID2Idx(500) ~= -1 then
		local tPos = {
			{500,1757,3088},{500,1826,3264},
			{500,1814,3131},{500,1833,3254},
			{500,1757,3195},{500,1627,3060},
			{500,1703,3139},{500,1640,3046},
			{500,1635,3258},{500,1870,3002},
			{500,1643,3266},{500,1877,3010},
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end
	--ÏåÑô
	if SubWorldID2Idx(350) ~= -1 then
		--12
		for i = 0, 20 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1427-i*4, 2770+i*4);
			SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\spring_decorate.lua");
		end
		--34
		for i = 0, 3 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1432-i*4, 2780+i*4);
			SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\spring_decorate.lua");
		end
		--56
		for i = 0, 2 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1404-i*4, 2815+i*4);
			SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\spring_decorate.lua");
		end
		--78
		for i = 0, 5 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1379-i*4, 2841+i*4);
			SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\spring_decorate.lua");
		end
		--49
		for i = 1, 2 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1416+i*4, 2796+i*4);
			SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\spring_decorate.lua");
		end
		--10 11
		for i = 0, 4 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1436+i*4, 2822+i*4);
			SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\spring_decorate.lua");
		end
		--12 13
		for i = 0, 5 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1463+i*4, 2849+i*4);
			SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\spring_decorate.lua");
		end
		--5 14
		for i = 1, 19 do
			local npcIndex = CreateNpc("§µo Hoa thô"," ", 350, 1404+i*4, 2815+i*4);
			SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\spring_decorate.lua");
		end
		local tPos = {
			{350,1437,3022},	{350,1402,2995},
			{350,1490,2971},	{350,1422,3015},
			{350,1478,2957},	{350,1548,2871},
			{350,1455,2933},	{350,1540,2864},
			{350,1444,2926},	{350,1346,3094},
			{350,1423,2938},	{350,1337,3084},
			{350,1403,2960},	{350,1325,2868},
			{350,1390,2978},	{350,1336,2857},
			{350,1545,3083},  {350,1536,3090},        
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end
	if SubWorldID2Idx(300) ~= -1 then
		local tPos = {
			{300,1736,3489},{300,1656,3711},	
			{300,1698,3532},{300,1641,3696},	
			{300,1809,3559},{300,1668,3464},	
			{300,1792,3544},{300,1681,3451},	
			{300,1919,3443},{300,1915,3692},	
			{300,1909,3431},{300,1926,3680},	
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end
	if SubWorldID2Idx(100) ~= -1 then
		local tPos = {
			{100,1384,2978},{100,1427,3023},	
			{100,1400,2960},{100,1412,3012},	
			{100,1416,2943},{100,1395,2995},	
			{100,1427,2934},{100,1545,2880},	
			{100,1443,2949},{100,1530,2866},	
			{100,1460,2964},{100,1331,2887},	
			{100,1473,2979},{100,1345,2873},	
			{100,1463,2990},{100,1585,3126},	
			{100,1446,3005},{100,1576,3135},	
		}
		for k, v in tPos do
			CreateNpc("§Ìn lång ®á", " ", v[1], v[2], v[3]);
		end
	end	
end

function main()
	sd_DailyReset();
	if gf_GetPlayerRebornCount() <= 0 and gf_CheckBaseCondition(85, 1) ~= 1 then
			return 0;
	end
	local nTimes = SD_TASK_GROUP:GetTask(SD_TASK_GROUP.ThsDrop);
	if nTimes >= 3 then
		Talk(1,"",format("N¨m míi vui vÎ! §¹i hiÖp h«m nay ®· nhËn hÕt %d phÇn th­ëng, h·y ®Õn ng¾m hoa ®µo vµ nhËn th­ëng vµo ngµy mai nhÐ !", 3));
		return 0;
	end
	--µã»÷¼ä¸ô60s
	if GetTime() - SD_TASK_GROUP:GetTask(SD_TASK_GROUP.ThsChickTime) < 60 then
		Talk(1,"",format("CÇn ®îi %d gi©y míi cã thÓ bÊm tiÕp ®Ó rót th­ëng, chóc c¸c b¹n may m¾n!", 60));
		return 0;
	end
	if random(1000) <= 500 then
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	SD_TASK_GROUP:SetTask(SD_TASK_GROUP.ThsDrop, nTimes + 1);
	SD_TASK_GROUP:SetTask(SD_TASK_GROUP.ThsChickTime, GetTime());
	local tAward = {
		{31, 4000, "sd_Ths_Exp()", 1},
		{31, 4000, "sd_Ths_ZhenQi()", 1},
		{31, 1999, "sd_Ths_Xuanzhang()", 1},
		{31, 1, "sd_Ths_dan()", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1);
end

function sd_Ths_Exp()
	local tAward = {
		{2, 25, 2000, 1},
		{2, 25, 20000, 1},
		{2, 25, 200000, 1},
		{2, 20, 2000000, 1},
		{2, 5, 20142015, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event TÕt Kingsoft", "§µo Hoa thô");
end

function sd_Ths_ZhenQi()
	local tAward = {
		{31, 60, "AwardGenuineQi(10)", 1},
		{31, 30, "AwardGenuineQi(50)", 1},
		{31, 5, "AwardGenuineQi(100)", 1},
		{31, 4, "AwardGenuineQi(500)", 1},
		{31, 1, "AwardGenuineQi(1000)", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event TÕt Kingsoft", "§µo Hoa thô");
end

function sd_Ths_Xuanzhang()
	local tAward = {
		{1, 50, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 1}, 0},
		{1, 40, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 2}, 0},
		{1, 10, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 5}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event TÕt Kingsoft", "§µo Hoa thô");
end

function sd_Ths_dan()
	gf_AddItemEx2({2,1,30787, 1}, "Trøng Bæn §iÓu", "Event TÕt Kingsoft", "§µo Hoa thô", 0, 1);
	Msg2Global(format("Chóc mõng %s khi ng¾m hoa ®µo ®· nhËn ®­îc Trøng Chim Ngèc ®¸ng yªu, thËt lµ ng­ìng mé!", GetName()));
end

function OnUse(nItem)
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch­a hoµn thµnh nhiÖm vô phôc sinh ®ång hµnh, t¹m thêi kh«ng thÓ më!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("Sè l­îng b¹n ®ång hµnh hiÖn t¹i v­ît qu¸ 5");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		AddPet(39);
		Msg2Player(format("Ng­¬i nhËn ®­îc [%s] b¹n ®ång hµnh", "Bæn §iÓu"));
	end
end

function sd_DailyReset()
	local nDate = gf_TodayDate();
	if nDate ~= SD_TASK_GROUP:GetTask(SD_TASK_GROUP.DaySeq) then
		SD_TASK_GROUP:SetTask(SD_TASK_GROUP.DaySeq, nDate);
		SD_TASK_GROUP:SetTask(SD_TASK_GROUP.ThsDrop, 0);
		SD_TASK_GROUP:SetTask(SD_TASK_GROUP.ThsChickTime, 0);
		SD_TASK_GROUP:SetTask(SD_TASK_GROUP.WpgCount, 0);
		SD_TASK_GROUP:SetTask(SD_TASK_GROUP.YearBoss, 0);
	end
end

