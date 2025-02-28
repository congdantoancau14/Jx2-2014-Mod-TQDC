Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")

WS_TASK_GROUP = TaskManager:Create(2, 21);
WS_TASK_GROUP.DaySeq = 1;
WS_TASK_GROUP.Number = 2; --生成的数
WS_TASK_GROUP.Recursive = 3; --递归次数
WS_TASK_GROUP.SuccTimes = 4; --划拳胜利次数
WS_TASK_GROUP.IbTimes = 5; --保留次数
WS_TASK_GROUP.GetAward = 6; --是够领取划拳奖励
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
		{{200,1385,2890}, "Bi謓 Kinh (173,180)"},
		{{150,1688,3127}, "Dng Ch﹗ (211,195)"},
		{{350,1440,2999}, "Tng Dng (180,187)"},
		{{100,1447,2977}, "Tuy襫 Ch﹗ (180,185)"},
		{{400,1480,3028}, "Чi L� (185,189)"},
		{{300,1764,3540}, "Th祅h Й (220,221)"},
		{{500,1740,3152}, "Ph鬾g Tng (217,196)"},
	}
	local nSize = getn(tMapPos);
	local nIndex = mod(nRandomSeed, nSize) + 1;
	
	Msg2Global(format("L﹏ S� xu蕋 hi謓 � %s, mau 甶 t譵 L﹏ S�  nh薾 Bao L� X� May M緉", tMapPos[nIndex][2]));
	AddLocalNews(format("L﹏ S� xu蕋 hi謓 � %s, mau 甶 t譵 L﹏ S�  nh薾 Bao L� X� May M緉", tMapPos[nIndex][2]));
	
	local nHour = tonumber(date("%H"));
	if SubWorldID2Idx(tMapPos[nIndex][1][1]) ~= -1 then
		local npcIndex = CreateNpc("Wushi_NPC", "L﹏ S�", tMapPos[nIndex][1][1], tMapPos[nIndex][1][2], tMapPos[nIndex][1][3]);
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
		"B鉯 Qu� u N╩/ws_zhangua",
		"May M緉 u N╩/ws_guess",
		"T筰 h� ch� xem qua th玦/nothing",
	}
	Say("<color=green>L﹏ S�:<color> N╩ m韎 ph竧 t礽!", getn(tSay), tSay);
end

--猜数字游戏
function ws_zhangua()
	ws_daily_reset();
	local tSay = {
		"B総 u ch琲/ws_guess_number",
		"T筰 h� ch� xem qua th玦/nothing",
	}
	Say("<color=green>L﹏ S�:<color> N╩ m韎 ngi c� mu鑞 ta b鉯 cho ngi 1 qu� u n╩ kh玭g, ch� c莕 10 ti襫 l� th玦?", getn(tSay), tSay);
end

function ws_guess_number()
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30778) < 10 then
		Talk(1,"",format("Trong h祅h trang %s s� lng kh玭g  %d", "Ti襫 L�", 10));
		return 0;
	end
	
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Recursive);
	if nTimes >= 5 then
		Talk(1,"","H玬 nay  tham gia r錳, ng祔 mai h穣 quay l筰!")
		return 0;
	end
	
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Number) == 111 then
		Talk(1,"","H玬 nay  tham gia r錳, ng祔 mai h穣 quay l筰!");
		return 0;
	end
	--游戏开始，生成目标数
	local nTarget = random(1,100);
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Number, nTarget);
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Recursive, 0);
	if DelItem(2,1,30778,10) ~= 1 then
		Talk(1,"",format("Trong h祅h trang %s s� lng kh玭g  %d", "Ti襫 L�", 10));
		return 0;
	end
	ws_guess_number_input();
end

function ws_guess_number_input()
	-- if DelItem(2,1,30778,10) ~= 1 then
		-- Talk(1,"",format("Trong h祅h trang %s s� lng kh玭g  %d", "Ti襫 L�", 10));
		-- return 0;
	-- end
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Recursive, WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Recursive)+1);
	AskClientForNumber("ws_guess_number_input_do",1,100,"Nh藀 ch� s� c竎 h� 畂竛 tr髇g");
end

function ws_guess_number_input_do(nNum)
	local nTarget = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Number);
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Recursive);
	if nNum == nTarget then
		Talk(1,"",format("Ch骳 m鮪g c竎 h�  畂竛 tr髇g r錳!!!  \n Ch� s� may m緉 c馻 c竎 h� l�<color=green>%d<color>, s� l莕 畂竛 l�<color=green>%d<color>",nTarget,nTimes));
		--给奖励
		local tAward = {
			{10000000, {2,1,30786,3}, "Bao l� x� may m緉"},
			{6000000, {2,1,30786,1}, "Bao l� x� may m緉"},
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
		gf_AddItemEx2(tAward[nTimes][2], tAward[nTimes][3], "M鮪g Xu﹏ 蕋 M飅", "B鉯 Qu� u N╩", 0, 1)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Number, 111);
	else
		if nTimes >= 5 then
			Talk(1,"",format("S� l莕 畂竛 s�  vt qu� <color=green>%d<color> l莕, <color=red>畂竛 s� th蕋 b筰<color>, ng祔 mai h穣 quay l筰! Con s� may m緉 c馻 b筺 l� <color=red>%d<color>.",5,nTarget));
			gf_ModifyExp(1000000);
			return 0;
		end
		if nNum > nTarget then
			Talk(1,"ws_guess_number_input",format("Ch� s� 畂竛 l莕 %d c馻 c竎 h� l�<color=red>%d<color>, qu� l韓 r錳, h穣 畂竛 s� nh� h琻 t�.",nTimes,nNum));
		else
			Talk(1,"ws_guess_number_input",format("Ch� s� 畂竛 l莕 %d c馻 c竎 h� l�<color=red>%d<color>, qu� nh� r錳, h穣 畂竛 s� l韓 h琻 t�.",nTimes,nNum));
		end
	end
end

function ws_guess()
	ws_daily_reset();
	local tSay = {
		"B総 u ch琲/ws_guess_finger",
		"T筰 h� ch� xem qua th玦/nothing",
	}
	Say("<color=green>L﹏ S�:<color> N╩ m韎 t誸 n ngi c� mu鑞 c飊g ta l祄 v礽 v竛 may m緉 kh玭g, c莕 10 ti襫 l� l� c� th� tham gia v韎 ta.", getn(tSay), tSay);
end

function ws_guess_finger()
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.GetAward) ~= 0 then
		Talk(1,"","H玬 nay  tham gia r錳, ng祔 mai h穣 quay l筰!")
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
		{4000000, {2,1,30784,1}, "M﹎ Ng� Qu�"},
		{6000000, {2,1,30786,1}, "Bao l� x� may m緉"},
		{10000000, {2,1,30786,3}, "Bao l� x� may m緉"},
	}
	
	if GetItemCount(2,1,30778) < 10 then
		Talk(1,"",format("Trong h祅h trang %s s� lng kh玭g  %d", "Ti襫 L�", 10))
		return 0;
	end
	if DelItem(2,1,30778,10) ~= 1 then
		return 0;
	end
	
	if nTimes >= 0 and nTimes < getn(tAward) then
		tinsert(tSay, format("Ra B骯/#ws_guess_finger_jugde(1)"))
		tinsert(tSay, format("Ra K衞/#ws_guess_finger_jugde(2)"))
		tinsert(tSay, format("Ra Bao/#ws_guess_finger_jugde(3)"))
	end
	if nTimes > 0 and nTimes <= getn(tAward) then
		msg = msg..format("\nPh莕 thng t輈h l騳 hi謓 t筰 %d EXP, %s*%d", tAward[nTimes][1], tAward[nTimes][3], tAward[nTimes][2][4]);
		tinsert(tSay, "\nTa kh玭g mu鑞 ch琲 n鱝! Nh薾 thng/ws_guess_finger_getaward");
	end
	tinsert(tSay, "T筰 h� ch� xem qua th玦/nothing");
	Say("H穣 ch鋘 c竎h o糿 t� t�:"..msg, getn(tSay), tSay);
end

function ws_guess_finger2()
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.GetAward) ~= 0 then
		Talk(1,"","H玬 nay  tham gia r錳, ng祔 mai h穣 quay l筰!")
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
		{4000000, {2,1,30784,1}, "M﹎ Ng� Qu�"},
		{6000000, {2,1,30786,1}, "Bao l� x� may m緉"},
		{10000000, {2,1,30786,3}, "Bao l� x� may m緉"},
	}

	if nTimes >= 0 and nTimes < getn(tAward) then
		tinsert(tSay, format("Ra B骯/#ws_guess_finger_jugde(1)"))
		tinsert(tSay, format("Ra K衞/#ws_guess_finger_jugde(2)"))
		tinsert(tSay, format("Ra Bao/#ws_guess_finger_jugde(3)"))
	end
	if nTimes > 0 and nTimes <= getn(tAward) then
		msg = msg..format("\nPh莕 thng t輈h l騳 hi謓 t筰 %d EXP, %s*%d", tAward[nTimes][1], tAward[nTimes][3], tAward[nTimes][2][4]);
		tinsert(tSay, "\nTa kh玭g mu鑞 ch琲 n鱝! Nh薾 thng/ws_guess_finger_getaward");
	end
	tinsert(tSay, "T筰 h� ch� xem qua th玦/nothing");
	Say("H穣 ch鋘 c竎h o糿 t� t�:"..msg, getn(tSay), tSay);
end

function ws_guess_finger_jugde(nValue)

	local tListCmp = {
		--{玩家输，玩家赢}
		[1] = {3, 2},
		[2] = {1, 3},
		[3] = {1, 2},
	}
	local nSysValue = mod(random(1, 99), 3) + 1;
	if nSysValue == tonumber(nValue) then
		Talk(1,"ws_guess_finger2","B筺 v� L﹏ S� h遖 nhau!");
	elseif nSysValue == tListCmp[tonumber(nValue)][1] then
		if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes) > 0 then
			WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTimes, WS_TASK_GROUP:GetTask(WS_TASK_GROUP.IbTimes) + 1)
			Talk(1,"ws_guess_finger_ib","B筺 <color=red>thua<color> r錳, L﹏ S� gi祅h chi課 th緉g!");
		else
			Talk(1,"nothing","B筺 <color=red>thua<color> r錳, L﹏ S� gi祅h chi課 th緉g!");
		end
	elseif nSysValue == tListCmp[tonumber(nValue)][2] then 
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.SuccTimes, WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes) + 1)
		Talk(1,"ws_guess_finger2","B筺 <color=green>th緉g<color> r錳, L﹏ S� th蕋 b筰!");
	end
end

function ws_guess_finger_ib()
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes);
	local tAward = {
		{600000, {2,1,30783,1}, "Sung"},
		{1000000, {2,1,30783,2}, "Sung"},
		{2000000, {2,1,30783,3}, "Sung"},
		{4000000, {2,1,30784,1}, "M﹎ Ng� Qu�"},
		{6000000, {2,1,30786,1}, "Bao l� x� may m緉"},
		{10000000, {2,1,30786,3}, "Bao l� x� may m緉"},
	}
	local msg = format("\nPh莕 thng t輈h l騳 hi謓 t筰 %d EXP, %s*%d", tAward[nTimes][1], tAward[nTimes][3], tAward[nTimes][2][4])
	local nIbTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.IbTimes);
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTag, 1);
	local tCost = {2, 4, 8, 16, 32};
	local tSay = {}
	if nIbTimes > 0 and nIbTimes <= getn(tCost) then
		tinsert(tSay, format("\nTi猽 hao %d Ti襫 L�, ch髇g ta ti誴 t鬰 n祇/#ws_guess_finger_ib_ensure(%d)", tCost[nIbTimes], tCost[nIbTimes]))
	end
	tinsert(tSay, "\nTa kh玭g mu鑞 ch琲 n鱝! Nh薾 thng/ws_guess_finger_getaward");	
	tinsert(tSay, "T筰 h� ch� xem qua th玦/nothing");
	Say(msg, getn(tSay), tSay);
end

function ws_guess_finger_ib_ensure(nCost)
	if DelItem(2,1,30778,nCost) == 1 then
		Msg2Player(format("B筺  ti猽 hao %d %s", nCost, "Ti襫 L�"));
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTag, 0);
		ws_guess_finger2();
	else
		Talk(1,"nothing","Trong t骾 kh玭g c� Ti襫 L�!");
	end
end

function ws_guess_finger_getaward()
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes);
	local tAward = {
		{600000, {2,1,30783,1}, "Sung"},
		{1000000, {2,1,30783,2}, "Sung"},
		{2000000, {2,1,30783,3}, "Sung"},
		{4000000, {2,1,30784,1}, "M﹎ Ng� Qu�"},
		{6000000, {2,1,30786,1}, "Bao l� x� may m緉"},
		{10000000, {2,1,30786,3}, "Bao l� x� may m緉"},
	}
	if nTimes <= 0 or nTimes > getn(tAward) then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	gf_ModifyExp(tAward[nTimes][1]);
	gf_AddItemEx2(tAward[nTimes][2], tAward[nTimes][3], "M鮪g Xu﹏ 蕋 M飅", "May M緉 u N╩", 0, 1);
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