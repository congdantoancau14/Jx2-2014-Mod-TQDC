Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")

WS_TASK_GROUP = TaskManager:Create(2, 21);
WS_TASK_GROUP.DaySeq = 1;
WS_TASK_GROUP.Number = 2; --Éú³ÉµÄÊý
WS_TASK_GROUP.Recursive = 3; --µÝ¹é´ÎÊý
WS_TASK_GROUP.SuccTimes = 4; --»®È­Ê¤Àû´ÎÊý
WS_TASK_GROUP.IbTimes = 5; --±£Áô´ÎÊý
WS_TASK_GROUP.GetAward = 6; --ÊÇ¹»ÁìÈ¡»®È­½±Àø
WS_TASK_GROUP.IbTag = 7 --IBtag

function Ws_RelayCallNpc(nRandomSeed)
	-- if gf_CheckEventDateEx(148) ~= 1 then
		-- return 0;
	-- end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20150211 then
		return 0
	end
	local tMapPos = {
		{{200,1385,2890}, "BiÖn Kinh (173,180)"},
		{{150,1688,3127}, "D­¬ng Ch©u (211,195)"},
		{{350,1440,2999}, "T­¬ng D­¬ng (180,187)"},
		{{100,1447,2977}, "TuyÒn Ch©u (180,185)"},
		{{400,1480,3028}, "§¹i Lý (185,189)"},
		{{300,1764,3540}, "Thµnh §« (220,221)"},
		{{500,1740,3152}, "Phông T­êng (217,196)"},
	}
	local nSize = getn(tMapPos);
	local nIndex = mod(nRandomSeed, nSize) + 1;
	
	Msg2Global(format("L©n S­ xuÊt hiÖn ë %s, mau ®i t×m L©n S­ ®Ó nhËn Bao L× X× May M¾n", tMapPos[nIndex][2]));
	AddLocalNews(format("L©n S­ xuÊt hiÖn ë %s, mau ®i t×m L©n S­ ®Ó nhËn Bao L× X× May M¾n", tMapPos[nIndex][2]));
	
	local nHour = tonumber(date("%H"));
	if SubWorldID2Idx(tMapPos[nIndex][1][1]) ~= -1 then
		local npcIndex = CreateNpc("Wushi_NPC", "L©n S­", tMapPos[nIndex][1][1], tMapPos[nIndex][1][2], tMapPos[nIndex][1][3]);
		if npcIndex > 0 then
			if nHour >= 12 and nHour <= 13 then
				SetNpcLifeTime(npcIndex, 60*60);
			elseif nHour >= 19 and nHour <= 22 then
				SetNpcLifeTime(npcIndex, 3*60*60);
			else
				SetNpcLifeTime(npcIndex, 0);
			end
			SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\wushi.lua");
		end
		npcIndex = CreateNpc("Datouwawa", " ", tMapPos[nIndex][1][1], tMapPos[nIndex][1][2]+3, tMapPos[nIndex][1][3]+3);
		if npcIndex > 0 then
			if npcIndex > 0 then
				if nHour >= 12 and nHour <= 13 then
					SetNpcLifeTime(npcIndex, 60*60);
				elseif nHour >= 19 and nHour <= 22 then
					SetNpcLifeTime(npcIndex, 3*60*60);
				else
					SetNpcLifeTime(npcIndex, 0);
				end
				SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\wushi.lua");
			end
		end
	end
end

function main()
	local tSay = {
		"Bãi QuÎ §Çu N¨m/ws_zhangua",
		"May M¾n §Çu N¨m/ws_guess",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("<color=green>L©n S­:<color> N¨m míi ph¸t tµi!", getn(tSay), tSay);
end

--²ÂÊý×ÖÓÎÏ·
function ws_zhangua()
	ws_daily_reset();
	local tSay = {
		"B¾t ®Çu ch¬i/ws_guess_number",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("<color=green>L©n S­:<color> N¨m míi ng­¬i cã muèn ta bãi cho ng­êi 1 quÎ ®Çu n¨m kh«ng, chØ cÇn 10 tiÒn lÎ th«i?", getn(tSay), tSay);
end

function ws_guess_number()
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30778) < 10 then
		Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "TiÒn LÎ", 10));
		return 0;
	end
	
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Recursive);
	if nTimes >= 5 then
		Talk(1,"","H«m nay ®· tham gia råi, ngµy mai h·y quay l¹i!")
		return 0;
	end
	
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Number) == 111 then
		Talk(1,"","H«m nay ®· tham gia råi, ngµy mai h·y quay l¹i!");
		return 0;
	end
	--ÓÎÏ·¿ªÊ¼£¬Éú³ÉÄ¿±êÊý
	local nTarget = random(1,100);
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Number, nTarget);
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Recursive, 0);
	if DelItem(2,1,30778,10) ~= 1 then
		Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "TiÒn LÎ", 10));
		return 0;
	end
	ws_guess_number_input();
end

function ws_guess_number_input()
	-- if DelItem(2,1,30778,10) ~= 1 then
		-- Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "TiÒn LÎ", 10));
		-- return 0;
	-- end
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Recursive, WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Recursive)+1);
	AskClientForNumber("ws_guess_number_input_do",1,100,"NhËp ch÷ sè c¸c h¹ ®o¸n tróng");
end

function ws_guess_number_input_do(nNum)
	local nTarget = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Number);
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Recursive);
	if nNum == nTarget then
		Talk(1,"",format("Chóc mõng c¸c h¹ ®· ®o¸n tróng råi!!!  \n Ch÷ sè may m¾n cña c¸c h¹ lµ<color=green>%d<color>, sè lÇn ®o¸n lµ<color=green>%d<color>",nTarget,nTimes));
		--¸ø½±Àø
		local tAward = {
			{10000000, {2,1,30786,3}, "Bao l× x× may m¾n"},
			{6000000, {2,1,30786,1}, "Bao l× x× may m¾n"},
			{4000000, {2,1,30783,3}, "Sung"},
			{2000000, {2,1,30783,2}, "Sung"},
			{1000000, {2,1,30783,1}, "Sung"},
		}
		if not tAward[nTimes] then
			return 0;
		end
		if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
			return 0;
		end
		gf_ModifyExp(tAward[nTimes][1]);
		gf_AddItemEx2(tAward[nTimes][2], tAward[nTimes][3], "Mõng Xu©n Êt Mïi", "Bãi QuÎ §Çu N¨m", 0, 1)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Number, 111);
	else
		if nTimes >= 5 then
			Talk(1,"",format("Sè lÇn ®o¸n sè ®· v­ît qu¸ <color=green>%d<color> lÇn, <color=red>®o¸n sè thÊt b¹i<color>, ngµy mai h·y quay l¹i! Con sè may m¾n cña b¹n lµ <color=red>%d<color>.",5,nTarget));
			gf_ModifyExp(1000000);
			return 0;
		end
		if nNum > nTarget then
			Talk(1,"ws_guess_number_input",format("Ch÷ sè ®o¸n lÇn %d cña c¸c h¹ lµ<color=red>%d<color>, qu¸ lín råi, h·y ®o¸n sè nhá h¬n tÝ.",nTimes,nNum));
		else
			Talk(1,"ws_guess_number_input",format("Ch÷ sè ®o¸n lÇn %d cña c¸c h¹ lµ<color=red>%d<color>, qu¸ nhá råi, h·y ®o¸n sè lín h¬n tÝ.",nTimes,nNum));
		end
	end
end

function ws_guess()
	ws_daily_reset();
	local tSay = {
		"B¾t ®Çu ch¬i/ws_guess_finger",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("<color=green>L©n S­:<color> N¨m míi tÕt ®Õn ng­¬i cã muèn cïng ta lµm vµi v¸n may m¾n kh«ng, cÇn 10 tiÒn lÎ lµ cã thÓ tham gia víi ta.", getn(tSay), tSay);
end

function ws_guess_finger()
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.GetAward) ~= 0 then
		Talk(1,"","H«m nay ®· tham gia råi, ngµy mai h·y quay l¹i!")
		return 0;
	end
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.IbTag) ~= 0 then
		ws_guess_finger_ib();
		return 0;
	end
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes);
	local tSay = {}
	local msg = "";
	local tAward = {
		{600000, {2,1,30783,1}, "Sung"},
		{1000000, {2,1,30783,2}, "Sung"},
		{2000000, {2,1,30783,3}, "Sung"},
		{4000000, {2,1,30784,1}, "M©m Ngò Qu¶"},
		{6000000, {2,1,30786,1}, "Bao l× x× may m¾n"},
		{10000000, {2,1,30786,3}, "Bao l× x× may m¾n"},
	}
	
	if GetItemCount(2,1,30778) < 10 then
		Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "TiÒn LÎ", 10))
		return 0;
	end
	if DelItem(2,1,30778,10) ~= 1 then
		return 0;
	end
	
	if nTimes >= 0 and nTimes < getn(tAward) then
		tinsert(tSay, format("Ra Bóa/#ws_guess_finger_jugde(1)"))
		tinsert(tSay, format("Ra KÐo/#ws_guess_finger_jugde(2)"))
		tinsert(tSay, format("Ra Bao/#ws_guess_finger_jugde(3)"))
	end
	if nTimes > 0 and nTimes <= getn(tAward) then
		msg = msg..format("\nPhÇn th­ëng tÝch lòy hiÖn t¹i %d EXP, %s*%d", tAward[nTimes][1], tAward[nTimes][3], tAward[nTimes][2][4]);
		tinsert(tSay, "\nTa kh«ng muèn ch¬i n÷a! NhËn th­ëng/ws_guess_finger_getaward");
	end
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	Say("H·y chän c¸ch o¼n tï t×:"..msg, getn(tSay), tSay);
end

function ws_guess_finger2()
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.GetAward) ~= 0 then
		Talk(1,"","H«m nay ®· tham gia råi, ngµy mai h·y quay l¹i!")
		return 0;
	end
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.IbTag) ~= 0 then
		ws_guess_finger_ib();
		return 0;
	end
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes);
	local tSay = {}
	local msg = "";
	local tAward = {
		{600000, {2,1,30783,1}, "Sung"},
		{1000000, {2,1,30783,2}, "Sung"},
		{2000000, {2,1,30783,3}, "Sung"},
		{4000000, {2,1,30784,1}, "M©m Ngò Qu¶"},
		{6000000, {2,1,30786,1}, "Bao l× x× may m¾n"},
		{10000000, {2,1,30786,3}, "Bao l× x× may m¾n"},
	}

	if nTimes >= 0 and nTimes < getn(tAward) then
		tinsert(tSay, format("Ra Bóa/#ws_guess_finger_jugde(1)"))
		tinsert(tSay, format("Ra KÐo/#ws_guess_finger_jugde(2)"))
		tinsert(tSay, format("Ra Bao/#ws_guess_finger_jugde(3)"))
	end
	if nTimes > 0 and nTimes <= getn(tAward) then
		msg = msg..format("\nPhÇn th­ëng tÝch lòy hiÖn t¹i %d EXP, %s*%d", tAward[nTimes][1], tAward[nTimes][3], tAward[nTimes][2][4]);
		tinsert(tSay, "\nTa kh«ng muèn ch¬i n÷a! NhËn th­ëng/ws_guess_finger_getaward");
	end
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	Say("H·y chän c¸ch o¼n tï t×:"..msg, getn(tSay), tSay);
end

function ws_guess_finger_jugde(nValue)

	local tListCmp = {
		--{Íæ¼ÒÊä£¬Íæ¼ÒÓ®}
		[1] = {3, 2},
		[2] = {1, 3},
		[3] = {1, 2},
	}
	local nSysValue = mod(random(1, 99), 3) + 1;
	if nSysValue == tonumber(nValue) then
		Talk(1,"ws_guess_finger2","B¹n vµ L©n S­ hßa nhau!");
	elseif nSysValue == tListCmp[tonumber(nValue)][1] then
		if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes) > 0 then
			WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTimes, WS_TASK_GROUP:GetTask(WS_TASK_GROUP.IbTimes) + 1)
			Talk(1,"ws_guess_finger_ib","B¹n <color=red>thua<color> råi, L©n S­ giµnh chiÕn th¾ng!");
		else
			Talk(1,"nothing","B¹n <color=red>thua<color> råi, L©n S­ giµnh chiÕn th¾ng!");
		end
	elseif nSysValue == tListCmp[tonumber(nValue)][2] then 
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.SuccTimes, WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes) + 1)
		Talk(1,"ws_guess_finger2","B¹n <color=green>th¾ng<color> råi, L©n S­ thÊt b¹i!");
	end
end

function ws_guess_finger_ib()
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes);
	local tAward = {
		{600000, {2,1,30783,1}, "Sung"},
		{1000000, {2,1,30783,2}, "Sung"},
		{2000000, {2,1,30783,3}, "Sung"},
		{4000000, {2,1,30784,1}, "M©m Ngò Qu¶"},
		{6000000, {2,1,30786,1}, "Bao l× x× may m¾n"},
		{10000000, {2,1,30786,3}, "Bao l× x× may m¾n"},
	}
	local msg = format("\nPhÇn th­ëng tÝch lòy hiÖn t¹i %d EXP, %s*%d", tAward[nTimes][1], tAward[nTimes][3], tAward[nTimes][2][4])
	local nIbTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.IbTimes);
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTag, 1);
	local tCost = {2, 4, 8, 16, 32};
	local tSay = {}
	if nIbTimes > 0 and nIbTimes <= getn(tCost) then
		tinsert(tSay, format("\nTiªu hao %d TiÒn LÎ, chóng ta tiÕp tôc nµo/#ws_guess_finger_ib_ensure(%d)", tCost[nIbTimes], tCost[nIbTimes]))
	end
	tinsert(tSay, "\nTa kh«ng muèn ch¬i n÷a! NhËn th­ëng/ws_guess_finger_getaward");	
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	Say(msg, getn(tSay), tSay);
end

function ws_guess_finger_ib_ensure(nCost)
	if DelItem(2,1,30778,nCost) == 1 then
		Msg2Player(format("B¹n ®· tiªu hao %d %s", nCost, "TiÒn LÎ"));
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTag, 0);
		ws_guess_finger2();
	else
		Talk(1,"nothing","Trong tói kh«ng cã TiÒn LÎ!");
	end
end

function ws_guess_finger_getaward()
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes);
	local tAward = {
		{600000, {2,1,30783,1}, "Sung"},
		{1000000, {2,1,30783,2}, "Sung"},
		{2000000, {2,1,30783,3}, "Sung"},
		{4000000, {2,1,30784,1}, "M©m Ngò Qu¶"},
		{6000000, {2,1,30786,1}, "Bao l× x× may m¾n"},
		{10000000, {2,1,30786,3}, "Bao l× x× may m¾n"},
	}
	if nTimes <= 0 or nTimes > getn(tAward) then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	gf_ModifyExp(tAward[nTimes][1]);
	gf_AddItemEx2(tAward[nTimes][2], tAward[nTimes][3], "Mõng Xu©n Êt Mïi", "May M¾n §Çu N¨m", 0, 1);
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.GetAward, 1);
end

function ws_daily_reset()
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.DaySeq) ~= gf_TodayDate() then
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.DaySeq, gf_TodayDate())
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Number, 0)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Recursive, 0)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.SuccTimes, 0)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTimes, 0)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.GetAward, 0)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTag, 0)
	end
end