Include("\\script\\equip_shop\\equip_shop_head.lua");

function main()
	local tbSay = {
		"Xin ��i quan d�n ��n Ng� c�c/OpenIB",
		"Xin ��i quan d�n ��n Kim phi�u �i�m/#show_equip_shop(3000)",
		"Xin ��i quan d�n ��n Ng�n phi�u �i�m/#show_equip_shop(3033)",
	}
	tinsert(tbSay,"T�i h� ch� gh� ngang th�i/nothing");
	Say("C�c h� mu�n �i ��u?",getn(tbSay),tbSay);
end;

function OpenIB()
	Talk(1,"","Ng� c�c v�n ch�a m� c�a");
end;

function nothing() end;