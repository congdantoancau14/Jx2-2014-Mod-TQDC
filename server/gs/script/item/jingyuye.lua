Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	local tSay = {
		format("S¸ch Kü N¨ng CÊp 1-2/#show_equip_shop(%d)", 3047),
		format("S¸ch Kü N¨ng CÊp 3-4/#show_equip_shop(%d)", 3048),
		"Hñy bá/nothing",	
	}
	Say("Chän cÊp ®é s¸ch cÇn ghÐp: ", getn(tSay), tSay);
end

function nothing()
	
end