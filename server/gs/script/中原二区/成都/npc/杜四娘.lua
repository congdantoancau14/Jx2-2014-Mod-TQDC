--Éú²ú¼¼ÄÜ½ä×Ó²ÄÁÏÖÆ×÷
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

DSN_NPC = "<color=green>§ç Tø N­¬ng<color>: ";

function main()
	local tSay = {
		"TiÖm §¸ Qu?/#show_equip_shop(6000)",
		"TiÖm V« H¹ Hµo HiÖp/#show_equip_shop(6001)",
		"TiÖm Èm Huy?t/#show_equip_shop(6003)",
		"TiÖm S¸t Tinh/#show_equip_shop(6004)",
		"TiÖm V« Song Chi?n ThÇn/#show_equip_shop(6005)",
		"TiÖm Minh Tinh V« Cùc/#show_equip_shop(6007)",
		"TiÖm Kim Xµ CÊp 6/#show_equip_shop(6011)",
		"TiÖm Trang B? Háa Phông/ShopHP",
		"TiÖm Trang B? Thanh Long/ShopTL",
		"TiÖm Trang B? Uy Hæ/ShopUH",
		"TiÖm UÈn Linh CÊp 7/ShopUL7",
		"TiÖm S¸ch Pet/#show_equip_shop(6012)",
		"TiÖm Thó C­?i/#show_equip_shop(6006)",
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

function ShopUH()
	local tSay = {
		g_szTitle.."Lùa chän",
		"TiÖm Tèng Uy Hæ T­íng Qu©n/#show_equip_shop(1000)",
		"TiÖm Tèng Uy Hæ Nguyªn So¸i/#show_equip_shop(1002)",
		"TiÖm Liªu Uy Hæ T­íng Qu©n/#show_equip_shop(1001)",
		"TiÖm Liªu Uy Hæ Nguyªn So¸i/#show_equip_shop(1003)",
		"\nRa khái/nothing",
	};
	Say(DSN_NPC..format("%s cã thÓ gióp ®­îc g× kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

function ShopTL()
	local tSay = {
		g_szTitle.."Lùa chän",
		"TiÖm Tèng Thanh Long T­íng Qu©n/#show_equip_shop(1004)",
		"TiÖm Tèng Thanh Long Nguyªn So¸i/#show_equip_shop(1006)",
		"TiÖm Liªu Thanh Long T­íng Qu©n/#show_equip_shop(1005)",
		"TiÖm Liªu Thanh Long Nguyªn So¸i/#show_equip_shop(1007)",
		"\nRa khái/nothing",
	};
	Say(DSN_NPC..format("%s cã thÓ gióp ®­îc g× kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

function ShopHP()
	local tSay = {
		g_szTitle.."Lùa chän",
		"TiÖm Tèng Háa Phông T­íng Qu©n/#show_equip_shop(1008)",
		"TiÖm Tèng Háa Phông Nguyªn So¸i/#show_equip_shop(1010)",
		"TiÖm Liªu Háa Phông T­íng Qu©n/#show_equip_shop(1009)",
		"TiÖm Liªu Háa Phông Nguyªn So¸i/#show_equip_shop(1011)",
		"\nRa khái/nothing",
	};
	Say(DSN_NPC..format("%s cã thÓ gióp ®­îc g× kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end
