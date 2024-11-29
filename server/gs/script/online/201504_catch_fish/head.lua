--∫£œ …Ã»ÀªÓ∂Ø
Include("\\script\\lib\\globalfunctions.lua")

g_debug = 0
g_tCatchFish = {
	tBombs={
		--name exp point item
		{"Ph∏o Nh·", {2,1,30817}, 10000, 1, 
			{
				{1,85, "C∏ Ngı", {2,1,30818,1},0},
				{1,14, "T´m Bi”n", {2,1,30819,1},0},
				{1,1, "Cua Bi”n", {2,1,30820,1},0},
			},
		},
		{"Ph∏o Hoa Chi’n Thæng",  {2,1,30809},30000, 2,
			{
				{1,50, "C∏ Ngı", {2,1,30818,1},0},
				{1,40, "T´m Bi”n", {2,1,30819,1},0},
				{1,10, "Cua Bi”n", {2,1,30820,1},0},
			},
		},
		{"Ph∏o Hoa Huy Hoµng",  {2,1,30810}, 30000, 2,
			{
				{1,50, "C∏ Ngı", {2,1,30818,1},0},
				{1,40, "T´m Bi”n", {2,1,30819,1},0},
				{1,10, "Cua Bi”n", {2,1,30820,1},0},
			},
		},
		{"Ph∏o Hoa Vinh D˘",  {2,1,30811}, 50000, 3,
			{
				{1,45, "C∏ Ngı", {2,1,30818,1},0},
				{1,40, "T´m Bi”n", {2,1,30819,1},0},
				{1,15, "Cua Bi”n", {2,1,30820,1},0},
			},
		},
	},
	tCombine = {
		tItem = {"Ph∏o Nh·", 2,1,30817, 1},
		tRequite = {
			{"Ngﬂi Ph∏o", 2,1,30806, 10},
			{"Ëng Ph„ng", 2,1,30807, 10},
			{"ThuËc NÊ", 2,1,30808, 10},
			{"ß∏ lˆa", 2,1,30816, 10},
		},
	},
	tBoss = {
		--min,max,delta,num,template,name, time
		{1000, 30000, 500, 8, "HX_yecha", "H∂i Dπ Xoa", 5*60*18},
		{5000, 30000, 1000, 2, "HX_sheyao", "Xµ Y™u ß∏y Bi”n", 10*60*18},
		{20000, 30000, 2000, 1, "HX_guichengxiang", "Quy Thıa T≠Ìng", 20*60*18},
		{30000, 30000, 30000, 1, "", "", 30*60*18},
	},
	tBossPos = {
		{103,1829,3398},
        {103,1827,3420},
        {103,1838,3440},
        {103,1857,3420},
        {103,1855,3391},
        {103,1840,3376},
        {103,1843,3398},
        {103,1838,3419},
	},
	nStartDate=20150417,
	nEndDate=20150430,
	nMaxServerCounter=30000,
	szBoss="",
	g_this_file = "\\script\\online\\201504_catch_fish\\head.lua",
	nServerPoint=0,
	nServerPointDate=tonumber(date("%Y%m%d")),
}

function _set_boss(szBoss)
	if g_debug==1 then
		print("_set_boss", szBoss)
	end
	g_tCatchFish.szBoss = szBoss
end

function set_boss(szBoss)
	_set_boss(szBoss)
	SendScript2VM("\\script\\online\\201504_catch_fish\\npc\\npc_fisher.lua", format("_set_boss(\"%s\")", szBoss))
end

function get_boss_pos()
	local t = g_tCatchFish.tBossPos
	local n = random(1,getn(t))
	return t[n]
end

function get_boss(tConfig)
	if tConfig[5] == "" then
    	if random(1,100)<=95 then
    		return "HX_longtiazi", "Long Th∏i Tˆ"
    	else
    		return "HX_Zlongtiazi", "Ch©n Long Th∏i Tˆ"
    	end
    else
    	return tConfig[5],tConfig[6]
    end
end

function get_boss_desc()
	local nCount = get_server_counter()
end

function apply_server_counter()
	if is_in_activity_date()~=1 then
		return
	end
	if g_debug==1 then
		print("apply_server_counter _catch_fish_201504")
	end
	ApplyRelayShareData("_catch_fish_201504",0,0,g_tCatchFish.g_this_file,"_apply_server_counter_cb")
end

function _apply_server_counter_cb(szKey, nKey1, nKey2, nCount)
	local nNum, nDate = GetRelayShareDataByKey("_catch_fish_201504", nKey1, nKey2, "server_point");
	if g_debug==1 then
		print("_apply_server_counter_cb",szKey, nKey1, nKey2, nCount, nNum, nDate)
	end
	local today = tonumber(date("%Y%m%d"));
	DelRelayShareDataCopy("_catch_fish_201504",nKey1,nKey2);
	if nDate and (nDate < g_tCatchFish.nStartDate-1 or nDate>g_tCatchFish.nEndDate) then
		--ClearRelayShareData("_catch_fish_201504", 0, 0, g_tCatchFish.g_this_file, "nothing");
		g_tCatchFish.nServerPointDate = today - 1
		set_server_counter(0)--÷ÿ÷√ ˝æ›ø‚
		if g_debug==1 then
			print("ClearRelayShareData _catch_fish_201504", nNum, nDate)
		end
		return
	elseif (not nNum) or (not nDate) then
		if g_debug==1 then
			print("AddRelayShareData _catch_fish_201504",g_tCatchFish.nServerPoint, g_tCatchFish.nServerPointDate-1)
		end
		--–¬‘ˆµƒ ˝æ›»’∆⁄∂ºº«Œ™«∞“ªÃÏ£¨∑¿÷πΩÒÃÏÀ¢–¬”–Œ Ã‚
		g_tCatchFish.nServerPointDate = today - 1
		AddRelayShareData("_catch_fish_201504",0,0,"","",0,"server_point","dd", g_tCatchFish.nServerPoint, g_tCatchFish.nServerPointDate)
	else
		set_server_counter(nNum, nDate)
	end
end

function get_server_counter()
	return g_tCatchFish.nServerPoint
end
function set_server_counter(nValue,nDate)
	if g_debug==1 then
		print("set_server_counter",nValue,nDate)
	end
	if not nDate then--√ª”–dateæÕ“™–ﬁ∏ƒrelay
		if g_debug==1 then
			print("ModifyRelayShareData",nValue, g_tCatchFish.nServerPointDate)
		end
		AddRelayShareData("_catch_fish_201504",0,0,"","",0,"server_point","dd", nValue, g_tCatchFish.nServerPointDate)
	else
		g_tCatchFish.nServerPointDate=nDate
	end
	_set_server_counter(nValue)
	SendScript2VM("\\script\\online\\201504_catch_fish\\npc\\npc_fisher.lua", format("_set_server_counter(%d)", nValue))
end
function _set_server_counter(nValue)
	nValue=tonumber(nValue)
	g_tCatchFish.nServerPoint=nValue
end

function add_server_counter(nValue)
	nValue=tonumber(nValue)
	if g_debug==1 then
		print("add_server_counter",nValue)
	end
	SendScript2VM(g_tCatchFish.g_this_file, format("_add_server_counter(%d)", nValue))
end

function _add_server_counter(nValue)
	nValue=tonumber(nValue)
	local nOld = get_server_counter()
	local nNew = nOld + nValue
	local t = g_tCatchFish.tBoss
	local szBoss = ""
	local today = tonumber(date("%Y%m%d"));
	if g_debug==1 then
		print("_add_server_counter",nValue, today)
	end
	for i=1,getn(t) do
		local tt = t[i]
		if nNew >= tt[1] then
			local o = floor(nOld/tt[3])
			local n = floor(nNew/tt[3])
			if n > o then
				if tt[5] ~= "" or g_tCatchFish.nServerPointDate~=today then
					local szTemplat,szName = get_boss(tt)
					szBoss = format("%s %s",szBoss, szName)
					for j=1,tt[4] do
    					local tPos = get_boss_pos()
    					local npc = CreateNpc(szTemplat,szName, tPos[1], tPos[2], tPos[3]);
    					SetNpcScript(npc, "");
    					SetNpcLifeTime(npc, tt[7])
					end
					if tt[5] == "" then
						local szMsg = format("G«n Æ©y do h∂i s∂n bﬁ Æ∏nh bæt qu∏ nhi“u, Long V≠¨ng nÊi giÀn n™n ph∏i Long Th∏i Tˆ dπy cho nh˜ng ng≠Íi Æ∏nh bæt mÈt bµi h‰c. Long Th∏i Tˆ xu t hi÷n Î ß´ng H∂i H∂i Binh 1.")
						AddGlobalNews(szMsg)
						if g_debug==1 then
							print("create npc finnal boss longtaizi")
						end
					end
				end
			end
		end
	end
	if szBoss ~= "" then
		set_boss(szBoss)
		local szMsg = format("Uy l˘c cÒa thÊ ph∏o nµy qu∏ mπnh, h◊nh nh≠ Æ∑ kinh ÆÈng %s d≠Ìi long cung", szBoss)
		Talk(1, "", szMsg)
	end
	if nNew >= g_tCatchFish.nMaxServerCounter then
		g_tCatchFish.nServerPointDate=today
		nNew = nNew - g_tCatchFish.nMaxServerCounter
	end
	set_server_counter(nNew)
end

function is_in_activity_date()
	if g_debug==1 then
		return 1
	end
	local today = tonumber(date("%Y%m%d"));
	if today >= g_tCatchFish.nStartDate and today <= g_tCatchFish.nEndDate then
		return 1
	end
	return 0
end

function check_player_condition()
	if is_in_activity_date() ~= 1 then
		return 0
	end
	if GetLevel() < 90 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","C p 90 trÎ l™n, Æ∑ gia nhÀp l≠u ph∏i vµ h‰c 1 bÈ k¸ n®ng c p 55 mÌi Æ≠Óc tham gia hoπt ÆÈng.")
		return 0;
	end
	return 1
end

--function get_trans_level()
--	return gf_GetPlayerRebornCount()*100+GetLevel()
--end


--apply_server_counter()--apply init data from relay

