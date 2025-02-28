--------------------------------------------------------------------
-- 地玄宫 第4关 作弊关
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------

Include("\\settings\\static_script\\missions\\base\\tstage.lua");
Include("\\script\\lib\\define.lua");
--Include("\\script\\master_prentice\\master_prentice_point.lua")
----2013年3月活动添加
--Include("\\script\\online\\2013\\camp03\\head.lua");
----2013年3月活动添加结束
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\script\\function\\honor_tong\\ht_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phasex_1 = gf_CopyInherit(tPhaseBase, {
--})

phasex_1 = {
	stepInterval = 5,
	stepLimit = 100/5,
};
phasex_2 = {
	stepInterval = 15,
	stepLimit = 600,
};
phasex_3 = {
	stepInterval = 3,
	stepLimit = 1,
};

--------------------------------------------------------------------
tStageX = {
	tPhases = {
		phasex_1,
		phasex_2,
		phasex_3,
	},

	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1732, 3160},
		{1731, 3171},
		{1723, 3163},
		{1724, 3179},
		{1716, 3170},
	},
	resetPos = {1721, 3168},
	npcMod = {
		{"мa Huy襫 Cung Cung Ch� мa", "Cung Ch� мa Huy襫 Cung "},
		{"Thi猲  Ph竝 S� мa", "Thi猲   Th莥 Mo"},
		{"Thi猲  Ng鬰 T鑤 мa", "u S� Ng鬰 T鑤 Thi猲 ",},
		{"Ngi g�1", "Tinh Anh мa Huy襫 Cung"},
		{"Ngi g�1", "Tinh Anh мa Huy襫 Cung"},

		{"yinbaoxiang", "Rng B筩", 180},
		{"tongbaoxiang", "Rng уng", 180},
		--{"箱子钱", "天阴精力箱", 180},
	},
--	stepLimit = 600,
	tGodState	= {
		tInfo	= {"Thi猲 th莕 h� ph祄", 10, "Duy tr� %d ph髏"},
		tState	= {
			[1] = {9908, "state_p_attack_percent_add",	700,	"Ngo筰 c玭g t╪g %d%%"},
			[2] = {9909, "state_m_attack_percent_add",	700,	"N閕 c玭g t╪g %d%%"},
			[3] = {9910, "state_life_max_percent_add",	300,	"Gi韎 h筺 m竨 t╪g %d%%"},
			[4] = {9911, "state_buff_resist",			14,		"Mi詎 d辌h tr筺g th竔 b� h筰 %d"},
		},
	},
}
msgs = {
	{
		"Nghe n鉯 d筼 n祔 nh﹏ s� gia nh藀 b鎛 gi竜 輙 h琻 th竛g trc 10%, gi秏 xu鑞g 8% 甶!",
		"L遪g ngi  tan, mang theo i ng� kh玭g d�!",
		"L祄 vi謈 b蕋 l頸 c遪 � y m� ng魕 bi謓",
		"M蕐 t猲 b猲 kia l祄 g� m� kh玭g th蕐 ngI bao gi�",
		"Kh玭g l� l� n nh藀 gi竜 sao?",
	},{
		"T鑙 nay u y, cho � ki課 甶!",
		"Nghe n鉯 Long M玭 Kh竎h c騨g 頲 y",
		"Ph秈 , ph秈, c遪 c� b� ch� kia n鱝",
		"C竎 ngi l� ai, sao v祇 頲 y ch�",
		"Di謙 h誸 bon h�, ki誱 t� ti襫",
	},
}
--------------------------------------------------------------------
function tStageX:onInit()
	g_theMS.msCamp[1]:turnPlayer(NewWorld, GetMissionV(MV_MAP_ID), self.resetPos[1], self.resetPos[2]);
	stageAction("p1");
	tStageBase:onInit();

	local n = random(1, getn(msgs));
	for i = 1, 5 do
		local npc = self:createChar(i)
		NpcChat(npc, msgs[n][i]);
	end
end

function tStageX:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(nId));
	SetNpcScript(npc, g_theMS.fileName);
	if npcMod[3] then
		SetNpcLifeTime(npc, npcMod[3]);
	end
	SetCampToNpc(npc, CampEnemy);
	return npc;
end

function tStageX:createBoss()
	self:createChar(3);
	self:createChar(4);
end

function tStageX:createJiguan()
	local rand1,rand2 = random(1,5), random(1,4)
	if rand1 == rand2 then
		rand1 = 5;
	end
	local npcMod = self.npcMod[5];
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(4 + rand1));
	SetNpcScript(npc, g_theMS.fileName);
	SetNpcLifeTime(npc, 30);
	npcMod = self.npcMod[6];
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(4 + rand2));
	SetNpcScript(npc, g_theMS.fileName);
	SetNpcLifeTime(npc, 30);
end

function tStageX:createDog()
	local npcMod = self.npcMod[7];
	for i = 1, 4 do
		local m, x, y = self:GetPos(i + 9);
		for i = 1, 4 do
			local npc = CreateNpc(npcMod[1], npcMod[2], m, x, y);
			SetNpcLifeTime(npc, 90);
		end
	end
end

function tStageX:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStageX:onTimerOver()
	g_theMS:Close()
end
tStageX.rule["timerover"] = tStageX.onTimerOver;

function tStageX:giveAward(nNpcIdx, nBossCount)
	
	if GetNpcName(nNpcIdx) == "Cung Ch� мa Huy襫 Cung " then
		create_dxg_box_gold(nNpcIdx,1)--金宝箱
	end
	
	local tChg = {
		1,0, 2, 0, 3
	}
	nBossCount = tChg[nBossCount] or 0
	if nBossCount == 0 then
		return
	end
	local m, x, y = GetNpcWorldPos(nNpcIdx);
--	for i = 1, 3 do
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[6];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box2);
--		AddUnitStates(npc, 3, 99 - GetUnitCurStates(npc))
--	end
	create_box_tong(nNpcIdx, nBossCount) --天阴密箱变铜宝箱
	for i= 1,4 do
		create_box_yin(m,x,y, nBossCount)
	end
--	for i = 1, 1 do
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[7];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box1);
--	end
	--天阴精力箱
--	if GetNpcName(nNpcIdx) == "地玄宫宫主" then
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[8];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box4);
--	end
	g_theMS.msCamp[1]:turnPlayer(
--		function ()
--		local lv = GetLevel();
--		local nExp = lv * lv * 60;
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS3) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS3, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		nExp = floor(nExp * 1.3)
--		gf_Modify("Exp", nExp);
--	end
		giveStageExpAward, nBossCount
	)
	
	g_theMS.msCamp[1]:turnPlayer(qht_raid_dxg_13);
	g_theMS.msCamp[1]:turnPlayer(aw_dxg_award, 0);
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, nBossCount)
	g_theMS.msCamp[1]:turnPlayer(oly_AddShengHuo, 3, 1)
	g_theMS.msCamp[1]:turnPlayer(ht_GetTongChip, 25, 1)
end

function tStageX:ReviveAllPlayer()
	local funReviveAllPlayer = function()
		if IsPlayerDeath() ~= 0 or GetLife() <= 0 then
			local nOldIndex = PlayerIndex;
			RevivePlayer(0);
			PlayerIndex = nOldIndex;
			StartTimeGuage("Th阨 gian v� ch", 10, 0, 2);
			CastState("state_dispear",0,10*18); --无敌
			RestoreAll();
			tStageX:AddGodState();
		end
	end;
	mf_OperateAllPlayer(MISSION_ID, funReviveAllPlayer, nil, 1);
end
function tStageX:AddGodState()
	self:CleanGodState();
	local tState = self.tGodState.tState;
	for i = 1, getn(tState) do
		CastState(tState[i][2], tState[i][3], self.tGodState.tInfo[2] * 60 * 18, 1, tState[i][1], 1);
	end
	SyncCustomState(1, tState[1][1], 1, self.tGodState.tInfo[1]);
end

function tStageX:CleanGodState()
	local tState = self.tGodState.tState;
	for i = 1, getn(tState) do
		RemoveState(tState[i][1]);
	end
end

--------杀怪阶段-------------------------------------------------
function phasex_2:onInit()
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thanh trt th阨 gian", self.stepLimit, 0);
	g_theMS.msCamp[1]:turnPlayer(tStageX.AddGodState, tStageX);
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Th阨 gian h錳 sinh", 15, 1, 1);
	SetMissionV(MV_BOSS_COUNT, 0);
--	ds_DXG:AddStatValue(4,1,1);
--	ds_DXG:AddStatValue(4,2,g_theMS.msCamp[1]:getCount(0));
	---201212活动修改
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
	--Observer:onEvent(OE_DXG_CREATE_NPC,{4, nMapID, 1734, 3160}); --pvp地图传入mapID和阵营，pve传入mapID和坐标
	
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
--	remove_tong_box()
--	remove_yin_box()
	--SetMissionV(MV_DXG_STAGE_CNT, 4)
	
end
function phasex_2:onTimer(nStep)
	nStep = (nStep - 1) * self.stepInterval;
	if nStep >= self.stepLimit then
		g_theMS:action("missionfinish");
		return
	end
	if 1 then
		tStageX:ReviveAllPlayer();
	end
end

function phasex_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--每日任务-杀怪
	local npcName = GetNpcName(npcIdx);
	if 1 then
		local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT) + 1;
		g_theMS:SetMissionV(MV_BOSS_COUNT, nBossCount);
		getStage():giveAward(npcIdx, nBossCount);
		if nBossCount == 5 then
		--	ClearMapNpc(g_theMS:getMapId(), nil);
			g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -2);
			stageAction('p2');
		end
	end
end
function phasex_2:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------本关结束----------------------------------------------------
function phasex_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 4);
--	ds_DXG:AddStatValue(4,3,1);
	reviveAll();
	tStageX:ReviveAllPlayer();
	g_theMS.msCamp[1]:turnPlayer(tStageX.CleanGodState, tStageX);
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("Tr秈 qua s� n� l鵦, c竎 v� i hi謕  vt 秈 мa Huy襫 C玭g th祅h c玭g")
--	local op = function()
--		if GetTask(TASKID_DXG_DAILY_TASK) == 1 then
--			SetTask(TASKID_DXG_DAILY_TASK, 2, TASK_ACCESS_CODE_DXG_MISSION);
--			Msg2Player("您完成了本日的地玄宫任务，去领取奖励吧！");
--		end
--	end
--	g_theMS.msCamp[1]:turnPlayer(op);
	for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
		SetMissionV(i, 0);
	end
	--通关前三关次数统计
	AddRuntimeStat(1,8,0,1);
end

function phasex_3:onTimer(nStep)
	g_theMS:action("so")
end

--------------------------------------------------------------------

tStageX = gf_CopyInherit(tStageBase, tStageX);
