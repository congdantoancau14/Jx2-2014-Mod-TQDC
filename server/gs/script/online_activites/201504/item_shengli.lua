Include("\\script\\online_activites\\201504\\main_head.lua")

function OnUse(nItemIndex)
	if gf_CheckEventDateEx(VET_201504_ID) ~= 1 then
		Talk(1,"","VÀt ph»m Æ∑ h’t hπn!");
		return 0;
	end
	
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end