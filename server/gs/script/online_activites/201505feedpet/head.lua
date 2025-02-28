--夏日训宠活动
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\activity_head.lua")

g_debug = 0
g_tFeedPet = {
	nStartDate=20150515,
	nEndDate=20250531,
	g_this_file = "\\script\\online_activites\\201505feedpet\\head.lua",
	nActivityID = 158,
	--tbKillNpcDaily.tbOpenDate = {2015032300, 2015050100}，在\script\online_activites\online_activites.txt有配置
	TASK_GROUP = TaskManager:Create(2, 21),
	--tbTaskGroupId = {2, 20},
	tKillNpc = {
		[115] = {--王母洞二层
			["T秐 Ti猲 T�"] = 1,
			["C莔 Ti猲 T�"] = 1,
		},
		[116] = {--王母洞三层
			["мch ti猲 T�"] = 1,
			["Ki誱 ti猲 T�"] = 1,
		},
		[506] = {--沙漠迷宫
			["Sa M筩 H祅h Nh﹏"] = 1,
			["T莔 B秓 Nh﹏"] = 1,
		},
	},
	
	nMaxUseFuDaiOneDay = 100,--每日使用福袋上限
	nMaxUseDrinkOneDay = 10,--每日使用葡萄酒上限
	nMaxGetExpOneDay = 60,--每日获得经验次数
	nMaxFeedPetOneDay = 5,--领取训练奖励次数
	nFeedTargetPoint = 46,--完成任务的训练点
	nMaxInitPetPoint = 6,--初始训练度的最大随机值
	
	nTaskIdx_FuDaiCount=1,--今日使用福袋次数
	nTaskIdx_NormalFeed=2,--普通训练：当前训练点数，今日领取训练奖励次数
	nTaskIdx_IBFeed=3,--IB训练：当前训练点数，今日领取训练奖励次数
	nTaskIdx_ExpGetCnt = 4,--可获得经验剩余次数
	nTaskIdx_ExpGetMulti=5,--获得经验倍数
	
	tFood = {--训练宠物的道具
		{1, "Th辴 C� Ti", {2,1,30837,1}, "C�  cho th� c璶g ╪", "ч cng tr竛g +2"},
    	{2, "эi Heo Th琺 Ngon", {2,1,30838,1}, "Th辴  cho th� c璶g ╪", "ч cng tr竛g +3"},
    	{3, "T� C莡", {2,1,30839,1}, "у ch琲 c馻 th� c璶g", "ч cng tr竛g x2"},
    	{4, "Th鴆  H誸 H筺", {2,1,30840,1}, "Th鴆 ╪ c馻 th� c璶g nh璶g  h誸 h筺", "ч cng tr竛g -50%"},
    	{5, "Ti猲 Qu�", {2,1,30842,1}, "Cho th� c璶g s� d鬾g Ti猲 Qu�", "Ho祅 th祅h hu蕁 luy謓"},
	},
	tDrink = {"Ru Nho", {2,1,30841,1}},
	tToolItem={
		{1, "C遡 Th� C璶g-Thng", {2,1,30836,1}},
		{2, "C遡 Th� C璶g-Hi誱", {2,1,30843,1}},
	},
	tJiuXi = {--酒席NPCList
		{"hd_yanxi", "M﹎ c�", 200,1376,2894, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M﹎ c�", 200,1358,2842, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M﹎ c�", 200,1407,2863, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M﹎ c�", 100,1452,2953, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M﹎ c�", 100,1408,2950, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M﹎ c�", 100,1408,2997, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M﹎ c�", 300,1789,3547, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M﹎ c�", 300,1772,3560, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M﹎ c�", 300,1758,3584, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
	},
	tMainAward = {
		[1] = {
			tAll = {
    			{38,5,1},--精力
    			{1,"Ru Nho",{2,1,30841,1,4},0,1},
			},
			tRand = {
				{1, 50, "Thi猲 Ki猽 L謓h", {2, 97, 236, 1, 4}, 0},
				{1, 300, "C蕄 3 T葃 T﹎ Th筩h", {2, 1, 30523, 1, 4}, 0},
				{1, 300, "C蕄 3 Luy謓 L� Thi誸", {2, 1, 30529, 1, 4}, 0},
				{1, 300, "Hu﹏ chng anh h飊g", {2, 1, 30499, 1, 4}, 0},
				{1, 200, "Hu﹏ chng anh h飊g", {2, 1, 30499, 2, 4}, 0},
				{1, 10, "Hu﹏ chng anh h飊g", {2, 1, 30499, 5, 4}, 0, 0, 0, 1},
				{1, 600, "M秐h Thi猲 Cang", {2, 1, 30390, 5, 4}, 0},
				{1, 600, "M秐h Thi猲 M玭", {2, 1, 30410, 5, 4}, 0},
				{1, 800, "Thi誸 Tinh c蕄 1", {2, 1, 30533, 1, 4}, 0},
				{1, 300, "Thi誸 Tinh c蕄 2", {2, 1, 30534, 1, 4}, 0},
				{3,1000,10000},--gold
				{3,500,50000},--gold
				{2,1300,2000000},--exp
				{2,700,2500000},--exp
				{2,330,3000000},--exp
				{1, 200, "Чi Nh﹏ s﹎", {2, 0, 553, 1, 4}, 0},
                {1, 100, "V� Ti誹 Y B筩", {2, 1, 30492, 1, 4}, 0},
                {1, 200, "V� Ti誹 Y уng", {2, 1, 30493, 4, 4}, 0},
                {1, 200, "C﹜ B竧 Nh� nh�", {2, 0, 504, 2, 4}, 0},
                {1, 100, "C﹜ B竧 Nh�", {2, 0, 398, 1, 4}, 0},
                {1, 10, "C﹜ T� Linh", {2, 1, 30269, 1, 4}, 0},
                {1, 500, "Ti觰 Nh﹏ s﹎ qu�", {2, 0, 552, 1, 4}, 0},
                {27,1000,100},--修为
                {27,300,500},--修为
                {27,100,1000},--修为
        	},
		},
		[2] = {
			tAll = {
				{38,5,1},--精力
    			{1,"Ru Nho",{2,1,30841,1,4},0,1},
			},
			tRand = {
				{1, 100, "Thi猲 Ki猽 L謓h", {2, 97, 236, 2, 4}, 0},
				{1, 10, "Thi猲 Ki猽 L謓h", {2, 97, 236, 6, 4}, 0},
				{1, 200, "Hu﹏ chng anh h飊g", {2, 1, 30499, 2, 4}, 0},
				{1, 50, "Hu﹏ chng anh h飊g", {2, 1, 30499, 6, 4}, 0},
				{1, 10, "Thi猲 Cang L謓h", {2, 95, 204, 1, 4}, 0, 0, 0,  1},
				{1, 30, "Thi猲 M玭 Kim L謓h", {2, 1, 30370, 2, 4}, 0, 0, 0,  1},
				{1, 100, "Th竔 Nh蕋 L謓h",{2,1,30687,2,4},0, 1},
				{1, 200, "Thi誸 Tinh c蕄 3", {2, 1, 30535, 2, 4}, 0},
				{1, 300, "V� Ti誹 Y B筩", {2, 1, 30492, 2, 4}, 0},
				{1, 100, "V� Ti誹 Y V祅g", {2, 1, 30491, 1, 4}, 0},
				{3,2000,100000},--gold
				{3,1000,200000},--gold
				{3,500,500000},--gold
				{3,100,1000000},--gold
				{2,2000,2000000},--exp
				{2,1000,4000000},--exp
				{2,750,6000000},--exp
				{2,500,8000000},--exp
				{2,100,10000000, 0, 0, 0, 1},--exp
				{1, 100, "C蕄 3 T葃 T﹎ Th筩h", {2, 1, 30523, 2,4}, 0},
				{1, 100, "T葃 T﹎ Th筩h c蕄 4", {2, 1, 30524, 1,4}, 0},
				{1, 300, "Ma o Th筩h c蕄 3", {2, 1, 30430, 1,4}, 0},
				{1, 200, "Ma o Th筩h c蕄 3", {2, 1, 30430, 3,4}, 0},
				{1, 50, "Ma o Th筩h c蕄 3", {2, 1, 30430, 5,4}, 0, 0, 0, 1},
				{1, 100, "C蕄 3 Luy謓 L� Thi誸", {2, 1, 30529, 2,4}, 0},
				{1, 100, "Luy謓 L� Thi誸 c蕄 4", {2, 1, 30530, 1,4}, 0},
			},
		},
	},
}

function get_task(nIndex)
	local TASK_GROUP = g_tFeedPet.TASK_GROUP
	return TASK_GROUP:GetTask(nIndex)
end

function set_task(nIndex,nValue)
	local TASK_GROUP = g_tFeedPet.TASK_GROUP
	return TASK_GROUP:SetTask(nIndex,nValue)
end

--活动的小跟班处理
function rand_follower()
	if GetFollower()>0 then
		Talk(1,"","Х c� 1 th� c璶g r錳")
		return
	end
	local nRand = random(1,100)
	local szName,szTemp = "",""
	if nRand <= 30 then
		szName,szTemp = "Heo B玭g", "hd_xiaohuazhu"
	elseif nRand <= 65 then
		szName,szTemp = "D� V祅g", "hd_xiaohuangyang"
	else
		szName,szTemp = "G蕌 X竚", "hd_xiaohuixiong"
	end
	SummonNpc(szTemp, szName)
end

function remove_follower()
	local nNpcIdx = GetFollower()
	if nNpcIdx > 0 then
		local szName = GetNpcName(nNpcIdx)
		if szName=="Heo B玭g" or szName=="D� V祅g" or szName=="G蕌 X竚" then
			KillFollower()
		end
	end
end

function is_in_activity_date()
	if g_debug==1 then
		return 1
	end
	local today = tonumber(date("%Y%m%d"));
	if today >= g_tFeedPet.nStartDate and today <= g_tFeedPet.nEndDate then
		return 1
	end
	return 0
end

function check_player_condition()
	if is_in_activity_date() ~= 1 then
		return 0
	end
	if get_trans_level() < 80 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","C蕄 80 tr� l猲,  gia nh藀 l璾 ph竔 v� h鋍 1 b� k� n╪g c蕄 55 m韎 頲 tham gia ho箃 ng.")
		return 0;
	end
	return 1
end

function get_trans_level()
	return gf_GetPlayerRebornCount()*100+GetLevel()
end

function get_cur_point(nLevel)
	local t = {g_tFeedPet.nTaskIdx_NormalFeed, g_tFeedPet.nTaskIdx_IBFeed}
	local nTaskIdx = t[nLevel]
	local nTaskVal = get_task(nTaskIdx)
	local nByte = 1
	local val = SafeGetByte(nTaskVal, nByte)
	if 0 == val then--随机一下初始值
		local nMax = g_tFeedPet.nMaxInitPetPoint
		val = random(1,nMax)
		set_cur_point(nLevel, val)
	end
	return val
end

function set_cur_point(nLevel,nValue)
	local t = {g_tFeedPet.nTaskIdx_NormalFeed, g_tFeedPet.nTaskIdx_IBFeed}
	local nTaskIdx = t[nLevel]
	local nTaskVal = get_task(nTaskIdx)
	local nByte = 1
	local val = SafeSetByte(nTaskVal, nByte,nValue)
	return set_task(nTaskIdx, val)
end

function get_next_point(nLevel, nType)
	local nCur = get_cur_point(nLevel)
	local nNew = nCur
	if nType == 1 then
		nNew = nCur + 2
	elseif nType==2 then
		nNew = nCur + 3
	elseif nType==3 then
		nNew = nCur * 2
	elseif nType==4 then
		nNew = max(floor(nCur/2), 1)--最小是1
	elseif nType==5 then
		nNew = g_tFeedPet.nFeedTargetPoint
	end
	if nCur >= g_tFeedPet.nFeedTargetPoint*2 and nNew > nCur then--太大了
		nNew = nCur
	end
	return nNew
end

function get_award_count(nLevel)
	local t = {g_tFeedPet.nTaskIdx_NormalFeed, g_tFeedPet.nTaskIdx_IBFeed}
	local nTaskIdx = t[nLevel]
	local nTaskVal = get_task(nTaskIdx)
	local nByte = 2
	local val = SafeGetByte(nTaskVal, nByte)
	return val
end

function set_award_count(nLevel,nValue)
	local t = {g_tFeedPet.nTaskIdx_NormalFeed, g_tFeedPet.nTaskIdx_IBFeed}
	local nTaskIdx = t[nLevel]
	local nTaskVal = get_task(nTaskIdx)
	local nByte = 2
	local val = SafeSetByte(nTaskVal, nByte, nValue)
	return set_task(nTaskIdx, val)
end

