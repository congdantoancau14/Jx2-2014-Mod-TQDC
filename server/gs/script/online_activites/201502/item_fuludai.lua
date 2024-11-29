Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if gf_CheckEventDateEx(147) ~= 1 then
		Talk(1,"","VËt phÈm ®· hÕt h¹n!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10," ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local tAward = {
		{1, 3610, "MÇm Xu©n", {2, 1, 30773, 20}, 0},
		{1, 3160, "MÇm Xu©n", {2, 1, 30773, 50}, 0},
		{1, 3060, "MÇm Xu©n", {2, 1, 30773, 100}, 0},
		{1, 100, "TiÒn LÎ", {2, 1, 30778, 1}, 0},
		{1, 50, "M©m Ngò Qu¶", {2, 1, 30784, 1}, 0},
		{1, 20, "Bao l× x× may m¾n", {2, 1, 30786, 1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "N¨m míi mõng xu©n", "Tói Léc §Çu N¨m")
end