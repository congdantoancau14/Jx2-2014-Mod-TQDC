Include("\\script\\equip_shop\\equip_shop_talk.lua")

function main()
	local tbSay = {
		"Ta c� C� linh th�ch/OnOpenShops_GuLingShi",
		"Ta c� C� linh ng�c/OnOpenShops_GuLingYu",
		"Ta c� Thi�n m�n kim l�nh/OnOpenShops_TianMenJinLing",
	}
	local szSay = "B�o v�t th�c s� kh�ng xu�t hi�n ch�n ph�n hoa n�o nhi�t m� xu�t hi�n � th�m s�n c�ng c�c. N�i ��y tuy kh�ng ph�i th�m s�n c�ng c�c nh�ng b�o v�t th� kh�ng thi�u. C�c h� c� g� �� trao ��i n�o?";
	tinsert(tbSay,"Ta ch� gh� xem/nothing");
	Say(szSay,getn(tbSay),tbSay);
end;

function nothing() end;
