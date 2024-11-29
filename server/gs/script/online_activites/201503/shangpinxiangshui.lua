Include("\\script\\online_activites\\head\\activity_normal_head.lua")

VET_201503_ID = 149
VET_201503_USE_MAX = 2000
VET_201503_ITEM_NAME = "N­íc Hoa §Æc BiÖt"
VET_201503_LOG = "Ho¹t ®éng th¸ng 3/2015"
VET_201503_ITEM_PRE1 = "N­íc Hoa Kh«"
VET_201503_ITEM_PRE2 = "N­íc Hoa Tinh ChÊt"
VET_201503_TASK_PRE1 = 2846
VET_201503_TASK_PRE2 = 2847
VET_201503_TASK_TIMES = 2848
VET_201503_TASK_AWARD = 2849

function OnUse(nItem)
	if gf_CheckEventDateEx(VET_201503_ID) ~= 1 then
		Talk(1,"","VËt phÈm ®· hÕt h¹n!");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end 
	if GetTask(VET_201503_TASK_TIMES) >= VET_201503_USE_MAX then
		Talk(1,"",format("%s sö dông ®· ®¹t giíi h¹n %d", VET_201503_ITEM_NAME, VET_201503_USE_MAX));
		return 0;
	end
	if GetTask(VET_201503_TASK_PRE1) < VET_201503_USE_MAX or GetTask(VET_201503_TASK_PRE2) < VET_201503_USE_MAX then
		Talk(1,"",format("Sè l­îng sö dông %s vµ %s ch­a ®¹t %d c¸i, kh«ng thÓ sö dông %s", VET_201503_ITEM_PRE1, VET_201503_ITEM_PRE2, VET_201503_USE_MAX, VET_201503_ITEM_NAME));
		return 0;
	end
	
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	SetTask(VET_201503_TASK_TIMES, GetTask(VET_201503_TASK_TIMES) + 1);
--	VET_201503_LookUsedNum();
	
	gf_ModifyExp(1500000);
	gf_EventGiveCustomAward(3, 2, 1);
	gf_EventGiveCustomAward(4, 2, 1);
	local tAward = {
		{2, 2000, 5000000, 1},
		{2, 1500, 10000000, 1},
		{2, 1000, 15000000, 1},
		{2, 500, 20000000, 1},
		{2, 100, 30000000, 1},
		{1, 50, "Tµng R­¬ng", {2, 1, 30341, 1}, 0},
		{1, 20, "Thiªn Th¹ch linh th¹ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
		{1, 20, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2, 1, 1067, 1}, 7 * 24 * 3600},
		{1, 500, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 0},
		{1, 30, "ChuyÓn Sinh §¬n ", {2, 1, 30345, 1}, 7 * 24 * 3600},
		{33, 600, 500, 1},
		{4, 1000, 200, 1},
		{5, 1000, 200, 1},
		{32, 500, 1000, 1},
		{1, 600, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 300, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		{1, 250, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}, 0},
		{1, 25, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 7 * 24 * 3600},
		{1, 5, "ThÇn Tµi B¶o R­¬ng", {2, 1, 30344, 1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, VET_201503_LOG, VET_201503_ITEM_NAME);
end

function VET_201503_AdditionDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201503_ID) == 1 then
		tinsert(tbSayDialog, format("NhËn phÇn th­ëng cuèi %s /VET_201503_GetFinalAward", VET_201503_ITEM_NAME));
		tinsert(tbSayDialog, format("KiÓm tra sè l­îng %s ®· sö dông/VET_201503_LookUsedNum", VET_201503_ITEM_NAME));
	end
	return tbSayDialog, szSayHead;
end

function VET_201503_GetFinalAward()
	if GetTask(VET_201503_TASK_TIMES) < VET_201503_USE_MAX then
		Talk(1,"",format("Giíi h¹n sö dông cña %s ch­a ®¹t %d, kh«ng thÓ nhËn phÇn th­ëng cuèi cïng.", VET_201503_ITEM_NAME, VET_201503_USE_MAX))
		return 0;
	end
	if GetTask(VET_201503_TASK_AWARD) ~= 0 then
		Talk(1,"",format("B¹n ®· nhËn phÇn th­ëng cuèi cïng cña %s, kh«ng thÓ nhËn l¹i.", VET_201503_ITEM_NAME));
		return 0;
	end
	if gf_Judge_Room_Weight(5, 100, " ") ~= 1 then
		return 0;
	end
	SetTask(VET_201503_TASK_AWARD, 1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({1, 1, 15, 222}, "B¸nh Bét vµng", VET_201503_LOG, VET_201503_ITEM_NAME, 0, 1);
	gf_AddItemEx2({1, 1, 19, 222}, "T©y B¾c Väng", VET_201503_LOG, VET_201503_ITEM_NAME, 0, 1);
	gf_AddItemEx2({1, 1, 17, 222}, "Minh NguyÖt D¹", VET_201503_LOG, VET_201503_ITEM_NAME, 0, 1);
	gf_EventGiveCustomAward(31, 9999, 1, VET_201503_LOG, VET_201503_ITEM_NAME);
	gf_EventGiveCustomAward(27, 9999, 1, VET_201503_LOG, VET_201503_ITEM_NAME);
	gf_AddItemEx2({2, 1, 30344, 6}, "ThÇn Tµi B¶o R­¬ng", VET_201503_LOG, VET_201503_ITEM_NAME, 0, 1);
end

function VET_201503_LookUsedNum()
	local msg = format("HiÖn nay<color=green>%s<color>cña ng­¬i: sè l­îng sö dông lµ :%d/%d ", VET_201503_ITEM_NAME, GetTask(2848), VET_201503_USE_MAX);
	Talk(1,"","<color=green>Nh¾c nhë<color>:"..msg)
end