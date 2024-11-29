Include("\\script\\online_activites\\201502\\spring_decorate.lua")

WPG_DIALOG = {
	"Ta muèn nép M©m Ngò Qu¶ (Tiªu hao 01 M©m Ngò Qu¶ vµ 01 Tiªu Dao Ngäc)/wpg_handup",
	"Ta muèn dïng Bao L× X× May M¾n ®Ó ®æi th­ëng/wpg_use_lucky",
	"Rêi Khái/nothing",
}

function wpg_handup()
	if gf_CheckEventDateEx(147) ~= 1 then
		return 0;
	end
	sd_DailyReset();
	local nCount = SD_TASK_GROUP:GetTask(SD_TASK_GROUP.WpgCount);
	if nCount >= 200 then
		Talk(1,"",format("Mçi ngµy ng­êi ch¬i chØ ®­îc nhËn th­ëng tèi ®a %d lÇn", 200));
		return 0;
	end
	if GetItemCount(2,1,30784) < 1 then
		Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "M©m ngò qu¶", 1));
		return 0;
	end
	if GetItemCount(2,1,30603) < 1 then
		Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "Tiªu Dao Ngäc", 1));
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, "") ~= 1 then
		return 0;
	end
	if DelItem(2,1,30784,1) ~= 1 or DelItem(2,1,30603,1) ~= 1 then
		return 0;
	end
	SD_TASK_GROUP:SetTask(SD_TASK_GROUP.WpgCount, nCount + 1);
	gf_ModifyExp(789000);
	local tAward = {
		{4, 10000, 20, 1},
		{5, 10000, 20, 1},	
		{32, 10000, 100, 1},	
		{1, 7000, "B¸nh Bét vµng", {1, 1, 15, 1}, 0},
		{1, 7000, "Minh NguyÖt D¹", {1, 1, 17, 1}, 0},
		{1, 7000, "T©y B¾c Väng", {1, 1, 19, 1}, 0},
		{1, 8000, "L«i Viªm Th¹ch", {2, 1, 30683, 1}, 0},
		{28, 9000, 10, 1},	
		{1, 8739, "B¨ng Tinh Th¹ch", {2, 1, 30554, 1}, 0},
		{1, 2000, "BÝ Ng©n To¶n", {2, 1, 30538, 1}, 0},
		{1, 2000, "BÝ Ng©n Chïy", {2, 1, 30539, 1}, 0},
		{31, 1000, "wpg_rand_gem1()", 1},	
		{1, 1000, "L«i Hæ Tinh Ph¸ch", {2, 1, 30614, 1}, 0},
		{1, 10, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 0},
		{1, 2000, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}, 0},
		{1, 1000, "M¶nh Thiªn M«n", {2, 1, 30410, 1}, 0},
		{1, 250, "Tµng R­¬ng", {2, 1, 30341, 1}, 0},
		{1, 1, "Hßa ThÞ BÝch", {2, 1, 1001, 1}, 0},
		{1, 10000, "V« Tù Kinh Th­", {2, 1, 30785, 1}, 0},
		{1, 2000, "Bao l× x× may m¾n", {2, 1, 30786, 1}, 0},	
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "M©m Ngò Qu¶ 02/2015", "M©m ngò qu¶")
	Say("<color=green>La Sa<color>: N¨m míi vui vÎ!!",getn(WPG_DIALOG),WPG_DIALOG)
end

function wpg_rand_gem1()
	local tAward = {
		{1, 25, "HuyÕtTrÝchTh¹ch Lv1", {2,22,101,1}, 0},
		{1, 25, "NguyÖtB¹chTh¹ch Lv1", {2,22,201,1}, 0},
		{1, 25, "Hæ Ph¸ch Th¹ch CÊp 1", {2,22,301,1}, 0},
		{1, 25, "H¾c DiÖu Th¹ch CÊp 1", {2,22,401,1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "M©m Ngò Qu¶ 02/2015", "§¸ quý cÊp 1")
end

WPG_EXCHANGE_TABLE = {
	{1, "Tói Thiªn Th¹ch Tinh Th¹ch", {2,1,3356,1}, 390, 14},
	{1, "Bao M¶nh Thiªn Th¹ch", {2,1,1049,1}, 290, 14},
	{1, "ThÇn Tµi B¶o R­¬ng", {2,1,30344,1}, 390, 14},
	{1, "Ma §ao Th¹ch cÊp 1", {2,1,30428,1}, 9, 14},
	{1, "Ma §¹o Th¹ch cÊp 2", {2,1,30429,1}, 19, 14},
	{1, "Ma §ao Th¹ch cÊp 3", {2,1,30430,1}, 29, 14},
	{1, "C­êng hãa quyÓn 12", {2,1,30424,1}, 69, 14},
	{1, "C­êng hãa quyÓn 13",  {2,1,30425,1}, 149, 14},
	{1, "C­êng hãa quyÓn 14", {2,1,30426,1}, 249, 14},
	{1, "C­êng hãa quyÓn 15", {2,1,30427,1}, 299, 14},
	{1, "B¸o §en B¶o B¶o", {0,105,30045,1,1,-1,-1,-1,-1,-1,-1,-1,0}, 2015, 0},
	{1, "B¸o Vµng B¶o B¶o", {0,105,30046,1,1,-1,-1,-1,-1,-1,-1,-1,0}, 2015, 0},
	{1, "L©n S­", {0,105,30044,1,1,-1,-1,-1,-1,-1,-1,-1,0}, 2015, 0},
	{1, "b¸nh Ýt B¸c B¶o", {2,1,1125,10,4}, 66, 0},
	{2, "999999000EXP", 999999000, 450},
	{3, "99000 ®iÓm c«ng tr¹ng", 99000, 450},
}

function wpg_use_lucky()
	if gf_CheckEventDateEx(147) ~= 1 then
		return 0;
	end
	local tSay = {}
	for i = 1, getn(WPG_EXCHANGE_TABLE) do
		tinsert(tSay, format("%s (Tiªu hao %d Bao L× X× May M¾n)/#wpg_use_lucky_do(%d)", WPG_EXCHANGE_TABLE[i][2], WPG_EXCHANGE_TABLE[i][4], i));		
	end
	tinsert(tSay,"Rêi Khái/nothing")
	Say("<color=green>La Sa<color>: N¨m míi vui vÎ!!", getn(tSay), tSay)
end

function wpg_use_lucky_do(nIndex)
	local tAward = WPG_EXCHANGE_TABLE[nIndex];
	if not tAward then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if tAward[1] == 1 then
		if GetItemCount(2, 1, 30786) < tAward[4] then
			Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "Bao l× x× may m¾n", tAward[4]));
			return 0;
		end
		if DelItem(2, 1, 30786, tAward[4]) ~= 1 then
			return 0;
		end
		gf_AddItemEx2(tAward[3], tAward[2], "M©m Ngò Qu¶ 02/2015", "Bao l× x× may m¾n", tAward[5]*24*3600, 1)
	elseif tAward[1] == 2 then
		if GetItemCount(2, 1, 30786) < tAward[4] then
			Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "Bao l× x× may m¾n", tAward[4]));
			return 0;
		end
		if DelItem(2, 1, 30786, tAward[4]) ~= 1 then
			return 0;
		end
		gf_ModifyExp(tAward[3])
	elseif tAward[1] == 3 then
		if GetItemCount(2, 1, 30786) < tAward[4] then
			Talk(1,"",format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "Bao l× x× may m¾n", tAward[4]));
			return 0;
		end
		if DelItem(2, 1, 30786, tAward[4]) ~= 1 then
			return 0;
		end
		gf_EventGiveCustomAward(31, tAward[3], 1)
	end
end

function _wpg_playerlogin()
	if gf_CheckEventDateEx(147) ~= 1 then
		if GetTrigger(1373*2) > 0 then
			RemoveTrigger(1373*2);
		end
		return 0;
	end
	if GetTrigger(1373*2) <= 0 then
		local nTrigger = CreateTrigger(0, 1373, 1373*2);
		if nTrigger > 0 then
			Msg2Player("Giíi thiÖu ho¹t ®éng: Ng­êi ch¬i cã thÓ ®Õn Quang Minh §Ønh, Sa M¹c Mª Cung, Thiªn TÇm Th¸p tÇng 3, TÇn L¨ng, Quû M«n Håi Lang, V­¬ng MÉu §éng tÇng 3, Thiªn S­ BÝ C¶nh ®¸nh qu¸i ®Ó thu thËp c¸c lo¹i tr¸i c©y: M·ng CÇu, Xoµi, §u §ñ, D­a HÊu, Sung!");
		end
	end
end

function wpg_OnTrigger()
	-- if GetTeamSize() > 1 then
		-- Msg2Player("Tr¹ng th¸i tæ ®éi kh«ng thÓ nhËn ®­îc tr¸i c©y!");
		-- return 0;
	-- end
	if gf_CheckEventDateEx(147) ~= 1 then
		if GetTrigger(1373*2) > 0 then
			RemoveTrigger(1373*2);
		end
		return 0;
	end
	local nMapID = GetWorldPos();
	if nMapID ~= 508 and nMapID ~= 506 and nMapID ~= 411 and 
		nMapID ~= 503 and nMapID ~= 328 and nMapID ~= 116 and
		nMapID ~= 329 then
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10) ~= 1 then
		return 0;
	end
	local tDrop = {}
	local nNpcIdx,sMoban,sName,bIsNpc,bIsBlueBoss = GetTriggeringUnit();
	if sName ~= "Gian TÕ Minh gi¸o" and sName ~= "§Ö Tö Minh gi¸o" and sName ~= "Sa M¹c Hµnh Nh©n" and 
		sName ~= "§äat B¶o Nh©n" and sName ~= "Ma Ni T¨ng" and	sName ~= "§µ La Ni T¨ng" and 
		sName ~= "NhÊt PhÈm §­êng ¸m S¸y Sø" and sName ~= "KÎ ®µo mé" and sName ~= "TiÓu Lam §ao Quû" and
		sName ~= "TiÓu Lam Xoa Quû" and	sName ~= "§Þch tiªn Tö" and sName ~= "KiÕm tiªn Tö" and sName ~= "HuyÕt C« L©u" then
		bIsBlueBoss = 0;
	end
	if bIsBlueBoss ~= 0 then
		gf_AddItemEx2({2, 1, 30784, 1}, "M©m Ngò Qu¶", "M©m Ngò Qu¶ 02/2015", "GhÐp M©m Ngò Qu¶", 0, 1)
	end
	if nMapID == 508 then
		tinsert(tDrop, {1, 10, "M·ng cÇu", {2, 1, 30779, 1}, 0})
		tinsert(tDrop, {31, 90, "nothing()", 1});
	end
	if nMapID == 506 then
		tinsert(tDrop, {1, 10, "Xoµi", {2, 1, 30780, 1}, 0})
		tinsert(tDrop, {31, 90, "nothing()", 1});
	end
	if nMapID == 411 then
		tinsert(tDrop, {1, 10, "§u §ñ", {2, 1, 30781, 1}, 0})
		tinsert(tDrop, {31, 90, "nothing()", 1});
	end
	if nMapID == 503 then
		tinsert(tDrop, {1, 5, "D­a hÊu", {2, 1, 30782, 1}, 0})
		tinsert(tDrop, {31, 95, "nothing()", 1});
	end
	if nMapID == 328 then
		tinsert(tDrop, {1, 5, "D­a hÊu", {2, 1, 30782, 1}, 0})
		tinsert(tDrop, {31, 95, "nothing()", 1});
	end
	if nMapID == 116 then
		tinsert(tDrop, {1, 5, "Sung", {2, 1, 30783, 1}, 0})
		tinsert(tDrop, {31, 95, "nothing()", 1});
	end
	if nMapID == 329 then
		tinsert(tDrop, {1, 5, "Sung", {2, 1, 30783, 1}, 0})
		tinsert(tDrop, {31, 95, "nothing()", 1});
	end
	gf_EventGiveRandAward(tDrop, gf_SumRandBase(tDrop), 1);
end


function OnUse(nItem)
	if gf_CheckEventDateEx(147) ~= 1 then
		Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông");
		return 0;
	end
	Say(format("Tiªu hao %d M·ng CÇu + %d Xoµi + %d §u §ñ + %d D­a HÊu + %d Sung + %d Vµng cã tû lÖ ghÐp thµnh M©m Ngò Qu¶, cã muèn ghÐp kh«ng?", 1, 1, 1, 1, 1, 3), 2, "Hîp thµnh/wpg_Compose", "T¹i h¹ chØ xem qua th«i/nothing");
end

function wpg_Compose()
	local nNum1 = GetItemCount(2, 1, 30779);
	local nNum2 = GetItemCount(2, 1, 30780);
	local nNum3 = GetItemCount(2, 1, 30781);
	local nNum4 = GetItemCount(2, 1, 30782);
	local nNum5 = GetItemCount(2, 1, 30783);
	local nNum6 = GetCash() / 30000;
	AskClientForNumber("wpg_Compose_do", 0, min(min(min(nNum1, nNum2), min(nNum3, nNum4)), min(nNum5, nNum6)),"H·y nhËp sè l­îng ghÐp:","");
end

function wpg_Compose_do(nNum)
	if nNum <= 0 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30779, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30780, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30781, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30782, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30783, nNum) ~= 1 then
		return 0;
	end
	if Pay(nNum*30000) ~= 1 then
		return 0; 
	end
	for i = 1, nNum do
		local nRand = random(100);
		if nRand <= 50 then
			local nP = {30779, 30780, 30781, 30782, 30783};
			local nIndex = mod(nRand, getn(nP)) + 1;
			for i = 1, getn(nP) do
				if i ~= nIndex then
					AddItem(2, 1, nP[i], 1);
				end
			end
		else
			gf_AddItemEx2({2,1,30784,1}, "M©m Ngò Qu¶", "M©m Ngò Qu¶ 02/2015", "GhÐp M©m Ngò Qu¶", 0, 1);
		end
	end
end