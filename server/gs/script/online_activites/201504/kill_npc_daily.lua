Include("\\script\\online_activites\\201504\\head.lua")
Include("\\script\\online_activites\\201504\\kill_npc_weekly.lua")
NORMAL_TYPE = 1 --ÆÕÍ¨
ADVANCED_TYPE = 2 --¸ß¼¶

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

--·þÎñÆ÷Æô¶¯ÒÔºó£¬È«·þÎ±Ëæ»ú¶ÔÓ¦µÄµØÍ¼
TB_MAP_PASEUDORANDOM = {1,1,2,3,2,3,1,2,3,2,1,2,3,2,2,1,3,2,1,1,2,2,2,1,3}
TB_MAP_TOTAL_DAY = getn(TB_MAP_PASEUDORANDOM)
TB_KILL_NPC = 
{
	[MAP_1] = 
	{
		{"Tiªu Tiªn Tö"},
		{"Tú Bµ Tiªn Tö"},
	},
	[MAP_2] = 
	{
		{"CÇm Tiªn Tö"},
		{"T¶n Tiªn Tö"},
	},
	[MAP_3] = 
	{
		{"§Þch tiªn Tö"},
		{"KiÕm tiªn Tö"},
	}
}
MAP_DESC = 
{
	[MAP_1] = "V­¬ng MÉu ®éng_1",
	[MAP_2] = "V­¬ng MÉu ®éng_2",
	[MAP_3] = "V­¬ng MÉu ®éng-3",
}

tbKillNpcDaily = {}

tbKillNpcDaily.nActivityID = 152
--tbKillNpcDaily.tbOpenDate = {2015032300, 2015050100}£¬ÔÚ\script\online_activites\online_activites.txtÓÐÅäÖÃ
tbKillNpcDaily.tbTaskGroupId = {7, 12}
tbKillNpcDaily.nAcceptTaskTaskIndex = 1 --ÊÇ·ñÁìÈ¡ÈÎÎñ
tbKillNpcDaily.nGetPrizeTaskIndex = 2 --ÊÇ·ñÁìÈ¡½±Àø
tbKillNpcDaily.nRetsetTaskTaskIndex = 3 --ÖØÖÃÈÎÎñ±äÁ¿
tbKillNpcDaily.nTaskInfoTaskIndex = 4 --ÈÎÎñÐÅÏ¢£¬É±¹ÖÇé¿ö
tbKillNpcDaily.nRandomMapTaskIndex = 5 --Ëæ»úµÄµØÍ¼×Ô¶¨ÒåID

tbKillNpcDaily.tbLogInfo = {"Ho¹t ®éng th¸ng 04/2015", "Ho¹t ®éng th¸ng 04/2015"}
tbKillNpcDaily.tbAward = 
{
	[NORMAL_TYPE] = 
	{
		tbFreeRoom = {1,1},
		tbCost = 
		{
			{2, 1, 30603, 29, "Tiªu Dao Ngäc"},
			{2, 1, 30807, 2000, "èng Phãng"},
			{2, 1, 30806, 2000, "Ngßi Ph¸o"},
		},
		tbPrize = 
		{
			{"Exp", 39000000},
			{2, 1, 30808, 1000, "Thuèc Næ"},
			{2, 1, 30785, 9, "V« Tù Kinh Th­"},
		}
	},
	[ADVANCED_TYPE] = 
	{
		tbFreeRoom = {1,1},
		tbCost = 
		{
			{2, 1, 30603, 299, "Tiªu Dao Ngäc"},
			{2, 1, 30807, 2000, "èng Phãng"},
			{2, 1, 30806, 2000, "Ngßi Ph¸o"},
		},
		tbPrize = 
		{
			{"Exp", 99000000},
			{2, 1, 30785, 19, "V« Tù Kinh Th­"},
			{2, 1, 30811, 99, "Ph¸o Hoa Vinh Dù"},
		}
	}
}

tbKillNpcDaily.tbOpenWeek = {1,2,3,4,5,6,0}
tbKillNpcDaily.tbTaskGroup = nil
tbKillNpcDaily.nTargetKillNpcNum = 399

tbKillNpcDaily.tbLang = 
{
	szTaskName = "Thu thËp Ph¸o Hoa Vinh Dù (Ngµy th­êng)",
	szOpenDateTimeError = "HiÖn t¹i kh«ng ph¶i thêi gian më tÝnh n¨ng, xin vui lßng ®îi.",
	szOpenWeekTimeError = "TÝnh n¨ng nµy chØ më vµo %s, xin vui lßng ®îi.",
	szAcceptTask = "\nNhËn nhiÖm vô %s/KillNpcDailyGetTask",
	szGetTaskPrize = "NhËn phÇn th­ëng nhiÖm vô/KillNpcDailyGetAward",
	szHaveAcceptTask = "B¹n ®· nhËn nhiÖm vô nµy råi, h·y ®Õn b¶n ®å<color=gold> %s <color> tiªu diÖt ®ñ sè l­îng qu¸i sÏ hoµn thµnh nhiÖm vô!<enter>NÕu nh­ ®· hoµn thµnh th× h·y nhí nhËn th­ëng nhÐ!",
	szAcceptTaskSuccess = "Chóc mõng, b¹n ®· nhËn nhiÖm vô nµy råi, h·y ®Õn b¶n ®å %s tiªu diÖt ®ñ sè l­îng qu¸i sÏ hoµn thµnh nhiÖm vô!",
	szNotFinishTask = "RÊt tiÕc, b¹n vÉn ch­a hoµn thµnh nhiÖm vô, h·y ®Õn b¶n ®å <color=gold> %s <color> tiªu diÖt ®ñ sè l­îng qu¸i sÏ hoµn thµnh nhiÖm vô!",
	szHaveGetPrize = "B¹n ®· nhËn phÇn th­ëng nhiÖm vô nµy råi, lÇn sau h·y quay l¹i.",
	szHaveGetOtherPrize = "B¹n ®· nhËn phÇn th­ëng cña %s, kh«ng thÓ nhËn phÇn th­ëng nhiÖm vô nµy, lÇn sau h·y quay l¹i!",
	szCashNotEngouh = "Ng©n l­îng kh«ng ®ñ %d vµng",
	szItemNotEngouh = "vËt phÈm trong tói  %s sè l­îng kh«ng ®ñ %d c¸i",
	szNpcNormalSelection = "Hoµn thµnh nhiÖm vô phæ th«ng (Tiªu hao 2000 Ngßi Ph¸o + 2000 èng Phãng + 29 Tiªu Dao Ngäc)",
	szNpcAdvanceSelection = "Hoµn thµnh nhiÖm vô cao cÊp (Tiªu hao 2000 Ngßi Ph¸o + 2000 èng Phãng + 299 Tiªu Dao Ngäc)",
	szNpcNothing = "\nT«i chØ xem xem th«i/nothing",
	szNpcGetAwardTittle = "<color=green>%s:<color> %s muèn nhËn phÇn th­ëng g×?<enter><color=red>Chó ý: Sau khi nhËn phÇn th­ëng nµy sÏ kh«ng thÓ nhËn phÇn th­ëng cña <color=gold>%s<color><color>",
	szKillNpcTip = "Tiªu diÖt qu¸i ë %s %d/%d",
	szKillNpcFinishTip = "Tiªu diÖt qu¸i ë %s %d/%d (Hoµn thµnh)",
	szConfirmSelection = "§óng, ta ®· suy nghÜ kü råi.",
	szConfirmTittle = "<enter><color=red>Chó ý: Sau khi nhËn phÇn th­ëng nµy th× sau nµy kh«ng thÓ nhËn phÇn th­ëng cña <color=gold>%s<color>,<color> ®ång ý nhËn kh«ng?",
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
	--¶ÓÔ±Ò²ÒªÍê³É
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
	
	nRetCode = self:CheckGetKillNpcPrize(nSelectType)--ÌáÊ¾ÔÚÄÚ²¿
	if nRetCode == 0 then
		return
	end
	
	nRetCode = self:CostKillNpcNeed(nSelectType)--ÕâÀï¾Í²»ÌáÊ¾ÁË
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
	gf_TeamOperateEX(function () --±Õ°ü£¬ÄäÃûº¯Êý£¬²¿·ÖÍâ²¿±äÁ¿ÐèÒª¼Ó%
		local nSelfMapID, nSelfMapX, nSelfMapY = GetWorldPos()
		if %nCurMapID ~= nSelfMapID then --¶ÓÔ±¶¼ÔÚÍ¬Ò»¸öµØÍ¼
			return
		end	
		--ÔÚÖ¸¶¨µØÍ¼
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
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i. Kh«ng thÓ nhËn nhiÖm vô")
		return
	end
	
	if GetLevel() < 90 then
		Talk(1,"","C¸c h¹ cÇn ®¹t Ýt nhÊt level 90 ®Ó nhËn nhiÖm vô!")
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
