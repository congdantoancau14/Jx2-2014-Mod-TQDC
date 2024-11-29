Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
function OnUse()
	if DelItem(2,1,246,1) == 1 then
		SetTask(701, GetTask(701)+20); --C«ng tr¹ng
		Msg2Player("B¹n nhËn ®­îc 20 ®iÓm c«ng tr¹ng.")
	end
end