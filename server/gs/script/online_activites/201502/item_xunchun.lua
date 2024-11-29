Include("\\script\\online_activites\\head\\activity_normal_head.lua")

function OnUse(nItem)
	if gf_CheckEventDateEx(147) ~= 1 then
		Talk(1,"","VËt phÈm ®· hÕt h¹n!");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end 
	if GetTask(2768) >= 4000 then
		Talk(1,"",format("%s sö dông ®· ®¹t giíi h¹n %d", "Nô TÇm Xu©n", 4000));
		return 0;
	end
	if GetTask(2768) >= 2000 then
		if GetTask(2769) < 1 or  GetTask(2764) < 1 or GetTask(2765) < 1 then
			Talk(1,"","§¹i hiÖp ch­a nhËn phÇn th­ëng cuèi mèc 2000 nªn kh«ng thÓ sö dông tiÕp vËt phÈm event !!!!")
			return 0
		end
	end
	if GetTask(2766) < 2000 or GetTask(2767) < 2000 then
		Talk(1,"",format("Sè l­îng sö dông %s vµ %s ch­a ®¹t %d c¸i, kh«ng thÓ sö dông %s", "Nh¸nh §µo", "Nh¸nh Mai", 2000, "Nô TÇm Xu©n"));
		return 0;
	end
	
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	SetTask(2768, GetTask(2768) + 1);
--	VET_201502_LookUsedNum();
	
	gf_ModifyExp(1500000);
	gf_EventGiveCustomAward(3, 2, 1);
	gf_EventGiveCustomAward(4, 2, 1);
	local tAward = {
		{2, 1997, 5000000, 1},
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
		{1, 3, "L©n S­", {0,105,30044,1,1,-1,-1,-1,-1,-1,-1,-1,0}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho¹t ®éng th¸ng 2 n¨m 2015", "Nô TÇm Xu©n");
end

function VET_201502_AdditionDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(147) == 1 then
		tinsert(tbSayDialog, format("NhËn phÇn th­ëng cuèi %s /VET_201502_GetFinalAward", "Nô TÇm Xu©n"));
		tinsert(tbSayDialog, format("KiÓm tra sè l­îng %s ®· sö dông/VET_201502_LookUsedNum", "Nô TÇm Xu©n"));
	end
	return tbSayDialog, szSayHead;
end

function VET_201502_GetFinalAward()
	if GetTask(2768) < 2000 then
		Talk(1,"",format("Giíi h¹n sö dông cña %s ch­a ®¹t %d, kh«ng thÓ nhËn phÇn th­ëng cuèi cïng.", "Nô TÇm Xu©n", 2000))
		return 0;
	end
	if GetTask(2769) ~= 0 then
		Talk(1,"",format("B¹n ®· nhËn phÇn th­ëng cuèi cïng cña %s, kh«ng thÓ nhËn l¹i.", "Nô TÇm Xu©n"));
		return 0;
	end
	if gf_Judge_Room_Weight(5, 100, " ") ~= 1 then
		return 0;
	end
	SetTask(2769, 1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({1, 1, 15, 222}, "B¸nh Bét vµng", "Ho¹t ®éng th¸ng 1 n¨m 2015", "Nô TÇm Xu©n", 0, 1);
	gf_AddItemEx2({1, 1, 19, 222}, "T©y B¾c Väng", "Ho¹t ®éng th¸ng 1 n¨m 2015", "Nô TÇm Xu©n", 0, 1);
	gf_AddItemEx2({1, 1, 17, 222}, "Minh NguyÖt D¹", "Ho¹t ®éng th¸ng 1 n¨m 2015", "Nô TÇm Xu©n", 0, 1);
	gf_EventGiveCustomAward(31, 9999, 1, "Ho¹t ®éng th¸ng 1 n¨m 2015", "Nô TÇm Xu©n");
	gf_EventGiveCustomAward(27, 9999, 1, "Ho¹t ®éng th¸ng 1 n¨m 2015", "Nô TÇm Xu©n");
	gf_AddItemEx2({2, 1, 30344, 4}, "ThÇn Tµi B¶o R­¬ng", "Ho¹t ®éng th¸ng 2 n¨m 2015", "Nô TÇm Xu©n", 0, 1);
end

function VET_201502_LookUsedNum()
	local msg = format("HiÖn nay<color=green>%s<color>cña ng­¬i: sè l­îng sö dông lµ :%d/%d ", "Nô TÇm Xu©n", GetTask(2768), 4000);
	Talk(1,"","<color=green>Nh¾c nhë<color>:"..msg)
end