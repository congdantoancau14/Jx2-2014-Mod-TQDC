--�������ܽ��Ӳ�������
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

DSN_NPC = "<color=green>�� T� N��ng<color>: ";

function main()
	local tSay = {
		"Ti�m �� Qu�/#show_equip_shop(6000)",
		"Ti�m S�ch Pet/#show_equip_shop(6012)",
		"Ti�m Th� C��i/#show_equip_shop(6006)",
		"Ti�m U�n Linh C�p 7/ShopUL7",
		--"Ti�m V� H� H�o Hi�p/#show_equip_shop(6001)",
		"Ti�m Kim X� C�p 6/#show_equip_shop(6011)",
		"Ti�m �m Huy�t/#show_equip_shop(6003)",
		"Ti�m S�t Tinh/#show_equip_shop(6004)",
		"Ti�m V� Song Chi�n Th�n/#show_equip_shop(6005)",
		"Ti�m Minh Tinh V� C�c/#show_equip_shop(6007)",
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
