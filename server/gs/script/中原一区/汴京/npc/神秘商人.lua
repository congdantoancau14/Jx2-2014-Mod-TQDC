Include("\\script\\online_activites\\201204\\changkuaishujia\\changkuaishujia.lua")
Include("\\script\\online_activites\\201205\\exchange_award.lua")
Include("\\script\\vng\\doinguyenlieu.lua")
Include("\\script\\item\\jubaoping.lua") -- Added in 23 Jul 2020

tBaoThach = {
	[1] = {"Lam tinh thµch", {2,1,30006},10000},
	[2] = {"Hoµng b¶o thµch", {2,1,30007},10000},
	[3] = {"Ngò linh thµch", {2,1,30005},100000},
}

tLinhThach = {
	[1] = {"Linh th¹ch nguyªn th¹ch cÊp 1",{2,1,30413}},
	[2] = {"Linh th¹ch nguyªn th¹ch cÊp 2",{2,1,30414}},
	[3] = {"Linh th¹ch nguyªn th¹ch cÊp 3",{2,1,30415}},
	[4] = {"Linh th¹ch nguyªn th¹ch cÊp 4",{2,1,30416}},
	[5] = {"Linh th¹ch nguyªn th¹ch cÊp 5",{2,1,30417}},
	[6] = {"Linh th¹ch nguyªn th¹ch cÊp 6",{2,1,30418}},
	[7] = {"Linh th¹ch nguyªn th¹ch cÊp 7",{2,1,30419}},
	[8] = {"Bao Linh th¹ch cÊp 6", {2,1,30306}},
	[9] = {"Bao Linh th¹ch cÊp 7", {2,1,30305}},
}

tCountStone = {}
nChoosenStoneId = 0
nKieuThanhToan = 0; -- 1: Ban bao thach, 2: Doi bo bao thach lay linh thach cap 7, 3: Doi bao thach lay linh thach

tDaQuy = {
	{"Thanh Kim",{2,1,17},14,1},
	{"TuyÕt Tinh",{2,1,22},14,1},
	{"¸m Yªn",{2,1,26},16,2},
	{"¢m Ph¸ch",{2,1,27},16,3},
	{"Hång Tinh",{2,1,32},16,1},
	{"Lang Hån",{2,1,37},16,1},
	{"TuyÕt Ph¸ch",{2,1,45},17,2},
	{"U Hån",{2,1,51},17,2},
	{"Lôc Ph¸ch",{2,1,62},18,3},
	{"Ên Th¹ch",{2,1,72},18,1},
	{"Hïng V¨n",{2,1,78},18,1},
	{"KiÕm Hån",{2,1,80},18,3},
	{"Hæ Ph¸ch",{2,1,84},18,1},
	{"Kim Cang",{2,1,86},18,3},
	{"Lôc Trô",{2,1,91},18,1},
	{"Quû Hån",{2,1,92},20,3},
	{"HuyÔn Quang",{2,1,99},20,1},
	{"§«ng L¨ng",{2,1,100},20,1},
}

tSellItem = {}

function main()
	local tbSay = {
		"* Nghe nãi l·o cã mét sè b¶o vËt? H·y cho ta xem!/muaBaoVat",
		"* Nghe nãi l·o ®ang thu mua b¶o th¹ch? Ta cã cho l·o ®©y/banBaoThach",
		"* Nghe nãi l·o ®ang trao ®æi b¶o th¹ch? Ta muèn dïng b¶o th¹ch ®æi linh th¹ch/doiBaoThachLinhThach",
		"* Ta cã ®ñ mét bé ®¸ quı, nghe nãi cã thÓ ®æi ®­îc linh th¹ch cÊp 7?/doiDaQuyLinhThach",
	};
	
	tinsert(tbSay,"* Ta muèn ®æi mét sè vËt phÈm kh¸c/exchangeOther");
	tinsert(tbSay,"* Thu ®æi Qu©n dông/Trade_Material_Menu3");

	tinsert(tbSay,"Sao l·o l¹i ®øng ë c¸i gãc xã xØnh nµy vËy?/cancel");
	Say("Tr¨ng thanh giã m¸t nh­ thÕ nµy…sao kh«ng cïng ta ®i t¶n bé chø?",
		getn(tbSay),tbSay)
		--"ÌıËµÄúÀÏÕâÀïÓĞÒ»Ğ©ÎäÁÖÊ§´«µÄ¶«Î÷£¿ÎÒÏëÂò¼¸¸ö¡£/Suiyinbuy",
		--"ÌıËµÄúÀÏÕâÀïÓĞÒ»Ğ©ÉÏºÃµÄÍâ×°ÒÂ·ş£¿ÎÒÏë¿´¿´¡£/ClothBuy",
		--"ÌıËµÄúÀÏÕâÀïÓĞÒ»Ğ©ÉÏºÃµÄÍâ×°·¢¹Ú£¿ÎÒÏë¿´¿´¡£/CapBuy",
		--"ÌıËµÄúÀÏÕâÀïÓĞÒ»Ğ©ÉÏºÃµÄÍâ×°¿ãÈ¹£¿ÎÒÏë¿´¿´¡£/ShoeBuy",
		--"ÌıËµÄúÀÏÕâÀïÓĞÒ»Ğ©Ò£Ô¶µÄÒì¹úÕ½ÅÛ£¿ÎÒÏë¿´¿´¡£/ShijieBuy",
		--"Àë¿ªÃ»ÊÂ¡£/cancel")
end

function exchangeOther()
	local tbSay = {}
	local nDate = tonumber(date("%Y%m%d"))
	--²åÈëtable
	if gf_CheckEventDateEx(VET_CKSJ_ACITIVITY_ID) == 1 then
		for i=1,getn(Vet_CKSJ_Say_Tb) do
			tinsert(tbSay,Vet_CKSJ_Say_Tb[i]);
		end
	end
	--2012Äê6ÔÂ»î¶¯
	if gf_CheckEventDateEx(VET_ExcAw_ACITIVITY_ID) == 1 then
		for i=1,getn(Vet_ExcAw_Say_Tb) do
			tinsert(tbSay,Vet_ExcAw_Say_Tb[i]);
		end
	end
	tinsert(tbSay,"Hmm, ta tù nhiªn kh«ng muèn ®æi n÷a/cancel");
	local szSay = "C¸c h¹ muèn ®æi g× nµo?";
	Say(szSay,getn(tbSay),tbSay);
end;

function doiDaQuyLinhThach()
	tSay = {}
	szDaQuy = "";
	for i=1, getn(tDaQuy) do
		szDaQuy = szDaQuy..colorize("green",tDaQuy[i][1])..", ";
	end
	tinsert(tSay, "Ta cã ®ñ thø l·o yªu cÇu. H·y ®æi cho ta!/countDaQuy");
	tinsert(tSay, "Ta ®æi ı råi, kh«ng ®æi n÷a!/cancel")
	local szTitle = "Mét bé ®¸ quı bao gåm: "..szDaQuy..". Tæng céng lµ "..getn(tDaQuy).." lo¹i.<enter>"
			.."NÕu b»ng h÷u tËp hîp ®­îc ®ñ bé, ta sÏ ®æi cho ng­¬i mét viªn Linh th¹ch cÊp 7";
	Say(szTitle,getn(tSay), tSay);
end;

function countItems(tItems)
	local tResult = {}
	local nMax = 2000;
	for i=1, getn(tItems) do
		local nCount = GetItemCount(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3]);
		if nCount < nMax then
			nMax = nCount;
		end
		tResult[i] = nCount;
	end
	return tResult, nMax;
end;

function countDaQuy()

	local tCounted, nMax = countItems(tDaQuy);
	
	if nMax < 1 then
		tSay = {}
		tinsert(tSay, "H×nh nh­ c¸c h¹ ch­a t×m ®­îc ®ñ bé. Muèn g¹t ta sao?");
		tinsert(tSay, "KiÕm ®­îc mét viªn ®· khã, ®ñ bé l¹i cµng kh«ng ph¶i chuyÖn dÔ. Cè g¾ng lªn thanh niªn.");
		tinsert(tSay, "Tuæi trÎ c¸c ng­¬i thËt ®¸ng ng­¬~ng mé.");
		tinsert(tSay, "Cã c«ng mµi s¾t, cã ngµy nªn kim");
		tinsert(tSay, "B¶o th¹ch th­êng cã ë nh÷ng n¬i th©m s¬n cïng cèc. Kh«ng lao ®éng th× sao l¹i mong h­ëng thµnh qu¶?");
		local i = random(1,getn(tSay));
		Talk(1,"",tSay[i]);
	else
		local tSay = {};
		local szHeader = "B»ng h÷u rÊt giái. §Ó kiÕm ®­îc ®ñ bé linh th¹ch nµy, "
			.."ch¾c h¼n ®· tèn kh«ng İt c«ng søc, cÇn rÊt nhiª`u sù kiªn nhÉn. T¹i h¹ th¸n phôc! "
			.."Sè ®¸ quı nµy cã thÓ ®æi ®­îc "..colorize("yellow",nMax).." viªn linh th¹ch cÊp 7. "
			.."Mçi lo¹i, ta chØ lÊy 1 viªn th«i. B»ng h÷u muèn ®æi bao nhiªu?";
		tinsert(tSay, "Ta muèn ®æi 1 viªn th«i/#getLinhThach7(1)");
		if nMax >= 5 then
			tinsert(tSay, "H·y ®æi cho ta 5 viªn/#getLinhThach7(5)");
		end
		tinsert(tSay, format("Ta ®ang cÇn linh th¹ch, h·y ®æi toµn bé cho ta/#getLinhThach7(%d)",nMax));
		Say(szHeader,getn(tSay),tSay);
	end
end;

function getLinhThach7(nNum)
	if GetFreeItemRoom() < nNum then
		Talk (1,"","Ng­¬i «m ®åm qu¸ nhiª`u thø trªn ng­êi. Hay lµ dän bít ®i?!!")
		return 0
	end
	
	local tDel = {};
	local nResult = 1;
	for i=1, getn(tDaQuy) do
		local nDel = DelItem(tDaQuy[i][2][1],tDaQuy[i][2][2],tDaQuy[i][2][3],nNum);
		if nDel ~= 1 then
			nResult = 0;
			break
		end
	end
	
	if nResult == 1 then
		AddItem(tLinhThach[9][2][1],tLinhThach[9][2][2],tLinhThach[9][2][3],nNum);
		Talk(1,"","Giao d×ch thµnh c«ng. "
			..format("NhËn %s %s",
				gf_FixColor(tostring(nNum),4),
				colorize("green",tLinhThach[9][1]))
		);
	else
		Talk(1,"","H×nh nh­ cã sù gian lËn ë ®©y. Kh«ng qua mÆt ®­îc l·o ®©u. "
			.."Ta sÏ lÊy ®i sè ®¸ ng­¬i ®· giao ®Ó lµm h×nh ph¹t.");
	end
end;

function colorize(szColor, anyData)
	anyData = tostring(anyData);
	return format("<color=%s>%s<color>",szColor,anyData);
end;

function doiBaoThachLinhThach()
	tSay = {}
	szBaoThach = ""
	for i=1, getn(tBaoThach) do
		szBaoThach = szBaoThach.."<color=green>"..tBaoThach[i][1].."<color>, ";
	end
	tinsert(tSay, "* Ta kh«ng cã ®ñ bé b¶o th¹ch\n"
				.."Ta muèn ®æi Lam tinh th¹ch lÊy linh th¹ch ngÉu nhiªn cÊp 1-5/#exchangeStone(1)");
	tinsert(tSay, "* Ta kh«ng cã ®ñ bé b¶o th¹ch\n"
				.."Ta muèn ®æi Hoµng tinh th¹ch lÊy linh th¹ch ngÉu nhiªn cÊp 1-5/#exchangeStone(2)");
	tinsert(tSay, "* Ta kh«ng cã ®ñ bé b¶o th¹ch\n"
				.."Ta muèn ®æi Ngò linh th¹ch lÊy linh th¹ch cÊp 6/#exchangeStone(3)");
	tinsert(tSay, "* L·o yªn t©m. Ta cã ®ñ bé b¶o th¹ch l·o yªu cÇu\n"
				.."Ta muèn ®æi c¶ bé lÊy linh th¹ch cÊp 7/exchangeStoneSet");
	tinsert(tSay, "Ta ®æi ı råi, kh«ng ®æi n÷a!/cancel")
	local szTitle = "§óng lµ ta cã linh th¹ch. Ta sÏ ®æi cho ng­¬i. Nh­ng linh th¹ch th× cã linh tİnh, "
		.."nÕu kh«ng cã c¸ch ®i.nh tİnh th× chØ cã thÓ tïy vËn mµ th«i!"
		.."Ng­¬i cÇn cã ®ñ "..szBaoThach.." th× míi cã thÓ ®æi lÊy linh th¹ch cÊp 7 "
		.."v× Ngò linh th¹ch lµ viªn ®¸ cã thÓ ®i.nh tİnh linh khİ. "
		.."NÕu kh«ng Lam tinh th¹ch vµ hoµng b¶o th¹ch chØ cã thÓ ®æi linh th¹ch t­` cÊp 1 ®Õn cÊp 5, "
		.."Cßn Ngò linh th¹ch th× cã thÓ ®èi lÊy linh th¹ch cÊp 6. ThÕ nµo?";
	Say(szTitle,getn(tSay), tSay);
	
end;

function exchangeStoneSet()
	local nMax = 2000;
	for i=1,getn(tBaoThach) do
		local tItem = tBaoThach[i];
		local nNum = GetItemCount(tItem[2][1],tItem[2][2],tItem[2][3]);
		tCountStone[i] = nNum;
		if nNum < nMax then
			nMax = nNum;
		end
	end
	
	if nMax < 1 then
		Talk(1,"doiBaoThachLinhThach","H×nh nh­ ng­¬i kh«ng cã ®ñ bé b¶o th¹ch nh­ ng­¬i nãi.");
	elseif nMax == 1 then
		nKieuThanhToan = 2;
		_request_number_call_back(1);
	else 
		nKieuThanhToan = 2;
		AskClientForNumber("_request_number_call_back",1,nMax,"NhËp sè l­îng");
	end
end;
	

function exchangeStone(nId)
	nChoosenStoneId = nId;
	tChoosenStone = tBaoThach[nId];
	local nMax = 2000;
	if nId <= 3 then
		nMax = GetItemCount(tChoosenStone[2][1],tChoosenStone[2][2],tChoosenStone[2][3]);
	end
	
	if nMax < 1 then
		Talk(1,"doiBaoThachLinhThach","Xin lçi. Ta kh«ng thÊy ng­¬i cã viªn "..tChoosenStone[1].." nµo c¶.");
	elseif nMax == 1 then
		nKieuThanhToan = 3;
		_request_number_call_back(1);
	else 
		nKieuThanhToan = 3;
		AskClientForNumber("_request_number_call_back",1,nMax,"NhËp sè l­îng");
	end
end;

function banBaoThach()
	tSay = {}
	for i=1, getn(tBaoThach) do
		tinsert(tSay, format("Ta muèn b¸n cho «ng %s/#supplyBaoThach(%d)",tBaoThach[i][1],i));
	end
	tinsert(tSay, "Ta chØ nãi ch¬i th«i, ha ha!/cancel")
	Say("B»ng h÷u cã b¶o th¹ch nµo vËy?",getn(tSay), tSay);
	
end;

function thanhtoan(nNum, nExchangeType)
	if nExchangeType == 1 then -- b¸n b¶o th¹ch
		Msg2Player("B¸n b¶o th¹ch");
		local nDel = DelItem(tSellItem[2][1],tSellItem[2][2],tSellItem[2][3],nNum);
		if nDel then
			Msg2Player("Giao d×ch thµnh c«ng!");
			Earn(nNum * tSellItem[3]);
			tSellItem = {} -- Thanh lİ
		else
			Msg2Player("Giao d×ch thÊt b¹i!");
		end
	elseif nExchangeType == 2 then -- ®æi bé b¶o th¹ch lÊy linh th¹ch cÊp 7
		Msg2Player("§æi bé b¶o th¹ch lÊy linh th¹ch cÊp 7");
		-- local nRoom = GetFreeItemRoom();
		-- if nRoom < nNum then
			-- Talk(1,"",format("Hµnh trang kh«ng ®ñ %s chç trèng.",colorize(nNum)));
			-- return
		-- end
		local tDel = {}
		for i=1, getn(tBaoThach) do
			local tItem = tBaoThach[i];
			local nDel = DelItem(tItem[2][1],tItem[2][2],tItem[2][3],nNum);
			if nDel == 1 then
				tinsert(tDel, {i,nDel});
			end
		end
		
		if getn(tDel) == getn(tBaoThach) then
			-- for i=1,nNum do
				-- local nStoneLevel = random(1,7);
				-- lspf_AddLingShiInBottle(nStoneLevel,1);
				-- Msg2Player("Giao d×ch thµnh c«ng. NhËn ®­îc "..nStoneLevel.." (cÊp) Linh th¹ch, "
								-- .."®· ®­îc cho vµo Tô Linh §Ønh.");
			-- end
			AddItem(tLinhThach[7][2][1],tLinhThach[7][2][2],tLinhThach[7][2][3],nNum);
			Msg2Player("Giao d×ch thµnh c«ng."..format("NhËn %s viªn %s",nNum,tLinhThach[7][1]));
		else
			Msg2Player("Giao d×ch thÊt b¹i.");
		end
	elseif nExchangeType == 3 then -- ®æi b¶o th¹ch lÊy linh th¹ch ngÉu nhiªn
		Msg2Player("§æi b¶o th¹ch lÊy linh th¹ch ngÉu nhiªn");
		local nDel = DelItem(tChoosenStone[2][1],tChoosenStone[2][2],tChoosenStone[2][3],nNum);
		if nDel ~= 1 then
			Msg2Player("Giao d?ch thÊt b¹i! Kh«ng ®ñ sè l­îng nguyªn liÖu nguån.");
			return 0;
		end
		local nStoneLevel = 0;
		if nChoosenStoneId == 1 or nChoosenStoneId == 2 then
			for i=1, nNum do
				nStoneLevel = random(1,5);
				lspf_AddLingShiInBottle(nStoneLevel,1);
				Msg2Player("Giao d×ch thµnh c«ng. NhËn ®­îc "..nStoneLevel
					.." (cÊp) Linh th¹ch, ®· ®­îc cho vµo Tô Linh §Ønh.");
			end
		elseif nChoosenStoneId == 3 then
			nStoneLevel = 6;
			AddItem(tLinhThach[nStoneLevel][2][1],tLinhThach[nStoneLevel][2][2],tLinhThach[nStoneLevel][2][3],nNum);
			Msg2Player("Giao d×ch thµnh c«ng. "
				..format("NhËn %s viªn %s",colorize("yellow",nNum),
					colorize("green",tLinhThach[nStoneLevel][1])
			));
		end
		
		
	end
end;

function supplyBaoThach(id)
	tSellItem = tBaoThach[id];
	local nNum = GetItemCount(tSellItem[2][1],tSellItem[2][2],tSellItem[2][3])
	if nNum < 1 then
		Talk(1,"banBaoThach","H×nh nh­ c¸c h¹ kh«ng mang theo b¶o th¹ch ng­¬i nãi");
		return
	end
	nKieuThanhToan = 1;
	AskClientForNumber("_request_number_call_back",1,nNum,"NhËp sè l­îng");
end;

function _request_number_call_back(nNum)
	if nNum < 1 then
		return 0
	end
	thanhtoan(nNum,nKieuThanhToan);
end;

function muaBaoVat()
	tSay = {
		"Nghe nãi chç l·o cã mét vµi b¶o vËt thÊt truyª`n?/Suiyinbuy",
		"Nghe nãi chç l·o cã mét vµi ngo¹i trang (y) cao cÊp?/ClothBuy",
		"Nghe nãi chç l·o cã mét vµi ngo¹i trang (m·o) cao cÊp?/CapBuy",
		"Nghe nãi chç l·o cã mét vµi ngo¹i trang (quÇn) cao cÊp?/ShoeBuy",
		"Nghe nãi chç l·o cã mét vµi di.quèc b¶o vËt? Cho ta xem!/ShijieBuy",
		"\nTrang tr­íc/main",
		"\nTh«i bá ®i/cancel",
		}
	Say("§óng lµ ta ®· truyª`n tin muèn b¸n mét sè b¶o vËt. Xin mêi kh¸ch quan xem qua!", getn(tSay),tSay);
	
end;

function cancel()
end

function Suiyinbuy()
   Sale(53)
end
function ClothBuy()
   Sale(56)
end
function CapBuy()
   Sale(57)
end
function ShoeBuy()
   Sale(58)
end
function ShijieBuy()
   Sale(87)
end