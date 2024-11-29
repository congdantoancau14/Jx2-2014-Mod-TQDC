--Éú²ú¼¼ÄÜ½ä×Ó²ÄÁÏÖÆ×÷
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

DSN_NPC = "<color=green>§ç Tø N­¬ng<color>: ";

function main()
	local tSay = {
		"TiÖm §¸ Quý/#show_equip_shop(6000)",
		"TiÖm S¸ch Pet/#show_equip_shop(6012)",
		"TiÖm Thó C­ìi/#show_equip_shop(6006)",
		"TiÖm UÈn Linh CÊp 7/ShopUL7",
		--"TiÖm V« H¹ Hµo HiÖp/#show_equip_shop(6001)",
		"TiÖm Kim Xµ CÊp 6/#show_equip_shop(6011)",
		"TiÖm Èm HuyÕt/#show_equip_shop(6003)",
		"TiÖm S¸t Tinh/#show_equip_shop(6004)",
		"TiÖm V« Song ChiÕn ThÇn/#show_equip_shop(6005)",
		"TiÖm Minh Tinh V« Cùc/#show_equip_shop(6007)",
		"\nT«i chØ xem xem th«i/nothing",
	}		
	Say(DSN_NPC..format("%s cã thÓ gióp ®­îc g× kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end


function ShopUL7()
	local tSay = {
		"TiÖm UÈn Linh CÊp 7 - §Çu/#show_equip_shop(6008)",
		"TiÖm UÈn Linh CÊp 7 - Y/#show_equip_shop(6009)",
		"TiÖm UÈn Linh CÊp 7 - Trang/#show_equip_shop(6010)",
		"\nRa khái/nothing",
	};
	--SelectSay(szSay);
	Say(DSN_NPC..format("%s cã thÓ gióp ®­îc g× kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end
