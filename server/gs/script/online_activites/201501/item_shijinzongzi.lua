Include("\\script\\online_activites\\head\\activity_normal_head.lua")

function OnUse(nItem)
	if gf_CheckEventDateEx(144) ~= 1 then
		Talk(1,"","B¸nh İt thËp cÈm ®· hÕt h¹n sö dông");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end 
	if GetTask(2848) >= 2000 then
		Talk(1,"",format("Sè lÇn sö dông B¸nh İt thËp cÈm ®· ®¹t giíi h¹n %d", 2000));
		return 0;
	end
	if GetTask(2846) < 2000 or GetTask(2847) < 2000 then
		Talk(1,"",format("Nh©n vËt ph¶i sö dông %d b¸nh ch­ng ®á vµ b¸nh ch­ng ®Ëu xanh míi ®­îc sö dông b¸nh İt thËp cÈm", 2000));
		return 0;
	end
	
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	SetTask(2848, GetTask(2848) + 1);
	--VET_201501_LookUsedNum();
	
	gf_ModifyExp(1500000);
	gf_EventGiveCustomAward(3, 2, 1);
	gf_EventGiveCustomAward(4, 2, 1);
	local tAward = {
		{2, 2000, 10000000, 1},
		{2, 1500, 15000000, 1},
		{2, 1000, 20000000, 1},
		{2, 384, 30000000, 1},
		{1, 50, "Tµng R­¬ng", {2, 1, 30341, 1}, 0},
		{1, 25, "Thiªn Th¹ch linh th¹ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
		{1, 25, "§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2, 1, 1067, 1}, 7 * 24 * 3600},
		{1, 50, "§¹i §Şnh Hån ", {2, 1, 1113, 1}, 7 * 24 * 3600},
		{1, 100, "VĞ TiÕu Y Vµng", {2, 1, 30491, 1}, 7 * 24 * 3600},
		{1, 500, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 0},
		{1, 50, "ChuyÓn Sinh §¬n ", {2, 1, 30345, 1}, 7 * 24 * 3600},
		{33, 600, 500, 1},
		{4, 1000, 200, 1},
		{5, 1000, 200, 1},
		{32, 491, 1000, 1},
		{1, 800, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 300, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		{1, 100, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}, 0},
		{1, 10, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 7 * 24 * 3600},
		{1, 5, "ThÇn Tµi B¶o R­¬ng", {2, 1, 30344, 1}, 0},
		{1, 10, "L¹c §µ Tr¾ng", {0, 105, 148, 1, 1, -1, -1, -1, -1, -1, -1}, 15 * 24 * 3600},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho¹t ®éng th¸ng 1 n¨m 2015", "B¸nh İt thËp cÈm");
end

function VET_201501_AdditionDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(144) == 1 then
		tinsert(tbSayDialog, "NhËn gi¶i th­ëng cuèi cña b¸nh İt thËp cÈm/VET_201501_GetFinalAward");
		tinsert(tbSayDialog, "Xem sè lÇn ®· sö dông b¸nh İt thËp cÈm/VET_201501_LookUsedNum");
	end
	return tbSayDialog, szSayHead;
end

function VET_201501_GetFinalAward()
	if GetTask(2848) < 2000 then
		Talk(1,"",format("Sè lÇn sö dông B¸nh İt thËp cÈm ch­a ®Õn %d, kh«ng ®­îc nhËn th­ëng cuèi cïng", 2000))
		return 0;
	end
	if GetTask(2849) ~= 0 then
		Talk(1,"","Ng­¬i ®· nhËn phÇn th­ëng cuèi cña b¸nh İt thËp cÈm, kh«ng thÓ nhËn l¹i.");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 100, " ") ~= 1 then
		return 0;
	end
	SetTask(2849, 1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({1, 1, 15, 111}, "B¸nh Bét vµng", "Ho¹t ®éng th¸ng 1 n¨m 2015", "B¸nh İt thËp cÈm", 0, 1);
	gf_AddItemEx2({1, 1, 19, 111}, "T©y B¾c Väng", "Ho¹t ®éng th¸ng 1 n¨m 2015", "B¸nh İt thËp cÈm", 0, 1);
	gf_AddItemEx2({1, 1, 17, 111}, "Minh NguyÖt D¹", "Ho¹t ®éng th¸ng 1 n¨m 2015", "B¸nh İt thËp cÈm", 0, 1);
	gf_EventGiveCustomAward(31, 9999, 1, "Ho¹t ®éng th¸ng 1 n¨m 2015", "B¸nh İt thËp cÈm");
	gf_EventGiveCustomAward(27, 9999, 1, "Ho¹t ®éng th¸ng 1 n¨m 2015", "B¸nh İt thËp cÈm");
	gf_AddItemEx2({2, 1, 30344, 4}, "ThÇn Tµi B¶o R­¬ng", "Ho¹t ®éng th¸ng 1 n¨m 2015", "B¸nh İt thËp cÈm", 0, 1);
	gf_AddItemEx2({0, 105, 30000, 1, 1, -1, -1, -1, -1, -1, -1}, "Kú l©n", "Ho¹t ®éng th¸ng 1 n¨m 2015", "B¸nh İt thËp cÈm", 0, 1);
end

function VET_201501_LookUsedNum()
	local msg = format("HiÖn nay<color=green>%s<color>cña ng­¬i: sè l­îng sö dông lµ :%d/%d ", "B¸nh İt thËp cÈm", GetTask(2848), 2000);
	Talk(1,"","<color=green>Nh¾c nhë<color>:"..msg)
end