Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");

g_szTitle = "<color=green>L�a ch�n: <color>"

List = {
	[1008] = {1008, "Ti�m T�ng H�a Ph�ng T��ng Qu�n"},
	[1009] = {1009, "Ti�m Li�u H�a Ph�ng T��ng Qu�n"},
	[1010] = {1010, "Ti�m T�ng H�a Ph�ng Nguy�n So�i"},
	[1011] = {1011, "Ti�m Li�u H�a Ph�ng Nguy�n So�i "},
}

function OnUse(nItemIndex)
	local nItem = GetItemParticular(nItemIndex)

	local tSay = {
	};
	
	for k, v in pairs(List) do
		tinsert(tSay,""..v[2].."/#show_equip_shop("..v[1]..")");
	end
	
	tinsert(tSay, "\nRa kh�i/nothing");
	Say(g_szTitle.."C�a H�ng", getn(tSay), tSay);	
end