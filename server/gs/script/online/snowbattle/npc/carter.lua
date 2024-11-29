Include("\\script\\online\\snowbattle\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

CR_Head = "<color=green>Xa Phu ®Êu tr­êng TuyÕt: <color>Ho¹t ®éng §Êu Tr­êng TuyÕt 1 ngµy tiÕn hµnh 3 lÇn, thêi gian bao gåm 11:30, 17:30, 21:30, mçi trËn ®Êu duy tr× 1 giê; §iÒu kiÖn tham gia cÊp 80 trë lªn, ®· gia nhËp m«n ph¸i, ®· kİch ho¹t c¶nh giíi kinh m¹ch.";

function main()
	local CR_Menu1 = {
		"Vµo Khu nĞm tuyÕt (Tiªu hao 10 vµng tÆng 10 TiÓu TuyÕt CÇu)/CR_DoEnter",
		"Mua ®¹n tuyÕt cÇu/CR_DoShowSaleList",
		"Gi¶i thİch ho¹t ®éng/CR_Information",
		"Rêi khái/gf_DoNothing"
	}
	local CR_Menu2 = {
		"Rêi khái ®Êu tr­êng tuyÕt/CR_DoExit",
		"Mua ®¹n tuyÕt cÇu/CR_DoShowSaleList",
		"Gi¶i thİch ho¹t ®éng/CR_Information",
		"Rêi khái/gf_DoNothing"
	}
	if 0 == SB_IsInSnowMap() then
		Say(CR_Head, getn(CR_Menu1), CR_Menu1);
	else
		Say(CR_Head, getn(CR_Menu2), CR_Menu2);
	end
end

function CR_DoEnter()
	local mapID = GetWorldPos();
  mapID = SB_MapMap[mapID];
	if 1 ~= SB_CheckState(mapID) then
		Talk(1, "", "RÊt tiÕc, ®ît ho¹t ®éng nµy ®· kÕt thóc, h·y trë l¹i lÇn sau");
		return
	end
	if 1 ~= SB_CheckPlayerCount(mapID) then
		Talk(1, "", "RÊt tiÕc, ®Êu tr­êng ®· ®Çy, vui lßng trë l¹i lÇn sau");
		return
	end
	if gf_CheckBaseCondition(SB_MIN_LEVEL) ~= 1 then
		return 
	end
	if MeridianGetLevel() < 1 then
		Talk(1,"","RÊt tiÕc, c¸c h¹ ch­a khai th«ng c¶nh giíi kinh m¹ch");
		return
	end
	if 1 ~= SB_CheckEquipment() then
		Talk(1, "", "Xin lçi, h·y th¸o vò khİ xuèng");
		return
	end
	if GetCash() < SB_COST then
		Talk(1,"","RÊt tiÕc, ng©n l­îng c¸c h¹ mang theo kh«ng ®ñ!");
		return
	end	
	local itemID = {2, 3, 219, 10};
	local itemName = "TiÓu tuyÕt cÇu";
	gf_AddItemEx2(itemID, itemName, "§¸nh trËn tuyÕt", "application gift");
	mf_JoinMission(SB_MISSION_ID, SB_CAMP_ID, mapID);
end

function CR_DoExit()
	DelMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
end

function CR_DoShowSaleList()
	local CR_Menu3_1 = {
		"10 §¹i TuyÕt CÇu (30 vµng)/#CR_DoBuy(1)",
		"10 Trung TuyÕt CÇu (20 vµng)/#CR_DoBuy(2)",
		"10 TiÓu TuyÕt CÇu (10 vµng)/#CR_DoBuy(3)",
		"Ta chØ ghĞ ch¬i/gf_DoNothing",
	}
	Say(CR_Head, getn(CR_Menu3_1), CR_Menu3_1);
end

function CR_DoBuy(index)
	local CR_SaleList = {
		{{2, 3, 221}, "§¹i tuyÕt cÇu", 10, 300000},
		{{2, 3, 220}, "Trung tuyÕt cÇu", 10, 200000},
		{{2, 3, 219}, "TiÓu tuyÕt cÇu", 10, 100000},
	}
	local itemID = CR_SaleList[index][1];
	local itemName = CR_SaleList[index][2];
	local itemCount = CR_SaleList[index][3];
	local cost = CR_SaleList[index][4];
	if GetCash() < cost then
		Talk(1,"","Hµnh trang kh«ng ®ñ tiÒn!");
		return
	end
	if 1 == gf_Judge_Room_Weight(1, itemCount, "") then
		if 1 == Pay(cost) then
			local tmpItemID = {itemID[1], itemID[2], itemID[3], itemCount};
			gf_AddItemEx2(tmpItemID, itemName, "§¸nh trËn tuyÕt", "Mua ®¹n tuyÕt cÇu");
		end
	end
	CR_DoShowSaleList();	
end

function CR_Information()
	Talk(1,"","Sau khi ®¹i hiÖp vµo khu nĞm tuyÕt, ®èi tho¹i víi Thiªn S¬n TuyÕt Yªu ë chİnh gi÷a, cã thÓ triÖu håi TuyÕt Qu¸i. Sau khi ®¸nh b¹i tÊt c¶ TuyÕt Qu¸i sÏ xuÊt hiÖn l­ît tiÕp theo, tæng céng cã 10 l­ît. Sau khi ®¸nh xong 10 l­ît th× ®èi tho¹i víi Thiªn S¬n TuyÕt Yªu, ®¸nh b¹i BOSS sÏ nhËn ®­îc phÇn th­ëng phong phó. Trong khu nĞm tuyÕt, chØ cã thÓ dïng kü n¨ng tuyÕt cÇu, kh«ng thÓ trang bŞ vò khİ.")
end
