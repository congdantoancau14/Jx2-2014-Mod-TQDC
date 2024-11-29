Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")


--兑换功能在使用机制\script\online_activites\ini\VnOnlineMain.ini
--和VnOnlineMain.ini [154]配置要一致，实际从VnOnlineMain.ini抽取出一些配置信息
--再做二次封装，使之好用一些。

VET_201505_ID = 155
VET_201505_ACTIVITY_CONFIG = TB_VN_ACTIVITY_MAIN[VET_201505_ID]
if VET_201505_ACTIVITY_CONFIG then
	tbPrizeItem1Info = VET_201505_ACTIVITY_CONFIG.tbPrizeItemInfo[1]--草莓冰淇淋
	tbPrizeItem2Info = VET_201505_ACTIVITY_CONFIG.tbPrizeItemInfo[2]--绿茶冰淇淋
	tbPrizeItem3Info = VET_201505_ACTIVITY_CONFIG.tbPrizeItemInfo[3]--水果糖浆
end

function VET_201505_Item1UseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201505_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201505_ACTIVITY_CONFIG.tbTaskGroup[2], tbPrizeItem1Info.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201505_Item2UseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201505_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201505_ACTIVITY_CONFIG.tbTaskGroup[2], tbPrizeItem2Info.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201505_Item3UseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201505_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201505_ACTIVITY_CONFIG.tbTaskGroup[2], tbPrizeItem3Info.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201505_GetItem1MaxUseTime()
	local nMaxTime = tbPrizeItem1Info.nItemUseTimesMax
	return nMaxTime
end

function VET_201505_GetItem2MaxUseTime()
	local nMaxTime = tbPrizeItem2Info.nItemUseTimesMax
	return nMaxTime
end

function VET_201505_GetItem3MaxUseTime()
	local nMaxTime = tbPrizeItem3Info.nItemUseTimesMax
	return nMaxTime
end