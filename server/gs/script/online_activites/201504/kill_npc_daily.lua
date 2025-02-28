Include("\\script\\online_activites\\201504\\head.lua")
Include("\\script\\online_activites\\201504\\kill_npc_weekly.lua")
NORMAL_TYPE = 1 --普通
ADVANCED_TYPE = 2 --高级

MAP_1 = 1
MAP_2 = 2
MAP_3 = 3

TB_MAP_ID = 
{
	[MAP_1] = 114,
	[MAP_2] = 115,
	[MAP_3] = 116,
}

MAP_NUM = MAP_3

--服务器启动以后，全服伪随机对应的地图
TB_MAP_PASEUDORANDOM = {1,1,2,3,2,3,1,2,3,2,1,2,3,2,2,1,3,2,1,1,2,2,2,1,3}
TB_MAP_TOTAL_DAY = getn(TB_MAP_PASEUDORANDOM)
TB_KILL_NPC = 
{
	[MAP_1] = 
	{
		{"Ti猽 Ti猲 T�"},
		{"T� B� Ti猲 T�"},
	},
	[MAP_2] = 
	{
		{"C莔 Ti猲 T�"},
		{"T秐 Ti猲 T�"},
	},
	[MAP_3] = 
	{
		{"мch ti猲 T�"},
		{"Ki誱 ti猲 T�"},
	}
}
MAP_DESC = 
{
	[MAP_1] = "Vng M蓇 ng_1",
	[MAP_2] = "Vng M蓇 ng_2",
	[MAP_3] = "Vng M蓇 ng-3",
}

tbKillNpcDaily = {}

tbKillNpcDaily.nActivityID = 152
--tbKillNpcDaily.tbOpenDate = {2015032300, 2015050100}，在\script\online_activites\online_activites.txt有配置
tbKillNpcDaily.tbTaskGroupId = {7, 12}
tbKillNpcDaily.nAcceptTaskTaskIndex = 1 --是否领取任务
tbKillNpcDaily.nGetPrizeTaskIndex = 2 --是否领取奖励
tbKillNpcDaily.nRetsetTaskTaskIndex = 3 --重置任务变量
tbKillNpcDaily.nTaskInfoTaskIndex = 4 --任务信息，杀怪情况
tbKillNpcDaily.nRandomMapTaskIndex = 5 --随机的地图自定义ID

tbKillNpcDaily.tbLogInfo = {"Ho箃 ng th竛g 04/2015", "Ho箃 ng th竛g 04/2015"}
tbKillNpcDaily.tbAward = 
{
	[NORMAL_TYPE] = 
	{
		tbFreeRoom = {1,1},
		tbCost = 
		{
			{2, 1, 30603, 29, "Ti猽 Dao Ng鋍"},
			{2, 1, 30807, 2000, "鑞g Ph鉵g"},
			{2, 1, 30806, 2000, "Ng遡 Ph竜"},
		},
		tbPrize = 
		{
			{"Exp", 39000000},
			{2, 1, 30808, 1000, "Thu鑓 N�"},
			{2, 1, 30785, 9, "V� T� Kinh Th�"},
		}
	},
	[ADVANCED_TYPE] = 
	{
		tbFreeRoom = {1,1},
		tbCost = 
		{
			{2, 1, 30603, 299, "Ti猽 Dao Ng鋍"},
			{2, 1, 30807, 2000, "鑞g Ph鉵g"},
			{2, 1, 30806, 2000, "Ng遡 Ph竜"},
		},
		tbPrize = 
		{
			{"Exp", 99000000},
			{2, 1, 30785, 19, "V� T� Kinh Th�"},
			{2, 1, 30811, 99, "Ph竜 Hoa Vinh D�"},
		}
	}
}

tbKillNpcDaily.tbOpenWeek = {1,2,3,4,5,6,0}
tbKillNpcDaily.tbTaskGroup = nil
tbKillNpcDaily.nTargetKillNpcNum = 399

tbKillNpcDaily.tbLang = 
{
	szTaskName = "Thu th藀 Ph竜 Hoa Vinh D� (Ng祔 thng)",
	szOpenDateTimeError = "Hi謓 t筰 kh玭g ph秈 th阨 gian m� t輓h n╪g, xin vui l遪g i.",
	szOpenWeekTimeError = "T輓h n╪g n祔 ch� m� v祇 %s, xin vui l遪g i.",
	szAcceptTask = "\nNh薾 nhi謒 v� %s/KillNpcDailyGetTask",
	szGetTaskPrize = "Nh薾 ph莕 thng nhi謒 v�/KillNpcDailyGetAward",
	szHaveAcceptTask = "B筺  nh薾 nhi謒 v� n祔 r錳, h穣 n b秐 <color=gold> %s <color> ti猽 di謙  s� lng qu竔 s� ho祅 th祅h nhi謒 v�!<enter>N誹 nh�  ho祅 th祅h th� h穣 nh� nh薾 thng nh�!",
	szAcceptTaskSuccess = "Ch骳 m鮪g, b筺  nh薾 nhi謒 v� n祔 r錳, h穣 n b秐  %s ti猽 di謙  s� lng qu竔 s� ho祅 th祅h nhi謒 v�!",
	szNotFinishTask = "R蕋 ti誧, b筺 v蒼 ch璦 ho祅 th祅h nhi謒 v�, h穣 n b秐  <color=gold> %s <color> ti猽 di謙  s� lng qu竔 s� ho祅 th祅h nhi謒 v�!",
	szHaveGetPrize = "B筺  nh薾 ph莕 thng nhi謒 v� n祔 r錳, l莕 sau h穣 quay l筰.",
	szHaveGetOtherPrize = "B筺  nh薾 ph莕 thng c馻 %s, kh玭g th� nh薾 ph莕 thng nhi謒 v� n祔, l莕 sau h穣 quay l筰!",
	szCashNotEngouh = "Ng﹏ lng kh玭g  %d v祅g",
	szItemNotEngouh = "v藅 ph萴 trong t骾  %s s� lng kh玭g  %d c竔",
	szNpcNormalSelection = "Ho祅 th祅h nhi謒 v� ph� th玭g (Ti猽 hao 2000 Ng遡 Ph竜 + 2000 鑞g Ph鉵g + 29 Ti猽 Dao Ng鋍)",
	szNpcAdvanceSelection = "Ho祅 th祅h nhi謒 v� cao c蕄 (Ti猽 hao 2000 Ng遡 Ph竜 + 2000 鑞g Ph鉵g + 299 Ti猽 Dao Ng鋍)",
	szNpcNothing = "\nT玦 ch� xem xem th玦/nothing",
	szNpcGetAwardTittle = "<color=green>%s:<color> %s mu鑞 nh薾 ph莕 thng g�?<enter><color=red>Ch� �: Sau khi nh薾 ph莕 thng n祔 s� kh玭g th� nh薾 ph莕 thng c馻 <color=gold>%s<color><color>",
	szKillNpcTip = "Ti猽 di謙 qu竔 � %s %d/%d",
	szKillNpcFinishTip = "Ti猽 di謙 qu竔 � %s %d/%d (Ho祅 th祅h)",
	szConfirmSelection = "ng, ta  suy ngh� k� r錳.",
	szConfirmTittle = "<enter><color=red>Ch� �: Sau khi nh薾 ph莕 thng n祔 th� sau n祔 kh玭g th� nh薾 ph莕 thng c馻 <color=gold>%s<color>,<color> ng � nh薾 kh玭g?",
}

function tbKillNpcDaily:InitTaskGroup()
	local objTaskGroup = TaskManager:Create(self.tbTaskGroupId[1], self.tbTaskGroupId[2]);
	tbKillNpcDaily.tbTaskGroup = objTaskGroup
end

function tbKillNpcDaily:TryResetTaskVariant()
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end

	local nDaySeq = taskGroup:GetTask(self.nRetsetTaskTaskIndex)
	local nCurDaySeq = zgc_pub_day_turn()		
	if nCurDaySeq ~= nDaySeq then
		taskGroup:SetTask(self.nRetsetTaskTaskIndex, nCurDaySeq)
		taskGroup:SetTask(self.nAcceptTaskTaskIndex, 0)
		taskGroup:SetTask(self.nGetPrizeTaskIndex, 0)
		taskGroup:SetTask(self.nTaskInfoTaskIndex, 0)
		
		local nRandomMapIndex = self:GetTodayKillMapIndex()
		taskGroup:SetTask(self.nRandomMapTaskIndex, nRandomMapIndex)
	end
end

function tbKillNpcDaily:CheckCondition()
	local nRetCode,szError = self:CheckDateTime()
	if nRetCode == 0 then
		return nRetCode,szError
	end
	
	nRetCode, szError = self:CheckWeek()
	if nRetCode == 0 then
		return nRetCode,szError
	end
	
	nRetCode = 1
	szError = ""
	return nRetCode,szError
end

function tbKillNpcDaily:CheckDateTime()
	local nRetCode = gf_CheckEventDateEx(self.nActivityID)
	local szError = ""
	if nRetCode ~= 1 then
		szError = self.tbLang.szOpenDateTimeError
	end
	return nRetCode, szError
end
 
function tbKillNpcDaily:CheckWeek()
	local szString = ""
	local nRetCode = 0
	local tbOpenWeekDesc = {}
	local nCurWeek = tonumber(date("%w"))
	for nIndex, nOpenWeek in self.tbOpenWeek do
		if nCurWeek == nOpenWeek then
			nRetCode = 1
		end
		tinsert(tbOpenWeekDesc, WEEK_DESC[nOpenWeek])
	end	
	
	if nRetCode == 0 then
		local szNotOpenWeek = join(tbOpenWeekDesc, ",")
		szString = format(self.tbLang.szOpenWeekTimeError, szNotOpenWeek)
	end
	return nRetCode, szString
end

function tbKillNpcDaily:GetTaskGroup()
	self:InitTaskGroup()
	return self.tbTaskGroup
end

function tbKillNpcDaily:GetTodayKillMapIndex()
	local nCurDaySeq = zgc_pub_day_turn()		
	local nTodayMapID = mod(nCurDaySeq, TB_MAP_TOTAL_DAY) + 1
	local nResult = TB_MAP_PASEUDORANDOM[nTodayMapID]
	return nResult
end

function tbKillNpcDaily:AcceptKillNpcTask()
	local nRetCode, szError = self:CheckCondition()
	if nRetCode == 0 then
		Talk(1, "", szError)
		return
	end
	
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end
	
	local nIsGetTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
	local nRandomMapID = taskGroup:GetTask(self.nRandomMapTaskIndex)
	if nIsGetTask ~= 0 and nRandomMapID ~= 0 then
		local szMapName = MAP_DESC[nRandomMapID]
		local szString = format(self.tbLang.szHaveAcceptTask, szMapName)
		Talk(1, "", szString)
		return 
	end
	
	taskGroup:SetTask(self.nAcceptTaskTaskIndex, 1)
	local nRandomMapIndex = self:GetTodayKillMapIndex()
	taskGroup:SetTask(self.nAcceptTaskTaskIndex, nRandomMapIndex)
	local szMapName = MAP_DESC[nRandomMapIndex]
	local szString = format(self.tbLang.szAcceptTaskSuccess, szMapName)
	TaskTip(szString)
end

function tbKillNpcDaily:OnFinishKillNpcTaskCallBack()
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end
	
	local nIsGetTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
	if nIsGetTask == 0 then
		return
	end
	
	taskGroup:SetTask(self.nAcceptTaskTaskIndex, 1)
	
	local nPlayerIndexBak = PlayerIndex
	--队员也要完成
	local nTeamSize = GetTeamSize()
	for nIndex=1, nTeamSize do
		PlayerIndex = GetTeamMember(nIndex)
		local nMemberIsGetTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
		if nMemberIsGetTask ~= 0 then
			taskGroup:SetTask(self.nAcceptTaskTaskIndex, 1)
		end
	end
	PlayerIndex = nPlayerIndexBak
end

function tbKillNpcDaily:CheckGetKillNpcPrize(nSelectType)
	local nRetCode = 0
	nSelectType = nSelectType or NORMAL_TYPE
	local tbAward = self.tbAward[nSelectType]
	if not tbAward then
		return nRetCode
	end
	
	local tbFreeRoom = tbAward.tbFreeRoom
	local tbCost = tbAward.tbCost
	
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return nRetCode
	end
	
	local nGetPrize = taskGroup:GetTask(self.nGetPrizeTaskIndex)
	if nGetPrize ~= 0 then
		local szString = self.tbLang.szHaveGetPrize
		Talk(1,"",szString)
		return nRetCode
	end
	
	local weekTaskGroup = tbKillNpcWeekly:GetTaskGroup()
	if not weekTaskGroup then
		return nRetCode
	end
	
	local nHaveGetWeeklyPrize = weekTaskGroup:GetTask(tbKillNpcWeekly.nGetPrizeTaskIndex)
	if nHaveGetWeeklyPrize ~= 0 then
		local szString = format(self.tbLang.szHaveGetOtherPrize, tbKillNpcWeekly.tbLang.szTaskName)
		Talk(1,"",szString)
		return nRetCode
	end
	
	local nCurCount = taskGroup:GetTask(self.nTaskInfoTaskIndex)
	local nTargetCount = self.nTargetKillNpcNum
	local nRandomMapIndex = taskGroup:GetTask(self.nRandomMapTaskIndex)
	if nCurCount < nTargetCount and nRandomMapIndex ~= 0 then
		local szMapName = MAP_DESC[nRandomMapIndex]
		local szString = format(self.tbLang.szNotFinishTask, szMapName)
		Talk(1,"",szString)
		return nRetCode
	end
	
	if gf_Judge_Room_Weight(tbFreeRoom[1], tbFreeRoom[2], " ") ~= 1 then
		return nRetCode
	end	
	
	for k, v in tbCost do
		if getn(v) == 1 then
			if GetCash() < v[1] then
				Talk(1,"",format(self.tbLang.szCashNotEngouh, ceil(v[1] / 10000)))
				return nRetCode
			end
		end
		if getn(v) == 5 then
			if GetItemCount(v[1], v[2], v[3]) < v[4] then
				Talk(1,"",format(self.tbLang.szItemNotEngouh, v[5], v[4]))
				return nRetCode
			end
		end
	end

	nRetCode = 1
	return nRetCode
end

function tbKillNpcDaily:CostKillNpcNeed(nSelectType)
	nSelectType = nSelectType or NORMAL_TYPE
	local tbAward = self.tbAward[nSelectType]
	if not tbAward then
		return
	end
	
	local tbFreeRoom = tbAward.tbFreeRoom
	local tbCost = tbAward.tbCost
	local nRetCode = 1

	for k, v in tbCost do
		if getn(v) == 1 then
			if Pay(v[1]) ~= 1 then
				nRetCode = 0
				break
			end
		end
		if getn(v) == 5 then
			if DelItem(v[1], v[2], v[3], v[4]) ~= 1 then
				nRetCode = 0
				break
			end
		end
	end
	
	return nRetCode
end

function tbKillNpcDaily:GivePrize(nSelectType)
	nSelectType = nSelectType or NORMAL_TYPE
	local tbAward = self.tbAward[nSelectType]
	if not tbAward then
		return
	end
	local tbPrize = tbAward.tbPrize
	for nIndex, tbAwardDetail in tbPrize do
		local nParamCount = getn(tbAwardDetail)
		if nParamCount == 2 then
			local szAwardKey = tbAwardDetail[1]
			local nAwardValue = tbAwardDetail[2]
			if szAwardKey == "Exp" then
				gf_Modify("Exp", nAwardValue);
			end
		elseif nParamCount == 5 then
			gf_AddItemEx2({tbAwardDetail[1], tbAwardDetail[2], tbAwardDetail[3], tbAwardDetail[4]},tbAwardDetail[5], self.tbLogInfo[1], self.tbLogInfo[2], 0, 1)
		end
	end
end

function tbKillNpcDaily:GetKillNpcPrize(nSelectType)
	nSelectType = nSelectType or NORMAL_TYPE
	local nRetCode, szError = self:CheckCondition()
	if nRetCode == 0 then
		Msg2Player(szError)
		return
	end
	
	nRetCode = self:CheckGetKillNpcPrize(nSelectType)--提示在内部
	if nRetCode == 0 then
		return
	end
	
	nRetCode = self:CostKillNpcNeed(nSelectType)--这里就不提示了
	if nRetCode == 0 then
		return
	end
	
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end
	
	local nIsGetPrize = taskGroup:GetTask(self.nGetPrizeTaskIndex)
	if nIsGetPrize ~= 0 then
		local szString = self.tbLang.szHaveGetPrize
		Msg2Player(szString)
		return 
	end
	
	taskGroup:SetTask(self.nGetPrizeTaskIndex, 1)
	self:GivePrize(nSelectType)
end

function tbKillNpcDaily:NpcShowMainDialog(tbSay)
	if gf_CheckEventDateEx(self.nActivityID) ~= 1 then
		return
	end
	
	tinsert(tbSay, format(self.tbLang.szAcceptTask, self.tbLang.szTaskName))
	tinsert(tbSay, self.tbLang.szGetTaskPrize)
	self:TryResetTaskVariant()
end


function tbKillNpcDaily:TriggerKillNpc(szNpcName)
	self:TryResetTaskVariant()
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return 
	end
	
	local nAcceptTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
	if nAcceptTask == 0 then
		return
	end
	
	local nCurMapID, nCurMapX, nCurMapY = GetWorldPos()
	gf_TeamOperateEX(function () --闭包，匿名函数，部分外部变量需要加%
		local nSelfMapID, nSelfMapX, nSelfMapY = GetWorldPos()
		if %nCurMapID ~= nSelfMapID then --队员都在同一个地图
			return
		end	
		--在指定地图
		local nTargetMapIndex = %taskGroup:GetTask(%tbKillNpcDaily.nRandomMapTaskIndex)
		local nTargetMapID = TB_MAP_ID[nTargetMapIndex]
		if nSelfMapID ~= nTargetMapID then
			return
		end
		local nCurCountTaskInfo = %taskGroup:GetTask(%tbKillNpcDaily.nTaskInfoTaskIndex)
		local tbTargetMapNpcInfo = TB_KILL_NPC[nTargetMapIndex]
		local szMapDesc = MAP_DESC[nTargetMapIndex]
		
		for nIndex, tbConfig in tbTargetMapNpcInfo do
			local szTargetNpcName = unpack(tbConfig)
			if strfind(%szNpcName, szTargetNpcName) ~= nil then
				local nNewCount = nCurCountTaskInfo + 1
				%taskGroup:SetTask(%tbKillNpcDaily.nTaskInfoTaskIndex, nNewCount)
				local nTargetNum = %tbKillNpcDaily.nTargetKillNpcNum
				local szString = ""
				if nNewCount >= %tbKillNpcDaily.nTargetKillNpcNum then
					szString = format(%tbKillNpcDaily.tbLang.szKillNpcFinishTip, szMapDesc, nNewCount, nTargetNum)
				else
					szString = format(%tbKillNpcDaily.tbLang.szKillNpcTip, szMapDesc, nNewCount, nTargetNum)
				end
				Msg2Player(szString)
			end
		end
	end)
end
-----------------------------------------------------
function KillNpcDailyServerStartUp()
	tbKillNpcDaily:InitTaskGroup()
end

function KillNpcDailyPlayerLogin()
	tbKillNpcDaily:TryResetTaskVariant()
end

function KillNpcDailyGetTask()

	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"","C竎 h� ch璦 gia nh藀 h� ph竔. Kh玭g th� nh薾 nhi謒 v�")
		return
	end
	
	if GetLevel() < 90 then
		Talk(1,"","C竎 h� c莕 t 輙 nh蕋 level 90  nh薾 nhi謒 v�!")
		return
	end
	tbKillNpcDaily:AcceptKillNpcTask()	
end

function KillNpcDailyGetAward()
	-- local nRetCode = tbKillNpcDaily:CheckGetKillNpcPrize()
	-- if nRetCode == 0 then
		-- return
	-- end
	local tbSay = {}
	tinsert(tbSay, format("%s/#SureGetDailyAward(%d)", tbKillNpcDaily.tbLang.szNpcNormalSelection, NORMAL_TYPE))
	tinsert(tbSay, format("%s/#SureGetDailyAward(%d)", tbKillNpcDaily.tbLang.szNpcAdvanceSelection, ADVANCED_TYPE))
	tinsert(tbSay, tbKillNpcDaily.tbLang.szNpcNothing)
	Say(format(tbKillNpcDaily.tbLang.szNpcGetAwardTittle ,GetNpcName(GetTargetNpc()), gf_GetPlayerSexName(), tbKillNpcWeekly.tbLang.szTaskName), getn(tbSay), tbSay)
end
	
function SureGetDailyAward(nSelectType)
	local tbSay = {}
	tinsert(tbSay,format("%s/#ConfirmSureGetDailyAward(%d)", tbKillNpcDaily.tbLang.szConfirmSelection, nSelectType))
	tinsert(tbSay, tbKillNpcDaily.tbLang.szNpcNothing)
	Say(format(tbKillNpcDaily.tbLang.szConfirmTittle ,tbKillNpcWeekly.tbLang.szTaskName), getn(tbSay), tbSay)
end

function ConfirmSureGetDailyAward(nSelectType)
	tbKillNpcDaily:GetKillNpcPrize(nSelectType)
end
