Include("\\script\\online\\���ڻ\\newyear_head.lua")	

TASKVAL_BAIJUWAN 	= 2501
MINGXIANG_TIME 		= 60 -- ڤ��ʱ�� | Unit: minutes

function OnUse()
	if DelItem(2,1,252,1) == 1 then
		local value = GetTask(TASKVAL_BAIJUWAN) + MINGXIANG_TIME
		SetTask(TASKVAL_BAIJUWAN, value)
		Msg2Player("Th�i gian B�ch C�u ho�n c�n l�i [" .. value .. "] ph�t!")
	end
end