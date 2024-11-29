Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
function OnUse()
	if DelItem(2,1,244,1) == 1 then
		ModifyReputation(10,0)
		Msg2Player("B¹n nhËn ®­îc 10 ®iÓm danh väng.")
	end
end