Include("\\script\\online_activites\\201504\\head.lua")
Include("\\script\\online_activites\\201504\\kill_npc_daily.lua")

--ÓÉÓÚÔ­À´µÄactivity_kill_npc»úÖÆ²»Ö§³ÖÅäÖÃ¶à¸öÈÎÎñÁìÈ¡£¬Ö¸¶¨ÈÕÆÚÁìÈ¡£¬ÁìÈ¡Ìõ¼þµÄÎÊÌâ£¬¹ÊÎªÁË¶ÌÊ±¼äÄÚ½â¾öÎÊÌâ¡£¹ÊÇ¿²åÖ®
tbKillNpcWeekly = {}

tbKillNpcWeekly.nActivityID = 153
--tbKillNpcWeekly.tbOpenDate = {2015032300, 2015050100}£¬ÔÚ\script\online_activites\online_activites.txtÓÐÅäÖÃ
tbKillNpcWeekly.tbTaskGroupId = {7, 12}
tbKillNpcWeekly.nAcceptTaskTaskIndex = 6 --ÊÇ·ñÁìÈ¡ÈÎÎñ
tbKillNpcWeekly.nGetPrizeTaskIndex = 7 --ÊÇ·ñÁìÈ¡½±Àø
tbKillNpcWeekly.nRetsetTaskTaskIndex = 8 --ÖØÖÃÈÎÎñ±äÁ¿
tbKillNpcWeekly.nTaskInfoTaskIndex = 9 --ÈÎÎñÐÅÏ¢£¬É±¹ÖÇé¿ö

tbKillNpcWeekly.tbLogInfo = {"Ho¹t ®éng th¸ng 04/2015", "Ho¹t ®éng th¸ng 04/2015"}
tbKillNpcWeekly.tbAward = 
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
		{"Exp", 150000000},
		{2, 1, 30785, 19, "V« Tù Kinh Th­"},
		{2, 1, 30811, 99, "Ph¸o Hoa Vinh Dù"},
	}
}

tbKillNpcWeekly.tbOpenWeek = {1,2,3,4,5,6,0}--ÐÇÆÚÁùºÍÐÇÆÚÌì¿ª·Å
tbKillNpcWeekly.tbTaskGroup = nil--serverÆô¶¯µÄÊ±ºò£¬¸ù¾ÝtbTaskGroupId²úÉú
tbKillNpcWeekly.nTargetKillNpcNum = 1

tbKillNpcWeekly.tbLang = 
{
	szTaskName = "Thu thËp Ph¸o Hoa Vinh Dù (Ngµy vµng)",
	szOpenDateTimeError = "HiÖn t¹i kh«ng ph¶i thêi gian më tÝnh n¨ng, xin vui lßng ®îi.",
	szOpenWeekTimeError = "TÝnh n¨ng nµy chØ më vµo %s, xin vui lßng ®îi.",
	szAcceptTask = "\nNhËn nhiÖm vô %s/KillNpcWeekGetTask",
	szGetTaskPrize = "NhËn phÇn th­ëng nhiÖm vô/KillNpcWeekGetAward",
	szHaveAcceptTask = "B¹n ®· nhËn nhiÖm vô nµy råi, h·y tiªu diÖt mét trong nh÷ng BOSS sau <color=gold><enter>§µo Hoa §¶o Chñ Hoµng Long: Phong Linh Ch©u,<enter>T©y Vùc Th­¬ng Lang B¸ V­¬ng: Háa Linh Ch©u,<enter>Ngäc S¬n Chi Linh Thiªn Cöu: L«i Linh Ch©u,<enter>U Tr¹ch Chi ¶nh Minh Vâ: §iÖn Linh Ch©u<color><enter> lµ cã thÓ hoµn thµnh nhiÖm vô!<enter>NÕu b¹n ®· hoµn thµnh råi th× nhí nhËn phÇn th­ëng nhÐ!",
	szAcceptTaskSuccess = "Chóc mõng, b¹n ®· nhËn nhiÖm vô, h·y tiªu diÖt mét trong nh÷ng con BOSS §µo Hoa §¶o Chñ Hoµng Long, T©y Vùc Th­¬ng Lang B¸ V­¬ng, Ngäc S¬n Chi Linh Thiªn Cöu, U Tr¹ch Chi ¶nh Minh Vâ sÏ cã thÓ hoµn thµnh nhiÖm vô!",
	szNotFinishTask = "RÊt tiÕc, b¹n vÉn ch­a hoµn thµnh nhiÖm vô, h·y tiÖu diÖt mét trong nh÷ng con BOSS <color=gold><enter>§µo Hoa §¶o Chñ Hoµng Long: Phong Linh Ch©u,<enter>T©y Vùc Th­¬ng Lang B¸ V­¬ng: Háa Linh Ch©u,<enter>Ngäc S¬n Chi Linh Thiªn Cöu: L«i Linh Ch©u,<enter>U Tr¹ch Chi ¶nh Minh Vâ: §iÖn Linh Ch©u<color><enter> sÏ cã thÓ hoµn thµnh nhiÖm vô!",
	szHaveGetPrize = "B¹n ®· nhËn phÇn th­ëng nhiÖm vô nµy råi, lÇn sau h·y quay l¹i.",
	szHaveGetOtherPrize = "B¹n ®· nhËn phÇn th­ëng cña %s, kh«ng thÓ nhËn phÇn th­ëng nhiÖm vô nµy, lÇn sau h·y quay l¹i!",
	szCashNotEngouh = "Ng©n l­îng kh«ng ®ñ %d vµng",
	szItemNotEngouh = "vËt phÈm trong tói  %s sè l­îng kh«ng ®ñ %d c¸i",
	szNpcSelection = "Hoµn thµnh nhiÖm vô BOSS (Tiªu hao 2000 Ngßi Ph¸o + 2000 èng Phãng + 299 Tiªu Dao Ngäc)",
	szNpcNothing = "\nT«i chØ xem xem th«i/nothing",
	szNpcGetAwardTittle = "<color=green>%s:<color> %s muèn nhËn phÇn th­ëng g×?<enter><color=red>Chó ý: Sau khi nhËn phÇn th­ëng nµy sÏ kh«ng thÓ nhËn phÇn th­ëng cña <color=gold>%s<color><color>",
	szKillNpcTip = "tiªu diÖt%s %d/%d",
	szKillNpcFinishTip = "Tiªu diÖt %s %d/%d (Hoµn thµnh)",
	szConfirmSelection = "§óng, ta ®· suy nghÜ kü råi.",
	szConfirmTittle = "<enter><color=red>Chó ý: Sau khi nhËn phÇn th­ëng nµy th× sau nµy kh«ng thÓ nhËn phÇn th­ëng cña <color=gold>%s<color>,<color> ®ång ý nhËn kh«ng?",
}

function tbKillNpcWeekly:InitTaskGroup()
	local objTaskGroup = TaskManager:Create(self.tbTaskGroupId[1], self.tbTaskGroupId[2]);
	tbKillNpcWeekly.tbTaskGroup = objTaskGroup
end

function tbKillNpcWeekly:TryResetTaskVariant()
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
	end
end

function tbKillNpcWeekly:CheckCondition()
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

function tbKillNpcWeekly:CheckDateTime()
	local nRetCode = gf_CheckEventDateEx(self.nActivityID)
	local szError = ""
	if nRetCode ~= 1 then
		szError = self.tbLang.szOpenDateTimeError
	end
	return nRetCode, szError
end
 
function tbKillNpcWeekly:CheckWeek()
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

function tbKillNpcWeekly:GetTaskGroup()
	self:InitTaskGroup()
	return self.tbTaskGroup
end

function tbKillNpcWeekly:AcceptKillNpcTask()
	local nRetCode, szError = self:CheckCondition()
	if nRetCode == 0 then
		Talk(1, "", szError)
		print(szError)
		return
	end
	
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end
	
	local nIsGetTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
	if nIsGetTask ~= 0 then
		local szString = self.tbLang.szHaveAcceptTask
		Talk(1, "", szString)
		return 
	end
	taskGroup:SetTask(self.nAcceptTaskTaskIndex, 1)
	TaskTip(self.tbLang.szAcceptTaskSuccess)
end

function tbKillNpcWeekly:OnFinishKillNpcTaskCallBack()
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

function tbKillNpcWeekly:CheckGetKillNpcPrize()
	local tbAward = self.tbAward
	local tbFreeRoom = tbAward.tbFreeRoom
	local tbCost = tbAward.tbCost
	local nRetCode = 0
	
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
	
	local dailyTaskGroup = tbKillNpcDaily:GetTaskGroup()
	if not dailyTaskGroup then
		return nRetCode
	end
	
	local nHaveGetDailyPrize = dailyTaskGroup:GetTask(tbKillNpcDaily.nGetPrizeTaskIndex)
	if nHaveGetDailyPrize ~= 0 then
		local szString = format(self.tbLang.szHaveGetOtherPrize, tbKillNpcDaily.tbLang.szTaskName)
		Talk(1,"",szString)
		return nRetCode
	end
	
	local nCurCount = taskGroup:GetTask(self.nTaskInfoTaskIndex)
	local nTargetCount = self.nTargetKillNpcNum
	if nCurCount < nTargetCount then
		local szString = self.tbLang.szNotFinishTask
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

function tbKillNpcWeekly:CostKillNpcNeed()
	local tbAward = self.tbAward
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

function tbKillNpcWeekly:GivePrize()
	local tbPrize = self.tbAward.tbPrize
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

function tbKillNpcWeekly:GetKillNpcPrize()
	local nRetCode, szError = self:CheckCondition()
	if nRetCode == 0 then
		Msg2Player(szError)
		return
	end
	
	nRetCode = self:CheckGetKillNpcPrize()--ÌáÊ¾ÔÚÄÚ²¿
	if nRetCode == 0 then
		return
	end
	
	nRetCode = self:CostKillNpcNeed()--ÕâÀï¾Í²»ÌáÊ¾ÁË
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
	self:GivePrize()
end

function tbKillNpcWeekly:NpcShowMainDialog(tbSay)
	if gf_CheckEventDateEx(self.nActivityID) ~= 1 then
		return
	end
	
	tinsert(tbSay, format(self.tbLang.szAcceptTask, self.tbLang.szTaskName))
	tinsert(tbSay, self.tbLang.szGetTaskPrize)
	self:TryResetTaskVariant()
end

function tbKillNpcWeekly:TriggerKillNpc(szNpcName)
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
	gf_TeamOperateEX(function()
		local nSelfMapID, nSelfMapX, nSelfMapY = GetWorldPos()
		if %nCurMapID ~= nSelfMapID then
			return
		end	
		--²»ÅÐ¶ÏNPCµÄÃû×ÖÁË¡£´¥·¢µÄ¿ÉÄÜÐÔÉÙ
		local nTargetNpcNum = %tbKillNpcWeekly.nTargetKillNpcNum
		local nCurCount = %taskGroup:GetTask(%tbKillNpcWeekly.nTaskInfoTaskIndex)
		local nNewCount = nCurCount + 1
		%taskGroup:SetTask(%tbKillNpcWeekly.nTaskInfoTaskIndex, nNewCount)
		local szString = ""
		if nNewCount >= nTargetNpcNum then
			szString = format(%tbKillNpcWeekly.tbLang.szKillNpcFinishTip, %szNpcName, nNewCount, nTargetNpcNum)
		else
			szString = format(%tbKillNpcWeekly.tbLang.szKillNpcTip, %szNpcName, nNewCount, nTargetNpcNum)
		end
		Msg2Player(szString)
	end)
end
-----------------------------------------------------
function KillNpcWeeklyServerStartUp()
	tbKillNpcWeekly:InitTaskGroup()
end

function KillNpcWeeklyPlayerLogin()
	tbKillNpcWeekly:TryResetTaskVariant()
end

function KillNpcWeekGetTask()
	tbKillNpcWeekly:AcceptKillNpcTask()	
end

function KillNpcWeekGetAward()
	local nRetCode = tbKillNpcWeekly:CheckGetKillNpcPrize()
	if nRetCode == 0 then
		return
	end
	local tbSay = {}
	tinsert(tbSay, format("%s/SureGetWeeklyAward", tbKillNpcWeekly.tbLang.szNpcSelection))
	tinsert(tbSay, tbKillNpcWeekly.tbLang.szNpcNothing)
	Say(format(tbKillNpcWeekly.tbLang.szNpcGetAwardTittle ,GetNpcName(GetTargetNpc()), gf_GetPlayerSexName(), tbKillNpcDaily.tbLang.szTaskName), getn(tbSay), tbSay)
end
	
function SureGetWeeklyAward(nSelectType)
	local tbSay = {}
	tinsert(tbSay,format("%s/ConfirmSureGetWeeklyAward", tbKillNpcWeekly.tbLang.szConfirmSelection))
	tinsert(tbSay, tbKillNpcDaily.tbLang.szNpcNothing)
	Say(format(tbKillNpcDaily.tbLang.szConfirmTittle ,tbKillNpcDaily.tbLang.szTaskName), getn(tbSay), tbSay)
end

function ConfirmSureGetWeeklyAward()
	tbKillNpcWeekly:GetKillNpcPrize()
end