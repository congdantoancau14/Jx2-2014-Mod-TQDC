--=============================================
--create by liub 2011.8.2
--describe:越南版8月份活动 **上等中秋月饼脚本文件
--=============================================

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2011_08\\string.lua")

function OnUse(nItem)
	--时间判断
	local nCurrentTime = GetTime()
	local nInTime = MkTime(2011,08,26,0,0,0)
	local nOutTime = MkTime(2031,10,03,0,0,0)
	if nCurrentTime > nOutTime or nCurrentTime < nInTime then
		Talk(1,"","V藅 ph萴  qu� h筺 s� d鬾g")
		return
	end
	if DelItemByIndex(nItem,1) ~= 0 then
		gf_Modify("Exp",250000)
		gf_Modify("Rep",3)
		SetTask(336,GetTask(336)+3)
		WriteLogEx(VET_201108_CAKE_LOG_TITLE, "nh薾 250 ng祅 exp, 3 甶觤 danh v鋘g, 3 甶觤 s� m玭")
		Msg2Player("C竎 h� nh薾 頲 3 甶觤 S� M玭")
	end
end