Include("\\script\\online_activites\\201211\\christmas_tree.lua");

function main()
	local tbSay = {}
	local szSay = "M�a ��ng � ��y n�ng qu�! Kh�ng th� m�c n�i �o l�ng. �o �� ta c�ng b�n m�t r�i. Gi� ta ph�i b�n c� th�ng �� l�y ti�n mua qu� cho t�i nh� th�i!!!";
	tbSay, szSay = VET_201211_AdditionDialog(tbSay,szSay);
	tinsert(tbSay,"Gi�ng sinh vui v�!/nothing");
	Say(szSay,getn(tbSay),tbSay);
end;

function nothing() end;