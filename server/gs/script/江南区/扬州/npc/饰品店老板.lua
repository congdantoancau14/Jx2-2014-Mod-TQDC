
tNgocQuy = {
	[1] = {"d� minh ch�u",{2,1,39},160000,1},
	[2] = {"ng�c nh� �", {2,1,87},1800,2},
	[3] = {"b�nh ng�c", {2,1,88},1800,2},
	[4] = {"ng�c nh� � t�ng ki�m",{2,0,187},500000,1},
}

tTrangSuc = {
	[1] = {"Kim Thoa",{2,1,41},1600,3},
	[2] = {"H�p trang s�c", {2,1,57},1700,3},
	[3] = {"H�p trang �i�m",{2,1,306},8000,2},
}

tDaQuy = {
	{"Thanh Kim",{2,1,17},14,1},
	{"Tuy�t Tinh",{2,1,22},14,1},
	{"�m Y�n",{2,1,26},16,2},
	{"�m Ph�ch",{2,1,27},16,3},
	{"H�ng Tinh",{2,1,32},16,1},
	{"Lang H�n",{2,1,37},16,1},
	{"Tuy�t Ph�ch",{2,1,45},17,2},
	{"U H�n",{2,1,51},17,2},
	{"L�c Ph�ch",{2,1,62},18,3},
	{"�n Th�ch",{2,1,72},18,1},
	{"H�ng V�n",{2,1,78},18,1},
	{"Ki�m H�n",{2,1,80},18,3},
	{"H� Ph�ch",{2,1,84},18,1},
	{"Kim Cang",{2,1,86},18,3},
	{"L�c Tr�",{2,1,91},18,1},
	{"Qu� H�n",{2,1,92},20,3},
	{"Huy�n Quang",{2,1,99},20,1},
	{"��ng L�ng",{2,1,100},20,1},

}

tChoosenItem = {}
nSupplyType = 0;
--szNpcName = GetTargetNpc();
szNpcName = "<color=green>Ch� Kim Ho�n<color>: ";

function main()
	local tSay = {
		"Ta mu�n mua it trang s�c/muaTrangSuc",
		"Ta mu�n b�n it trang s�c/banTrangSuc",
		"Ta mu�n b�n m�t it �� qu�/choosStones",
		"Sure! Ta mu�n cung c�p cho b� m�t �t ch�u b�u/chooseGems",
		"Ch�ng hay d�o n�y l�o b�n l�m �n th� n�o/nothing"
	}
	Say(szNpcName.."Ng��i tr� c�c ng��i �i l�i tr�n giang h� nhi�u, ch�c h�n ph�i s� h�u kh�ng it ch�u b�u. N�u c� th� trao ��i v�i ta, b�n ti�m h�a l� s� kh�ng khi�n ng��i chiu thi�t th�i",getn(tSay),tSay)
	
	if random(1,10) == 1 then
		NpcChat(GetTargetNpc(),"Ng�c nh� � th��ng ���c k�t tinh t�i n�i l�nh l�o nh� ��ng b�ng. B�ng h�u n�u mu�n t�m ch�ng th� gh� th� nh�ng ��ng b�ng xem sao!");
	end
end;

function banTrangSuc()
	local tSay = {}
	for i=1, getn(tTrangSuc) do
		tinsert(tSay, format("Ta c� m�t it %s/#supply(%d,3)",tTrangSuc[i][1],i))
	end
	tinsert(tSay,"\n�! Kh�ng ph�i/main")
	tinsert(tSay,"��a v�i b� cho vui th�i, haha!/nothing")
	Say(szNpcName.."Trang s�c l� �� ��ng gi� d� �� d�ng qua. N�u c� h�ng th� b�ng h�u c� mang ��n nh�",getn(tSay),tSay)
end;

function choosStones()
	local tSay = {}
	for i=1, getn(tDaQuy) do
		tinsert(tSay, format("Ta c� m�t it %s/#supply(%d,2)",tDaQuy[i][1],i))
	end
	tinsert(tSay,"\n�! Kh�ng ph�i/main")
	tinsert(tSay,"��a v�i b� cho vui th�i, haha!/nothing")
	Say(szNpcName.."Ch�ng hay b�ng h�u c� ch�u b�u g� mu�n b�n cho b�n �i�m?",getn(tSay),tSay)
end;

function chooseGems()
	local tSay = {}
	for i=1, getn(tNgocQuy)-1 do
		tinsert(tSay, format("Ta c� m�t it %s/#supply(%d,1)",tNgocQuy[i][1],i))
	end
	tinsert(tSay,format("Ta c� ng�c nh� � l�y t� T�ng Ki�m s�n Trang/#supply(%d,%d)",getn(tNgocQuy),1))
	tinsert(tSay,"\n�! Kh�ng ph�i/main")
	tinsert(tSay,"Ta n�i ch�i th�i, hihi!/nothing")
	Say(szNpcName.."Ch�ng hay b�ng h�u c� ch�u b�u g� mu�n b�n cho b�n ti�m?",getn(tSay),tSay)
end;

function supply(id, supplyType)
	nSupplyType = supplyType;
	local nCount = 0;
	if nSupplyType == 1 then
		tChoosenItem = tNgocQuy[id];
	elseif nSupplyType == 2 then
		tChoosenItem = tDaQuy[id];
	elseif nSupplyType == 3 then
		tChoosenItem = tTrangSuc[id];
	end
	nCount = GetItemCount(tChoosenItem[2][1],tChoosenItem[2][2],tChoosenItem[2][3])
	if nCount < 1 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� kh�ng mang theo v�t ph�m ng��i n�i");
		return
	end
	AskClientForNumber("_request_number_call_back", 1, nCount, "Nh�p s� l��ng");
end;

function _request_number_call_back(nNum)
	
	if nNum < 1 then
		Msg2Player("�� h�y b� giao d�ch.")
		return 0;
	end
	
	local nDelResult = DelItem(tChoosenItem[2][1],tChoosenItem[2][2],tChoosenItem[2][3], nNum)
	if nSupplyType == 1 then
		if  nDelResult and nDelResult == 1 then
			local nMoney = tChoosenItem[3] * nNum;
			Earn(nMoney)
			local szTalkMore = "";
			if tChoosenItem[4] == 2 then
				szTalkMore = "Lo�i ng�c n�y qu� ph� bi�n, gi� tr� kh�ng cao. E r�ng ta ch� c� th� tr� nhi�u ��y.\n";
			end
			local szMsg = format(szNpcName..szTalkMore.."Ti�n c�a ng��i ��y: %d %s", nMoney, "l��ng. C� h�ng l�i mang ��n ch� ta nh� :)")
			Talk(1, "", szMsg)
			Talk(1,"","<color=green>"..GetName().."<color>: Ta �� bi�t b� l� ng��i tinh t��ng m� :D")
			--Msg2Player("Giao d?ch th�nh c�ng")
			--WriteLog(format("%s exchange %d %s(%d,%d,%d) using %d",GetName(),nNum, target_item[4], target_item[1], target_item[2], target_item[3], nType));
		end
	elseif nSupplyType == 2 then
		if  nDelResult and nDelResult == 1 then
			local nMoney = tChoosenItem[3] * nNum;
			
			local szTalkMore = "";
			if tChoosenItem[4] == 1 then
				szTalkMore = "��ng l� k� tr�n d� b�o. Ta ki�m ���c m�n h�i r�i. Ha ha'.\n";
				nMoney = nMoney * 10000;
			end
			if tChoosenItem[4] == 2 then
				szTalkMore = "Lo�i �� n�y t��ng ��i ph� bi�n, gi� kh�ng ���c t�t l�m nh�.\n";
				nMoney = nMoney * 1000;
			end
			if tChoosenItem[4] == 3 then
				szTalkMore = "Lo�i �� n�y qu� ph� bi�n, gi� tr� kh�ng cao. E r�ng ta ch� c� th� tr� nhi�u ��y.\n"
				nMoney = nMoney * 100;
			end
			Earn(nMoney)
			
			local szMsg = format(szNpcName..szTalkMore.."Ti�n c�a ng��i ��y: %d %s", nMoney, "l��ng. C� h�ng l�i mang ��n ch� ta nh� :)")
			Talk(1, "", szMsg)
			if nMoney > 200000 then
				Talk(1,"","<color=green>"..GetName().."<color>: Ta �� bi�t b� l� ng��i tinh t��ng m� :D")
			end
			--Msg2Player("Giao d?ch th�nh c�ng")
			--WriteLog(format("%s exchange %d %s(%d,%d,%d) using %d",GetName(),nNum, target_item[4], target_item[1], target_item[2], target_item[3], nType));
		end
	elseif nSupplyType == 3 then
		if  nDelResult and nDelResult == 1 then
			local nMoney = tChoosenItem[3] * nNum;
			Earn(nMoney)
			
			local szMsg = format(szNpcName.."Ti�n c�a ng��i ��y: %d %s", nMoney, "l��ng. C� h�ng l�i mang ��n ch� ta nh� :)")
			Talk(1, "", szMsg)
			if random(1,10) == 1 then
				Talk(1,"","<color=green>"..GetName().."<color>: R�nh ta l�i ki�m v� cho b�. Y�n t�m �i! :D")
			end
			--Msg2Player("Giao d?ch th�nh c�ng")
			--WriteLog(format("%s exchange %d %s(%d,%d,%d) using %d",GetName(),nNum, target_item[4], target_item[1], target_item[2], target_item[3], nType));
		end
	end
end


function muaTrangSuc()
	Sale(40)
end;

function nothing()
end;