Include("\\script\\online_activites\\201204\\changkuaishujia\\changkuaishujia.lua")
Include("\\script\\online_activites\\201205\\exchange_award.lua")
Include("\\script\\vng\\doinguyenlieu.lua")
Include("\\script\\item\\jubaoping.lua") -- Added in 23 Jul 2020

tBaoThach = {
	[1] = {"Lam tinh th�ch", {2,1,30006},10000},
	[2] = {"Ho�ng b�o th�ch", {2,1,30007},10000},
	[3] = {"Ng� linh th�ch", {2,1,30005},100000},
}

tLinhThach = {
	[1] = {"Linh th�ch nguy�n th�ch c�p 1",{2,1,30413}},
	[2] = {"Linh th�ch nguy�n th�ch c�p 2",{2,1,30414}},
	[3] = {"Linh th�ch nguy�n th�ch c�p 3",{2,1,30415}},
	[4] = {"Linh th�ch nguy�n th�ch c�p 4",{2,1,30416}},
	[5] = {"Linh th�ch nguy�n th�ch c�p 5",{2,1,30417}},
	[6] = {"Linh th�ch nguy�n th�ch c�p 6",{2,1,30418}},
	[7] = {"Linh th�ch nguy�n th�ch c�p 7",{2,1,30419}},
	[8] = {"Bao Linh th�ch c�p 6", {2,1,30306}},
	[9] = {"Bao Linh th�ch c�p 7", {2,1,30305}},
}

tCountStone = {}
nChoosenStoneId = 0
nKieuThanhToan = 0; -- 1: Ban bao thach, 2: Doi bo bao thach lay linh thach cap 7, 3: Doi bao thach lay linh thach

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

tSellItem = {}

function main()
	local tbSay = {
		"* Nghe n�i l�o c� m�t s� b�o v�t? H�y cho ta xem!/muaBaoVat",
		"* Nghe n�i l�o �ang thu mua b�o th�ch? Ta c� cho l�o ��y/banBaoThach",
		"* Nghe n�i l�o �ang trao ��i b�o th�ch? Ta mu�n d�ng b�o th�ch ��i linh th�ch/doiBaoThachLinhThach",
		"* Ta c� �� m�t b� �� qu�, nghe n�i c� th� ��i ���c linh th�ch c�p 7?/doiDaQuyLinhThach",
	};
	
	tinsert(tbSay,"* Ta mu�n ��i m�t s� v�t ph�m kh�c/exchangeOther");
	tinsert(tbSay,"* Thu ��i Qu�n d�ng/Trade_Material_Menu3");

	tinsert(tbSay,"Sao l�o l�i ��ng � c�i g�c x� x�nh n�y v�y?/cancel");
	Say("Tr�ng thanh gi� m�t nh� th� n�y�sao kh�ng c�ng ta �i t�n b� ch�?",
		getn(tbSay),tbSay)
		--"��˵����������һЩ����ʧ���Ķ����������򼸸���/Suiyinbuy",
		--"��˵����������һЩ�Ϻõ���װ�·������뿴����/ClothBuy",
		--"��˵����������һЩ�Ϻõ���װ���ڣ����뿴����/CapBuy",
		--"��˵����������һЩ�Ϻõ���װ��ȹ�����뿴����/ShoeBuy",
		--"��˵����������һЩңԶ�����ս�ۣ����뿴����/ShijieBuy",
		--"�뿪û�¡�/cancel")
end

function exchangeOther()
	local tbSay = {}
	local nDate = tonumber(date("%Y%m%d"))
	--����table
	if gf_CheckEventDateEx(VET_CKSJ_ACITIVITY_ID) == 1 then
		for i=1,getn(Vet_CKSJ_Say_Tb) do
			tinsert(tbSay,Vet_CKSJ_Say_Tb[i]);
		end
	end
	--2012��6�»
	if gf_CheckEventDateEx(VET_ExcAw_ACITIVITY_ID) == 1 then
		for i=1,getn(Vet_ExcAw_Say_Tb) do
			tinsert(tbSay,Vet_ExcAw_Say_Tb[i]);
		end
	end
	tinsert(tbSay,"Hmm, ta t� nhi�n kh�ng mu�n ��i n�a/cancel");
	local szSay = "C�c h� mu�n ��i g� n�o?";
	Say(szSay,getn(tbSay),tbSay);
end;

function doiDaQuyLinhThach()
	tSay = {}
	szDaQuy = "";
	for i=1, getn(tDaQuy) do
		szDaQuy = szDaQuy..colorize("green",tDaQuy[i][1])..", ";
	end
	tinsert(tSay, "Ta c� �� th� l�o y�u c�u. H�y ��i cho ta!/countDaQuy");
	tinsert(tSay, "Ta ��i � r�i, kh�ng ��i n�a!/cancel")
	local szTitle = "M�t b� �� qu� bao g�m: "..szDaQuy..". T�ng c�ng l� "..getn(tDaQuy).." lo�i.<enter>"
			.."N�u b�ng h�u t�p h�p ���c �� b�, ta s� ��i cho ng��i m�t vi�n Linh th�ch c�p 7";
	Say(szTitle,getn(tSay), tSay);
end;

function countItems(tItems)
	local tResult = {}
	local nMax = 2000;
	for i=1, getn(tItems) do
		local nCount = GetItemCount(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3]);
		if nCount < nMax then
			nMax = nCount;
		end
		tResult[i] = nCount;
	end
	return tResult, nMax;
end;

function countDaQuy()

	local tCounted, nMax = countItems(tDaQuy);
	
	if nMax < 1 then
		tSay = {}
		tinsert(tSay, "H�nh nh� c�c h� ch�a t�m ���c �� b�. Mu�n g�t ta sao?");
		tinsert(tSay, "Ki�m ���c m�t vi�n �� kh�, �� b� l�i c�ng kh�ng ph�i chuy�n d�. C� g�ng l�n thanh ni�n.");
		tinsert(tSay, "Tu�i tr� c�c ng��i th�t ��ng ng��~ng m�.");
		tinsert(tSay, "C� c�ng m�i s�t, c� ng�y n�n kim");
		tinsert(tSay, "B�o th�ch th��ng c� � nh�ng n�i th�m s�n c�ng c�c. Kh�ng lao ��ng th� sao l�i mong h��ng th�nh qu�?");
		local i = random(1,getn(tSay));
		Talk(1,"",tSay[i]);
	else
		local tSay = {};
		local szHeader = "B�ng h�u r�t gi�i. �� ki�m ���c �� b� linh th�ch n�y, "
			.."ch�c h�n �� t�n kh�ng �t c�ng s�c, c�n r�t nhi�`u s� ki�n nh�n. T�i h� th�n ph�c! "
			.."S� �� qu� n�y c� th� ��i ���c "..colorize("yellow",nMax).." vi�n linh th�ch c�p 7. "
			.."M�i lo�i, ta ch� l�y 1 vi�n th�i. B�ng h�u mu�n ��i bao nhi�u?";
		tinsert(tSay, "Ta mu�n ��i 1 vi�n th�i/#getLinhThach7(1)");
		if nMax >= 5 then
			tinsert(tSay, "H�y ��i cho ta 5 vi�n/#getLinhThach7(5)");
		end
		tinsert(tSay, format("Ta �ang c�n linh th�ch, h�y ��i to�n b� cho ta/#getLinhThach7(%d)",nMax));
		Say(szHeader,getn(tSay),tSay);
	end
end;

function getLinhThach7(nNum)
	if GetFreeItemRoom() < nNum then
		Talk (1,"","Ng��i �m ��m qu� nhi�`u th� tr�n ng��i. Hay l� d�n b�t �i?!!")
		return 0
	end
	
	local tDel = {};
	local nResult = 1;
	for i=1, getn(tDaQuy) do
		local nDel = DelItem(tDaQuy[i][2][1],tDaQuy[i][2][2],tDaQuy[i][2][3],nNum);
		if nDel ~= 1 then
			nResult = 0;
			break
		end
	end
	
	if nResult == 1 then
		AddItem(tLinhThach[9][2][1],tLinhThach[9][2][2],tLinhThach[9][2][3],nNum);
		Talk(1,"","Giao d�ch th�nh c�ng. "
			..format("Nh�n %s %s",
				gf_FixColor(tostring(nNum),4),
				colorize("green",tLinhThach[9][1]))
		);
	else
		Talk(1,"","H�nh nh� c� s� gian l�n � ��y. Kh�ng qua m�t ���c l�o ��u. "
			.."Ta s� l�y �i s� �� ng��i �� giao �� l�m h�nh ph�t.");
	end
end;

function colorize(szColor, anyData)
	anyData = tostring(anyData);
	return format("<color=%s>%s<color>",szColor,anyData);
end;

function doiBaoThachLinhThach()
	tSay = {}
	szBaoThach = ""
	for i=1, getn(tBaoThach) do
		szBaoThach = szBaoThach.."<color=green>"..tBaoThach[i][1].."<color>, ";
	end
	tinsert(tSay, "* Ta kh�ng c� �� b� b�o th�ch\n"
				.."Ta mu�n ��i Lam tinh th�ch l�y linh th�ch ng�u nhi�n c�p 1-5/#exchangeStone(1)");
	tinsert(tSay, "* Ta kh�ng c� �� b� b�o th�ch\n"
				.."Ta mu�n ��i Ho�ng tinh th�ch l�y linh th�ch ng�u nhi�n c�p 1-5/#exchangeStone(2)");
	tinsert(tSay, "* Ta kh�ng c� �� b� b�o th�ch\n"
				.."Ta mu�n ��i Ng� linh th�ch l�y linh th�ch c�p 6/#exchangeStone(3)");
	tinsert(tSay, "* L�o y�n t�m. Ta c� �� b� b�o th�ch l�o y�u c�u\n"
				.."Ta mu�n ��i c� b� l�y linh th�ch c�p 7/exchangeStoneSet");
	tinsert(tSay, "Ta ��i � r�i, kh�ng ��i n�a!/cancel")
	local szTitle = "��ng l� ta c� linh th�ch. Ta s� ��i cho ng��i. Nh�ng linh th�ch th� c� linh t�nh, "
		.."n�u kh�ng c� c�ch �i.nh t�nh th� ch� c� th� t�y v�n m� th�i!"
		.."Ng��i c�n c� �� "..szBaoThach.." th� m�i c� th� ��i l�y linh th�ch c�p 7 "
		.."v� Ng� linh th�ch l� vi�n �� c� th� �i.nh t�nh linh kh�. "
		.."N�u kh�ng Lam tinh th�ch v� ho�ng b�o th�ch ch� c� th� ��i linh th�ch t�` c�p 1 ��n c�p 5, "
		.."C�n Ng� linh th�ch th� c� th� ��i l�y linh th�ch c�p 6. Th� n�o?";
	Say(szTitle,getn(tSay), tSay);
	
end;

function exchangeStoneSet()
	local nMax = 2000;
	for i=1,getn(tBaoThach) do
		local tItem = tBaoThach[i];
		local nNum = GetItemCount(tItem[2][1],tItem[2][2],tItem[2][3]);
		tCountStone[i] = nNum;
		if nNum < nMax then
			nMax = nNum;
		end
	end
	
	if nMax < 1 then
		Talk(1,"doiBaoThachLinhThach","H�nh nh� ng��i kh�ng c� �� b� b�o th�ch nh� ng��i n�i.");
	elseif nMax == 1 then
		nKieuThanhToan = 2;
		_request_number_call_back(1);
	else 
		nKieuThanhToan = 2;
		AskClientForNumber("_request_number_call_back",1,nMax,"Nh�p s� l��ng");
	end
end;
	

function exchangeStone(nId)
	nChoosenStoneId = nId;
	tChoosenStone = tBaoThach[nId];
	local nMax = 2000;
	if nId <= 3 then
		nMax = GetItemCount(tChoosenStone[2][1],tChoosenStone[2][2],tChoosenStone[2][3]);
	end
	
	if nMax < 1 then
		Talk(1,"doiBaoThachLinhThach","Xin l�i. Ta kh�ng th�y ng��i c� vi�n "..tChoosenStone[1].." n�o c�.");
	elseif nMax == 1 then
		nKieuThanhToan = 3;
		_request_number_call_back(1);
	else 
		nKieuThanhToan = 3;
		AskClientForNumber("_request_number_call_back",1,nMax,"Nh�p s� l��ng");
	end
end;

function banBaoThach()
	tSay = {}
	for i=1, getn(tBaoThach) do
		tinsert(tSay, format("Ta mu�n b�n cho �ng %s/#supplyBaoThach(%d)",tBaoThach[i][1],i));
	end
	tinsert(tSay, "Ta ch� n�i ch�i th�i, ha ha!/cancel")
	Say("B�ng h�u c� b�o th�ch n�o v�y?",getn(tSay), tSay);
	
end;

function thanhtoan(nNum, nExchangeType)
	if nExchangeType == 1 then -- b�n b�o th�ch
		Msg2Player("B�n b�o th�ch");
		local nDel = DelItem(tSellItem[2][1],tSellItem[2][2],tSellItem[2][3],nNum);
		if nDel then
			Msg2Player("Giao d�ch th�nh c�ng!");
			Earn(nNum * tSellItem[3]);
			tSellItem = {} -- Thanh l�
		else
			Msg2Player("Giao d�ch th�t b�i!");
		end
	elseif nExchangeType == 2 then -- ��i b� b�o th�ch l�y linh th�ch c�p 7
		Msg2Player("��i b� b�o th�ch l�y linh th�ch c�p 7");
		-- local nRoom = GetFreeItemRoom();
		-- if nRoom < nNum then
			-- Talk(1,"",format("H�nh trang kh�ng �� %s ch� tr�ng.",colorize(nNum)));
			-- return
		-- end
		local tDel = {}
		for i=1, getn(tBaoThach) do
			local tItem = tBaoThach[i];
			local nDel = DelItem(tItem[2][1],tItem[2][2],tItem[2][3],nNum);
			if nDel == 1 then
				tinsert(tDel, {i,nDel});
			end
		end
		
		if getn(tDel) == getn(tBaoThach) then
			-- for i=1,nNum do
				-- local nStoneLevel = random(1,7);
				-- lspf_AddLingShiInBottle(nStoneLevel,1);
				-- Msg2Player("Giao d�ch th�nh c�ng. Nh�n ���c "..nStoneLevel.." (c�p) Linh th�ch, "
								-- .."�� ���c cho v�o T� Linh ��nh.");
			-- end
			AddItem(tLinhThach[7][2][1],tLinhThach[7][2][2],tLinhThach[7][2][3],nNum);
			Msg2Player("Giao d�ch th�nh c�ng."..format("Nh�n %s vi�n %s",nNum,tLinhThach[7][1]));
		else
			Msg2Player("Giao d�ch th�t b�i.");
		end
	elseif nExchangeType == 3 then -- ��i b�o th�ch l�y linh th�ch ng�u nhi�n
		Msg2Player("��i b�o th�ch l�y linh th�ch ng�u nhi�n");
		local nDel = DelItem(tChoosenStone[2][1],tChoosenStone[2][2],tChoosenStone[2][3],nNum);
		if nDel ~= 1 then
			Msg2Player("Giao d?ch th�t b�i! Kh�ng �� s� l��ng nguy�n li�u ngu�n.");
			return 0;
		end
		local nStoneLevel = 0;
		if nChoosenStoneId == 1 or nChoosenStoneId == 2 then
			for i=1, nNum do
				nStoneLevel = random(1,5);
				lspf_AddLingShiInBottle(nStoneLevel,1);
				Msg2Player("Giao d�ch th�nh c�ng. Nh�n ���c "..nStoneLevel
					.." (c�p) Linh th�ch, �� ���c cho v�o T� Linh ��nh.");
			end
		elseif nChoosenStoneId == 3 then
			nStoneLevel = 6;
			AddItem(tLinhThach[nStoneLevel][2][1],tLinhThach[nStoneLevel][2][2],tLinhThach[nStoneLevel][2][3],nNum);
			Msg2Player("Giao d�ch th�nh c�ng. "
				..format("Nh�n %s vi�n %s",colorize("yellow",nNum),
					colorize("green",tLinhThach[nStoneLevel][1])
			));
		end
		
		
	end
end;

function supplyBaoThach(id)
	tSellItem = tBaoThach[id];
	local nNum = GetItemCount(tSellItem[2][1],tSellItem[2][2],tSellItem[2][3])
	if nNum < 1 then
		Talk(1,"banBaoThach","H�nh nh� c�c h� kh�ng mang theo b�o th�ch ng��i n�i");
		return
	end
	nKieuThanhToan = 1;
	AskClientForNumber("_request_number_call_back",1,nNum,"Nh�p s� l��ng");
end;

function _request_number_call_back(nNum)
	if nNum < 1 then
		return 0
	end
	thanhtoan(nNum,nKieuThanhToan);
end;

function muaBaoVat()
	tSay = {
		"Nghe n�i ch� l�o c� m�t v�i b�o v�t th�t truy�`n?/Suiyinbuy",
		"Nghe n�i ch� l�o c� m�t v�i ngo�i trang (y) cao c�p?/ClothBuy",
		"Nghe n�i ch� l�o c� m�t v�i ngo�i trang (m�o) cao c�p?/CapBuy",
		"Nghe n�i ch� l�o c� m�t v�i ngo�i trang (qu�n) cao c�p?/ShoeBuy",
		"Nghe n�i ch� l�o c� m�t v�i di.qu�c b�o v�t? Cho ta xem!/ShijieBuy",
		"\nTrang tr��c/main",
		"\nTh�i b� �i/cancel",
		}
	Say("��ng l� ta �� truy�`n tin mu�n b�n m�t s� b�o v�t. Xin m�i kh�ch quan xem qua!", getn(tSay),tSay);
	
end;

function cancel()
end

function Suiyinbuy()
   Sale(53)
end
function ClothBuy()
   Sale(56)
end
function CapBuy()
   Sale(57)
end
function ShoeBuy()
   Sale(58)
end
function ShijieBuy()
   Sale(87)
end