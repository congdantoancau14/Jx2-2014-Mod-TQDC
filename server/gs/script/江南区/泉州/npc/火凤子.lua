Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua")

function main()
	local tbSay = {
		"Ti�m n�ng c�p H�a Ph�ng/ShopHP",
		"Ti�m n�ng c�p Thanh Long/ShopTL",
		"Ti�m n�ng c�p Uy H�/ShopUH",
	}
	tinsert(tbSay, "Ta ch� gh� ch�i/no")
	Say("<color=green>H�a Ph�ng T�: <color> Ta c� th� gi�p ���c g� cho ng��i kh�ng?",getn(tbSay),tbSay)
end

function ShopUH()
	local tSay = {
		"Ti�m T�ng Uy H� T��ng Qu�n/#show_equip_shop(2000)",
		"Ti�m T�ng Uy H� Nguy�n So�i/#show_equip_shop(2002)",
		"Ti�m Li�u Uy H� T��ng Qu�n/#show_equip_shop(2001)",
		"Ti�m Li�u Uy H� Nguy�n So�i/#show_equip_shop(2003)",
		"\nRa kh�i/nothing",
	};
	Say(format("<color=green>C�a H�ng: <color>%s c� th� gi�p ���c g� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

function ShopTL()
	local tSay = {
		"Ti�m T�ng Thanh Long T��ng Qu�n/#show_equip_shop(2004)",
		"Ti�m T�ng Thanh Long Nguy�n So�i/#show_equip_shop(2006)",
		"Ti�m Li�u Thanh Long T��ng Qu�n/#show_equip_shop(2005)",
		"Ti�m Li�u Thanh Long Nguy�n So�i/#show_equip_shop(2007)",
		"\nRa kh�i/nothing",
	};
	Say(format("<color=green>C�a H�ng: <color>%s c� th� gi�p ���c g� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

function ShopHP()
	local tSay = {
		"Ti�m T�ng H�a Ph�ng T��ng Qu�n/#show_equip_shop(2008)",
		"Ti�m T�ng H�a Ph�ng Nguy�n So�i/#show_equip_shop(2010)",
		"Ti�m Li�u H�a Ph�ng T��ng Qu�n/#show_equip_shop(2009)",
		"Ti�m Li�u H�a Ph�ng Nguy�n So�i/#show_equip_shop(2011)",
		"\nRa kh�i/nothing",
	};
	Say(format("<color=green>C�a H�ng: <color>%s c� th� gi�p ���c g� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end
