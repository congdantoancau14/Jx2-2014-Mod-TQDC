Include("\\script\\online\\���ڻ\\newyear_head.lua")	
function OnUse()
	if DelItem(2,1,244,1) == 1 then
		ModifyReputation(10,0)
		Msg2Player("B�n nh�n ���c 10 �i�m danh v�ng.")
	end
end