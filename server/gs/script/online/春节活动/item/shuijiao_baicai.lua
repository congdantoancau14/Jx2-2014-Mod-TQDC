Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
function OnUse()
	if DelItem(2,1,243,1) == 1 then
		ModifyExp(100000)
		Msg2Player("B¹n nhËn ®­îc 100000 ®iÓm kinh nghiÖm.")
	end
end