Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua")

function main()
	local tbSay = {
		"TiÖm n©ng cÊp Háa Phông/ShopHP",
		"TiÖm n©ng cÊp Thanh Long/ShopTL",
		"TiÖm n©ng cÊp Uy Hæ/ShopUH",
	}
	tinsert(tbSay, "Ta chØ ghÐ ch¬i/no")
	Say("<color=green>Háa Phông Tö: <color> Ta cã thÓ gióp ®­îc g× cho ng­¬i kh«ng?",getn(tbSay),tbSay)
end

function ShopUH()
	local tSay = {
		"TiÖm Tèng Uy Hæ T­íng Qu©n/#show_equip_shop(2000)",
		"TiÖm Tèng Uy Hæ Nguyªn So¸i/#show_equip_shop(2002)",
		"TiÖm Liªu Uy Hæ T­íng Qu©n/#show_equip_shop(2001)",
		"TiÖm Liªu Uy Hæ Nguyªn So¸i/#show_equip_shop(2003)",
		"\nRa khái/nothing",
	};
	Say(format("<color=green>Cöa Hµng: <color>%s cã thÓ gióp ®­îc g× kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

function ShopTL()
	local tSay = {
		"TiÖm Tèng Thanh Long T­íng Qu©n/#show_equip_shop(2004)",
		"TiÖm Tèng Thanh Long Nguyªn So¸i/#show_equip_shop(2006)",
		"TiÖm Liªu Thanh Long T­íng Qu©n/#show_equip_shop(2005)",
		"TiÖm Liªu Thanh Long Nguyªn So¸i/#show_equip_shop(2007)",
		"\nRa khái/nothing",
	};
	Say(format("<color=green>Cöa Hµng: <color>%s cã thÓ gióp ®­îc g× kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

function ShopHP()
	local tSay = {
		"TiÖm Tèng Háa Phông T­íng Qu©n/#show_equip_shop(2008)",
		"TiÖm Tèng Háa Phông Nguyªn So¸i/#show_equip_shop(2010)",
		"TiÖm Liªu Háa Phông T­íng Qu©n/#show_equip_shop(2009)",
		"TiÖm Liªu Háa Phông Nguyªn So¸i/#show_equip_shop(2011)",
		"\nRa khái/nothing",
	};
	Say(format("<color=green>Cöa Hµng: <color>%s cã thÓ gióp ®­îc g× kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end
