-- =====================================================
-- File : 药品npc对话脚本
-- Desc : 和npc对话，取得药品
-- Creator : Tony(Jizheng)
-- =====================================================

Include("\\script\\yaopin_npc_head.lua")

nTotalItemCount = 1					-- 总共有多少采集物品

szItemGenre = 		{1}			-- 采集物品的大类
szItemDetail = 		{2}			-- 采集物品的副类
szItemParticular = 	{10}			-- 采集物品的详细类别
szItemGailv = 		{100}		-- 采集物品的概率（这里填的时候，后面一个要加上前面一个的概率）
szItemLowCount =	{30}		-- 采集物品最低数量
szItemHighCount =	{50}		-- 采集物品最高数量

nSkillType = 0						-- 采集类生活技能大类型
nSkillID = 4						-- 采药技能ID
nSkillLevelLow = 51					-- 需要达到的采集技能最低等级
nSkillLevelHigh = 60				-- 需要达到的采集技能最高等级

nDigToolCount = 2							-- 采集工具种类数量
nDigToolGenre = {0, 0}				-- 采集工具大类
nDigToolDetail = {200, 200}				-- 采集工具副类
nDigToolParticular = {16, 28}		-- 采集工具详细类
nEndureCount = 90							-- 采集这个东西要消耗的耐久度

-- 默认入口函数
function main()
	local nCurNpcIndex = GetTargetNpc()
	if (nCurNpcIndex == 0) then
		return
	end
	local nCurLevel = GetUnitCurStates(nCurNpcIndex, 0)
	if (nCurLevel == 99) then
		return
	end
	AddUnitStates(nCurNpcIndex, 0, 100)		-- 此段防刷

	local nCanDig = check_dig_condition(nSkillType, nSkillID, nSkillLevelLow)
	
	-- 检查是否有采集工具
	local nCanDigTool = 0
	for i = 1, nDigToolCount do
		local bHaveDigTool = GetItemCount(nDigToolGenre[i], nDigToolDetail[i], nDigToolParticular[i])
		if (bHaveDigTool ~= 0) then
			nCanDigTool = 1
			break
		end
	end
	
	-- 如果玩家可以挖这个药品，进入下面执行段
	if (nCanDig == 1 and nCanDigTool == 1) then
		if (DoFireworks(890, 1) == 1) then
			Msg2Player("Thu th藀......");
			CastState("state_fetter", 1, 5 * 18)
			ProgressSlot(5 * 18)
			
			local nMapID, nX, nY = GetWorldPos()
			MedicNpcDeath(nMapID, nCurNpcIndex)
			SetNpcLifeTime(nCurNpcIndex, 0)
			SetNpcScript(nCurNpcIndex, "")
			AbradeDigTool(nSkillID, nSkillLevelLow, nEndureCount)	-- 消耗采集工具的耐久
		else
			Msg2Player("Kh玭g th� l祄 ng t竎 n祔 � tr筺g th竔 ng錳")
		end
	end
	
	if nCanDigTool == 0 then
		Msg2Player("B筺 kh玭g mang theo c玭g c� c莕 thi誸!")
	end
	
	-- 如果玩家不能挖这个药品，让别人可以继续挖
	AddUnitStates(nCurNpcIndex, 0, -100)	-- 此段防刷
end;

-- 挖掘结束以后的回调函数
function OnProgressCallback()
	local nExpMultiCount = get_dig_multi_count(nSkillType, nSkillID, nSkillLevelHigh)	-- 获得得经验的时候的加成倍数
	
	local nSel = random(1, 99)
	local nChoice = 0
	local nSelCount = 0
	
	for i = 1, nTotalItemCount do
		if (nSel < szItemGailv[i]) then
			nChoice = i			
			break
		end
	end
	
	-- 随机到可以得到东西
	if (nChoice ~= 0) then
		nSelCount = random(szItemLowCount[nChoice], szItemHighCount[nChoice])
		AddItem(szItemGenre[nChoice], szItemDetail[nChoice], szItemParticular[nChoice], nSelCount)	-- 加物品
		AddLifeSkillExp(nSkillType, nSkillID, nExpMultiCount * nSelCount)							-- 加经验
	end
	
	-- 提示
	if (nChoice == 1) then
		Say("襫 th蕋 n祔 r蕋 r鑤, ngi t譵 頲"..nSelCount.." 襫 th蕋!", 0)
	elseif (nChoice == 2) then
		Say("Kh玭g ng� b猲 trong c遪 g鉯 h祅g, b筺 nh薾 頲 "..nSelCount.." Da h� tr緉g!", 0)
	else
		Say("M蕐 t蕀 da n祔  r竎h n竧, ngi v蒼 ch璦 t譵 頲  c莕 d飊g!", 0)
	end
	
end;

function OnDeath()
local nExpMultiCount = get_dig_multi_count(nSkillType, nSkillID, nSkillLevelHigh)	-- 获得得经验的时候的加成倍数
	
	local nSel = random(1, 99)
	local nChoice = 0
	local nSelCount = 0
	
	for i = 1, nTotalItemCount do
		if (nSel < szItemGailv[i]) then
			nChoice = i			
			break
		end
	end
	
	-- 随机到可以得到东西
	if (nChoice ~= 0) then
		nSelCount = random(szItemLowCount[nChoice], szItemHighCount[nChoice])
		AddItem(szItemGenre[nChoice], szItemDetail[nChoice], szItemParticular[nChoice], nSelCount)	-- 加物品
		AddLifeSkillExp(nSkillType, nSkillID, nExpMultiCount * nSelCount)							-- 加经验
	end
end;

