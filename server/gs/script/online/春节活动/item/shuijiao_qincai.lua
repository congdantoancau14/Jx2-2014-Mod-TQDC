Include("\\script\\online\\���ڻ\\newyear_head.lua")	
function OnUse()
	if DelItem(2,1,245,1) == 1 then
		SetTask(336,GetTask(336)+10);  --S� M�n
		Msg2Player("B�n nh�n ���c 10 �i�m s� m�n.")
	end
end