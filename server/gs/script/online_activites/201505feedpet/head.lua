--ÏÄÈÕÑµ³è»î¶¯
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\activity_head.lua")

g_debug = 0
g_tFeedPet = {
	nStartDate=20150515,
	nEndDate=20250531,
	g_this_file = "\\script\\online_activites\\201505feedpet\\head.lua",
	nActivityID = 158,
	--tbKillNpcDaily.tbOpenDate = {2015032300, 2015050100}£¬ÔÚ\script\online_activites\online_activites.txtÓÐÅäÖÃ
	TASK_GROUP = TaskManager:Create(2, 21),
	--tbTaskGroupId = {2, 20},
	tKillNpc = {
		[115] = {--ÍõÄ¸¶´¶þ²ã
			["T¶n Tiªn Tö"] = 1,
			["CÇm Tiªn Tö"] = 1,
		},
		[116] = {--ÍõÄ¸¶´Èý²ã
			["§Þch tiªn Tö"] = 1,
			["KiÕm tiªn Tö"] = 1,
		},
		[506] = {--É³Ä®ÃÔ¹¬
			["Sa M¹c Hµnh Nh©n"] = 1,
			["TÇm B¶o Nh©n"] = 1,
		},
	},
	
	nMaxUseFuDaiOneDay = 100,--Ã¿ÈÕÊ¹ÓÃ¸£´üÉÏÏÞ
	nMaxUseDrinkOneDay = 10,--Ã¿ÈÕÊ¹ÓÃÆÏÌÑ¾ÆÉÏÏÞ
	nMaxGetExpOneDay = 60,--Ã¿ÈÕ»ñµÃ¾­Ñé´ÎÊý
	nMaxFeedPetOneDay = 5,--ÁìÈ¡ÑµÁ·½±Àø´ÎÊý
	nFeedTargetPoint = 46,--Íê³ÉÈÎÎñµÄÑµÁ·µã
	nMaxInitPetPoint = 6,--³õÊ¼ÑµÁ·¶ÈµÄ×î´óËæ»úÖµ
	
	nTaskIdx_FuDaiCount=1,--½ñÈÕÊ¹ÓÃ¸£´ü´ÎÊý
	nTaskIdx_NormalFeed=2,--ÆÕÍ¨ÑµÁ·£ºµ±Ç°ÑµÁ·µãÊý£¬½ñÈÕÁìÈ¡ÑµÁ·½±Àø´ÎÊý
	nTaskIdx_IBFeed=3,--IBÑµÁ·£ºµ±Ç°ÑµÁ·µãÊý£¬½ñÈÕÁìÈ¡ÑµÁ·½±Àø´ÎÊý
	nTaskIdx_ExpGetCnt = 4,--¿É»ñµÃ¾­ÑéÊ£Óà´ÎÊý
	nTaskIdx_ExpGetMulti=5,--»ñµÃ¾­Ñé±¶Êý
	
	tFood = {--ÑµÁ·³èÎïµÄµÀ¾ß
		{1, "ThÞt C¸ T­¬i", {2,1,30837,1}, "C¸ ®Ó cho thó c­ng ¨n", "§é c­êng tr¸ng +2"},
    	{2, "§ïi Heo Th¬m Ngon", {2,1,30838,1}, "ThÞt ®Ó cho thó c­ng ¨n", "§é c­êng tr¸ng +3"},
    	{3, "Tó CÇu", {2,1,30839,1}, "§å ch¬i cña thó c­ng", "§é c­êng tr¸ng x2"},
    	{4, "Thøc ¡n HÕt H¹n", {2,1,30840,1}, "Thøc ¨n cña thó c­ng nh­ng ®· hÕt h¹n", "§é c­êng tr¸ng -50%"},
    	{5, "Tiªn Qu¶", {2,1,30842,1}, "Cho thó c­ng sö dông Tiªn Qu¶", "Hoµn thµnh huÊn luyÖn"},
	},
	tDrink = {"R­îu Nho", {2,1,30841,1}},
	tToolItem={
		{1, "Cßi Thó C­ng-Th­êng", {2,1,30836,1}},
		{2, "Cßi Thó C­ng-HiÕm", {2,1,30843,1}},
	},
	tJiuXi = {--¾ÆÏ¯NPCList
		{"hd_yanxi", "M©m cç", 200,1376,2894, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M©m cç", 200,1358,2842, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M©m cç", 200,1407,2863, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M©m cç", 100,1452,2953, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M©m cç", 100,1408,2950, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M©m cç", 100,1408,2997, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M©m cç", 300,1789,3547, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M©m cç", 300,1772,3560, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
		{"hd_yanxi", "M©m cç", 300,1758,3584, "\\script\\online_activites\\201505feedpet\\npc\\npc_jiuxi.lua"},
	},
	tMainAward = {
		[1] = {
			tAll = {
    			{38,5,1},--¾«Á¦
    			{1,"R­îu Nho",{2,1,30841,1,4},0,1},
			},
			tRand = {
				{1, 50, "Thiªn Kiªu LÖnh", {2, 97, 236, 1, 4}, 0},
				{1, 300, "CÊp 3 TÈy T©m Th¹ch", {2, 1, 30523, 1, 4}, 0},
				{1, 300, "CÊp 3 LuyÖn L« ThiÕt", {2, 1, 30529, 1, 4}, 0},
				{1, 300, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 1, 4}, 0},
				{1, 200, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 2, 4}, 0},
				{1, 10, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 5, 4}, 0, 0, 0, 1},
				{1, 600, "M¶nh Thiªn Cang", {2, 1, 30390, 5, 4}, 0},
				{1, 600, "M¶nh Thiªn M«n", {2, 1, 30410, 5, 4}, 0},
				{1, 800, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 1, 4}, 0},
				{1, 300, "ThiÕt Tinh cÊp 2", {2, 1, 30534, 1, 4}, 0},
				{3,1000,10000},--gold
				{3,500,50000},--gold
				{2,1300,2000000},--exp
				{2,700,2500000},--exp
				{2,330,3000000},--exp
				{1, 200, "§¹i Nh©n s©m", {2, 0, 553, 1, 4}, 0},
                {1, 100, "VÐ TiÕu Y B¹c", {2, 1, 30492, 1, 4}, 0},
                {1, 200, "VÐ TiÕu Y §ång", {2, 1, 30493, 4, 4}, 0},
                {1, 200, "C©y B¸t Nh· nhá", {2, 0, 504, 2, 4}, 0},
                {1, 100, "C©y B¸t Nh·", {2, 0, 398, 1, 4}, 0},
                {1, 10, "C©y Tø Linh", {2, 1, 30269, 1, 4}, 0},
                {1, 500, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1, 4}, 0},
                {27,1000,100},--ÐÞÎª
                {27,300,500},--ÐÞÎª
                {27,100,1000},--ÐÞÎª
        	},
		},
		[2] = {
			tAll = {
				{38,5,1},--¾«Á¦
    			{1,"R­îu Nho",{2,1,30841,1,4},0,1},
			},
			tRand = {
				{1, 100, "Thiªn Kiªu LÖnh", {2, 97, 236, 2, 4}, 0},
				{1, 10, "Thiªn Kiªu LÖnh", {2, 97, 236, 6, 4}, 0},
				{1, 200, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 2, 4}, 0},
				{1, 50, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 6, 4}, 0},
				{1, 10, "Thiªn Cang LÖnh", {2, 95, 204, 1, 4}, 0, 0, 0,  1},
				{1, 30, "Thiªn M«n Kim LÖnh", {2, 1, 30370, 2, 4}, 0, 0, 0,  1},
				{1, 100, "Th¸i NhÊt LÖnh",{2,1,30687,2,4},0, 1},
				{1, 200, "ThiÕt Tinh cÊp 3", {2, 1, 30535, 2, 4}, 0},
				{1, 300, "VÐ TiÕu Y B¹c", {2, 1, 30492, 2, 4}, 0},
				{1, 100, "VÐ TiÕu Y Vµng", {2, 1, 30491, 1, 4}, 0},
				{3,2000,100000},--gold
				{3,1000,200000},--gold
				{3,500,500000},--gold
				{3,100,1000000},--gold
				{2,2000,2000000},--exp
				{2,1000,4000000},--exp
				{2,750,6000000},--exp
				{2,500,8000000},--exp
				{2,100,10000000, 0, 0, 0, 1},--exp
				{1, 100, "CÊp 3 TÈy T©m Th¹ch", {2, 1, 30523, 2,4}, 0},
				{1, 100, "TÈy T©m Th¹ch cÊp 4", {2, 1, 30524, 1,4}, 0},
				{1, 300, "Ma §ao Th¹ch cÊp 3", {2, 1, 30430, 1,4}, 0},
				{1, 200, "Ma §ao Th¹ch cÊp 3", {2, 1, 30430, 3,4}, 0},
				{1, 50, "Ma §ao Th¹ch cÊp 3", {2, 1, 30430, 5,4}, 0, 0, 0, 1},
				{1, 100, "CÊp 3 LuyÖn L« ThiÕt", {2, 1, 30529, 2,4}, 0},
				{1, 100, "LuyÖn L« ThiÕt cÊp 4", {2, 1, 30530, 1,4}, 0},
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

--»î¶¯µÄÐ¡¸ú°à´¦Àí
function rand_follower()
	if GetFollower()>0 then
		Talk(1,"","§· cã 1 thó c­ng råi")
		return
	end
	local nRand = random(1,100)
	local szName,szTemp = "",""
	if nRand <= 30 then
		szName,szTemp = "Heo B«ng", "hd_xiaohuazhu"
	elseif nRand <= 65 then
		szName,szTemp = "Dª Vµng", "hd_xiaohuangyang"
	else
		szName,szTemp = "GÊu X¸m", "hd_xiaohuixiong"
	end
	SummonNpc(szTemp, szName)
end

function remove_follower()
	local nNpcIdx = GetFollower()
	if nNpcIdx > 0 then
		local szName = GetNpcName(nNpcIdx)
		if szName=="Heo B«ng" or szName=="Dª Vµng" or szName=="GÊu X¸m" then
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
		Talk(1,"","CÊp 80 trë lªn, ®· gia nhËp l­u ph¸i vµ häc 1 bé kü n¨ng cÊp 55 míi ®­îc tham gia ho¹t ®éng.")
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
	if 0 == val then--Ëæ»úÒ»ÏÂ³õÊ¼Öµ
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
		nNew = max(floor(nCur/2), 1)--×îÐ¡ÊÇ1
	elseif nType==5 then
		nNew = g_tFeedPet.nFeedTargetPoint
	end
	if nCur >= g_tFeedPet.nFeedTargetPoint*2 and nNew > nCur then--Ì«´óÁË
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

