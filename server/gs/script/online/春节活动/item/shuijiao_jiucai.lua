Include("\\script\\online\\���ڻ\\newyear_head.lua")	
function OnUse()
	if DelItem(2,1,247,1) == 1 then
		AwardGenuineQi(10); -- Ch�n kh�
		Msg2Player("B�n nh�n ���c 10 �i�m ch�n kh�.")
	end
end