Include("\\script\\online\\���ڻ\\newyear_head.lua")	
function OnUse()
	if DelItem(2,1,243,1) == 1 then
		ModifyExp(100000)
		Msg2Player("B�n nh�n ���c 100000 �i�m kinh nghi�m.")
	end
end