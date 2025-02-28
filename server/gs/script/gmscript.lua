-------测试用GM指令-----
--为了方便测试使用，暂时增加增加这些，有需要再增加---
--本文件最终解释权：西山居-测试组。

-- 世界收集任务头文件
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\collection\\task_head.lua");
Include("\\script\\task\\boss\\boss_pos.lua");
Include("\\script\\online\\laborday06\\laborday_head.lua");
-- 辉煌之夜头文件
Include("\\script\\shinynight_head.lua");
--村长的公共处理函数
Include("\\script\\online\\zgc_public_fun.lua")
--月亮兔活动头文件
Include("\\script\\online\\abluemoon\\abluemoon_init.lua");
Include("\\script\\online\\viet_event\\factionboss\\head_factionboss.lua");
--日常任务头文件
Include("\\script\\task\\richangrenwu\\init_task.lua")
--挑战四灵boss
Include("\\script\\online_activites\\tiaozhansilingboss\\mission_head.lua");
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件
Include("\\script\\online_activites\\2011_03\\boss\\eventboss.lua")
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\meridian\\meridian_exp_exchg_zhenqi.lua")
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")

function tianzhansilingboss(nMapId)
	-- do	return	end
    if gf_CheckEventDateEx(VET_201008_SILING_EVENT_NUMBER) == 0 then
        return 0;
    end
    SetGlbValue(1033,nMapId)
    print("SILING_MAP_ID = ***************"..SILING_MAP_ID[nMapId][1])
    mf_OpenMission(MISSION_ID,SILING_MAP_ID[nMapId][1])
    AddSiLingDing(nMapId); --添加四灵鼎
    AddTanMuXiang()
    --print("nMapId = ******************"..nMapId)
end

function GS_VET_201103_EventBoss_SpawnBoss(nMapId,nX,nY)
	VET_201103_EventBoss_SpawnBoss(nMapId,nX,nY);
end

function UPLevel(lvl)
     SetLevel(lvl,8000)
     SetStrength(1999);
     SetDexterity(999);
     SetEnergy(999);
     SetObserve(999);
     SetVitality(999);
     Earn(100000000);
     AddItem(0,105,1,1)   ----增加ring等
     AddItem(0,102,5,1)
     AddItem(0,102,10,1)
     AddItem(0,102,15,1)
     AddItem(0,102,20,1)
     if (lvl>=50)   then    --增加武器
     AddItem(0,0,1,1)
     AddItem(0,2,14,1)
     AddItem(0,5,27,1)
     AddItem(0,1,40,1)
     AddItem(0,3,53,1)
     AddItem(0,10,64,1)
     AddItem(0,9,75,1)
     AddItem(0,8,86,1)
     end
     RestoreAll()
end
-----------------技能学习----------------------
function AddSkillSL(Route)     ---学习少林技能
     if (Route==1) then
     for i=21,32 do LearnSkill(i) end
     Msg2Player("B筺 h鋍 頲 k� n╪g Thi誹 L﹎ t鬰 gia");
     elseif (Route==2) then
     for i=45,57 do LearnSkill(i) end
     Msg2Player("B筺 h鋍 頲 k� n╪g Thi誹 L﹎ thi襫 t╪g");
     elseif (Route==3) then
     for i=33,44 do LearnSkill(i) end
     Msg2Player("B筺 h鋍 頲 k� n╪g Thi誹 L﹎ v� t╪g");
     end
end

function AddSkillTM(Route)    ---学习唐门技能
     if (Route==1) then
     for i=58,74 do LearnSkill(i) end
     Msg2Player("B筺 h鋍 頲 k� n╪g Л阯g M玭 hi謕 kh竎h");
     end
end

function AddSkillEM(Route)    ---学习峨嵋技能
     if (Route==1) then
     for i=75,89 do LearnSkill(i) end
     Msg2Player("B筺 h鋍 頲 k� n╪g Nga My xu蕋 gia");
     elseif (Route==2) then
     for i=90,102 do LearnSkill(i) end
     Msg2Player("B筺 h鋍 頲 k� n╪g Nga My t鬰 gia");
     end
end

function AddSkillGB(Route)   ---学习丐帮技能
     if (Route==1) then
     for i=103,113 do LearnSkill(i) end
     Msg2Player("B筺 h鋍 頲 k� n╪g C竔 Bang T躰h y");
     elseif (Route==2) then
     for i=114,124 do LearnSkill(i) end
     Msg2Player("B筺 h鋍 頲 k� n╪g C竔 Bang � y");
     end
end

function AddSkillWD(Route)  ---学习武当技能
     if (Route==1) then
     for i=125,146 do LearnSkill(i) end
     Msg2Player("B筺 h鋍 頲 k� n╪g V� ng o gia");
     elseif (Route==2) then
     for i=147,159 do LearnSkill(i) end
     Msg2Player("B筺 h鋍 頲 k� n╪g V� ng t鬰 gia");
     end
end
-------------------------增加道具---------------------------
function AddCloth(sex)   --增加衣服
     if (sex=="Nam ti猽 chu萵") then
     for i=1,18 do AddItem(0,100,i,1) end
     for i=1,18 do AddItem(0,101,i,1) end
     for i=1,18 do AddItem(0,103,i,1) end
     elseif (sex=="Nam kh玦 ng�") then
     for i=19,36 do AddItem(0,100,i,1) end
     for i=19,36 do AddItem(0,101,i,1) end
     for i=19,36 do AddItem(0,103,i,1) end
     elseif (sex=="N� g頸 c秏") then
     for i=37,54 do AddItem(0,100,i,1) end
     for i=37,54 do AddItem(0,101,i,1) end
     for i=37,54 do AddItem(0,103,i,1) end
     elseif (sex=="Ki襲 n�") then
     for i=55,72 do AddItem(0,100,i,1) end
     for i=55,72 do AddItem(0,101,i,1) end
     for i=55,72 do AddItem(0,103,i,1) end
     end
end
function AddWeapon(tp)   ---增加武器
    if(tp=="H� uy觧") then
    	for i=1,13 do AddItem(0,0,i,1) end
    elseif(tp=="Ki誱") then
    	for i=14,26 do AddItem(0,2,i,1) end
    elseif(tp=="C玭") then
    	for i=27,39 do AddItem(0,5,i,1) end
    elseif(tp=="竚 kh�") then
    	for i=40,52 do AddItem(0,1,i,1) end
    elseif(tp=="o") then
    	for i=53,63 do AddItem(0,3,i,1) end
    elseif(tp=="C莔") then
    	for i=64,74 do AddItem(0,10,i,1) end
    elseif(tp=="B髏") then
    	for i=75,85 do AddItem(0,9,i,1) end
    elseif(tp=="Trng") then
    	for i=86,96 do AddItem(0,8,i,1) end
    end
end

function CollectionTaskStart(nMapId, nNpcId, nObjId, nObjType)
	print("gmscript>>CollectionTaskStart");
	SetGlbValue(100, 333)
end

function CollectionTaskClose(nMapId, nNpcId, nObjId, nObjType)
	print(format("GlobleValue(%d):%d", 100, GetGlbValue(100)));
end


function createDataCall(nRandomSeed)
	print("gmscript>>createDataCall>>createCollecEvent");
	--randomseed(nRandomSeed);

	createCollecEvent();

end;


function closeDataCall(nState)

	closeCollectEvent();

end;
-------------------------召唤BOSS---------------------------
function createBoss(Random1,Random2,Random3)
	print("gmscript >> createBoss >> Boss Ho祅g Kim  xu蕋 hi謓!");
	if tonumber(date("%H")) == 23 then
		return
	end
--召唤北绿林盟主
	x=random(1,Pos[Random1][1]) --同一地图上多个点随机找一个刷
	npcIndex = CreateNpc(Boss[1][1],Boss[1][2],Pos[Random1][2],Pos[Random1][x+2][1],Pos[Random1][x+2][2],-1,1,1,30)
	msg="Nghe n鉯 minh ch� l鬰 l﹎ x璶g b� s琻 tr筰 ph輆 b綾 產ng � "..Pos[Random1][Pos[Random1][1]+3].." hi謓 th﹏, ch綾 產ng c� ﹎ m璾!"
		for i=1,3 do
		AddGlobalNews(msg,1)
		-- AddGlobalNews(msg)
		-- AddLocalNews(mgs);
		end
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

--召唤枪神赢天
	y=random(1,Pos[Random2][1]) --同一地图上多个点随机找一个刷
	npcIndex = CreateNpc(Boss[2][1],Boss[2][2],Pos[Random2][2],Pos[Random2][y+2][1],Pos[Random2][y+2][2],-1,1,1,30)
	msg="Nghe n鉯 th� v� th﹏ t輓 c馻 T莕 Th駓 Ho祅g l� Thng Th莕 Doanh Thi猲  xu蕋 hi謓 t筰 "..Pos[Random2][Pos[Random2][1]+3].." v� l﹎ s緋 c� m閠 tr薾 h祇 ki誴!"
		for i=1,3 do
		AddGlobalNews(msg,1)
		-- AddGlobalNews(msg)
		-- AddLocalNews(mgs);
		end
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

--召唤冷香凝
	z=random(1,Pos[Random3][1]) --同一地图上多个点随机找一个刷
	date=tonumber(date("%w"))
	if(date==5 or date==6) then
	npcIndex = CreateNpc(Boss[3][1],Boss[3][2],Pos[Random3][2],Pos[Random3][z+2][1],Pos[Random3][z+2][2],-1,1,1,30)
	msg="Nghe n鉯 h錸 ma L穘h Hng L╪g 10 n╩ trc t鮪g l� hoa kh玦 Giang T﹏ Th玭 nay xu蕋 hi謓 t筰"..Pos[Random3][Pos[Random3][1]+3].."mau n  xem th� dung nhan ki襲 di詍 c馻 n祅g!"
		for i=1,3 do
		AddGlobalNews(msg,1)
		-- AddGlobalNews(msg)
		-- AddLocalNews(mgs);
		end
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")
    	end
end
function createNewResBoss(nBossType,nPosType)
	print("gmscript >> createNewResBoss >> T礽 nguy猲 chi課");
	local tbMapID = 
		{
			{606,1363,3074,"T礽 nguy猲 chi課"},
			{606,1465,2978,"T礽 nguy猲 chi課"},
			{606,1364,2886,"T礽 nguy猲 chi課"},
			{606,1268,2979,"T礽 nguy猲 chi課"},
		}
	
	local tbMsg = 
		{
			{"Nghe n鉯 minh ch� l鬰 l﹎ x璶g b� s琻 tr筰 ph輆 b綾 產ng � ", " hi謓 th﹏, ch綾 產ng c� ﹎ m璾!"},
			{"Nghe n鉯 th� v� th﹏ t輓 c馻 T莕 Th駓 Ho祅g l� Thng Th莕 Doanh Thi猲  xu蕋 hi謓 t筰 ", " v� l﹎ s緋 c� m閠 tr薾 h祇 ki誴!"},
			{"Nghe n鉯 h錸 ma L穘h Hng L╪g 10 n╩ trc t鮪g l� hoa kh玦 Giang T﹏ Th玭 nay xu蕋 hi謓 t筰 ", "mau n  xem th� dung nhan ki襲 di詍 c馻 n祅g!"},
		}
			
	local nNpcIndex = CreateNpc(Boss[nBossType][1],Boss[nBossType][2],tbMapID[nPosType][1],tbMapID[nPosType][2],tbMapID[nPosType][3])
	SetNpcScript(nNpcIndex, "\\script\\task\\boss\\bossnewres_ondeath.lua")
	SetNpcLifeTime(nNpcIndex, 3*60*60)
	
	
	if SubWorldID2Idx(tbMapID[nPosType][1]) >= 0 then
		local szMsg = tbMsg[nBossType][1]..tbMapID[nPosType][4]..tbMsg[nBossType][2]
		Msg2Global(szMsg)
	end
end

function OpenPunishFlag(bOpen)
	 SetPunishFlagEnable(bOpen)
end

-------------------------MikeDai---------------------------
function MikeDai(route)
	local nRoute = tonumber(route)

	local nSkillStartID, nSkillEndID
	if nRoute == 2 then        --少林俗家
		AddItem(0, 3, 53, 1, 1)   -- 加刀
		AddItem(0, 5, 27, 1, 1)   -- 加棍
		nSkillStartID	= 21
		nSkillEndID	= 31
	elseif nRoute == 3  then   --少林禅宗
		AddItem(0, 8, 86, 1, 1)   -- 加杖
		nSkillStartID	= 45
		nSkillEndID	= 56
	elseif nRoute == 4  then   --少林武宗
		AddItem(0, 0, 1, 1, 1)    -- 加拳套
		nSkillStartID	= 33
		nSkillEndID	= 43
	elseif nRoute == 6  then   --唐门
		AddItem(0, 1, 40, 1, 1)   -- 加暗器囊
		AddItem(2, 11, 0, 1000, 1)-- 加暗器
		AddItem(2, 3, 6, 500, 1)  -- 加机关
		nSkillStartID	= 58
		nSkillEndID	= 73
	elseif nRoute == 8  then   --峨嵋佛家
		AddItem(0, 2, 14, 1, 1)   -- 加剑
		nSkillStartID	= 75
		nSkillEndID	= 88
	elseif nRoute == 9  then   --峨嵋俗家
		AddItem(0, 10, 64, 1, 1)  -- 加琴
		nSkillStartID	= 90
		nSkillEndID	= 101
	elseif nRoute == 11 then   --丐帮净衣
		AddItem(0, 0, 1, 1, 1)    -- 加拳套
		nSkillStartID	= 103
		nSkillEndID	= 112
	elseif nRoute == 12 then   --丐帮污衣
		AddItem(0, 5, 27, 1, 1)   -- 加棍
		nSkillStartID	= 114
		nSkillEndID	= 123
	elseif nRoute == 14 then   --武当道家
		AddItem(0, 2, 14, 1, 1)   -- 加剑
		nSkillStartID	= 125
		nSkillEndID	= 145
	elseif nRoute == 15 then   --武当俗家
		AddItem(0, 9, 75, 1, 1)   -- 加笔
		nSkillStartID	= 147
		nSkillEndID	= 158
	elseif nRoute == 17 then   --杨门枪骑
		AddItem(0, 6, 97, 1, 1)   -- 加枪
		nSkillStartID	= 720
		nSkillEndID	= 731
	elseif nRoute == 18 then   --杨门弓骑
		AddItem(0, 4, 108, 1, 1)  -- 加弓
		nSkillStartID	= 733
		nSkillEndID	= 744
	elseif nRoute == 20 then   --五毒邪侠
		AddItem(0, 7, 1, 1, 1)    -- 加双刀
		nSkillStartID	= 364
		nSkillEndID	= 377
	elseif nRoute == 21 then   --五毒蛊师
		AddItem(0, 11, 1, 1, 1)   -- 加爪
		nSkillStartID	= 347
		nSkillEndID	= 363
	else
		return
	end

	for nSkillID = nSkillStartID, nSkillEndID, 1
	do
		LearnSkill(nSkillID)
		while LevelUpSkill(nSkillID) == 1
		do
		end
	end

	SetPlayerRoute(nRoute)

	SetLevel(99,999 * 5)

	SetStrength(999)
	SetDexterity(999)
	SetVitality(999)
	SetEnergy(999)
	SetObserve(999)

	RestoreAll()

	AddItem(0, 105, 1,  1, 1)	-- 加马
end

-- 辉煌之夜开始
function ShinyNight_Start(system, multiple, szVoteName)
	-- DEBUG
	if (szVoteName ~= nil) then
		print(format("ShinyNight_Start(%d,%d,%s)", system, multiple, szVoteName))
	end

	SetGlbValue(GAMESVRGLB_SYSTEM, system)
	SetGlbValue(GAMESVRGLB_MULTIPLE, multiple)
	WriteLog(format("ShinyNight start: %s(%1.1f)", map_sysnames[system], multiple / 100))

	local strTaskName = {"Chi課 trng", "Thng h閕", "Nhi謒 v� s� m玭 - ng蓇 nhi猲", "Nhi謒 v� s� m玭 tu莕 ho祅", "Nhi謒 v� s竧 th�", "u thuy襫 r錸g"}
	local msg = ""
	if (szVoteName ~= "" and szVoteName ~= nil) then
		msg = "Иm huy ho祅g h玬 nay do "..szVoteName.."  quy誸 nh! N閕 dung c� th�:"..strTaskName[system]
	else
		msg = "Иm huy h玬 h玬 nay  頲 quy誸 nh! N閕 dung c� th�:"..strTaskName[system]
	end
	AddGlobalNews(msg,1)
	AddGlobalNews(msg)
end

-- 辉煌之夜结束
function ShinyNight_Close()
	-- DEBUG
	print("ShinyNight_Close()")
	SetGlbValue(GAMESVRGLB_SYSTEM, 0)
	SetGlbValue(GAMESVRGLB_MULTIPLE, 100)
	WriteLog("ShinyNight close......")
end


-- 随机call出一个商会卖东西的npc
function random_shop(nWorld, nX, nY)
	local nNpcIndex = CreateNpc("Ch� c莔  T﹜ Nam", "Thng nh﹏ T﹜ V鵦", nWorld, nX, nY)

	-- 设置npc生存时间：半个小时
	SetNpcLifeTime(nNpcIndex, 1800)

	-- 挂载脚本
	SetNpcScript(nNpcIndex, "\\script\\task\\tasklink\\xiyuhushang.lua")
end;


-- 根据relay发来的指令，搞三个门派boss出来给大家打
function call_faction_bt_boss(nPos1, nPos2, nPos3, nForge)
	local strBossName = {"Thanh Th�", "Huy襫 Ch﹏", "Dng Di猲 c", "Л阯g H�", "Ho祅g Ch輓h Nh蕋", "C� M芻", "Tu� Minh"}
	local szBossMapID = {312, 204, 219, 305, 209, 407, 303}
	local szBossMapX = {1580, 1378, 1676, 1570, 1482, 1710, 1673}
	local szBossMapY = {3386, 3241, 3307, 3007, 3244, 3211, 3387}
	local strBossScript = {"\\script\\task\\faction_boss\\qingshu.lua",
						   "\\script\\task\\faction_boss\\xuanzhen.lua",
						   "\\script\\task\\faction_boss\\yangwulang.lua",
						   "\\script\\task\\faction_boss\\tangxi.lua",
						   "\\script\\task\\faction_boss\\huangzhengjian.lua",
						   "\\script\\task\\faction_boss\\gumo.lua",
						   "\\script\\task\\faction_boss\\huiming.lua"}

	-- 现在是直接7个boss全部招出来
	-- 判断是不是星期五，星期六，星期天
	local nCurWeekDay = tonumber(date("%w"))
	if (nCurWeekDay == 0 or nCurWeekDay == 5 or nCurWeekDay == 6) or nForge == 1 then
		local nNpcIndex = 0;
		for i = 1, 7 do
			nNpcIndex = CreateNpc(strBossName[i], strBossName[i], szBossMapID[i], szBossMapX[i], szBossMapY[i])
			SetNpcLifeTime(nNpcIndex, 1800)
			SetNpcScript(nNpcIndex, strBossScript[i])
		end
		local msg = "Cao th� c馻 c竎 i ph竔 hi謓 產ng t藀 trung b猲 ngo礽, v� b籲g h鱱 n祇  b竜 danh mau nhanh ch鉵g n !"
		AddGlobalNews(msg)
		AddGlobalNews(msg,1)
	end

	-- 招第一个boss
	--local nNpcIndex = CreateNpc(strBossName[nPos1], strBossName[nPos1], szBossMapID[nPos1], szBossMapX[nPos1], szBossMapY[nPos1])
	--SetNpcLifeTime(nNpcIndex, 1800)
	--SetNpcScript(nNpcIndex, strBossScript[nPos1])

	-- 招第二个boss
	--nNpcIndex = CreateNpc(strBossName[nPos2], strBossName[nPos2], szBossMapID[nPos2], szBossMapX[nPos2], szBossMapY[nPos2])
	--SetNpcLifeTime(nNpcIndex, 1800)
	--SetNpcScript(nNpcIndex, strBossScript[nPos2])

	-- 招第三个boss
	--nNpcIndex = CreateNpc(strBossName[nPos3], strBossName[nPos3], szBossMapID[nPos3], szBossMapX[nPos3], szBossMapY[nPos3])
	--SetNpcLifeTime(nNpcIndex, 1800)
	--SetNpcScript(nNpcIndex, strBossScript[nPos3])
end;
--********************************************太虚首饰任务创建刘铁匠************************************
function taixujwl_liu_crt()
--============================变量定义区======================
local lingbao_map_ID = 218					--灵宝山的地图ID
local taixu_jwl_hammer_date_glbID = 507		--服务器物品使用序号
local taixu_liu_killed_date_glbID = 508		--刘铁匠被杀日期序号
local taixu_jwl_liu_crt_att_glbID_srt = 511	--记录坐标的世界变量开始位置
local taixu_jwl_liu_crt_att_glbID_end = 550	--记录坐标的时间变量结束位置
--============================脚本主逻辑区域====================
local glb_use_date_seq = GetGlbValue(taixu_jwl_hammer_date_glbID)
local att_seq_random = 0					--随机取得的坐标
	if glb_use_date_seq ~= zgc_pub_day_turn(1) then		--没有人使用莫三的铁锤的情况
		return
	else									--有人使用铁锤，随机取得地图坐标
		if (zgc_pub_day_turn(1) - GetGlbValue(taixu_liu_killed_date_glbID)) <= 1 then		--判断昨天是否已经创建过了刘铁匠
			return
		else								--符合条件就开始创建
			for i = taixu_jwl_liu_crt_att_glbID_srt,taixu_jwl_liu_crt_att_glbID_end do
				local GlbDate = GetGlbValue(i)
				if GlbDate == 0 or GlbDate == nil then
					att_seq_random = random(taixu_jwl_liu_crt_att_glbID_srt,(i-1))
					break
				end
			end
		end
	end
	--取得存储的数据
	local att_inf_save = GetGlbValue(att_seq_random)
	if att_inf_save == 0 or att_inf_save == nil then
		return
	end
	--数据转换
	local att_X = floor(att_inf_save/10000)		--X坐标
	local att_Y = att_inf_save - (att_X * 10000)
	local npc_index = CreateNpc("Th� r蘮 L璾","Th� r蘮 L璾",218,att_X,att_Y,-1,1,0,0)
	SetNpcScript(npc_index,"\\script\\task\\taixu_jwl_up\\taixu_liu_ondeath.lua")
	SetNpcLifeTime(npc_index,7200)
	Msg2SubWorld("Th� r蘮 L璾  xu蕋 hi謓 � Linh B秓 s琻!")
end
--********************************************西北区任务创建Npc****************************************
Drug_grass_coordinate = {	--药人草坐标
	{510,1585,2854},
	{510,1566,2880},
	{510,1557,2925},
	{510,1519,2877},
	{510,1507,2832},
	{510,1503,2787},
	{510,1536,2767},
	{510,1534,2821},
	{510,1476,2925},
	{510,1426,2914},
	{510,1469,2852},
	{510,1442,2764},
	{510,1414,2813},
	{510,1379,2856},
	{510,1344,2833},
	{510,1378,2785},
	{510,1288,2922},
	{510,1370,2923},
	{510,1322,2995},
	{510,1290,3057},
	{510,1332,3089},
	{510,1304,3168},
	{510,1574,2999},
	{510,1549,3042},
	{510,1549,3099},
	{510,1523,3085},
	{510,1514,3135},
	{510,1520,3206},
	{510,1415,3048},
	{510,1415,3114},
	{510,1381,3135},
	{510,1375,3185},
	{510,1414,3182},
	{510,1470,3088},
	{510,1516,2983},
}
Sun_bank_info = {			--烈阳根的信息
	{"T輈h Dng c╪ h錸g","\\script\\西北区\\沙漠迷宫\\npc\\红烈阳根.lua"},
	{"T輈h Dng c╪ ho祅g","\\script\\西北区\\沙漠迷宫\\npc\\黄烈阳根.lua"},
	{"T輈h Dng c╪ kh玦","\\script\\西北区\\沙漠迷宫\\npc\\灰烈阳根.lua"}
}
Sun_bank_coordinate ={		--烈阳根坐标
	{506,1440,2658},
	{506,1475,2659},
	{506,1363,2666},
	{506,1314,2667},
	{506,1252,2681},
	{506,1304,2722},
	{506,1295,2779},
	{506,1246,2712},
	{506,1274,2816},
	{506,1347,2742},
	{506,1347,2864},
	{506,1258,2852},
	{506,1249,2956},
	{506,1293,2922},
	{506,1255,3036},
	{506,1306,3021},
	{506,1325,3089},
	{506,1252,3142},
	{506,1330,3124},
	{506,1398,3136},
	{506,1405,3070},
	{506,1441,3156},
	{506,1562,3131},
	{506,1502,3075},
	{506,1450,3036},
	{506,1384,3016},
	{506,1410,2924},
	{506,1489,2932},
	{506,1545,3025},
	{506,1567,2910},
	{506,1534,2918},
	{506,1551,3020},
	{506,1549,2841},
	{506,1516,2870},
	{506,1454,2814},
	{506,1407,2856},
	{506,1457,2750},
	{506,1530,2712},
	{506,1390,2805},
	{506,1420,2772},
	{506,1614,2695},
	{506,1489,2698},
	{506,1525,2669},
	{506,1558,2662},
	{506,1447,2873},
	{506,1536,3146},
	{506,1547,3090},
	{506,1335,3153},
	{506,1474,2895},
	{506,1385,2748},
}
function north_west_task()

	local npc_index = 0
	--创建要人草
	for i = 1,getn(Drug_grass_coordinate) do
		npc_index = CreateNpc("Dc Nh﹏ Th秓","Dc Nh﹏ Th秓",Drug_grass_coordinate[i][1],Drug_grass_coordinate[i][2],Drug_grass_coordinate[i][3])
		SetNpcLifeTime(npc_index,1500);
		SetNpcScript(npc_index,"\\script\\西北区\\药王洞\\npc\\药人草.lua")
	end
	--创建烈阳根
	local sun_bank_diff = 0
	for i = 1,getn(Sun_bank_coordinate) do
		sun_bank_diff =( mod(i,3)+1)
		npc_index = CreateNpc(Sun_bank_info[sun_bank_diff][1],"T輈h Dng c╪",Sun_bank_coordinate[i][1],Sun_bank_coordinate[i][2],Sun_bank_coordinate[i][3])
		SetNpcLifeTime(npc_index,1500);
		SetNpcScript(npc_index,Sun_bank_info[sun_bank_diff][2])
	end
end
--月亮兔活动
function abluemoon_start(nMapID)
	print("gmscript >> abluemoon_start::ran");
	abluemoon_init(nMapID)
end
-- 更新战场军功排名
function ReBattleBulidRank()
	ReBuildBattleData(5, 5)
end

-- 更新攻城战攻城双方数据
function ReApplyCityWarADData(nType, nFlag)
	ApplyCityWarData(nType, nFlag)
end

-- 增加可以提取属性的装备
function AddItemL(a,b,c,d,e,l1,atr1,l2,atr2,l3,atr3)
	if d == nil then d = 1 end
	if e == nil then e = 1 end
	if l1 == nil then l1 = -1 end
	if atr1 == nil then atr1 = -1 end
	if l2 == nil then l2 = -1 end
	if atr2 == nil then atr2 = -1 end
	if l3 == nil then l3 = -1 end
	if atr3 == nil then atr3 = -1 end
	local flag,idx = AddItem(a,b,c,d,e,l1,atr1,l2,atr2,l3,atr3)
	SetEquipCanChouQu(idx, 1)
end

-- 比武大会排名后通知GS
function ReApplyGestRank()
	ApplyBWRankInfo()
end

--比武大会开始配对
--建议以后Relay回调执行的函数采用这种方法以避免不同头文件之间的常量冲突
function biwudahuiqianzou_init()
	dofile("script/biwudahui/tournament/callback_function.lua");
end;

--圣火传递传递活动初始化
function shenghuochuandi_init(nType)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20200804 then
		if nType == 1 then
			Msg2Global("Ho箃 ng rc 畊鑓 b総 u l骳 20:00, nh鱪g ngi tham gia d鵤 theo ch� th� c馻 quy襫 tham gia, chu萵 b� rc 畊鑓.");
		elseif nType == 2 then
			SetGlbValue(200,1);
			Msg2Global("Ho箃 ng rc 畊鑓 ch輓h th鴆 b総 u, khi 畊鑓 chuy觧 n l� b総 u rc, nh鱪g ngi ch璦 n lt th� s絥 s祅g, nh鱪g ngi c� v� chu萵 b� c� v�.");
		elseif nType == 3 then
			SetGlbValue(200,0);
			Msg2Global("Ho箃 ng rc 畊鑓  th祅h c玭g m� m穘, c竚 琻 m鋓 ngi  tham gia, ch髇g ta c飊g ch骳 m鮪g th祅h c玭g n祔.");
			if GetTask(547) ~= 0 then
				Msg2Player("Trong 2 ph髏 nh蕁 Уi 畊鑓 tng 鴑g  nh薾 ph莕 thng cu鑙.")
			end
		elseif nType == 4 then
			dofile("script/online/aoyun08/aoyun_init.lua");
		end
	end
end

function AddItemOnce(a,b,c,d,e)
	if GetItemCount(a,b,c) < 1 then
		AddItem(a,b,c,d,e)
	end
end

function MikeDai2(route)
	local nRoute = tonumber(route)

	local nSkillStartID, nSkillEndID
	if nRoute == 2 then        --少林俗家
		AddItemOnce(0, 3, 53, 1, 1)   -- 加刀
		AddItemOnce(0, 5, 27, 1, 1)   -- 加棍
		nSkillStartID	= 21
		nSkillEndID	= 31
	elseif nRoute == 3  then   --少林禅宗
		AddItemOnce(0, 8, 86, 1, 1)   -- 加杖
		nSkillStartID	= 45
		nSkillEndID	= 56
	elseif nRoute == 4  then   --少林武宗
		AddItemOnce(0, 0, 1, 1, 1)    -- 加拳套
		nSkillStartID	= 33
		nSkillEndID	= 43
	elseif nRoute == 6  then   --唐门
		AddItemOnce(0, 1, 40, 1, 1)   -- 加暗器囊
		AddItemOnce(2, 11, 0, 1000, 1)-- 加暗器
		AddItemOnce(2, 3, 6, 500, 1)  -- 加机关
		nSkillStartID	= 58
		nSkillEndID	= 73
	elseif nRoute == 8  then   --峨嵋佛家
		AddItemOnce(0, 2, 14, 1, 1)   -- 加剑
		nSkillStartID	= 75
		nSkillEndID	= 88
	elseif nRoute == 9  then   --峨嵋俗家
		AddItemOnce(0, 10, 64, 1, 1)  -- 加琴
		nSkillStartID	= 90
		nSkillEndID	= 101
	elseif nRoute == 11 then   --丐帮净衣
		AddItemOnce(0, 0, 1, 1, 1)    -- 加拳套
		nSkillStartID	= 103
		nSkillEndID	= 112
	elseif nRoute == 12 then   --丐帮污衣
		AddItemOnce(0, 5, 27, 1, 1)   -- 加棍
		nSkillStartID	= 114
		nSkillEndID	= 123
	elseif nRoute == 14 then   --武当道家
		AddItemOnce(0, 2, 14, 1, 1)   -- 加剑
		nSkillStartID	= 125
		nSkillEndID	= 145
	elseif nRoute == 15 then   --武当俗家
		AddItemOnce(0, 9, 75, 1, 1)   -- 加笔
		nSkillStartID	= 147
		nSkillEndID	= 158
	elseif nRoute == 17 then   --杨门枪骑
		AddItemOnce(0, 6, 97, 1, 1)   -- 加枪
		nSkillStartID	= 720
		nSkillEndID	= 731
	elseif nRoute == 18 then   --杨门弓骑
		AddItemOnce(0, 4, 108, 1, 1)  -- 加弓
		nSkillStartID	= 733
		nSkillEndID	= 744
	elseif nRoute == 20 then   --五毒邪侠
		AddItemOnce(0, 7, 1, 1, 1)    -- 加双刀
		nSkillStartID	= 364
		nSkillEndID	= 377
	elseif nRoute == 21 then   --五毒蛊师
		AddItemOnce(0, 11, 1, 1, 1)   -- 加爪
		nSkillStartID	= 347
		nSkillEndID	= 363
	else
		return
	end

	for nSkillID = nSkillStartID, nSkillEndID, 1
	do
		LearnSkill(nSkillID)
		while LevelUpSkill(nSkillID) == 1
		do
		end
	end

	SetPlayerRoute(nRoute)

	SetLevel(99,22222 * 5)

	SetStrength(22222)
	SetDexterity(22222)
	SetVitality(22222)
	SetEnergy(22222)
	SetObserve(22222)

	RestoreAll()

	AddItemOnce(0, 105, 1,  1, 1)	-- 加马
end
function create_lanhua_boss_viet(nIndex)
	print("gmscript >> create_lanhua_boss_viet::ran");
	local nWeek = tonumber(date("%w"))
	local nHour = tonumber(date("%H"))
	if (nWeek >= 1 and nWeek <= 4 and nHour == 18) or nHour == 22 then
		return
	end
	local tbMapID = 
		{
			{606,1219,3129,"T礽 nguy猲 chi課"},
			{606,1295,3111,"T礽 nguy猲 chi課"},
			{606,1229,3053,"T礽 nguy猲 chi課"},
			{606,1398,2948,"T礽 nguy猲 chi課"},
		}
	local nNpcIndex = CreateNpc("lanhua_viet","Lan Hoa",tbMapID[nIndex][1],tbMapID[nIndex][2],tbMapID[nIndex][3])
	SetNpcScript(nNpcIndex,"\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")
	SetNpcLifeTime(nNpcIndex,3*60*60)
	nNpcIndex = CreateNpc("yingzi_viet","Anh T�",tbMapID[nIndex][1],tbMapID[nIndex][2],tbMapID[nIndex][3])
	SetNpcScript(nNpcIndex,"\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")
	SetNpcLifeTime(nNpcIndex,3*60*60)
	if SubWorldID2Idx(tbMapID[nIndex][1]) > 0 then
		Msg2Global("C� ngi nh譶 th蕐 Lan Hoa v� Anh T� xu蕋 hi謓 t筰 "..tbMapID[nIndex][4])
	end
end

function create_npcs(nDay)
	--if tonumber(date("%H")) == 0 or tonumber(date("%H")) == 1 or tonumber(date("%H")) == 22 or tonumber(date("%H")) == 23 then
	--		return
	--	end
	
	local	t_denglong_sets = {
		[0] = {"Thi誹 L﹎", {204, 1526, 3269}},--星期日
		[1] = {"Nga My", {303, 1552, 3232}},--星期一
		[2] = {"Л阯g M玭", {305, 1530, 2921}},--星期二
		[3] = {"C竔 Bang", {209, 1515, 3265}},--星期三
		[4] = {"V� ng", {312, 1707, 3477}},--星期四
		[5] = {"Ng� чc", {407, 1555, 3286}},--星期五
		[6] = {"Dng M玭", {219, 1655, 3301}},--星期六
	};
	local nDate = tonumber(date("%y%m%d"));
--	if nDate > 091206 or nDate < 091106 then
--		return 0;
--	end
	local nNpcIndex = 0;
	local nNpcLifeTime = 57 * 60;--因为systemtimetask.txt里面有些整点的时间已经被占用，所以被迫微调几分钟时间
	nNpcIndex = CreateNpc("L� nng b竛h", "L� Nng", gf_UnPack(t_denglong_sets[nDay][2]));
	SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\2\\npc_zoujundenglong.lua");
	AddUnitStates(nNpcIndex, 6, GetTime());--记录NPC创建的时间
	AddGlobalNews("Y課 ti謈 Th辴 Nng 頲 chi猽 i t筰 ["..t_denglong_sets[nDay][1].."]. M阨 ng o n tham d�!");
end

function call_faction_boss(nTime)	
	-- do return end
	local tBossMapPos = {
										[0] = {"Thi誹 L﹎", {204, 1526, 3269}},
										[1] = {"Nga My", {303, 1554, 3235}},
										[2] = {"Л阯g M玭", {305, 1530, 2921}},
										[3] = {"C竔 Bang", {209, 1515, 3265}},
										[4] = {"V� ng", {312, 1707, 3477}},
										[5] = {"Ng� чc", {407, 1555, 3286}},
										[6] = {"Dng M玭", {219, 1655, 3301}},
									}
	local nDay = tonumber(date("%w"));
	local msg = "C� ngi th蕐 c竎 cao th� m玭 ph竔  xu蕋 hi謓 t筰 "..tBossMapPos[nDay][1]..", c竎 v� b籲g h鱱 h穣 mau n t� th�!"
	-- AddGlobalNews(msg)
	AddGlobalNews(msg,1)
	SetGlbValue(GLB_TSK_BOSS,0)
	call_faction_boss_new(nTime,tBossMapPos[nDay][2][1],tBossMapPos[nDay][2][2],tBossMapPos[nDay][2][3])
end

function call_niansou()
	local	t_niansou_set = {
		[0] = {"Thi誹 L﹎", {204, 1526, 3269}},--星期日
		[1] = {"Nga My", {303, 1552, 3232}},--星期一
		[2] = {"Л阯g M玭", {305, 1530, 2921}},--星期二
		[3] = {"C竔 Bang", {209, 1515, 3265}},--星期三
		[4] = {"V� ng", {312, 1707, 3477}},--星期四
		[5] = {"Ng� чc", {407, 1555, 3286}},--星期五
		[6] = {"Dng M玭", {219, 1655, 3301}},--星期六
	};
	local nDate = tonumber(date("%y%m%d"));
	local nDay = tonumber(date("%w"));
--	if nDate > 100228 or nDate < 100129 then
--		return 0;
--	end
	
	-- if nTime == 2 and nDay ~= 0 and nDay ~= 6 then
	
	local nTime = tonumber ( date ("%H") )
	if (nTime >= 0 and nTime <= 7 ) or ( nTime >= 22 and nTime <= 24 ) then
		return 0;
	end	
	
	local nNpcIndex = 0;
	local nNpcLifeTime = 30 * 60;  --------------
	nNpcIndex = CreateNpc("Чi Ni猲 Th�", "Ni猲 Th�", gf_UnPack(t_niansou_set[nDay][2]));
	SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
	SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\2\\death_niansou.lua");	
	local szMsg = "C� ngi th蕐 Ni猲 Th� xu蕋 hi謓 t筰 ["..t_niansou_set[nDay][1].."]. C竎 v� b籲g h鱱 h穣 mau thu ph鬰!"
	-- AddGlobalNews(szMsg);
	AddGlobalNews(szMsg,1)
	Msg2Global(szMsg)
end

--初始化日常任务
function InitDaliyTask(nPersonalTask, nTeamTask)
    local szFileName = "\\script\\gmscript.lua";
    if DAILY_TASK_0912_SWITCH == 1 then
        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, nPersonalTask);
        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, nTeamTask);
        if SubWorldID2Idx(100) >= 0 then --只一台服务器写入共享库就可以了
            local nOldIndex = PlayerIndex;
            PlayerIndex = FirstPlayer();
            AddRelayShareData("richangrenwu_type", 0, 0, szFileName, "nothing", 0, "type", "dd", nPersonalTask, nTeamTask);
            PlayerIndex = nOldIndex;
        end
    end
end
function conf_res_protect_info()
	local Tb_conf_res_protect_info = {
		--{100,"泉州的“资源保护任务”已经开始！"},
		{300,"Nhi謒 v� b秓 h� T礽 nguy猲 � Th祅h Й  b総 u"},
		--{350,"襄阳的“资源保护任务”已经开始！"},
	}
	if Zgc_pub_week_day() ~= 3 then
		return
	end
	for i = 1 ,getn(Tb_conf_res_protect_info) do
		local city_belog_name = GetCityWarInfo(Tb_conf_res_protect_info[i][1],"base")
		--判断本城是否被占领
		if city_belog_name ~= "" or city_belog_name ~= nil then
			Msg2SubWorld(Tb_conf_res_protect_info[i][2])
			AddGlobalNews(Tb_conf_res_protect_info[i][2])
		end
	end
end
--function GmAddGenuineQi(nValue)
--	ActivityAwardGenuineQiDaily(nValue)
--end
--
--function GmAddGenuineQiByType(nType, nValue)
--	AwardGenuineQiByType(nValue, nType)
--end

--function GmAddGenuineQiActivity(nValue)
--	return ActivityAwardGenuineQiDaily(nValue)
--end
--
--function GmGetGenuineQiCapacityActivity()
--	return ActivityGetDailyGenuineQiLeftCapacity()
--end
--
--function GmGetGenuineQiActivity()
--	return ActivityGetDailyAwardGenuineQi()
--end
--
--function GmAddGenuineQiIB(nValue)
--	return IBAwardGenuineQiDaily(nValue)
--end
--
--function GmGetGenuineQiCapacityIB()
--	return IBGetDailyGenuineQiLeftCapacity()
--end
--
--function GmGetGenuineQiIB()
--	return IBGetDailyAwardGenuineQi()
--end

--梁山boss
function Create_LSB_BOSS(nRand)
	--print("Create_LSB_BOSS",nRand);
	if LSB_IsActivityOpen() ~= 1 then
		return 0;
	end
	if nRand == 1 then
		--刷龙门镇
		ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_CallBoos_Relay_LM");
	elseif nRand == 2 then
		--刷凤翔府北
		ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_CallBoos_Relay_FB");
	elseif nRand == 3 then
		--刷凤翔府南
		ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_CallBoos_Relay_FN");
	end
end

--奥运幸运数字生成
function Relay_Generate_LuckNum()
	dofile("script/online/olympic/oly_relaycall.lua");
end


--奥运活动清理
function Relay_Clean_Data()
	dofile("script/online/olympic/oly_relay_clean.lua");
end

--激战千寻塔黄金BOSS
function Qht_Relay_Create_Gold_boss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d"));
	SendScript2VM("\\script\\online\\qianhe_tower\\qht_head.lua", format("qht_relay_create_gold_boss(%d)", tonumber(nRandomSeed)));	
end

--激战千寻塔定时数据清理
function Qht_Relay_Clean()
	dofile("script/online/qianhe_tower/qht_relay_call.lua")
end

--追回大字帖大作战
function Dzt_CreateBoss()
	dofile("script/online/dazitie/dzt_relay.lua")
end

function Dzt_Close()
	dofile("script/online/dazitie/dzt_relay_close.lua");
end

--跨服存盘
function exgsvr_SavePlayerTasks()
	exgsvr_func_save_player_task()
end

--新门派活动字卡BOSS
function Cc_CreateBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d"));
	SendScript2VM("\\script\\online\\collect_card\\cc_relay_call.lua", format("cc_Relay_Callboss(%d)", tonumber(nRandomSeed)));	
end

--年兽刷新
function sp_CreateNianShou(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d"));
	SendScript2VM("\\script\\online\\spring2014\\sp_head.lua", format("sp_RealyCreateNianShou(%d)", tonumber(nRandomSeed)));	
end

-- 比武大会排名后通知GS
function ReApplyGestRank()
	print("ReApplyGestRank... i h閕 t� v�")
	ApplyBWRankInfo()
end

--比武大会开始配对
--建议以后Relay回调执行的函数采用这种方法以避免不同头文件之间的常量冲突
function biwudahuiqianzou_init()
	SendScript2VM("\\script\\biwudahui\\tournament\\callback_function.lua", "callback_open_biwudahui()");
end;

--世界BOSS
function wb_CreateBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\function\\world_boss\\wb_head.lua", format("wb_RelayCallCreateBoss(%d)", tonumber(nRandomSeed)));	
end

--中秋花灯
function hd_CallNpc(nRandomSeed)
	print("gmscript >> hd_CallNpc (hoa ng)");
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online_activites\\201409\\huadeng.lua", format("hd_CreateLantern(%d)", tonumber(nRandomSeed)));	
end

--黑道具补偿
function ibc_CallBoss(nRandomSeed)
	print("gmscript >> ibc_CallBoss (n b�)");
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online\\item_buchang\\ibc_head.lua", format("ibc_RelayCallBoss(%d)", tonumber(nRandomSeed)));	
end

--寒冰巫女
function oly_hanbingwunv(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online\\olympic\\npc\\hanbinwunv.lua", format("call_hanbingwunv(%d)", tonumber(nRandomSeed)));	
end

--新年BOSS
function Yb_CreateBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online_activites\\201502\\year_boss.lua", format("yb_RelayCallBoss(%d)", tonumber(nRandomSeed)));	
end

function Ws_CreateWushiNpc(nRandomSeed)
	do return 0 end
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online_activites\\201502\\wushi.lua", format("Ws_RelayCallNpc(%d)", tonumber(nRandomSeed)));	
end

function yp_write_data()
	if SubWorldID2Idx(425) ~= -1 then --武林盟服务器
		SendScript2VM("\\script\\missions\\yp\\dhx_npc.lua", "dhx_writeData()")
	end
end

function mooncake_08_viet()
	print("gmscript >> mooncake_08_viet::called");
end;