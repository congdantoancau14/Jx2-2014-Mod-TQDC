--------------------------------------------------------------------
-- 地玄宫 第2关
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\tstage.lua");
--Include("\\script\\lib\\define.lua");
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
--phase2_1 = gf_CopyInherit(tPhaseBase, {
--})
COUNT_RUNNER = 15 - 1;

phase2_1 = {
	stepInterval = 1,
	stepLimit = 2,
};
phase2_2 = {
	stepInterval = 1,
	stepLimit = 10 * 60,
	maxCount = COUNT_RUNNER,
};
phase2_3 = {
	stepInterval = 5,
	stepLimit = 180/5,
};

--------------------------------------------------------------------
tStage2 = {
	tPhases = {
		phase2_1,
		phase2_2,
		phase2_3,
	},
	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1674, 3234},
		{1681, 3214},
	},
	way1 = {
		{1690, 3210, },
		{1682, 3203, },
		{1668, 3217, },
		{1675, 3226, },
		{1660, 3240, }, },
	way2 = {
		{1690, 3210, },
		{1697, 3219, },
		{1683, 3234, },
		{1675, 3226, },
		{1660, 3240, }, },
	npcpos = {1702, 3190, },
	fishpos = {
		{1682, 3209, },
		{1692, 3218, },
		{1674, 3218, },
		{1683, 3228, }, },
	bosspos = {1682, 3218, },

	resetPos = {1674, 3234},
	npcMod = {
		{"Minh Gi竜 Th竚 T� мa", "Minh Gi竜 Th竚 T�"},

		{"Thi猲  Ng鬰 T鑤 мa", "u S� Ng鬰 T鑤 Thi猲 ",},
		{"Tuy襫 C� мa", "Tuy襫 C�", },

		{"yinbaoxiang", "Rng B筩", 180},
		{"tongbaoxiang", "Rng уng", 180},
		--{"箱子钱", "天阴精力箱", 180},
	},
--	stepLimit = 600,
}

--------------------------------------------------------------------
function tStage2:onInit()
	stageAction("p0");
	tStageBase:onInit();
end

function tStage2:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npc = CreateNpc(npcMod[1], npcMod[2], getStage():GetPos(nId));
	SetNpcScript(npc, g_theMS.fileName);
	SetCampToNpc(npc, CampEnemy);
	return npc;
end

function tStage2:createRunner()
	local npcMod = {};
	npcName = "Nh﹏ s� v� l﹎ b� giam c莔";
	local model = "Giam C莔 мa"..random(1,10)
	npc = CreateNpc(model, npcName, self:GetPosEx(self.npcpos));
	SetNpcScript(npc, g_theMS.fileName);
	SetCampToNpc(npc, CampPlayer);
	SetNpcLifeTime(npc, 16);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	local way = self.way1;
	if self.bWay == 1 then
		way = self.way2;
		self.bWay = 0;
	else
		self.bWay = 1;
	end
	g_NpcAI:setWayPoint(npc, way);
	SetNpcActivator(npc);
	return npc;
end

function tStage2:createFish()
	local npcMod = self.npcMod[3];
	local tPos = self.fishpos;
	for i = 1, getn(tPos) do
		local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPosEx(tPos[i]));
		if npcMod[3] then
			SetNpcLifeTime(npc, npcMod[3]);
		end
		SetCampToNpc(npc, CampEnemy);
		SetNpcScript(npc, g_theMS.fileName);
	end
end

function tStage2:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end
function tStage2:GetPosEx(pos)
	local m, x, y = g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
	return m, x, y;
end
function tStage2:onTimerOver()
	g_theMS:Close()
end
tStage2.rule["timerover"] = tStage2.onTimerOver;

function tStage2:giveAward(nNpcIdx, nBossCount)
	--天阴圣物箱
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	for i = 1, 4 do
		create_box_yin(m,x,y,2)
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[4];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box2);
--		AddUnitStates(npc, 3, 99 - GetUnitCurStates(npc))
	end
	create_box_tong(nNpcIdx, 2) --天阴密箱变铜宝箱
--	--天阴密箱
--	for i = 1, 1 do
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--		local npcMod = self.npcMod[5];
--		local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--		if npcMod[3] then
--			SetNpcLifeTime(npc, npcMod[3]);
--		end
--		SetNpcScript(npc, g_theMS.Box1);
--	end
--	--天阴精力箱
--	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--	local npcMod = self.npcMod[6];
--	local npc = CreateNpc(npcMod[1], npcMod[2], m, x2, y2);
--	if npcMod[3] then
--		SetNpcLifeTime(npc, npcMod[3]);
--	end
--	SetNpcScript(npc, g_theMS.Box4);
	
	local nCount = GetMissionV(MV_LIVED_RUNNER);
	local nScore = GetMissionV(MV_L2_SCORE);
	local nExpMulti;
	if nScore < 12 then
		nExpMulti = 1.2;
	elseif nScore < 18 then
		nExpMulti = 1.5;
	elseif nScore < 24 then
		nExpMulti = 2;
	else
		nExpMulti = 2.5;
	end
	g_theMS:Msg2MSAll(format("T鎛g c閚g c鴘 %d v� Nh﹏ S� V� L﹎, nh薾 頲 %d 甶觤",nCount, nScore));
	g_theMS.msCamp[1]:turnPlayer(
--		function ()
--		local lv = GetLevel();
--		local nExp = floor(lv * lv * 40 * %nExpMulti);
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS2) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS2, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		gf_Modify("Exp", nExp);
--	end
	giveStageExpAward
	)
--	g_theMS.msCamp[1]:turnPlayer(function ()
--		local lv = GetLevel();
--		local nExp = floor(lv * lv * lv);
--		local nBossCount = GetTask(TASKID_DIXUANGONG_DAILY_BOSS2) + 1;
--		SetTask(TASKID_DIXUANGONG_DAILY_BOSS2, nBossCount, TASK_ACCESS_CODE_DXG_MISSION);
--		gf_Modify("Exp", nExp);
--	end)
	g_theMS.msCamp[1]:turnPlayer(qht_raid_dxg_13);
	g_theMS.msCamp[1]:turnPlayer(aw_dxg_award, 0);
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 2)
	g_theMS.msCamp[1]:turnPlayer(oly_AddShengHuo, 1, 1)
	g_theMS.msCamp[1]:turnPlayer(ht_GetTongChip, 25, 1)
end

-------等待开启阶段------------------------------------------------------
function phase2_1:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
--	getStage():createChar(1)
--	g_theMS:Msg2MSAll("你们的队伍已经到达地玄宫中殿，队长与被抓的天阴教徒对话可开启关卡。");
	g_theMS:SetMissionV(MV_BOSS_COUNT, 0);
end

function phase2_1:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('p1');
		return
	end
	if nStep == 1 then
		local npc = findNpc("Nga My Li評 Hi猲");
		ChangeNpc2Talk(npc);
		NpcChat(npc, "H鴆 hu hu, t� mu閕 t閕 nghi謕 c馻 ta~");
	end
end

function phase2_1:onTalk(npcIdx)
	if PlayerIndex ~= GetTeamMember(0) then
		return
	end
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())

	local tSel = {
		"Ta i ngi n c鴘 ngi/#stageAction('p1')",
		"Trung 謓 c馻 мa Huy襫 Cung n祔 c� huy襫 c� g�/info2",
		"K誸 th骳 i tho筰/nothing"
	}
	Say("Li評 Hi猲: h鴆 hu hu, t� mu閕 ng thng c馻 ta~", getn(tSel), tSel);
end
function info2()
	Talk(1, "", "Trong ph遪g c� r蕋 nhi襲 Tuy襫 C�, r蕋 nhi襲 t� mu閕 ng m玭 trong  ch辵 kh�. B猲 trong c遪 c� t猲 cai ng鬰 gian 竎, nhanh nhanh gi髉 ch髇g t玦! N猲 nh�, khi cai ng鬰 ch誸 甶 th� to祅 b� c� quan s� ph竧 ng, t蕋 c� c竎 nh﹏ s� v� l﹎ s� b� giam c莔 m� ch誸!");
end

--------杀怪阶段-------------------------------------------------
function phase2_2:onInit()
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"Thanh trt th阨 gian", self.stepLimit, 0);
	g_theMS:Msg2MSAll("H穣 b秓 v� Nh﹏ S� V� L﹎ ch箉 tr鑞!");
	local pos = getStage().resetPos;
	g_theMS.msCamp[1]:turnPlayer(SetPos, pos[1], pos[2]);
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
	---201212活动修改
	--Observer:onEvent(OE_DXG_CREATE_NPC,{2, nMapID, 1734, 3160}); --pvp地图传入mapID和阵营，pve传入mapID和坐标
--	ds_DXG:AddStatValue(2,1,1);
--	ds_DXG:AddStatValue(2,2,g_theMS.msCamp[1]:getCount(0));
end
function phase2_2:onTimer(nStep)
	nStep = nStep - 1;
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
	if nStep == 0 then
		g_theMS:SetMissionV(MV_KILLED_NPC, 0);
		SetMissionV(MV_LIVED_RUNNER, 0);
		local npc = getStage():createChar(2);
		NpcChat(npc, "Qu� nhi猲 c竎 ngi  n y, ng ti誧 i c竎 ngi l筰 l� con 阯g ch誸!");
		getStage():createFish();
	end
	local runStep = 8
	if mod(nStep, runStep) == 0 then
		if nStep < self.maxCount * runStep then
			local npc = getStage():createRunner();
			tMsg = {
				"H� gi� ta, � y nguy hi觤 qu�!",
				" cha m� 琲! cu鑙 c飊g ta c騨g tho竧 ra 頲 r錳 !",
				"Cu鑙 c飊g t猲 c莔 u c騨g xu蕋 hi謓 !",
				"Qu﹏ t� 10 n╩ b竜 th� c騨g ch璦 mu閚, ngi ngi ngi c遪 c� ngi n鱝 h穣 i y!",
				" t� i hi謕 tng tr�, sau n祔 c莕 vi謈 g� c� g鋓 ta m閠 ti課g!",
			}
			local msg = randomin(tMsg);
			NpcChat(npc, msg);
		elseif nStep == self.maxCount * runStep then
			local npc = getStage():createRunner();
			NpcChat(npc, "Cu鑙 c飊g ta c騨g tho竧 ra 頲!");
			g_theMS:Msg2MSAll("Чi 產 s� c竎 nh﹏ s� v� l﹎ b� giam c莔 u tho竧 ra ngo礽 頲!");
		end
	end
	self:checkRunner();
	if nStep == 25 or nStep == 85 then
		self:castSkill(1);
	elseif nStep == 55 then
		self:castSkill(2);
	end
end
function phase2_2:checkRunner()
	local tNpc = findAllNpc("Nh﹏ s� v� l﹎ b� giam c莔");
	for i = 1, getn(tNpc) do
		local npc = tNpc[i];
		local _, x, y = GetNpcWorldPos(npc);
		if abs(x-1660) + abs(y-3240) < 5 then
			local l = GetMissionV(MV_LIVED_RUNNER) + 1;
			SetMissionV(MV_LIVED_RUNNER, l)
			SetNpcLifeTime(npc, 0);
			SetMissionV(MV_L2_SCORE, GetMissionV(MV_L2_SCORE) + 2);
		end
	end
end
function phase2_2:castSkill(n)
	local npc = findNpc("u S� Ng鬰 T鑤 Thi猲 ");
	if not npc then return end

	local tPos = {
		{{1662,3217},{1670,3205},{1693,3232},{1685,3239},{1679,	3213},{1686,3223},},
		{{1670,3205},{1693,3232},{1693,3207},{1671,3231},{1682,3217},},
	}
	tPos = randomin(tPos[n]);
	local tMod = {
		{"H祅 B╪g Tr薾 мa","H祅 B╪g Tr薾"},
		{"Li謙 H醓 Tr薾 мa","Li謙 H醓 Tr薾"},
	}
	tMod = tMod[n];
	local npcFlag = CreateNpc(tMod[1], tMod[2], GetMissionV(MV_MAP_ID), tPos[1], tPos[2]);
	SetNpcLifeTime(npcFlag, 15);
	SetCampToNpc(npcFlag, CampEnemy);
	NpcChat(npc, "Уo t萿 h� n籱 m� 甶! Ta kh玭g  cho c竎 ngi tho竧 kh醝 y u!");
end

function phase2_2:finish()
	getStage():action("p2");
end

function phase2_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--每日任务-杀怪
	local npcName = GetNpcName(npcIdx);
	if npcName == "u S� Ng鬰 T鑤 Thi猲 " then
		ClearMapNpc(g_theMS:getMapId(), nil);
		g_theMS.msCamp[1]:turnPlayer(StopTimeGuage,-2);
		stageAction('p2');
		getStage():giveAward(npcIdx, nBossCount);
		local maxCount = GetMissionV(MV_TIMER_STEP) * 5 / 20;
		if maxCount > self.maxCount then
			maxCount = self.maxCount;
		end
	elseif npcName == "Nh﹏ s� v� l﹎ b� giam c莔" then
		local nCount = g_theMS:GetMissionV(MV_KILLED_NPC) + 1;
		g_theMS:Msg2MSAll(format("Х c� %d nh﹏ s� v� l﹎ b� gi誸 ch誸!!!", nCount));
		g_theMS:SetMissionV(MV_KILLED_NPC, nCount);
--		ClearMapNpc(g_theMS:getMapId(), nil);
--		StopTimeGuage(-2);
--		stageAction('p2');
	end
	if npcName ~= "Tuy襫 C�" then
		SetNpcLifeTime(npcIdx, 3);
	end
end
function phase2_2:onTrap(nId)
		local pos = getStage().resetPos;
		SetPos(pos[1], pos[2]);
end

--------本关结束----------------------------------------------------
function phase2_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 2);
	--ds_DXG:AddStatValue(2,3,1);
	reviveAll();
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("Tr秈 qua gian nguy n� l鵦, Thi猲  Cai Ng鬰 u M鬰 b� c竎 ngi nh b筰 r錳.");

	self:createMinion();
	for i = MV_IS_OPENED_BOX_BEGIN, MV_IS_OPENED_BOX_END do
		SetMissionV(i, 0);
	end
end

function phase2_3:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('timerover');
		return
	end

	if nStep == 3 then
		local npc = findNpc("Nga My Li評 Hi猲");
		ChangeNpc2Talk(npc);
		NpcChat(npc, " t� c竎 v� i hi謕  ra tay tng tr�!");
	end
end

tPos_2_3 = {
	{1649, 3251, { {1660, 3240}, {1678, 3220}}},		-- 03
	{1651, 3253, { {1660, 3240}, {1680, 3222}}},		-- 04
	{1646, 3254, { {1660, 3240}, {1675, 3223}}},		-- 09
	{1648, 3256, { {1660, 3240}, {1677, 3225}}},		-- 10
	{1647, 3249, { {1655, 3235}, {1676, 3218}}},		-- 02
	{1653, 3255, { {1665, 3245}, {1682, 3224}}},		-- 05
	{1644, 3252, { {1655, 3235}, {1673, 3221}}},		-- 08
	{1650, 3258, { {1665, 3245}, {1679, 3227}}},		-- 11
	{1643, 3257, { {1660, 3240}, {1672, 3226}}},		-- 15
	{1645, 3259, { {1660, 3240}, {1674, 3228}}},		-- 16
	{1640, 3260, { {1660, 3240}, {1669, 3229}}},		-- 21
	{1642, 3262, { {1660, 3240}, {1671, 3231}}},		-- 22
	{1645, 3247, { {1655, 3235}, {1674, 3216}}},		-- 01
	{1655, 3257, { {1665, 3245}, {1684, 3226}}},		-- 06
	{1642, 3250, { {1655, 3235}, {1671, 3219}}},		-- 07
	{1652, 3260, { {1665, 3245}, {1681, 3229}}},		-- 12
	{1641, 3255, { {1655, 3235}, {1670, 3224}}},		-- 14
	{1647, 3261, { {1665, 3245}, {1676, 3230}}},		-- 17
	{1639, 3253, { {1655, 3235}, {1668, 3222}}},		-- 13
	{1649, 3263, { {1665, 3245}, {1678, 3232}}},		-- 18
	{1638, 3258, { {1655, 3235}, {1667, 3227}}},		-- 20
	{1644, 3264, { {1665, 3245}, {1673, 3233}}},		-- 23
	{1636, 3256, { {1655, 3235}, {1665, 3225}}},		-- 19
	{1646, 3266, { {1665, 3245}, {1675, 3235}}},		-- 24
}
function phase2_3:createMinion()
	local npc = CreateNpc("Li評 Hi猲 мa", "Nga My Li評 Hi猲", g_theMS:GetMissionV(MV_MAP_ID), 1653, 3248);
	SetCampToNpc(npc, CampPlayer);
	SetNpcActivator(npc);
	ChangeNpc2Talk(npc);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	g_NpcAI:setWayPoint(npc, {{1690, 3209}});
	SetNpcScript(npc, g_theMS.fileName);

	local nCount = g_theMS:GetMissionV(MV_LIVED_RUNNER);
	m = GetMissionV(MV_MAP_ID);
	for i = 1, nCount do
		local pos = tPos_2_3[i];
		npc = self:createMinion2(m, pos[1], pos[2]);
		g_NpcAI:setAI(npc, AT_SM_MOVE);
		g_NpcAI:setWayPoint(npc, pos[3]);
		SetNpcScript(npc, g_theMS.fileName);
	end
end

function phase2_3:createMinion2(m, x, y)
	npcName = "V� L﹎ Tinh Anh";
	local model = "V� L﹎ Nh﹏ S� мa"..random(1,10)
	npc = CreateNpc(model, npcName, m, x, y);
	SetCampToNpc(npc, CampPlayer);
--	ChangeNpc2Talk(npc);
	return npc;
end

function phase2_3:onTalk(npcIdx)
	local npcName = GetTargetNpcName();
	if npcName == "Nga My Li評 Hi猲" and isCaption() then
		Say("Tr薾 chi課 n祔 nh﹏ s� v� l﹎ t鎛 th蕋 n苙g n�, mong c竎 ch� v� tng tr�!", 1, "Ta nguy謓 v� v� l﹎ m� gi髉 s鴆/phase2_3_gogogo");
	else
		Talk(1, "", format("<color=green>%s<color>: 產 t�  tng tr�!", npcName));
	end
end

function phase2_3_gogogo()
	local flag = GetMissionV(MV_S2_GGG_FLAG);
	if flag == 1 then return end
	SetMissionV(MV_S2_GGG_FLAG, 1);
	local npc = findNpc("Nga My Li評 Hi猲");
	NpcChat(npc, "C竎 huynh , nh tan Чi Huy襫 Cung Cung Ch� ch髇g ta chia nhau trang b�!");
	ChangeNpc2Fight(npc);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	g_NpcAI:setWayPoint(npc, {{1717, 3169}});
	setCurStage(3)
	remove_tong_box()
	remove_yin_box()
	remove_box_gold()

	local tMsg = {
		"H誸 ti襫 s鯽 trang b� r錳 T_T",
		"Tr阨, c� b�!",
		"++++++++++++++",
		"H綾 th� ng m� rng!! ",
	}
	local tnpcs = findAllNpc("V� L﹎ Tinh Anh");
	local t = {{1690, 3197}, {1696, 3201}, {1700, 3208}};
	for _, npc in tnpcs do
--		ChangeNpc2Fight(npc);
		g_NpcAI:setAI(npc, AT_SM_ATTACK);
		local _, x, y = GetNpcWorldPos(npc);
		local p1 = randomin(t);
		g_NpcAI:setWayPoint(npc, {p1, {x+50, y-50}});
		if random(10) <= 3 then
			NpcChat(npc, randomin(tMsg));
			SetNpcActivator(npc);
		end
	end
end

function phase2_3:onTrap(nId)
	if nId == 2 then
		g_theMS:action("s3")
	end
end
--------------------------------------------------------------------

tStage2 = gf_CopyInherit(tStageBase, tStage2);
