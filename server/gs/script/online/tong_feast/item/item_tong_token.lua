Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\online\\tong_feast\\tf_define.lua")

function OnUse(nItem)
	--show_equip_shop(3036);
	local tSay = {
		"T¸ch LÖnh Bµi Bang Héi/DismantleTongToken",
		"T¹i h¹ chØ xem qua th«i/nothing"	
	}
	Say("Dïng 1 LÖnh Bµi Bang Héi t¸ch thµnh 100 M¶nh LÖnh Bµi Bang Héi, b¹n muèn t¸ch LÖnh Bµi Bang Héi kh«ng?", getn(tSay), tSay);
end

function DismantleTongToken()
	local nCount = min(GetItemCount(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3]), GetFreeItemRoom());
	AskClientForNumber("DismantleTongToken_CB", 0, nCount, "H·y nhËp sè l­îng vµo", "");
end

function DismantleTongToken_CB(nNum)
	if nNum <= 0 then
		return 0; 
	end
	if DelItem(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3], nNum) == 1 then
		AddItem(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3], nNum*100);
		Msg2Player(format("B¹n ®· t¸ch %d LÖnh Bµi Bang Héi", nNum));
	end
end

--Include("\\script\\online\\tong_feast\\tf_head.lua")
--
--function OnUse(nItem)
--	local tSay = {
--		format("»ÕÕÂÏä£¨%d¸ö£©/#ExchageTongToken(%d,%d)",15,15,1),
--		format("¹ÒÒÂÏä£¨%d¸ö£©/#ExchageTongToken(%d,%d)",15,15,2),
--		format("Ð¬×ÓÏä£¨%d¸ö£©/#ExchageTongToken(%d,%d)",15,15,3),
--		format("¸ß¼¶»ÕÕÂÏä£¨%d¸ö£©/#ExchageTongToken(%d,%d)",30,30,4),
--		format("¸ß¼¶¹ÒÒÂÏä£¨%d¸ö£©/#ExchageTongToken(%d,%d)",30,30,5),
--		format("¸ß¼¶Ð¬×ÓÏä£¨%d¸ö£©/#ExchageTongToken(%d,%d)",30,30,6),
--		format("»ÕÕÂÏä£¬¹ÒÒÂÏä£¬Ð¬×ÓÏä¸÷Ò»¸ö£¨%d¸ö£©/#ExchageTongToken(%d,%d)",35,35,7),
--		format("¸ß¼¶»ÕÕÂÏä£¬¸ß¼¶¹ÒÒÂÏä£¬¸ß¼¶Ð¬×ÓÏä¸÷Ò»¸ö£¨%d¸ö£©/#ExchageTongToken(%d,%d)",70,70,8),
--		format("°ïÅÉÌØÊâ×øÆï£¨%d¸ö£©/#ExchageTongToken(%d,%d)",100,100,9),		
--		"ÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
--	}
--	Say("°ïÅÉÁîÅÆ¶Ò»»ÈçÏÂ£º", getn(tSay), tSay);
--end
--
--function ExchageTongToken(nNum, nKind)
--	local tFreeRoom = {1,1,1,1,1,1,3,3,1};
--	if GetFreeItemRoom() < tFreeRoom[nKind] then
--		Talk(1,"","±³°ü¿Õ¼ä²»×ã");
--		return 0;
--	end
--	if GetItemCount(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3]) < nNum then
--		Talk(1,"",format("±³°üÄÚ°ï»áÁîÅÆµÄÊýÁ¿²»×ã%dÎÞ·¨Íê³É¶Ô»»", nNum));
--		return 0;
--	end
--	if DelItem(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3], nNum) ~= 1 then
--		return 0;
--	end
--	if nKind == 1 then
--		gf_AddItemEx2({2,1,30593,1,4}, "»ÕÕÂÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--	elseif nKind == 2 then
--		gf_AddItemEx2({2,1,30594,1,4}, "¹ÒÒÂÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--	elseif nKind == 3 then
--		gf_AddItemEx2({2,1,30595,1,4}, "Ð¬×ÓÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--	elseif nKind == 4 then
--		gf_AddItemEx2({2,1,30596,1,4}, "¸ß¼¶»ÕÕÂÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--	elseif nKind == 5 then
--		gf_AddItemEx2({2,1,30597,1,4}, "¸ß¼¶¹ÒÒÂÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--	elseif nKind == 6 then
--		gf_AddItemEx2({2,1,30598,1,4}, "¸ß¼¶Ð¬×ÓÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--	elseif nKind == 7 then
--		gf_AddItemEx2({2,1,30593,1,4}, "»ÕÕÂÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--		gf_AddItemEx2({2,1,30594,1,4}, "¹ÒÒÂÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--		gf_AddItemEx2({2,1,30595,1,4}, "Ð¬×ÓÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--	elseif nKind == 8 then
--		gf_AddItemEx2({2,1,30596,1,4}, "¸ß¼¶»ÕÕÂÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--		gf_AddItemEx2({2,1,30597,1,4}, "¸ß¼¶¹ÒÒÂÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--		gf_AddItemEx2({2,1,30598,1,4}, "¸ß¼¶Ð¬×ÓÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--	elseif nKind == 9 then
--		gf_AddItemEx2({0,105,10120,1,4,-1,-1,-1,-1,-1,-1}, "»ÕÕÂÏä", "°ï»áÊ¢Ñç", "°ï»áÁîÅÆ¶Ò»»", 0, 1);
--	end
--end