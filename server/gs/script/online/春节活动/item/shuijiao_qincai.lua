Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
function OnUse()
	if DelItem(2,1,245,1) == 1 then
		SetTask(336,GetTask(336)+10);  --S­ M«n
		Msg2Player("B¹n nhËn ®­îc 10 ®iÓm s­ m«n.")
	end
end