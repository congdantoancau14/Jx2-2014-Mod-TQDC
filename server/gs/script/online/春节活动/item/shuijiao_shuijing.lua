Include("\\script\\online\\���ڻ\\newyear_head.lua")	

TASKVAL_SHENNONGDAN	= 2502		-- ���������������ũ����ʣ��ʱ�䣨���ӣ�
MINGXIANG_TIME 		= 60 -- ڤ��ʱ�� | Unit: minutes

function OnUse()
	local value = GetTask(TASKVAL_SHENNONGDAN) + MINGXIANG_TIME
	if value > 200000000 then --����2������
		Say("V��t qu� th�i gian gi�i h�n!",1,"��ng �/no");
		return
	end
	if DelItem(2,1,253,1) == 1 then	
		SetTask(TASKVAL_SHENNONGDAN, value)
		Msg2Player("Th�i gian Th�n N�ng ��n c�n l�i [" .. value .. "] ph�t!")
	end
end