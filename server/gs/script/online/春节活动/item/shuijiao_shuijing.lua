Include("\\script\\online\\春节活动\\newyear_head.lua")	

TASKVAL_SHENNONGDAN	= 2502		-- 该任务变量保存神农丹的剩余时间（分钟）
MINGXIANG_TIME 		= 60 -- 冥想时间 | Unit: minutes

function OnUse()
	local value = GetTask(TASKVAL_SHENNONGDAN) + MINGXIANG_TIME
	if value > 200000000 then --超过2亿上限
		Say("Vt qu� th阨 gian gi韎 h筺!",1,"уng �/no");
		return
	end
	if DelItem(2,1,253,1) == 1 then	
		SetTask(TASKVAL_SHENNONGDAN, value)
		Msg2Player("Th阨 gian Th莕 N玭g n c遪 l筰 [" .. value .. "] ph髏!")
	end
end