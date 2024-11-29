Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

szNpcName = gf_FixColor("Qu�n l� c�a hi�u",2)..": ";

function main()
	local szSay = szNpcName.."Hoan ngh�nh b�ng h�u ��n v�i b�n �i�m."
		.."Ta ph� tr�ch qu�n l� c�c c�a hi�u, qu�n l� c�c m�t h�ng tr�n th� tr��ng �� tr�nh vi�c ��u c� ��y gi�.";
	local tSay = {};
	for i=1,4 do
		tinsert(tSay, format("* C�c c�a hi�u khu: %d/#showShop(%d)",i,i));
	end
	tinsert(tSay,"��n Ng� c�c/#show_equip_shop(2)");
	tinsert(tSay, "Nhi�u m�t h�ng qu�!/nothing");
	Say(szSay,getn(tSay),tSay);
end;

function showShop(nPage)
	local szSay = "Khu c�a hi�u th� "..nPage;
	local tSay = {};
	local tPage = {
		[1] = {1, 50},
		[2] = {51, 100},
		[3] = {101, 150},
		[4] = {151, 170},
	}
	for i=tPage[nPage][1],tPage[nPage][2] do
		tinsert(tSay, format("* Gian h�ng th�: %d/#Sale(%d)",i,i));
	end
	Say(szSay,getn(tSay),tSay);
end

function nothing()
end;