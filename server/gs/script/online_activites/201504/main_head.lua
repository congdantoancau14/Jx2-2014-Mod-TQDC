Include("\\script\\lib\\globalfunctions.lua") --公共函数文件
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")


--兑换功能在使用机制\script\online_activites\ini\VnOnlineMain.ini
--和VnOnlineMain.ini [154]配置要一致，实际从VnOnlineMain.ini抽取出一些配置信息
--再做二次封装，使之好用一些。

VET_201504_ID = 154
VET_201504_ACTIVITY_CONFIG = TB_VN_ACTIVITY_MAIN[VET_201504_ID]
tbShengliPrizeItemInfo = VET_201504_ACTIVITY_CONFIG.tbPrizeItemInfo[1]--胜利爆竹
tbHuiHuangPrizeItemInfo = VET_201504_ACTIVITY_CONFIG.tbPrizeItemInfo[2]--辉煌爆竹
tbRongYuPrizeItemInfo = VET_201504_ACTIVITY_CONFIG.tbPrizeItemInfo[3]--荣誉爆竹

function VET_201504_GetShengLiUseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201504_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201504_ACTIVITY_CONFIG.tbTaskGroup[2], tbShengliPrizeItemInfo.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201504_GetHuiHuangUseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201504_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201504_ACTIVITY_CONFIG.tbTaskGroup[2], tbHuiHuangPrizeItemInfo.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201504_GetRongYuUseTime()
	local nUseTimes = Vet_Activity_GetItemUseInfo(VET_201504_ACTIVITY_CONFIG.tbTaskGroup[1], VET_201504_ACTIVITY_CONFIG.tbTaskGroup[2], tbRongYuPrizeItemInfo.nTaskIdUseItemTimes)
	return nUseTimes
end

function VET_201504_GetShengLiMaxUseTime()
	local nMaxTime = tbShengliPrizeItemInfo.nItemUseTimesMax
	return nMaxTime
end

function VET_201504_GetHuiHuangMaxUseTime()
	local nMaxTime = tbHuiHuangPrizeItemInfo.nItemUseTimesMax
	return nMaxTime
end

function VET_201504_GetRongYuMaxUseTime()
	local nMaxTime = tbRongYuPrizeItemInfo.nItemUseTimesMax
	return nMaxTime
end