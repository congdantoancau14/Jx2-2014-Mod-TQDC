Include("\\script\\online_activites\\201211\\christmas_tree.lua");

function main()
	local tbSay = {}
	local szSay = "�o �� ta c�ng b�n m�t r�i. Gi� ta ph�i b�n c� th�ng �� l�y ti�n mua qu� cho t�i nh� th�i!!!";
	tbSay, szSay = VET_201211_AdditionDialog(tbSay,szSay);
	Say(szSay,getn(tbSay),tbSay);
end;