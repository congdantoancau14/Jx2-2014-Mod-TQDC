--�������ܽ��Ӳ�������
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

DSN_NPC = "<color=green>�� T� N��ng<color>: ";

function main()
	local tSay = {
		"Ti�m �� Qu?/#show_equip_shop(6000)",
		"Ti�m V� H� H�o Hi�p/#show_equip_shop(6001)",
		"Ti�m �m Huy?t/#show_equip_shop(6003)",
		"Ti�m S�t Tinh/#show_equip_shop(6004)",
		"Ti�m V� Song Chi?n Th�n/#show_equip_shop(6005)",
		"Ti�m Minh Tinh V� C�c/#show_equip_shop(6007)",
		"Ti�m Kim X� C�p 6/#show_equip_shop(6011)",
		"Ti�m Trang B? H�a Ph�ng/ShopHP",
		"Ti�m Trang B? Thanh Long/ShopTL",
		"Ti�m Trang B? Uy H�/ShopUH",
		"Ti�m U�n Linh C�p 7/ShopUL7",
		"Ti�m S�ch Pet/#show_equip_shop(6012)",
		"Ti�m Th� C�?i/#show_equip_shop(6006)",
		"\nT�i ch� xem xem th�i/nothing",
	}		
	Say(DSN_NPC..format("%s c� th� gi�p ���c g� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end


function ShopUL7()
	local tSay = {
		"Ti�m U�n Linh C�p 7 - ��u/#show_equip_shop(6008)",
		"Ti�m U�n Linh C�p 7 - Y/#show_equip_shop(6009)",
		"Ti�m U�n Linh C�p 7 - Trang/#show_equip_shop(6010)",
		"\nRa kh�i/nothing",
	};
	--SelectSay(szSay);
	Say(DSN_NPC..format("%s c� th� gi�p ���c g� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

function ShopUH()
	local tSay = {
		g_szTitle.."L�a ch�n",
		"Ti�m T�ng Uy H� T��ng Qu�n/#show_equip_shop(1000)",
		"Ti�m T�ng Uy H� Nguy�n So�i/#show_equip_shop(1002)",
		"Ti�m Li�u Uy H� T��ng Qu�n/#show_equip_shop(1001)",
		"Ti�m Li�u Uy H� Nguy�n So�i/#show_equip_shop(1003)",
		"\nRa kh�i/nothing",
	};
	Say(DSN_NPC..format("%s c� th� gi�p ���c g� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

function ShopTL()
	local tSay = {
		g_szTitle.."L�a ch�n",
		"Ti�m T�ng Thanh Long T��ng Qu�n/#show_equip_shop(1004)",
		"Ti�m T�ng Thanh Long Nguy�n So�i/#show_equip_shop(1006)",
		"Ti�m Li�u Thanh Long T��ng Qu�n/#show_equip_shop(1005)",
		"Ti�m Li�u Thanh Long Nguy�n So�i/#show_equip_shop(1007)",
		"\nRa kh�i/nothing",
	};
	Say(DSN_NPC..format("%s c� th� gi�p ���c g� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

function ShopHP()
	local tSay = {
		g_szTitle.."L�a ch�n",
		"Ti�m T�ng H�a Ph�ng T��ng Qu�n/#show_equip_shop(1008)",
		"Ti�m T�ng H�a Ph�ng Nguy�n So�i/#show_equip_shop(1010)",
		"Ti�m Li�u H�a Ph�ng T��ng Qu�n/#show_equip_shop(1009)",
		"Ti�m Li�u H�a Ph�ng Nguy�n So�i/#show_equip_shop(1011)",
		"\nRa kh�i/nothing",
	};
	Say(DSN_NPC..format("%s c� th� gi�p ���c g� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end
