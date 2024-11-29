tItems = {
	[1] = {"g�m lam",{2,1,15},1400},
	[2] = {"g�m v�ng",{2,1,54},1700},
	[3] = {"v�i l�a cao c�p",{2,1,30360},90000},
	[4] = {"t� l�a ��i L�",{2,95,929},80000},
	[5] = {"h�p g�m",{2,0,168},500000},
}
item = {}

function main()
		if random(1,15) == 1 then
			NpcChat(GetTargetNpc(),"Kh�m n�m linh th�ch d�ng �� l�m trang b� B�t Qu�i �� xu�t hi�n tr�n giang h�, ta s�p c� m�i l�m �n r�i ��y!");
		end;	
			
		local szPlayerName = GetName()
		Say(GetTargetNpc()..": V�i voc � D��ng Ch�u th� kh�ng thi�u. Nh�ng nghe n�i v�ng Trung Nguy�n c� lo�i v�i cao c�p do th� d�t n�i ti�ng C�m N��ng ��c ch�"
			.."hay T�y Nam cu~ng c� m�t lo�i l�a ho�ng th�t ��i L�. Ch�ng hay c�c h� c� th� h�p t�c, cung c�p c�c lo�i v�i cho b�n �i�m hay kh�ng?", 3,
			szPlayerName..": Ta mu�n mua trang ph�c/muaTrangPhuc",
			szPlayerName..": Ta mu�n cung c�p cho �ng m�t it v�i voc/choose",
			szPlayerName..": Ch�ng hay d�o n�y l�o b�n l�m �n th� n�o/nothing"
		)
end;

function choose()
	
	local tSay = {}
	for i=1, getn(tItems) do
		tinsert(tSay,format("Ta c� m�t it %s/#supply(%d)",tItems[i][1],i))
	end
	tinsert(tSay, "Ta n�i ch�i th�i, hihi!/nothing")
	Say("���c l�m �n v�i c�c h� l� vinh h�nh c�a b�n ti�m?",getn(tSay),tSay)
end;

function supply(id)
	local nCount = GetItemCount(tItems[id][2][1], tItems[id][2][2], tItems[id][2][3]);
	item = {tItems[id][2][1], tItems[id][2][2], tItems[id][2][3], tItems[id][3]};
	AskClientForNumber("_request_number_call_back",1,nCount,"C�c h� mu�n b�n m�y t�m?");
end;

function _request_number_call_back(nNum)
	if nNum < 1 then
		Msg2Player("�� h�y b� giao d�ch");
		return
	end
	local nDelResult = DelItem(item[1],item[2],item[3],nNum)
	if nDelResult then
		Earn(item[4] * nNum)
		Msg2Player("Giao d�ch th�nh c�ng!");
		Say("C� h�ng l�i t�i ch� ta nhe'",1,"���c th�i!/nothing")
	end
end;

function getItem()
	return item
end;

function nothing()
end;

function muaTrangPhuc()
	Sale(43)
end;