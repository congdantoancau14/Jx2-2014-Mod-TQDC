
tNgocQuy = {
	[1] = {"d¹ minh ch©u",{2,1,39},160000,1},
	[2] = {"ngäc nh­ ý", {2,1,87},1800,2},
	[3] = {"b×nh ngäc", {2,1,88},1800,2},
	[4] = {"ngäc nh­ ý tµng kiÕm",{2,0,187},500000,1},
}

tTrangSuc = {
	[1] = {"Kim Thoa",{2,1,41},1600,3},
	[2] = {"Hép trang søc", {2,1,57},1700,3},
	[3] = {"Hép trang ®iÓm",{2,1,306},8000,2},
}

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

tChoosenItem = {}
nSupplyType = 0;
--szNpcName = GetTargetNpc();
szNpcName = "<color=green>Chñ Kim Hoµn<color>: ";

function main()
	local tSay = {
		"Ta muèn mua it trang søc/muaTrangSuc",
		"Ta muèn b¸n it trang søc/banTrangSuc",
		"Ta muèn b¸n mét it ®¸ quý/choosStones",
		"Sure! Ta muèn cung cÊp cho bµ mét Ýt ch©u b¸u/chooseGems",
		"Ch¼ng hay d¹o nµy l·o b¶n lµm ¨n thÕ nµo/nothing"
	}
	Say(szNpcName.."Ng­êi trÎ c¸c ng­¬i ®i l¹i trªn giang hå nhiÒu, ch¾c h¼n ph¶i së h÷u kh«ng it ch©u b¸u. NÕu cã thÓ trao ®æi víi ta, bæn tiÖm høa lµ sÏ kh«ng khiÕn ng­¬i chiu thiÖt thßi",getn(tSay),tSay)
	
	if random(1,10) == 1 then
		NpcChat(GetTargetNpc(),"Ngäc nh­ ý th­êng ®­îc kÕt tinh t¹i n¬i l¹nh lÏo nh­ ®éng b¨ng. B»ng h÷u nÕu muèn t×m chóng th× ghÐ thö nh÷ng ®éng b¨ng xem sao!");
	end
end;

function banTrangSuc()
	local tSay = {}
	for i=1, getn(tTrangSuc) do
		tinsert(tSay, format("Ta cã mét it %s/#supply(%d,3)",tTrangSuc[i][1],i))
	end
	tinsert(tSay,"\nµ! Kh«ng ph¶i/main")
	tinsert(tSay,"§ïa víi bµ cho vui th«i, haha!/nothing")
	Say(szNpcName.."Trang søc lµ ®å ®¸ng gi¸ dï ®· dïng qua. NÕu cã hµng th× b»ng h÷u cø mang ®Õn nhÐ",getn(tSay),tSay)
end;

function choosStones()
	local tSay = {}
	for i=1, getn(tDaQuy) do
		tinsert(tSay, format("Ta cã mét it %s/#supply(%d,2)",tDaQuy[i][1],i))
	end
	tinsert(tSay,"\nµ! Kh«ng ph¶i/main")
	tinsert(tSay,"§ïa víi bµ cho vui th«i, haha!/nothing")
	Say(szNpcName.."Ch¼ng hay b»ng h÷u cã ch©u b¾u g× muèn b¸n cho bæn ®iÕm?",getn(tSay),tSay)
end;

function chooseGems()
	local tSay = {}
	for i=1, getn(tNgocQuy)-1 do
		tinsert(tSay, format("Ta cã mét it %s/#supply(%d,1)",tNgocQuy[i][1],i))
	end
	tinsert(tSay,format("Ta cã ngäc nh­ ý lÊy tõ Tµng KiÕm s¬n Trang/#supply(%d,%d)",getn(tNgocQuy),1))
	tinsert(tSay,"\nµ! Kh«ng ph¶i/main")
	tinsert(tSay,"Ta nãi ch¬i th«i, hihi!/nothing")
	Say(szNpcName.."Ch¼ng hay b»ng h÷u cã ch©u b¾u g× muèn b¸n cho bæn tiÖm?",getn(tSay),tSay)
end;

function supply(id, supplyType)
	nSupplyType = supplyType;
	local nCount = 0;
	if nSupplyType == 1 then
		tChoosenItem = tNgocQuy[id];
	elseif nSupplyType == 2 then
		tChoosenItem = tDaQuy[id];
	elseif nSupplyType == 3 then
		tChoosenItem = tTrangSuc[id];
	end
	nCount = GetItemCount(tChoosenItem[2][1],tChoosenItem[2][2],tChoosenItem[2][3])
	if nCount < 1 then
		Talk(1,"",szNpcName.."H×nh nh­ c¸c h¹ kh«ng mang theo vËt phÈm ng­¬i nãi");
		return
	end
	AskClientForNumber("_request_number_call_back", 1, nCount, "NhËp sè l­îng");
end;

function _request_number_call_back(nNum)
	
	if nNum < 1 then
		Msg2Player("§· hñy bá giao d×ch.")
		return 0;
	end
	
	local nDelResult = DelItem(tChoosenItem[2][1],tChoosenItem[2][2],tChoosenItem[2][3], nNum)
	if nSupplyType == 1 then
		if  nDelResult and nDelResult == 1 then
			local nMoney = tChoosenItem[3] * nNum;
			Earn(nMoney)
			local szTalkMore = "";
			if tChoosenItem[4] == 2 then
				szTalkMore = "Lo¹i ngäc nµy qu¸ phæ biÕn, gi¸ trÞ kh«ng cao. E r»ng ta chØ cã thÓ tr¶ nhiªu ®©y.\n";
			end
			local szMsg = format(szNpcName..szTalkMore.."TiÒn cña ng­¬i ®©y: %d %s", nMoney, "l­îng. Cã hµng l¹i mang ®Õn chç ta nhÐ :)")
			Talk(1, "", szMsg)
			Talk(1,"","<color=green>"..GetName().."<color>: Ta ®· biÕt bµ lµ ng­êi tinh t­êng mµ :D")
			--Msg2Player("Giao d?ch thµnh c«ng")
			--WriteLog(format("%s exchange %d %s(%d,%d,%d) using %d",GetName(),nNum, target_item[4], target_item[1], target_item[2], target_item[3], nType));
		end
	elseif nSupplyType == 2 then
		if  nDelResult and nDelResult == 1 then
			local nMoney = tChoosenItem[3] * nNum;
			
			local szTalkMore = "";
			if tChoosenItem[4] == 1 then
				szTalkMore = "§óng lµ k× tr©n dÞ b¶o. Ta kiÕm ®­îc mãn hêi råi. Ha ha'.\n";
				nMoney = nMoney * 10000;
			end
			if tChoosenItem[4] == 2 then
				szTalkMore = "Lo¹i ®¸ nµy t­¬ng ®èi phæ biÕn, gi¸ kh«ng ®­îc tèt l¾m nhÐ.\n";
				nMoney = nMoney * 1000;
			end
			if tChoosenItem[4] == 3 then
				szTalkMore = "Lo¹i ®¸ nµy qu¸ phæ biÕn, gi¸ trÞ kh«ng cao. E r»ng ta chØ cã thÓ tr¶ nhiªu ®©y.\n"
				nMoney = nMoney * 100;
			end
			Earn(nMoney)
			
			local szMsg = format(szNpcName..szTalkMore.."TiÒn cña ng­¬i ®©y: %d %s", nMoney, "l­îng. Cã hµng l¹i mang ®Õn chç ta nhÐ :)")
			Talk(1, "", szMsg)
			if nMoney > 200000 then
				Talk(1,"","<color=green>"..GetName().."<color>: Ta ®· biÕt bµ lµ ng­êi tinh t­êng mµ :D")
			end
			--Msg2Player("Giao d?ch thµnh c«ng")
			--WriteLog(format("%s exchange %d %s(%d,%d,%d) using %d",GetName(),nNum, target_item[4], target_item[1], target_item[2], target_item[3], nType));
		end
	elseif nSupplyType == 3 then
		if  nDelResult and nDelResult == 1 then
			local nMoney = tChoosenItem[3] * nNum;
			Earn(nMoney)
			
			local szMsg = format(szNpcName.."TiÒn cña ng­¬i ®©y: %d %s", nMoney, "l­îng. Cã hµng l¹i mang ®Õn chç ta nhÐ :)")
			Talk(1, "", szMsg)
			if random(1,10) == 1 then
				Talk(1,"","<color=green>"..GetName().."<color>: R¶nh ta l¹i kiÕm vÒ cho bµ. Yªn t©m ®i! :D")
			end
			--Msg2Player("Giao d?ch thµnh c«ng")
			--WriteLog(format("%s exchange %d %s(%d,%d,%d) using %d",GetName(),nNum, target_item[4], target_item[1], target_item[2], target_item[3], nType));
		end
	end
end


function muaTrangSuc()
	Sale(40)
end;

function nothing()
end;