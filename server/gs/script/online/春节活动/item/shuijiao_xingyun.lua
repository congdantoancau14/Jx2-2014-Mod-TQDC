Include("\\script\\online\\春节活动\\newyear_head.lua")	

TASKVAL_BAIJUWAN 	= 2501
MINGXIANG_TIME 		= 60 -- 冥想时间 | Unit: minutes

function OnUse()
	if DelItem(2,1,252,1) == 1 then
		local value = GetTask(TASKVAL_BAIJUWAN) + MINGXIANG_TIME
		SetTask(TASKVAL_BAIJUWAN, value)
		Msg2Player("Th阨 gian B筩h C﹗ ho祅 c遪 l筰 [" .. value .. "] ph髏!")
	end
end