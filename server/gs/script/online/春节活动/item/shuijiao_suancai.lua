Include("\\script\\online\\���ڻ\\newyear_head.lua")	
function OnUse()
	if DelItem(2,1,246,1) == 1 then
		SetTask(701, GetTask(701)+20); --C�ng tr�ng
		Msg2Player("B�n nh�n ���c 20 �i�m c�ng tr�ng.")
	end
end