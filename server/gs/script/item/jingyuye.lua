Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	local tSay = {
		format("S�ch K� N�ng C�p 1-2/#show_equip_shop(%d)", 3047),
		format("S�ch K� N�ng C�p 3-4/#show_equip_shop(%d)", 3048),
		"H�y b�/nothing",	
	}
	Say("Ch�n c�p �� s�ch c�n gh�p: ", getn(tSay), tSay);
end

function nothing()
	
end