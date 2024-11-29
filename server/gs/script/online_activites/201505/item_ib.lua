Include("\\script\\online_activites\\201505\\main_head.lua")

function OnUse(nItemIndex)
	if gf_CheckEventDateEx(VET_201505_ID) ~= 1 then
		Talk(1,"","VÀt ph»m Æ∑ h’t hπn!");
		return 0;
	end
	if VET_201505_Item1UseTime()<VET_201505_GetItem1MaxUseTime() then
		Talk(1,"","Sˆ dÙng h’t 2000 kem d©u t©y vµ 2000 kem trµ xanh mÌi Æ≠Óc sˆ dÙng!");
		return 0
	end
	if VET_201505_Item2UseTime()<VET_201505_GetItem2MaxUseTime() then
		Talk(1,"","Sˆ dÙng h’t 2000 kem d©u t©y vµ 2000 kem trµ xanh mÌi Æ≠Óc sˆ dÙng!");
		return 0
	end
	
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end