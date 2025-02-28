-- 
-- 
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\offline_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")
Include("\\script\\tmp_task_id_def.lua")

MONSTER_FILE = new(KTabFile, "\\settings\\太虚幻境\\monster.txt")
FILE_ROW_COUNT = tonumber(MONSTER_FILE:getRow())
Include("\\script\\lib\\writelog.lua")

CHEAT_MODE = 1; -- cheat for 1 player -- Added 21/08/2020
TAIXU_TASK_TEMP_BEGIN = 100
TAIXU_MONSTER_TYPE = 100	-- 记录当前刷怪的类型
TAIXU_ZONE_INDEX = 101		-- 记录被传送到哪个空间里面
TAIXU_MAP_ID = 102			-- 记录太虚幻境的地图ID
TAIXU_TEAM_SIZE = 107		-- 记录进入时队伍的人数
TAIXU_RINGS_MAX = 103		-- 刷怪多少轮次
TAIXU_TEAM_INDEX = 108		-- 记录队员进入时是队伍的哪个位置
TAIXU_RINGS = 104			-- 杀怪的轮数
TAIXU_STEPS = 105			-- 时间触发器的计步器
TAIXU_STEP_CONTROL = 106	-- 控制刷怪的时间

TAIXU_TASK_TEMP_END = 108

TRIGGER_TIMER = 1011
TRIGGER_KILL = 1012
TRIGGER_RECT = 1013
TRIGGER_LOG = 1014

GROUP_OFFSET = 10

ONE_MONSTER_EXP = 2500
ONE_MONSTER_POPUR = 10

MAX_MONSTER_COUNT = 80		--最多刷多少怪物

RINGS_INTERVAL = 2		-- 刷怪间隔

TAIXU_TIME = 1782		--记录最近一次进入太虚幻境的时间

tMAP_ID =
{
	[200] = 2010,
	[300] = 1010,
	[100] = 3010,
}

-- 从太虚幻境传送回来的坐标
tPos = 
{
	[3010] = {100, 1379, 2858},
	[2010] = {200, 1151, 2850},
	[1010] = {300, 1975, 3552},
	[4010] = {300, 1111, 1111},
	[5010] = {300, 1111, 1111},
}

tName =
{
	"B╪g Thi猲 Tuy誸 мa",
	"Giang Nam Xu﹏ S綾",
	"Dung Nham мa Ng鬰",
	"H筺 H秈 Ho祅g Sa",
}

tNEW_WORLD =
{
	{1543, 3297},
	{1625, 3300},
	{1542, 3458},
	{1625, 3470},
}

tMonsterType = 
{
	[1] = {"Kinh nghi謒 Th�", "Kinh nghi謒 Ph鬾g ho祅g", "Kinh nghi謒 H醓 K� L﹏", "Kinh nghi謒 Th鵦 nh﹏ th秓", "Kinh nghi謒 B� T﹜ T筺g", "Kinh nghi謒 C莔 Ti猲 T�","Phi Thi猲3","У La Ni T╪g","тat B秓 Nh﹏"},
	[2] = {"Kinh nghi謒 Th�", "Kinh nghi謒 Ph鬾g ho祅g", "Kinh nghi謒 H醓 K� L﹏", "Kinh nghi謒 Th鵦 nh﹏ th秓", "Kinh nghi謒 B� T﹜ T筺g", "Kinh nghi謒 C莔 Ti猲 T�","Phi Thi猲3","У La Ni T╪g","тat B秓 Nh﹏"},
	[3] = {"Kinh nghi謒 Th�", "Kinh nghi謒 Ph鬾g ho祅g", "Kinh nghi謒 H醓 K� L﹏", "Kinh nghi謒 Th鵦 nh﹏ th秓", "Kinh nghi謒 B� T﹜ T筺g", "Kinh nghi謒 C莔 Ti猲 T�","Phi Thi猲3","У La Ni T╪g","тat B秓 Nh﹏"},
	[4] = {"Kinh nghi謒 Th�", "Kinh nghi謒 Ph鬾g ho祅g", "Kinh nghi謒 H醓 K� L﹏", "Kinh nghi謒 Th鵦 nh﹏ th秓", "Kinh nghi謒 B� T﹜ T筺g", "Kinh nghi謒 C莔 Ti猲 T�","Phi Thi猲3","У La Ni T╪g","тat B秓 Nh﹏"},
	
--	[2] = {"Luy謓 Th� t�", "Luy謓 Ph鬾g Ho祅g", "Luy謓 H醓 K� L﹏", "Luy謓 Th鵦 Nh﹏ Hoa", "Luy謓 Mao Ng璾", "Luy謓 C莔 Ti猲 T�"},
--	[3] = {"B秓 Th筩h Th�", "B秓 Th筩h Ph鬾g ho祅g", "B秓 Th筩h H醓 K� L﹏", "B秓 Th筩h Th鵦 Nh﹏ hoa", "B秓 Th筩h B� T﹜ T筺g", "B秓 Th筩h C莔 Ti猲 T�"},
--	[4] = {"Trang b� Th�", "Trang b� Ph鬾g ho祅g", "Trang b� H醓 K� L﹏", "Trang b� Th鵦 nh﹏ th秓", "Trang b� B� T﹜ T筺g", "Trang b� C莔 Ti猲 T�"},
}
-- фi t猲 hi觧 th� c竎 lo筰 qu竔
t1 =  {"Th�", "Ph鬾g ho祅g", "H醓 K� L﹏", "Th鵦 nh﹏ th秓", "B� T﹜ T筺g", "C莔 Ti猲 T�", "Li謙 Nhan Li Long", "У La Ni T╪g", "T莔 B秓 Nh﹏"}

tbMobsRate = {
	[1] = {[1] = 1, nRate = 5.00},
	[2] = {[1] = 2, nRate = 15.00},
	[3] = {[1] = 3, nRate = 15.00},
	[4] = {[1] = 4, nRate = 10.00},
	[5] = {[1] = 5, nRate = 5.00},
	[6] = {[1] = 6, nRate = 10.00},
	[7] = {[1] = 7, nRate = 15.00},
	[8] = {[1] = 8, nRate = 15.00},
	[9] = {[1] = 9, nRate = 10.00},
}
-- Table v遪g Th竔 H�
tThaiHuRing = 
{
	{"V遪g Th竔 H� B竧 Qu竔 - C祅",2,1,469},
	{"V遪g Th竔 H� B竧 Qu竔 - Kh玭",2,1,470},	
	{"V遪g Th竔 H� B竧 Qu竔 - Kh秏",2,1,471},	
	{"V遪g Th竔 H� B竧 Qu竔 - 礽",2,1,472},
	{"V遪g Th竔 H� B竧 Qu竔 - Ly",2,1,473},	
	{"V遪g Th竔 H� B竧 Qu竔 - Ch蕁",2,1,474},	
	{"V遪g Th竔 H� B竧 Qu竔 - C蕁",2,1,475},
	{"V遪g Th竔 H� B竧 Qu竔 - T鑞",2,1,476},
}
function GetTabData(nRow, nCell)
	local tempdata = MONSTER_FILE:getCell(nRow, nCell)
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end
end

-- 判断队伍是否能够进入
function Chk_Enter()
	local szSex = {"Thi誹 hi謕", "N� hi謕 "}
	local szNoTeam ={"Th竔 H� Huy詎 C秐h nguy hi觤 tr飊g tr飊g,", " n猲 t� i hay h琻!"}
	local nSex = GetSex()
	local szLevel = "<color=green>L韓 h琻 ho芻 b籲g c蕄 70<color>"
	local szItemCount = "<color=green>1 Th竔 H�  M藅 qu�<color>"
	local szTimes = "<color=green>1 l莕<color>"
	local szLeader = "<color=green>чi trng<color>"
	local szTown = "<color=green>чi vi猲 c飊g m閠 th祅h th�<color>"
	local szExMsg = ""				-- 额外的信息
	local nRetCode = 1
	
	if IsinTeam() == 0 then
		nRetCode = 0
		return nRetCode, szNoTeam[1]..szSex[nSex]..szNoTeam[2]
	end
	
	if IsCaptain() == 0 then
		nRetCode = 0
		szLeader = "<color=red>чi trng<color>" 
	end
	
	local nSize = GetTeamSize()
	local nCount = 1
	local OldPlayer = PlayerIndex
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() < 70 then
			nRetCode = 0
			szLevel = "<color=red>L韓 h琻 ho芻 b籲g c蕄 70<color>"
			break
		end
	end
    
	--队长携带1个太虚果
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex <= 0 then
		print("###太虚幻境 Chk_Enter 检测队长携带太虚果出错")
		return
	end
	-- if GetItemCount(2,1,387) < 1 then
		-- nRetCode = 0
		-- --szItemCount = "<color=red>1个太虚多蜜花果<color>"
		-- szItemCount = "<color=red>1 qu� Th竔 H� 產 m藅 <color>";
	-- end
	-- Ki觤 tra ng祔 甶 Th竔 H� m閠 l莕
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i)
		-- 襲 ki謓 ch苙 ng祔
		if TodayCanEnter() <= 0 then
			nRetCode = 0
			szTimes = "<color=red>1 l莕<color>"
			szExMsg = szExMsg..GetName()..", "
		end
	end
	PlayerIndex = OldPlayer
	if szExMsg ~= "" then
	    local nLen = strlen(szExMsg)
	    szExMsg = strsub(szExMsg, 1, nLen - 2)
	    szExMsg = szExMsg.."Kh玭g v祇 頲 Th竔 H� Huy詎 C秐h (H玬 nay  v祇 1 l莕)"
	end
	
    
    if AreaCheck() == 0 then
    	nRetCode = 0
    	szTown = "<color=red>чi vi猲 c飊g m閠 th祅h th�<color>"
    end
    
    local nSleepCheckRet = 0
    local szSleepCheck = ""
    nSleepCheckRet, szSleepCheck = SleepCheck()
    if nSleepCheckRet == 0 then
    	nRetCode = 0
    end

	if szExMsg ~= "" then
		Msg2Team(szExMsg)
	end
	if szSleepCheck ~= "" then
		Msg2Team(szSleepCheck)
	end

    local szMsg = "----- 襲 ki謓 c莕 -----\nDo "..szLeader.." d蒼 u, "..szLevel..", "..szTown
		..", 1 ng祔 v祇 "..szTimes.." Th竔 H� Huy詎 C秐h. \n\n"
		.."(<color=white>M祏 xanh tng tr璶g  甶襲 ki謓, m祏  kh玭g  nguy猲 nh﹏<color>)\n"
		--..szItemCount
    return nRetCode, szMsg
end

-- 是否在队伍中
function IsinTeam()
	if GetTeamSize() < 1 then
		return 0
	else
		return 1
	end
end

-- 是否为队长
function IsCaptain()
	if IsinTeam() == 0 then
		return 0
	end
	
	local nCaptain = GetTeamMember(0)
	if nCaptain == PlayerIndex then
		return 1
	else
		return 0
	end
end

function TodayCanEnter()
	local nNow = date("%y%m%d")
	local nLastTime = GetTask(TAIXU_TIME)
	local nDuration = nNow - nLastTime
	return nDuration
end

function GetRouteCount()
	local RouteTable = {}
	local nCount = 1
	local nRoute = 0
	local flagInTable = 0
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		nRoute = GetPlayerRoute()
		for index, value in RouteTable do
			if value == nRoute then
				flagInTable = 1
				break
			end
		end
		if flagInTable == 1 then
			flagInTable = 0
		else
			RouteTable[nCount] = nRoute;
			nCount = nCount + 1
		end
	end
	PlayerIndex = nOldIndex
	return nCount - 1
end

-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
	local nRestMin = floor(nSec / 60)
	local nRestSec = mod(nSec, 60)
	return nRestMin, nRestSec
end;


function InitPlayerStatus(nMapid, nIndex)
	--Msg2Player("Trong quy t綾 b� tr� 秈厖")
	-- 如果是队长
	if IsCaptain() == 1 then
		SetDeathScript("\\script\\太虚幻境\\death.lua")
		SetTaskTemp(TAIXU_STEPS, 0)
		SetTaskTemp(TAIXU_STEP_CONTROL, 2)
		SetTaskTemp(TAIXU_RINGS, 0)
		SetTaskTemp(TAIXU_ZONE_INDEX, nIndex)
		SetTaskTemp(TAIXU_MAP_ID, nMapid)
		SetTaskTemp(TAIXU_TEAM_SIZE, GetTeamSize())
		local nRouteCount = 0;
		if CHEAT_MODE == 1 then
			nRouteCount = 10
		else
			nRouteCount = GetRouteCount();
		end

		if nRouteCount > 8 then
			nRouteCount = 8
		end
		SetTaskTemp(TAIXU_RINGS_MAX, nRouteCount)

		local nTrigger = CreateTrigger(1, 1106, TRIGGER_TIMER)
		
		ContinueTimer(nTrigger)
	end

	-- 队长和成员都有的初始化
	local nNow = date("%y%m%d")
	SetTask(TAIXU_TIME, nNow)
	
	SetLogoutRV(1)						-- 中途中断后回城
	SetFightState(1)					-- 设置为可战斗
	SetCreateTeam(1)					-- 关闭组队功能
	--UseScrollEnable(0)					-- 禁止使用回城符
	InteractiveEnable(0)					-- 交互开关，0关闭，1打开
	StallEnable(0)						-- 摆摊开关
	ForbitTrade(1)						-- 禁止交易
	OpenFriendliness(0)					-- 不提升好感
	SetDeathPunish(0)					-- 无死亡惩罚
	
	CreateTrigger(0, 1106, TRIGGER_KILL)
	CreateTrigger(2, 1106, TRIGGER_RECT)
	CreateTrigger(3, 1106, TRIGGER_LOG)
	--OnKill开关
	SetTaskTemp(TMP_TASK_TAIXU_TAG, 0);
	--cdkey活动
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(1)");	
end

function ClearMonster(nIndex)
	nIndex = nIndex + GROUP_OFFSET					-- 避免和藏剑冲突
	SetGroupLifeTime(nIndex, nLifeTime)
	SetGroupDeathScript(nIndex, "")
	return ClearGroup(nIndex)
end

function Move2Stage(nIndex)
	local szMsg = ""
	local nMapid = GetWorldPos()
	
	-- 8个队员的相对偏移，保证trap后不会传送到同一点
	local tOffset =
	{
		{-2, 0},
		{-1, 0},
		{0, 0},
		{1, 0},
		{-2, 1},
		{-1, 1},
		{0, 1},
		{1, 1},
	}

	local pos = {}
	pos[1] = tMAP_ID[nMapid]

	local nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		CleanInteractive()
		SCCheckOfflineExp(3)
		local nPlayerTeamIndex = GetTaskTemp(TAIXU_TEAM_INDEX)
		
		if nPlayerTeamIndex > 0 and nPlayerTeamIndex <= 8 then
			pos[2] = tNEW_WORLD[nIndex + 1][1] + tOffset[nPlayerTeamIndex][1]
			pos[3] = tNEW_WORLD[nIndex + 1][2] + tOffset[nPlayerTeamIndex][2]
		else
			pos[2] = tNEW_WORLD[nIndex + 1][1]
			pos[3] = tNEW_WORLD[nIndex + 1][2]
		end
		
		if NewWorld(pos[1], pos[2], pos[3]) ~= 1 then
			Msg2Player("chuy觧 ti誴 th蕋 b筰, kh玭g th� v祇 Th竔 H� Huy詎 C秐h")
			LeaveTeam()
			WriteLog("**Th竔 H� Huy詎 C秐h "..GetName().."Chuy觧 ti誴 th蕋 b筰, th阨 gian : "..date("%H%M"))
		end
	end
	
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		InitPlayerStatus(pos[1], nIndex)
	end
	PlayerIndex = nOldPlayer
	
	-- 记录该ZONE已经有队伍进入
	SetMapTaskTemp(pos[1], nIndex, 1)
end

function EnterTx()
--	Talk(1, "", "Th竔 H�  h誸 linh kh�, i hi謕 h穣 quay l筰 sau nha !!!!")
--	do return end
	-- 简单检查怪物表的正确性
	local nMap = GetWorldPos()
	if nMap ~= 100 then
		Talk(1,"","C竎 h� ch� c� th� v祇 Th竔 H� Huy詎 C秐h t� Tuy襫 Ch﹗!")
		return
	end
--	ReSetDateTH()
	if CheckMaxJoinCount() ~= 1 then
		return
	end
	if (FILE_ROW_COUNT - 2) > MAX_MONSTER_COUNT then
		Msg2Team("Th竔 H� Huy詎 C秐h 產ng h鏽 lo筺, m鋓 ngi kh玭g n猲 v祇!", 2)
		WriteLog("**Th竔 H� Huy詎 C秐h monster.txt v� MAX_MONSTER_COUNT kh玭g ph鑙 h頿 頲")
		return
	end

	local nRetCode, szMsg = Chk_Enter()
	if nRetCode == 0 then
		Talk(1, "", szMsg)
		return
	end

	local t = {}
	local nCount = 0
	local nMapid = GetWorldPos()
	-- 地图变量的0，1，2，3的值表示是否被占用，0为没占用，1为被占用
	for i = 0, 3 do
		local nValue = GetMapTaskTemp(tMAP_ID[nMapid], i)
		--local nLastTime = GetMapTaskTemp(tMAP_ID[nMapid], i + 4)
		if nValue == 0 then
			nCount = nCount + 1
			t[nCount] = i
		end
	end

	if nCount == 0 then
		Msg2Team("Th竔 H� Huy詎 C秐h  y, khi kh竎 h穣 quay l筰!", 2)
		return
	end

	local n = random(1, getn(t))
	local nIndex = t[n]

	Msg2Team("Ph� sinh nh蕋 trng, uy觧 nh� xu﹏ m閚g; th� gian v筺 tng, huy詎 h鉧 th竔 h�.", 2)
	-- Tr� v祅g v� v藅 ph萴 xu trc khi v祇 Th竔 H�
	local nOldIndex = PlayerIndex
		----------------------- Chu鏸 nhi謒 v� Chuy觧 Sinh Кn, l璾 s� th� 4 v� 5 u b猲 ph秈
--	local nCSD_TH = floor(GetTask(TSK_CSD_COUNT_A) / 1000)  -- CSD
--	local nNumBK = mod(GetTask(TSK_CSD_COUNT_A),1000)		--CSD
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if mod(GetTask(TSK_THAIHU_DAY), 100) < 1 then
			--Pay(290000)
			SetTask(TSK_THAIHU_DAY, GetTask(TSK_THAIHU_DAY) + 1)
			--=================== Chu鏸 nhi謒 v� Ph鬰 Sinh 2 ==================
			if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 20 and PhucSinh2_GetMissionPart() > 0 then
				PhucSinh2_SetMissionPart()
			end
			--=============================================================
			if mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000), 100) < 30 and GetTask(TSK_CSD) == 1 then
				local nCSD_TH = (floor(GetTask(TSK_CSD_COUNT_A) / 1000) + 1) * 1000 + mod(GetTask(TSK_CSD_COUNT_A),1000)
				SetTask(TSK_CSD_COUNT_A, nCSD_TH)
			--	Msg2Player("Gia tri 4: "..nCSD_TH)
			--	Msg2Player("Gia tri 5: "..GetTask(TSK_CSD_COUNT_A))
			end
			 gf_WriteLogEx("Thai Hu Huyen Canh","tham gia th祅h c玭g",1,"Tham gia l莕 1")
		else
			--DelItem(2, 1, 30230, 20)
			SetTask(TSK_THAIHU_DAY, GetTask(TSK_THAIHU_DAY) + 1)
			--=================== Chu鏸 nhi謒 v� Ph鬰 Sinh 2 ==================
			if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 21 and PhucSinh2_GetMissionPart() > 0 then
				PhucSinh2_SetMissionPart()
			end
			--=============================================================
			if mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000), 100) < 30 and GetTask(TSK_CSD) == 1 then
				local nCSD_THa = (floor(GetTask(TSK_CSD_COUNT_A) / 1000) + 1) * 1000 + mod(GetTask(TSK_CSD_COUNT_A),1000)
				SetTask(TSK_CSD_COUNT_A, nCSD_THa)
			--	Msg2Player("Gia tri 4: "..nCSD_THa)
			--	Msg2Player("Gia tri 5: "..GetTask(TSK_CSD_COUNT_A))
			end
			gf_WriteLogEx("Thai Hu Huyen Canh","tham gia th祅h c玭g",1,"Tham gia l莕 2 tr� l猲")
			--WriteLogEx("LOG XU VAT PHAM","Tham gia Th竔 H� l莕 2 tr� l猲 (20 xu)")
		end
		--nhi謒 v� l祄 gi祏
		if CFG_NhiemVuLamGiau == 1 then
			if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and  gf_GetTaskBit(TSK_LAMGIAU, 2) == 0 then
		     		gf_SetTaskBit(TSK_LAMGIAU, 2, 1, 0)
		     		TaskTip("Ho祅 th祅h nhi謒 v� l祄 gi祏: Ho祅 th祅h 01 l莕 Th竔 H� Huy詎 C秐h.")
	     		end
	     end
		-----------------------Chu鏸 nhi謒 v� уng H祅h
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 11 then
				DongHanh_SetStatus()
			end
		end
		-----------------------	     
	end

	PlayerIndex = nOldIndex
	SetPlayerTeamIndex()	-- 保存队员在队伍中的位置
	ClearMonster(nIndex)
	Move2Stage(nIndex)
end

function Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    local OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end

function CreateMonster(nZone, nType)
	local nMapid = GetWorldPos()
	if not (nMapid == 2010 or nMapid == 1010 or nMapid == 3010) then
		RemoveTrigger(GetTrigger(TRIGGER_TIMER))
		RemoveTrigger(GetTrigger(TRIGGER_KILL))
		RemoveTrigger(GetTrigger(TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TRIGGER_LOG))
		return
	end
	
	local n = mod(random(4315511), 100)
	local nMonsterType = 0
	if nType == 0 then
		if n < 75 then
			nMonsterType = 1
		else
			nMonsterType = 2
		end
	elseif nType == 1 then
		if n < 25 then
			nMonsterType = 4
		elseif n < 75 then
			nMonsterType = 1
		else
			nMonsterType = 2
		end
	end

	local t = tMonsterType[nMonsterType];
	n = random(1, getn(t));
	local szMonsterName = t[n];
	local szMonsterMode = "";
	if nMonsterType == 2 then		-- 修为怪也用经验怪模板
		szMonsterMode = tMonsterType[1][n];
	else
		szMonsterMode = t[n];
	end

	local x, y
	for i = 3, FILE_ROW_COUNT do
		x = GetTabData(i, nZone * 2 + 1)
		y = GetTabData(i, nZone * 2 + 2)
		local npcIndex = CreateNpc(szMonsterMode, szMonsterName, nMapid, x, y)
		AddGroupUnit(nZone + GROUP_OFFSET, npcIndex)
		SetNpcDeathScript(npcIndex,"\\script\\太虚幻境\\npc_death.lua")
	end
	
	-- 记录当前刷怪类型
	SetTaskTemp(TAIXU_MONSTER_TYPE, nMonsterType)
end

function GiveAward(nType)
	local nMonsterCount = FILE_ROW_COUNT - 2		-- 怪物总数
	local nTeamSize = 0
	local nRouteCount = 0
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		nTeamSize = GetTaskTemp(TAIXU_TEAM_SIZE)
		nRouteCount = GetTaskTemp(TAIXU_RINGS_MAX)
	end
	--============= Thng vt 秈
	ThaiHu_ThuongVuotAi()
	--===========================
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if nType == 1 then	--经验
			local nExpAll = nMonsterCount * ONE_MONSTER_EXP * nRouteCount
			local nExp = floor(nExpAll / nTeamSize)
			-- 经验上线
			if nExp > MAX_MONSTER_COUNT * ONE_MONSTER_EXP then
				nExp = MAX_MONSTER_COUNT * ONE_MONSTER_EXP
				WriteLog("** Th竔 H� Huy詎 C秐h, tr� kinh nghi謒  vt m鴆, FILE_ROW_COUNT = "..FILE_ROW_COUNT..", s� l莕 nh qu竔 nhi襲 nh蕋= "..nRouteCount..", s� ngi i ng� trc= "..nTeamSize)
			end
			ModifyExp(nExp)
			Msg2Player("чi ng� t鎛g c閚g nh薾 頲 "..nExpAll.." 甶觤 kinh nghi謒, b譶h qu﹏ m鏸 ngi 頲 "..nExp)
		elseif nType == 2 then	--修为
			local nPopurAll = nMonsterCount * ONE_MONSTER_POPUR * nRouteCount
			local nPopur = floor(nPopurAll / nTeamSize)
			if nPopur > MAX_MONSTER_COUNT * ONE_MONSTER_POPUR then
				nPopur = MAX_MONSTER_COUNT * ONE_MONSTER_POPUR
				WriteLog("**Th竔 H� Huy詎 C秐h: tr�  vt m鴆, FILE_ROW_COUNT = "..FILE_ROW_COUNT..", s� l莕 nh qu竔 nhi襲 nh蕋= "..nRouteCount..", s� ngi i ng� trc= "..nTeamSize)
			end
			ModifyPopur(nPopur)
			Msg2Player("чi ng� t鎛g c閚g nh薾 頲"..nPopurAll.." 甶觤 tu luy謓, b譶h qu﹏ m鏸 ngi 頲 "..nPopur)
		elseif nType == 3 then	--宝石
			AddItem(1, 0, 32, 1, 1)		--九转一个（暂时）
		end
	end
	PlayerIndex = nOldPlayer
end

function ResetPlayerStatus()
	SetLogoutRV(0)						-- 中途中断后回城
	SetFightState(0)					-- 设置为可战斗
	SetCreateTeam(0)					-- 关闭组队功能
	--UseScrollEnable(0)					-- 禁止使用回城符
	InteractiveEnable(1)					-- 交互开关，0关闭，1打开
	StallEnable(1)		   				-- 摆摊开关
	ForbitTrade(0)						-- 禁止交易
	OpenFriendliness(1)					-- 恢复提升好感
	SetDeathPunish(1)					-- 恢复死亡惩罚
end

function GameOver(nType)
	local nMapid = 0
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		nMapid = GetTaskTemp(TAIXU_MAP_ID)
	end
	PlayerIndex = nOldPlayer
	
	if nType == 0 then		--单人GameOver
		RemoveTrigger(GetTrigger(TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TRIGGER_KILL))
		RemoveTrigger(GetTrigger(TRIGGER_LOG))
		NewWorld(tPos[nMapid][1], tPos[nMapid][2], tPos[nMapid][3])
		ResetPlayerStatus()
		LeaveTeam()
	elseif nType == 1 then
		-- 先处理队长
		nOldPlayer = PlayerIndex
		PlayerIndex = GetTeamMember(0)
		local nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
		SetDeathScript("")
		RemoveTrigger(GetTrigger(TRIGGER_TIMER))
		for i = TAIXU_TASK_TEMP_BEGIN, TAIXU_TASK_TEMP_END do
			SetTaskTemp(i, 0)
		end
		-- 然后队员
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if PlayerIndex > 0 then
				SetTaskTemp(TAIXU_TEAM_INDEX, 0)
				RemoveTrigger(GetTrigger(TRIGGER_RECT))
				RemoveTrigger(GetTrigger(TRIGGER_KILL))
				RemoveTrigger(GetTrigger(TRIGGER_LOG))
				NewWorld(tPos[nMapid][1], tPos[nMapid][2], tPos[nMapid][3])
				ResetPlayerStatus()
			end
		end
		PlayerIndex = nOldPlayer
		-- 把地图标记为无队进入
		SetMapTaskTemp(nMapid, nZone, 0)
		SetMapTaskTemp(nMapid, nZone + 4, 0)
		SetGroupLifeTime(nZone + GROUP_OFFSET, 1)
		ClearGroup(nZone + GROUP_OFFSET)
	end
end

function no()

end


function Hewei()
	Say("C鰑 Thi猲 Huy襫 N� l蕐 tam thu thanh l� v� b竎h hoa qu� m藅 l祄 ra nhi襲 lo筰 linh th�; ngo礽 ra c遪 l蕐 m﹜ m� luy謓 ng� s綾 k� th筩h t ch髇g t筰 m閠 th� gi韎 huy襫 秓 c� t猲 Th竔 H�. Ph祄 ai v祇 頲 trong u to筰 nguy謓.",
		1, "Ta ch� h醝 th玦!/no")
end

function Ruhe()
	Say("Ch� c莕 <color=yellow>t� i<color> mang theo <color=yellow>1 Th竔 H�  M藅 qu�<color> n t譵 b莕 o l� 頲. Th竔 H� Huy詎 C秐h l� ch鑞 th莕 ti猲 m鏸 ng祔 ch� v祇 頲 t鑙 產 <color=yellow>1 l莕<color>.",
		1, "Ta ch� h醝 th玦!/no")
end

-- 在进入前判断所有队员是否在同一个城里
function AreaCheck()
	local nTeamSize = 0
	local nMapid = GetWorldPos()	--随便取一个队员的worldpos
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetWorldPos() == nMapid then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if GetTeamSize() == nTeamSize then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function SleepCheck()
	local nTeamSize = 0
	local szExMsg = ""
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsSleeping() == 1 then
			szExMsg = szExMsg..GetName()..", "
		else
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if szExMsg ~= "" then
	    local nLen = strlen(szExMsg)
	    szExMsg = strsub(szExMsg, 1, nLen - 2)
	    szExMsg = szExMsg.."Kh玭g th� v祇 Th竔 H� Huy詎 C秐h (產ng ng)"
	end
	if (GetTeamSize() == nTeamSize) and (GetTeamSize() > 0) then
		return 1, szExMsg
	else
		return 0, szExMsg
	end
end

function SetPlayerTeamIndex()
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		SetTaskTemp(TAIXU_TEAM_INDEX, i)
		WriteLogEx("Thai Hu Huyen Canh", "Tham gia");
	end
	PlayerIndex = nOldIndex
end
-- ReSet qua ng祔
--function ReSetDateTH()
--	local nDate = tonumber(date("%y%m%d"))
--	local nOldIndex = PlayerIndex
--	for i=1, GetTeamSize() do
--		PlayerIndex = GetTeamMember(i)
--		if floor( GetTask(TSK_THAIHU_DAY)/100) ~= nDate then
--			SetTask(TSK_THAIHU_DAY,nDate*100)
--		end
--	end
--	PlayerIndex = nOldIndex
--end
-- Check xem th祅h vi猲 trong t� i  tham gia 6 l莕 trong ng祔 ch璦
function CheckMaxJoinCount()
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nCount =	mod(GetTask(TSK_THAIHU_DAY),100)
		if nCount >= 6 then
			gf_Msg2Team("T� i c馻 b筺 c� th祅h vi猲 "..GetName().."  tham gia 6 l莕",2)
			return 0
		-- elseif nCount < 1 then
			-- if GetCash()<290000 then
				-- gf_Msg2Team("T� i c馻 b筺 c� th祅h vi猲 "..GetName().." kh玭g c� 29 v祅g",2)
				-- return 0
			-- end
		elseif nCount >= 1 and nCount <= 6 then
			-- if GetItemCount(2,1,30230) < 20 then
				-- gf_Msg2Team("T� i c馻 b筺 c� th祅h vi猲 "..GetName().." kh玭g c� 20 xu v藅 ph萴",2)
				-- return 0
			-- end
			if TodayCanEnter() == 0 then
				gf_Msg2Team("T� i c馻 b筺 c� th祅h vi猲 <color=yellow>"..GetName()
				.."<color>  h誸 c� h閕 v祇 Th竔 H�. C莕 ╪ <color=green>Th竔 H� 產 m藅 qu�<color>.",2)
			end
		end
	end
	PlayerIndex = nOldIndex
	return 1
end


function Award_Max()
	if gf_JudgeRoomWeight(3,100) == 0 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , ngi h穣 s緋 x誴 l筰 nh�!");
		return 0
	end
	local nCheck =	floor(GetTask(TSK_THAIHU_DAY)/100)
	if nCheck > 0 then
		Talk(1,"","Ph莕 thng h玬 nay  nh薾 r錳, mai ti誴 t鬰 c� g緉g nh�!");
		return 0
	end
	local tbAward = {
		fn="RandomAward()",
		nDanhvong = 60, 
		nSumon = 60, 
		nExp = 24000000, 
		nGold = 100000, 
		item={
			{gdp={2,1,2652	,20}, name = "X輈h Thi誸 Tinh"}, 
			{gdp={2,1,3219,1}, name="Nguy謙 Hoa Chi Tinh"}
		},
	}
	LIB_Award.szLogTitle = "Thai Hu Huyen Canh"
	LIB_Award.szLogAction = "nh薾"
	LIB_Award:Award(tbAward)
	SetTask(TSK_THAIHU_DAY, GetTask(TSK_THAIHU_DAY) + 100)
	gf_WriteLogEx("Thai Hu Huyen Canh","nh薾",1,"Ph莕 thng cu鑙")
end

function RandomAward()
	local tbAward_ThaiHu = {
								{1, 2500, "L筩 Mai", {1, 1, 16, 5}},
								{1, 2500, "M閏 Lan Xu﹏", {1, 1, 18, 5}},
								{1, 2000, "B竛h B閠 V祅g", {1, 1, 15, 5}},
								{1, 2000, "T﹜ B綾 V鋘g", {1, 1, 19, 5}},
								{1, 999, "Minh D� Nguy謙", {1, 1, 17, 5}},
								{1, 1, "T祅g Rng", {2, 1, 30341, 2}},
							}
	gf_EventGiveRandAward(tbAward_ThaiHu, 10000,1,"Thai Hu Huyen Canh","ph莕 thng ng蓇 nhi猲")							
end