Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if GetItemCount(2, 1, 30796) < 20 then
		Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "Tµng B¶o §å", 20));
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30796, 20) ~= 1 then
		return 0;
	end
	local tAwart = {
		{1, 10, "Tµng R­¬ng", {2, 1, 30341, 1}, 0},
		{1, 10, "Thiªn Th¹ch linh th¹ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
		{1, 10, "Hép M¶nh Thiªn Th¹ch (Nhá)", {2, 1, 30788, 1}, 7 * 24 * 3600},
		{1, 10, "Bao m¶nh Thiªn Th¹ch", {2, 1, 1049, 1}, 15 * 24 * 3600},
		{1, 10, "Tói Thiªn Th¹ch Tinh Th¹ch", {2, 1, 3356, 1}, 7 * 24 * 3600},
		{1, 10, "Trøng Linh Thó-Cao", {2, 1, 30728, 1}, 0},
		{1, 10, "N÷ Oa Tinh Th¹ch", {2, 1, 504, 1}, 7 * 24 * 3600},
		{1, 10, "ChuyÓn Sinh §¬n ", {2, 1, 30345, 1}, 15 * 24 * 3600},
		{2, 10, 999999999, 1},
		{32, 10, 99999, 1},
	}
	gf_EventGiveRandAward(tAwart, gf_SumRandBase(tAwart), 1, "Tµng R­¬ng", "Tµng R­¬ng")
end