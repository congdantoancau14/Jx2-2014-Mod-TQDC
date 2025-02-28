Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Include("\\script\\lib\\define.lua")
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\misc\\autocleaner\\autocleaner_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\script\\class\\clause3.lua");
Include("\\settings\\static_script\\lib\\val2str.lua");
Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\mission_award.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--活动产出头文件包含
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\online_activites\\award.lua")
--追回字帖大作战
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\online\\collect_card\\cc_head.lua")
Include("\\script\\online\\award_head.lua")
Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")
Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\npc\\box_tong.lua")
Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\npc\\box_yin.lua")
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
Include("\\script\\function\\honor_tong\\ht_head.lua")

thisFile = "\\settings\\static_script\\missions\\cangjianshanzhuang\\mission.lua";

WJZ_EXP_ADD_RATE = min(VNG_CFG_WJZ_EXP_EXT_ADD_RATE or 0, 2) --经验加成系数
T_ROUTE_CNT_EXP_ADD_RATE = {
	0,0,0,0,0.2,0.4,0.6,1
}
function getRouteCount()
	local tRoute = {}
	local nRouteCnt = 0
	local OldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			local nRoute = GetPlayerRoute();
			if not tRoute[nRoute] then
				tRoute[nRoute] = 1
				nRouteCnt = nRouteCnt + 1
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	return nRouteCnt
end

tbJZMY = {
	name = "V筺 Ki誱 Tr騨g",
	missionID = 57,
	realMapID = 6020,
	dynamicMap = 1,

--以下为missionV变量
	mv1 = 1, --前戏对话
	mv2 = 2, --第1关第几波fish
	mv3 = 3, --第1关fish的剩余数量
	mv4 = 4, --第1关fish的倒计时
	mv5 = 5, --第1关boss是否出现
	mv6 = 6, --第2关第几波fish
	mv7 = 7, --第2关fish的剩余数量
	mv8 = 8, --第2关fish的倒计时
	mv9 = 9, --第2关boss是否出现
	mv10 = 10, --第1关boss是否分身
	mv11 = 11, --第2关boss招小怪
	mv12 = 12, --第3关boss死亡数
	mv13 = 13, --第3关倒计时
	mv14 = 14, --第3关boss技能
	mv15 = 15, --第3关boss技能
	mv16 = 16, --第3关boss技能
	mv17 = 17, --第4关前戏对话
	mv18 = 18, --第4关boss是否分身
	mv19 = 19, --进入前的地图ID
	mv20 = 20, --破除封印的阶段ID
	mv21 = 21, --第三关第四关的计时器
	mv22 = 22, --资源宝箱index
	
	mv_open_jingli_box_flag = 23, --打开精力宝箱标志
	
	mv_wo_shi_daye = 24,--收费箱子开关
	mv_wo_shi_daye_loot_id = 25,--收费箱子奖励ID
	
	mv_route_count = 26,--报名进来的流派个数
	--一些NPC名字
--	szNpc_waiyuanzongguan = "外院总管",
--	szNpc_neiyuanzongguan = "内院总管",
--	szNpc_zhanglao = "藏剑长老",
--	szNpc_xiaojie = "藏剑小姐",
	szNpc_jiangbiehe = "Giang Bi謙 H筩",
	--szNpc_yeziqiu = "叶子丘",
	szNpc_renwoxing = "Nh薽 Ng� H祅h",
	szNpc_renyingying = "Nh薽 Doanh Doanh",

	szNpc_tongling = "Th鑞g l躰h tng binh m�",

	szNpc_jiguanzhu = "C� Quan B祅 Long Tr�",

	szNpc_tianjian = "Thi猲 Ki誱 Di謕 Phong",
	szNpc_dijian = "мa Ki誱 Di謕 B╪g",
	szNpc_renjian = "Nh﹏ Ki誱 Di謕 M閚g",

	szNpc_jiaozhu = "Ki誱 Ma Giang Bi謙 H筩",
	szNpc_mjn = "Ma Ki誱 N�",
}
tbJZMY = gf_CopyInherit(missionHead, tbJZMY);

-------时间控制器-----------------------------------------------
firePhases = {
	timerID = 87,
	maxsecond = 150*60,
};
firePhases = gf_CopyInherit(phaseBase,firePhases)

-----------------------------------------------------------------

-------一些公共数据---------------------------------------------
tNpcs = {
	wrx = {"Ng� Nh﹏ H筺h","Tr薾 Linh","\\settings\\static_script\\missions\\cangjianshanzhuang\\wrx_npc.lua",nil, CampPlayer,0},
	jtyl = {"V筺 Ki誱 Giang Bi謙 H筩","Giang Bi謙 H筩",thisFile,nil,CampPlayer,0},
	qrs = {"V筺 Ki誱 Nh薽 Doanh Doanh", "Nh薽 Doanh Doanh", thisFile, nil, CampPlayer, 0},
	lf = {"V筺 Ki誱 Nh薽 Ng� H祅h", "Nh薽 Ng� H祅h", nil, nil, CampPlayer, 0},
	--yzq = {"叶子丘剑冢", "叶子丘", thisFile, nil, CampPlayer, 0},
	cjzl = {"T鎛g qu秐 T祅g Ki誱90", "Trng L穙 T祅g Ki誱 ", nil, nil, CampPlayer, 0},
	cjxj = {"Чi ti觰 th�90", "Ti觰 Th璗祅g Ki誱", nil, nil, CampPlayer, 0},
	nyzg = {"T鎛g n閕 qu秐90", "T鎛g qu秐 n閕 vi謓", nil, nil, CampPlayer, 0},
	wyzg = {"T鎛g ngo筰 qu秐90", "T鎛g qu秐 ngo筰 vi謓", nil, nil, CampPlayer, 0},

	cyfy = {"g Tr�", "Thng g Phong 蕁 ", nil, nil, CampEnemy, 0},
	qlfy = {"Long Tr�", "Thanh Long Phong 蕁", nil, nil, CampEnemy, 0},
	hffy = {"Phng Tr�", "H醓 Phng Phong 蕁", nil, nil, CampEnemy, 0},
	bhfy = {"H� Tr�", "B筩h H� Phong 蕁", nil, nil, CampEnemy, 0},
	yl = {"pozhenying", "g Linh", nil, nil, CampPlayer, 0},
	ll = {"pozhenlong", "Long Linh", nil, nil, CampPlayer, 0},
	fl = {"pozhenfeng", "Phng Linh", nil, nil, CampPlayer, 0},
	hl = {"pozhenhu", "H� Linh", nil, nil, CampPlayer, 0},

	boss1 = {"V筺 Ki誱 Binh M� Th鑞g L躰h","Th鑞g l躰h tng binh m�", thisFile, nil, CampEnemy, 0},
	boss2 = {"C� Quan B祅 Long Tr�","C� Quan B祅 Long Tr�", thisFile, nil, CampEnemy, 0},
	boss3 = {"Thi猲 Ki誱 Di謕 Phong","Thi猲 Ki誱 Di謕 Phong", thisFile, nil, CampEnemy, 0},
	boss4 = {"мa Ki誱 Di謕 B╪g","мa Ki誱 Di謕 B╪g", thisFile, nil, CampEnemy, 0},
	boss5 = {"Nh﹏ Ki誱 Di謕 M閚g","Nh﹏ Ki誱 Di謕 M閚g", thisFile, nil, CampEnemy, 0},
	boss6 = {"Ki誱 Ma Giang Bi謙 H筩","Ki誱 Ma Giang Bi謙 H筩", nil, nil, CampEnemy, 0},--红印教主
	boss7 = {"V筺 Ki誱 Ma Ki誱 N�","Ma Ki誱 N�", thisFile, nil, CampEnemy, 0},--
};

tPos = {
	wrx = {{1760,3234}},
	jtyl = {{1688,3161}},
	qrs = {{1696,3151}},
	lf = {{1694,3156}},
--	yzq = {{1701,3163}},
--	cjzl = {{1679,3150}},
--	cjxj = {{1683,3146}},
--	nyzg = {{1683,3146}},
--	wyzg = {{1672,3125}},

	boss1 = {{1682,3134}},
	boss2 = {{1698,3160}},
	boss3 = {{1688,3166}},
	boss4 = {{1701,3149}},
	boss5 = {{1700,3163}},
	boss6 = {{1679, 3139}},
	boss7 = {{1699, 3164}},

	cyfy = {{1704, 3145}},
	qlfy = {{1679, 3170}},
	hffy = {{1704, 3195}},
	bhfy = {{1730, 3170}},
	yl = {{1695, 3159}, {1704, 3145}},
	ll = {{1695, 3159}, {1679, 3170}},
	fl = {{1695, 3159}, {1704, 3195}},
	hl = {{1695, 3159}, {1730, 3170}},
};

--封印NPC信息
t_stand_npc =
{
	{npc = tNpcs.cyfy, pos = tPos.cyfy, disp_effect = {913, 0, 1, 4}},
	{npc = tNpcs.qlfy, pos = tPos.qlfy, disp_effect = {913, 0, 1, 4}},
	{npc = tNpcs.hffy, pos = tPos.hffy, disp_effect = {913, 0, 1, 4}},
	{npc = tNpcs.bhfy, pos = tPos.bhfy, disp_effect = {913, 0, 1, 4}},
}
t_move_npc =
{
	{npc = tNpcs.yl, pos = tPos.yl, move_effect = {957, 0, 1}},
	{npc = tNpcs.ll, pos = tPos.ll, move_effect = {956, 0, 1}},
	{npc = tNpcs.fl, pos = tPos.fl, move_effect = {958, 0, 1}},
	{npc = tNpcs.hl, pos = tPos.hl, move_effect = {955, 0, 1}},
}

--闯关失败后的位置
tFildPos = {
	{1696, 3158},{1696, 3158},{1696, 3158},{1693, 3139},
};

tRealGod	= {
	tInfo	= {"T╪g cng n╪g l鵦 ", 5, "Duy tr� %d ph髏"},
	tBuff	= {
		[2] = {200,4,0,0,0,4},
		[3] = {100,0,0,4,0,4},
		[4] = {100,0,4,4,0,0},
		[6] = {150,4,4,0,0,0},
		[8] = {100,0,0,4,0,4},
		[9] = {150,0,4,4,0,0},
		[11] = {200,4,0,0,0,4},
		[12] = {150,0,4,0,4,0},
		[14] = {100,0,0,4,4,0},
		[15] = {150,0,4,0,4,0},
		[17] = {200,4,0,0,0,4},
		[18] = {200,4,4,0,0,0},
		[20] = {150,4,4,0,0,0},
		[21] = {100,0,0,4,4,0},
		[23] = {100,0,0,4,4,0},
		[25] = {200,4,0,0,0,4},
		[26] = {150,0,4,0,4,0},
		[27] = {100,0,4,4,0,0},
		[29] = {150,4,4,0,0,0},
		[30] = {150,0,0,0,4,4},
	},
	tState = {
		[1] = {9923, "state_life_max_point_add",	"T╪g 甶觤 sinh l鵦"},
		[2] = {9924, "state_add_strength",	"S鴆 m筺g t╪g"},
		[3] = {9925, "state_add_dexterity",	"Th﹏ ph竝 t╪g"},
		[4] = {9926, "state_add_energy",		"N閕 c玭g t╪g "},
		[5] = {9927, "state_add_observe",		"Linh ho箃 t╪g"},
		[6] = {9928, "state_add_vitality",	"G﹏ c鑤 t╪g"},
	},
}

--npc缓存表
tNpcInfo = {
--	[65537] = {
--			[8000] = "秋若水",
--
--
--		},
};
-------------------------------------------------------------------

------------------------一些公共函数------------------------------
function ttd_removeNpc(nNpcIdx)
	SetNpcLifeTime(nNpcIdx,0);
	local m = this.msPosition:getMapID();
	if tNpcInfo[m][nNpcIdx] then
		tNpcInfo[m][nNpcIdx] = nil;
	end
end

function ttd_clearMapNpc(m)
	ClearMapNpc(m);
	if tNpcInfo[m] then
		tNpcInfo[m] = {};
	end
	--没人了，把mission关了
	if GetMSPlayerCount(tbJZMY.missionID) == 0 then
		CloseMission(tbJZMY.missionID);
	end
end

function ttd_createNpc(model, name, m, x, y)
	local m = this.msPosition:getMapID();
	local nNpcIdx = CreateNpc(model, name, m, x, y);
	if tNpcInfo[m] then
		tNpcInfo[m][nNpcIdx] = name;
	else
		tNpcInfo[m] = {};
		tNpcInfo[m][nNpcIdx] = name;
	end
--	if self.DEBUG == 1 then
--		gf_PrintTable(tNpcInfo,2);
--	end
--	print(format("***************ttd_createNpc(%s,%s)=%d",model, name, nNpcIdx))
	return nNpcIdx;
end

function ttd_createSomeNpc(npc, pos, way, nAiType)
	local model, name = npc[1], npc[2];
	local m = this.msPosition:getMapID();
--	print("ttd_createSomeNpc",m)
	local newnpc = 0;
	if type(pos[1]) ~= "table" then
		pos = {pos};
	end
	for i = 1, getn(pos) do
		local x, y = pos[i][1], pos[i][2];
		newnpc = ttd_createNpc(model, name, m, x, y);
		if npc[3] then
			SetNpcScript(newnpc, npc[3]);
		end
		if npc[4] then
			SetNpcLifeTime(newnpc, npc[4]);
		end
		if npc[5] then
			SetCampToNpc(newnpc, npc[5]);
		end
		if npc[6] then
			SetNpcDir(newnpc, npc[6]);
		end
		if npc[7] then
			SetNpcRemoveScript(newnpc, npc[7]);
		end
		SetNpcActivator(newnpc);
		if way then
			nAiType = nAiType or AT_SM_ATTACK;
			g_NpcAI:setAI(newnpc, nAiType);
			g_NpcAI:setWayPoint(newnpc, way);
		end
	end
	return newnpc;
end

function ttd_ChangeNpc2Talk(nNpcIDX)
	AddUnitStates(nNpcIDX, 7, 0);
	AddUnitStates(nNpcIDX, 8, -1000); --视野变0，为了防止对话npc乱动！这样做行不行啊！？
	ChangeNpcToFight(nNpcIDX, 0, 6);
end

function ttd_ChangeNpc2Fight(nNpcIDX)
	AddUnitStates(nNpcIDX, 7, 3);
	AddUnitStates(nNpcIDX, 8, 1000); --视野变回去，仅适用于此关卡，后人勿乱用
	ChangeNpcToFight(nNpcIDX, 3, 0);
end

function ttd_findNpc(npcName,bForceNpcInfo)
	local m = this.msPosition:getMapID();
	if tNpcInfo[m] then
		local nNpcIDX = 0;
		for i,v in tNpcInfo[m] do
			if v == npcName then
				local strIDXName = GetNpcName(i); --再次确定此IDX的npc名字是不是要找的NPC
				if strIDXName == npcName then
					return i;
				end
			end
		end
	end
	--强制还缓存找没找到，返回0
	if bForceNpcInfo then
		return 0
	end
	--没在缓存里找到就全地图找
	local tNpcs = GetMapNpcIdx(m);
	if tNpcs == nil then
		return 0;
	end
	for i = 1, getn(tNpcs) do
		local nNpcIDX = tNpcs[i];
		if GetNpcName(nNpcIDX) == npcName then
			return nNpcIDX;
		end
	end
	return 0;
end
function ttd_findAllNpc(npcName)
	local npcs = {}
	local m = this.msPosition:getMapID();
	if tNpcInfo[m] then
		local nNpcIDX = 0;
		for i,v in tNpcInfo[m] do
			if v == npcName then
				local strIDXName = GetNpcName(i); --再次确定此IDX的npc名字是不是要找的NPC
				if strIDXName == npcName then
					tinsert(npcs,i);
				end
			end
		end
	end
	if getn(npcs) ~= 0 then
		return npcs;
	end
	--没在缓存里找到就全地图找
	local tNpcs = GetMapNpcIdx(m);
	for i = 1, getn(tNpcs) do
		local nNpcIDX = tNpcs[i];
		if GetNpcName(nNpcIDX) == npcName then
			tinsert(npcs, nNpcIDX);
		end
	end
	return npcs;
end

function ttd_isCaption()
	if PlayerIndex == GetTeamMember(0) then
		return 1;
	end
end

function ttd_reviveAll(nCamp)
	nCamp = nCamp or 0;
	this.msCamp:turnPlayer(nCamp,function ()
		if IsPlayerDeath() ~= 0 or GetLife() <= 1 then
			RevivePlayer(0);
		end
	end)
end

function ttd_setPos(nPosX,nPosY,nMv)
	SetPos(nPosX,nPosY);
	SetFightState(1); --战斗状态 死亡去了吴仁道那里会清战斗状态
--	print(format("SetDeathScript(tbJZMY.szInitDeahScript=%s) %s", thisFile or "", GetName()))
	SetDeathScript(thisFile);	--死亡脚本
	if nMv then
		--作弊状态
		ttd_addGodState();
	end
end

function ttd_findRandomPlayer(x,y)
	this.msCamp:reflash();
	local oldPlayerIdx = PlayerIndex;
	local t = {};
	for i, p in this.msCamp.players do
		PlayerIndex = p;
		local m,x1,y1 = GetWorldPos();
		local d = floor(sqrt((x1-x)^2+(y1-y)^2));
		if d < 40 and IsPlayerDeath() == 0 then
			tinsert(t,p);
		end
	end
	PlayerIndex = oldPlayerIdx;
	local nNum = getn(t);
	if nNum ~= 0 then
		local nRand = random(1,nNum);
		return t[nRand];
	else
		return 0;
	end
end

function ttd_createJTYL(nStage)
	local tJTYLPos = {{1689,3149},{1689,3149},{1689,3149},{1689,3149}};
	local tQrsPos = {{1697,3152},{1697,3152},{1697,3152},{1697,3152}};
	local tLfPos = {{1690,3161},{1690,3161},{1690,3161},{1690,3161}};
	local nCurStage = nStage or GetMissionV(MV_STAGE);
	
	local MAX_STAGE = getn(t_stand_npc)
	if t_stand_npc[nCurStage] then
		local nIdx = ttd_findNpc(t_stand_npc[nCurStage].npc[2], 1)
		if not nIdx or nIdx == 0 then
			for i = nCurStage, MAX_STAGE do
				local nNpcIDX = ttd_createSomeNpc(t_stand_npc[i].npc, t_stand_npc[i].pos);
				ttd_ChangeNpc2Talk(nNpcIDX)
			end
		end
	end
	
	if tJTYLPos[nCurStage] then
		local nNpcIDX = ttd_createSomeNpc(tNpcs.jtyl,tJTYLPos[nCurStage]); --创建剑僮叶量
		ttd_ChangeNpc2Talk(nNpcIDX);
		nNpcIDX = ttd_createSomeNpc(tNpcs.lf,tLfPos[nCurStage]); --创建洛飞
		ttd_ChangeNpc2Talk(nNpcIDX);
		nNpcIDX = ttd_createSomeNpc(tNpcs.qrs,tQrsPos[nCurStage]); --创建秋若水
		ttd_ChangeNpc2Talk(nNpcIDX);
	end
end

--每关开始后创建吴仁杏
function ttd_createWRX()
	ttd_createSomeNpc(tNpcs.wrx,tPos.wrx);
end

--过关了
function ttd_passStage(nStage,strBossName)
	local nCurStage = GetMissionV(MV_STAGE);
	if nCurStage ~= nStage then
		print(format("[ERROR] [ttd_passStage] [nStage=%d, nCurStage=%d]", nStage, nCurStage));
	end
	
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nStage][1],tFildPos[nStage][2]);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	---------------------
	
	--给固定奖励
	--this.msCamp:turnPlayer(0, MissionAward_FixAward,nStage, t_award);
	local get_fix_award = function(nCurStage)
    	local nRouteAddRate = T_ROUTE_CNT_EXP_ADD_RATE[GetMissionV(tbJZMY.mv_route_count)] or 0
    	local tAddRate = {
    		nExpAddRate = (1+nRouteAddRate+GetVipCardParam())*(1 + WJZ_EXP_ADD_RATE),
    	}
    	gf_EventGiveAllAward(tbNormalAward[nCurStage].tbAward,"V筺 Ki誱 Tr騨g",format("WanJianZhong stage award %d",nCurStage),tAddRate);
	end
	this.msCamp:turnPlayer(0, get_fix_award, nCurStage);


	--给箱子
	local nNpcIndex = 0
	if nStage == 4 then
		nNpcIndex = CreateNpc("jinbaoxiang",format("Kim Rng"),m,1699,3163);
		SetNpcScript(nNpcIndex,"\\settings\\static_script\\missions\\cangjianshanzhuang\\head.lua");
	else
		create_box_tong(m,1699,3163,nCurStage)
    	for i=1,4 do
    		create_box_yin(m,1699,3163,nCurStage)
    	end
	end

	
	--drop_jingli_box(nNpcIndex)
	
	--设置进入下一关开关
	SetMissionV(tbJZMY.mv22,nNpcIndex);
	--加入autocleaner
--	local tRequire = ttd_CreateTable();
--	ttd_GiveAward(nStage,tRequire);
	---------------------
	local tCurPhase = firePhases:getPhase();
	if tCurPhase then
		tCurPhase:onFinish();
	end
	--Observer:onEvent(OE_JZMY_PASS_STAGE,nStage);
	--ds_JZMY:AddStatValue(1,4+nStage,1);
	
	--2Xu活动产出
	this.msCamp:turnPlayer(0,extra_wjz_award);
	
	--活动产出
	if nStage == 4 then
		--给奥运圣火
		this.msCamp:turnPlayer(0,oly_AddShengHuo,3,5);
		--激战千寻塔
		this.msCamp:turnPlayer(0,qht_raid_wj_4);
		this.msCamp:turnPlayer(0,dzt_wj_4);
		this.msCamp:turnPlayer(0,function()
			SendScript2VM("\\script\\online_activites\\head\\activity_normal_head.lua", "vaf_award_api('tWanJianZongFinish')");
		end)
	else
		this.msCamp:turnPlayer(0,oly_AddShengHuo,1,5);
		this.msCamp:turnPlayer(0,qht_raid_wj_13);
		this.msCamp:turnPlayer(0,dzt_wj_13);
	end
	
	--新资料片卡牌活动
	this.msCamp:turnPlayer(0,cc_wjz_award,nStage);
	--其他功能获奖励汇总
	this.msCamp:turnPlayer(0,aw_wjz_award,nStage);
	Observer:onTeamEvent(SYSEVENT_WANJIANZHONG_STAGE_FINISH, nStage)
	this.msCamp:turnPlayer(0,ht_GetTongChip,20,1);
end

function ttd_addAllGodState()
	local funAddAllGodState = function()
		ttd_addGodState();
	end;
	this.msCamp:turnPlayer(0, funAddAllGodState);
end

function ttd_cleanAllGodState()
	local funAddAllGodState = function()
		ttd_cleanGodState();
	end;
	this.msCamp:turnPlayer(0, funAddAllGodState);
end

function ttd_cleanGodState()
	local tState = tRealGod.tState;
	for i = 1, getn(tState) do
		RemoveState(tState[i][1]);
	end
end

function ttd_addGodState()
--	ttd_cleanGodState();
--	local tBuff = tRealGod.tBuff;
--	local tState = tRealGod.tState;
--	local nRouteCheck = gf_CheckPlayerRoute();
--	if nRouteCheck ~= 1 then
--		return 0;
--	end
--	local nRoute = GetPlayerRoute();
--	local nLv = GetLevel();
--	for i = 1, getn(tBuff[nRoute]) do
--		local nNum = tBuff[nRoute][i];
--		if nNum ~= 0 and nLv < 80 then
--			local nArg = (80-nLv)*nNum;
--			CastState(tState[i][2], nArg, tRealGod.tInfo[2] * 60 * 18, 1, tState[i][1], 1);
--		end
--	end
--	SyncCustomState(1, tState[1][1], 1, tRealGod.tInfo[1]);
--	Talk(1, "", "你获得<color=yellow>“"..tRealGod.tInfo[1].."”<color>效果：\n<color=green>"..ttd_getGodStateInfo().."<color>");
end

function ttd_getGodStateInfo()
	local strInfo	= "";
	local tState	= tRealGod.tState;
	for i = 1, getn(tState) do
		strInfo = strInfo..tState[i][3]..", ";
	end
--	strInfo = strInfo..format(tRealGod.tInfo[3], tRealGod.tInfo[2]).."。";
	return strInfo;
end

function ttd_askClose()
	if GetMissionV(this.mv22) ~= 0 then
		Say("M� B秓 Rng V筺 Ki誱 Tr騨g m韎 c� th� r阨 秈",1,"\nTa bi誸 r錳/ttd_nothing");
		return 0;
	end
	Say("C� r阨 kh醝 秈 kh玭g? ",
		2,
		"\nX竎 nh薾/ttd_confirmClose",
		"\nK誸 th骳 i tho筰/nothing")
end

function ttd_confirmClose()
	local nCurStage = GetMissionV(MV_STAGE) or 0;
	gf_WriteLogEx("wanjianzhong mission", format("team leave mission at stage %d member count is %d", nCurStage, GetTeamSize()));
	SetMissionV(MV_MISSION_STATUS,1);
	CloseMission(this.missionID);
end

function ttd_ModifyExp(nStage)
	autoclean();
	local nLv = GetLevel();
	local nExp = floor(nLv*nLv*30);
	local nMP = floor(nLv*nLv*0.01);
	gf_Modify("Exp",nExp);
	--MP_MasterAddPoint(nMP);
	if nStage == 4 then
		if GetTask(TASK_JZMY_DAYLY_FINISH) ~= 2 then
			SetTask(TASK_JZMY_DAYLY_FINISH,1);
		end
	end
end

function ttd_CreateTable()
	local tRequire = {};
	for i = 1,8 do
		tinsert(tRequire,{2,97,236,1});
	end
	return tRequire;
end

--function ttd_GiveAward(nStage,tRequire)
--	gf_SetLogCaption("万剑冢");
--	--this.msCamp:turnPlayer(0,ttd_ModifyExp,nStage); --经验
--	MissionAward_FixAward(nStage, t_award)
--	ttd_OpenUi(nStage,tRequire); --翻牌
--	gf_SetLogCaption("");
--end

function ttd_OpenUi(nStage,tRequire)
	local szFunc = format("ttd_CallBack%d", nStage)
	MA_Mission_OpenUI(tbJZMY.missionID,0,"\\settings\\static_script\\missions\\cangjianshanzhuang\\head.lua", szFunc, tRequire);
end

function ttd_giveFactionBook()
	local g,d,p = 0,107,0;
	if _JX2WZ ~= 1 then
		local nRand = random(166,179);
		p = nRand;
	else
		local nRand1 = random(1,2)
		if nRand1 == 1 then
			p = random(166,179);
		else
			p = random(198,203);
		end
	end
	gf_AddItemEx({g,d,p,1},"M藅 t辌h s� m玭 cao c蕄");
	return g,d,p;
end

function ttd_CallBack1(nId)
	_ttd_CallBack_Stage(1, nId)
end
function ttd_CallBack2(nId)
	_ttd_CallBack_Stage(2, nId)
end
function ttd_CallBack3(nId)
	_ttd_CallBack_Stage(3, nId)
end
function ttd_CallBack4(nId)
	_ttd_CallBack_Stage(4, nId)
end

--数据统计回调函数
function _ib_item_stat(g, d, p, n)
	if g == 2 and d == 1 and p == 30369 then--古灵玉
		_stat_when_ib_produce_gulingyu(n)
	elseif g == 0 and d == 107 and p >= 204 and p <= 223 then
		_stat_when_ib_produce_super_book(n)
	end
end

function _ttd_CallBack_Stage(nStage, nId)
	local m = GetWorldPos();
	if m < 65537 then
		SendScript2Client('Open([[ma]])');
		return 0;
	end
	local nRet = MissionAward_RandAward(nStage, nId, t_award, _ib_item_stat);
	
	if nRet == 1 then
		if nId < 8 then
		_stat_when_open_free_card()
	else
		wjz_DailyWeeklyTask(2);  --翻牌任务
		_stat_when_open_ib_card();	
  	end
	end
end

function ttd_AddItemMail(sItemIds, strName, nRoom, nWeight, szTitle)
	if type(sItemIds) ~= "table" then
		WriteLog(format("[%s] [AddItemEx Tham s� sai!] [Role:%s (acc:%s)] [Item:%s]",
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end
	local nCount = sItemIds[4];
	local nAmg = (nCount and 3) or 4;
	if getn(sItemIds) < nAmg then
		WriteLog(format("[%s] [AddItemEx Tham s� sai!] [Role:%s (acc:%s)] [Item:%s]",
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end

	nRoom = nRoom or 1;
	nWeight = nWeight or 10;

	if gf_Judge_Room_Weight(nRoom, nWeight) == 1 then
		local nRet, nItemIdx = 0;
		if sItemIds[5] ~= nil then
			nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount,sItemIds[5],sItemIds[6],sItemIds[7],sItemIds[8],sItemIds[9],sItemIds[10],sItemIds[11],sItemIds[12],sItemIds[13],sItemIds[14]);
		else
			nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount);
		end
		if nRet == 0 then
			WriteLog(format("[%s] [AddItemEx: Th蕋 b筰] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d)]",
				strLog, GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
		elseif nRet == 1 then
			Msg2Player("C竎 h� nh薾 頲 ["..strName.."]x"..nCount);
			WriteLog(format("[%s] [AddItemEx:nh薾 v藅 ph萴] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d)]",
				strLog or "", GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
		elseif nRet == 2 then
			Msg2Player("C竎 h�  r琲["..strName.."]x"..nCount);
			WriteLog(format("[%s] [AddItemEx:nh r琲 ph莕 thng] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d)]",
				strLog, GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
		end
		return nRet, nItemIdx;
	else
		local tMailInfo =
		{
			szTo				= GetName(),
			szFrom			= "V筺 Ki誱 Tr騨g",		-- 32 char
			szTitle			= szTitle or "Nh薾 v藅 ph萴",
			byPRI				= eMAIL_PRI_SUPER,
		};
		local tMailAttachmentInfo =
		{
			{
				nType		= eMAIL_ATTACHMENT_T_TEXT,
				szContent	= "H祅h trang  y kh玭g th� nh薾 v藅 ph萴!",
			},
			{
				nType		= eMAIL_ATTACHMENT_T_SCRIPT,
				szContent	= format("giveTTDAward(%s)",Val2Str_mini(sItemIds)),
			},
		};

		local tMailConditionInfo =
		{
			{
				nType		= eMAIL_CONDIFION_T_TAKEOUT,
				szContent	= format("#gf_Judge_Room_Weight(%d,%d)",nRoom,nWeight),
			},
		};
		nRet, guid = SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
		WriteLog(format("[Mail] [%s] [GGUID:%d from:%s to:%s title:%s] [Con:%s Scr:%s Chk:%s]", (nRet >= 1 and "Success") or "Failed",
			guid, tMailInfo.szFrom, tMailInfo.szTo, tMailInfo.szTitle, tMailAttachmentInfo[1].szContent, "giveTTDAward", "gf_Judge_Room_Weight"));
		return nRet;
	end
end

function ttd_IsAllDeath()
	local oldPlayerIndex = PlayerIndex;
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		--print("gf_GetDistance(1474,2961) =",gf_GetDistance(1474,2961))
		--print("PlayerIndex ,",PlayerIndex);
		local m = this.msPosition:getMapID();
		local CurrMap,nX,nY = GetWorldPos();
		--print("m =",m)
		--print("CurrMap =",CurrMap)
		if m == CurrMap and gf_GetDistance(1766,3232) > 16 then
			if PlayerIndex ~= oldPlayerIndex and IsPlayerDeath() == 0 then
				PlayerIndex = oldPlayerIndex;
--				print("somebody is living")
				return 0;
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
	return 1;
end

--关卡开始的破除封印处理
function ttd_StagePreStart(nStageNo)
	--local nStageNo = GetMissionV(MV_STAGE);
	local MAX_STAGE = getn(t_stand_npc)
	if nStageNo and nStageNo >= 1 and nStageNo <= MAX_STAGE then
		local i = nStageNo
		local nNpcIDX2 = ttd_createSomeNpc(t_move_npc[i].npc, {t_move_npc[i].pos[1]}, {t_move_npc[i].pos[2]}, AT_SM_MOVE);
		--ttd_ChangeNpc2Talk(nNpcIDX2)
		--g_NpcAI:setAI(nNpcIDX2, AT_SM_MOVE);
		--g_NpcAI:setWayPoint(nNpcIDX2, {t_move_npc[i].pos[2]});
		SetCurrentNpcSFX(nNpcIDX2, t_move_npc[i].move_effect[1], t_move_npc[i].move_effect[2], t_move_npc[i].move_effect[3]); --特效
	end

	SetMissionV(tbJZMY.mv20,1)
end

--关卡开始的破除封印处理
function ttd_StagePreMid(nStageNo)
	local nStageNo = GetMissionV(MV_STAGE);
	local MAX_STAGE = getn(t_stand_npc)
	if nStageNo and nStageNo >= 1 and nStageNo <= MAX_STAGE then
		local nNpcIdx = ttd_findNpc(t_move_npc[nStageNo].npc[2]);
		if nNpcIdx ~= 0 then
			ttd_removeNpc(nNpcIdx)
		end

		nNpcIdx = ttd_findNpc(t_stand_npc[nStageNo].npc[2]);
		if nNpcIdx ~= 0 then
			SetCurrentNpcSFX(nNpcIdx, t_stand_npc[nStageNo].disp_effect[1], t_stand_npc[nStageNo].disp_effect[2], t_stand_npc[nStageNo].disp_effect[3]); --特效
		end
	end
	SetMissionV(tbJZMY.mv20,2)
end

--关卡开始的破除封印处理
function ttd_StagePreEnd(nStageNo)
	local nStageNo = GetMissionV(MV_STAGE);
	local MAX_STAGE = getn(t_stand_npc)
	if nStageNo and nStageNo >= 1 and nStageNo <= MAX_STAGE then
		local nNpcIdx = ttd_findNpc(t_stand_npc[nStageNo].npc[2]);
		if nNpcIdx ~= 0 then
			ttd_removeNpc(nNpcIdx)
		end
	end
	SetMissionV(tbJZMY.mv20,0)
end

--每日每周任务
function wjz_DailyWeeklyTask(nType)
	if nType == 1 then
		if tGtTask:check_cur_task(85) == 1 and GetTask(VET_WJZ_DALIY_TASK_CROSS) ~= 1 then
			SetTask(VET_WJZ_DALIY_TASK_CROSS,1);
			Msg2Player(format("Nhi謒 v� ng祔 - th玭g quan V筺 Ki誱 Tr騨g %d/1 l莕 (ho祅 th祅h) ",GetTask(VET_WJZ_DALIY_TASK_CROSS)));
			AddRuntimeStat(4,14,0,1)
		end
		if tGtTask:check_cur_task(86) == 1 and GetTask(VET_WJZ_WEEK_TASK_CROSS) < 7 then
			SetTask(VET_WJZ_WEEK_TASK_CROSS,GetTask(VET_WJZ_WEEK_TASK_CROSS) + 1);
			if GetTask(VET_WJZ_WEEK_TASK_CROSS) == 7 then
				Msg2Player(format("Nhi謒 v� tu莕 - th玭g quan V筺 Ki誱 Tr騨g %d/7 l莕 (ho祅 th祅h) ",GetTask(VET_WJZ_WEEK_TASK_CROSS)));
				AddRuntimeStat(4,16,0,1)
			else
				Msg2Player(format("Nhi謒 v� tu莕 - th玭g quan V筺 Ki誱 Tr騨g %d/7 l莕 ",GetTask(VET_WJZ_WEEK_TASK_CROSS)));
			end
		end
	elseif nType == 2 then
		if tGtTask:check_cur_task(87) == 1 and GetTask(VET_DALIY_TASK_FANPAI) ~= 1 then
			SetTask(VET_DALIY_TASK_FANPAI,1);
			Msg2Player(format("Nhi謒 v� ng祔 - l藅 b礽 thu ph� %d/1 l莕 (ho祅 th祅h)",GetTask(VET_DALIY_TASK_FANPAI)));
			AddRuntimeStat(4,15,0,1)
		end
		if tGtTask:check_cur_task(88) == 1 and GetTask(VET_WEEK_TASK_FANPAI) < 15 then
			SetTask(VET_WEEK_TASK_FANPAI,GetTask(VET_WEEK_TASK_FANPAI) + 1);
			if GetTask(VET_WEEK_TASK_FANPAI) == 15 then
				Msg2Player(format("Nhi謒 v� tu莕 - l藅 b礽 thu ph� %d/15 l莕 (ho祅 th祅h)",GetTask(VET_WEEK_TASK_FANPAI)));
				AddRuntimeStat(4,17,0,1)
			else
				Msg2Player(format("Nhi謒 v� tu莕 - l藅 b礽 thu ph� %d/15 l莕",GetTask(VET_WEEK_TASK_FANPAI)));
			end
		end
	end
end


--万剑冢宝箱
function main()
--	print("GetName =",GetName())
--	print("g_tMAPlayerInfo =",g_tMAPlayerInfo)
--	print("g_tMAPlayerInfo[GetName()] =",g_tMAPlayerInfo[GetName()])
	local nNpcIndex = GetMissionV(tbJZMY.mv22);
--	print("GetMissionV(mv23) =",nNpcIndex);
	if nNpcIndex == 0 then
		print("ERROR: T礽 nguy猲 B秓 Rng ")
		return 0;
	end
	--是否是队长
	if GetName() ~= GetCaptainName() then
		return 0;
	end
	--开启下一关
	SetMissionV(tbJZMY.mv22,0);
	--翻牌
	local nStage = GetMissionV(MV_STAGE);
	if nStage < 1 or nStage > 4 then
		print("nStage = ",nStage);
		return 0 ;
	end;
	local tRequire = ttd_CreateTable();
	if 4 == nStage then
		ttd_OpenUi(nStage,tRequire);
	end
	--使箱子消失
	SetNpcLifeTime(nNpcIndex,0);
	gf_TeamOperateEX(vaf_award_api, "tWjzJinBox")
end

function ttd_nothing()
end