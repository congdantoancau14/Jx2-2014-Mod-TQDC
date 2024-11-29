Include("\\script\\online_activites\\201502\\spring_decorate.lua")

function yb_RelayCallBoss(nRandomSeed)
	-- if gf_CheckEventDateEx(148) ~= 1 then
		-- return 0;
	-- end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20150228 then
		return 0
	end
	local tMapPos = {
		{{218,1834,3436}, "Linh B¶o S¬n (229,213)"},
		{{312,1722,3776}, "Vâ §ang (215,235)"},
		{{108,1485,3026}, "B¾c TuyÒn Ch©u (185,189)"},
		{{105,1462,3071}, "T©y TuyÒn Ch©u (182,191)"},
		{{401,1692,2988}, "§iÓm Th­¬ng S¬n (211,186)"},
		{{203,1524,3034}, "T©y BiÖn Kinh (190,189)"},
		{{201,1548,3048}, "Nam BiÖn Kinh (193,190)"},
		{{301,1513,2972}, "T©y Thµnh §« (189,185)"},
		{{308,1519,3180}, "B¾c Thµnh §« (189,198)"},
		{{507,1658,3352}, "Long M«n TrÊn (207,209)"},
	}
	local NpcTemplate = {
		{"SF15_DFBB", "§«ng Ph­¬ng BÊt B¹i"},
		{"SF15_Wushi", "L©n S­"},
		{"SF15_LYQ", "Lý Nguyªn Kh¸nh"},
	}
	local nSize = getn(tMapPos);
	local nIndex1 = mod(nRandomSeed, nSize) + 1;
	local nIndex2 = mod(nIndex1 + 3, nSize);
	if nIndex2 == 0 then
		nIndex2 = nSize;
	end
	local nIndex3 = mod(nIndex1 + 6, nSize);
	if nIndex3 == 0 then
		nIndex3 = nSize;
	end
	
	Msg2Global(format("Boss %s xuÊt hiÖn ë b¶n ®å %s, c¸c ®¹i hiÖp h·y nhanh chãng ®i tiªu diÖt boss nµo!", NpcTemplate[1][2], tMapPos[nIndex1][2]));
	AddLocalNews(format("Boss %s xuÊt hiÖn ë b¶n ®å %s, c¸c ®¹i hiÖp h·y nhanh chãng ®i tiªu diÖt boss nµo!", NpcTemplate[1][2], tMapPos[nIndex1][2]));
	
	Msg2Global(format("Boss %s xuÊt hiÖn ë b¶n ®å %s, c¸c ®¹i hiÖp h·y nhanh chãng ®i tiªu diÖt boss nµo!", NpcTemplate[2][2], tMapPos[nIndex2][2]));
	AddLocalNews(format("Boss %s xuÊt hiÖn ë b¶n ®å %s, c¸c ®¹i hiÖp h·y nhanh chãng ®i tiªu diÖt boss nµo!", NpcTemplate[2][2], tMapPos[nIndex2][2]));
	
	Msg2Global(format("Boss %s xuÊt hiÖn ë b¶n ®å %s, c¸c ®¹i hiÖp h·y nhanh chãng ®i tiªu diÖt boss nµo!", NpcTemplate[3][2], tMapPos[nIndex3][2]));
	AddLocalNews(format("Boss %s xuÊt hiÖn ë b¶n ®å %s, c¸c ®¹i hiÖp h·y nhanh chãng ®i tiªu diÖt boss nµo!", NpcTemplate[3][2], tMapPos[nIndex3][2]));
	
	if SubWorldID2Idx(tMapPos[nIndex1][1][1]) ~= -1 then
		local npcIndex = CreateNpc(NpcTemplate[1][1], NpcTemplate[1][2], tMapPos[nIndex1][1][1], tMapPos[nIndex1][1][2], tMapPos[nIndex1][1][3]);
		if npcIndex > 0 then
			SetNpcLifeTime(npcIndex, 30*60);
			SetNpcDeathScript(npcIndex, "\\script\\online_activites\\201502\\year_boss.lua");
		end
	end
	
	if SubWorldID2Idx(tMapPos[nIndex2][1][1]) ~= -1 then
		local npcIndex = CreateNpc(NpcTemplate[2][1], NpcTemplate[2][2], tMapPos[nIndex2][1][1], tMapPos[nIndex2][1][2], tMapPos[nIndex2][1][3]);
		if npcIndex > 0 then
			SetNpcLifeTime(npcIndex, 30*60);
			SetNpcDeathScript(npcIndex, "\\script\\online_activites\\201502\\year_boss.lua");
		end
	end
	
	if SubWorldID2Idx(tMapPos[nIndex3][1][1]) ~= -1 then
		local npcIndex = CreateNpc(NpcTemplate[3][1], NpcTemplate[3][2], tMapPos[nIndex3][1][1], tMapPos[nIndex3][1][2], tMapPos[nIndex3][1][3]);
		if npcIndex > 0 then
			SetNpcLifeTime(npcIndex, 30*60);
			SetNpcDeathScript(npcIndex, "\\script\\online_activites\\201502\\year_boss.lua");
		end
	end
end

YB_GLOBLE_TAG = 0;
function OnDeath(id, x, f)
	SetNpcLifeTime(id, 0);
	sd_DailyReset();
	if gf_GetTeamSize() <= 1 then
		if SD_TASK_GROUP:GetTask(SD_TASK_GROUP.YearBoss) ~= 0 then
			Talk(1,"","H«m nay ®· phÇn th­ëng tiªu diÖt BOSS, kh«ng thÓ nhËn l¹i!");
			return 0;
		end 
		if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
			return 0;
		end
		local tAward = {
			{1, 8, "Thiªn Cang LÖnh", {2, 95, 204, 1}, 0},
			{1, 30, "Thiªn M«n Kim LÖnh", {2, 1, 30370, 1}, 0},
			{1, 1, "Bao Thiªn Kiªu LÖnh Lín", {2, 95, 2087, 1}, 0},
			{1, 60, "Bao Thiªn Kiªu LÖnh Nhá", {2, 95, 2086, 1}, 0},
		}
		if YB_GLOBLE_TAG == 0 then
			if GetNpcName(id) == "L©n S­" then
				tinsert(tAward, {31, 1, format("yb_randhorse(%d, %d)", 1, id), 1});
			else
				tinsert(tAward, {31, 1, format("yb_randhorse(%d, %d)", 1, id), 1});
			end
		end
		local nRand = gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "BOSS N¨m Míi", "PhÇn th­ëng BOSS");
		if nRand >= 1 and nRand <= 4 then
			Msg2Global(format("Chóc mõng %s ®· ®¸nh b¹i BOSS %s nhËn ®­îc phÇn th­ëng %s*%d!", GetName(), GetNpcName(id), tAward[nRand][3], 1));
		end
		SD_TASK_GROUP:SetTask(SD_TASK_GROUP.YearBoss, 1);
	else
		local oldPlayerIndex = PlayerIndex;
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if SD_TASK_GROUP:GetTask(SD_TASK_GROUP.YearBoss) ~= 0 then
				Talk(1,"","H«m nay ®· phÇn th­ëng tiªu diÖt BOSS, kh«ng thÓ nhËn l¹i!");
				LeaveTeam();
			end 
			if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
				LeaveTeam();
			end
		end
		PlayerIndex = oldPlayerIndex;
		
		local tAward = {
			{800, {"Thiªn Cang LÖnh", {2, 95, 204, 1}}},
	    {3000, {"Thiªn M«n Kim LÖnh", {2, 1, 30370, 1}}},
	    {100, {"Bao Thiªn Kiªu LÖnh Lín", {2, 95, 2087, 1}}},
	    {6000, {"Bao Thiªn Kiªu LÖnh Nhá", {2, 95, 2086, 1}}},
		}
		if YB_GLOBLE_TAG == 0 then
			tinsert(tAward, {45, {"ThÇn Thó TÞch Tµ", {0, 105, 30048, 1, 1, -1, -1, -1, -1, -1, -1}}});
	    tinsert(tAward, {50, {"Kú l©n", {0, 105, 30049, 1, 1, -1, -1, -1, -1, -1, -1}}});
	    tinsert(tAward, {3, {"B¸o Tr¾ng B¶o B¶o", {0, 105, 30047, 1, 1, -1, -1, -1, -1, -1, -1}}});
	    tinsert(tAward, {1, {"B¸o Vµng B¶o B¶o", {0, 105, 30046, 1, 1, -1, -1, -1, -1, -1, -1}}});
			if GetNpcName(id) == "L©n S­" then
				tinsert(tAward, {1, {"L©n S­", {0, 105, 30044, 1, 1, -1, -1, -1, -1, -1, -1}}});
			end
		end
		local tItem = gf_RandRate(tAward)[2];
		gf_ThrowDice(tItem[2], nil, nil, nil, nil, id);		
		Msg2Global(format("Chóc mõng tæ ®éi %s ®· ®¸nh b¹i BOSS %s nhËn ®­îc phÇn th­ëng %s*%d!", GetName(), GetNpcName(id), tItem[1], 1));
		if tItem[1] == "ThÇn Thó TÞch Tµ" or tItem[1] == "Kú l©n" or 
		tItem[1] == "B¸o Tr¾ng B¶o B¶o" or tItem[1] == "B¸o Vµng B¶o B¶o" or tItem[1] == "L©n S­" then
			YB_GLOBLE_TAG = 1;
		end
	end
end

function yb_randhorse(nTag, id)
	local tAward = {
		{1, 45, "ThÇn Thó TÞch Tµ", {0, 105, 30048, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 50, "Kú l©n", {0, 105, 30049, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 3, "B¸o Tr¾ng B¶o B¶o", {0, 105, 30047, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "B¸o Vµng B¶o B¶o", {0, 105, 30046, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	}
	if nTag == 1 then
		tinsert(tAward, {1, 1, "L©n S­", {0, 105, 30044, 1, 1, -1, -1, -1, -1, -1, -1}, 0});
	end
	local nRand = gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "BOSS N¨m Míi", "PhÇn th­ëng BOSS");
	YB_GLOBLE_TAG = 1;
	Msg2Global(format("Chóc mõng %s ®· ®¸nh b¹i BOSS %s nhËn ®­îc phÇn th­ëng %s*%d!", GetName(), GetNpcName(id), tAward[nRand][3], 1));
end