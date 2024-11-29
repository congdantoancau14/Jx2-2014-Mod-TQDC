Include("\\script\\online_activites\\201504\\main_head.lua")

function OnUse(nItemIndex)
	if gf_CheckEventDateEx(VET_201504_ID) ~= 1 then
		Talk(1,"","VÀt ph»m Æ∑ h’t hπn!");
		return 0;
	end
	
	local nShengliUseTimes = VET_201504_GetShengLiUseTime()
	local nShengLiMaxTime = VET_201504_GetShengLiMaxUseTime()
	
	local nHuiHuangUseTimes = VET_201504_GetHuiHuangUseTime()
	local nHuiHuangMaxTime = VET_201504_GetHuiHuangMaxUseTime()
	
	if nShengliUseTimes < nShengLiMaxTime or nHuiHuangUseTimes < nHuiHuangMaxTime then
		local szString = format("Ph∂i sˆ dÙng %d Ph∏o Hoa Chi’n Thæng vµ %d Ph∏o Hoa Huy Hoµng mÎi Æ≠Óc dÔng Ph∏o Hoa Vinh D˘", nShengLiMaxTime, nHuiHuangMaxTime)
		Talk(1,"",szString);
		return 0;
	end
	
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end