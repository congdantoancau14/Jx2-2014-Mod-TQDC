Include("\\script\\online_activites\\201211\\christmas_tree.lua");

function main()
	local tbSay = {}
	local szSay = "¸o ®á ta còng b¸n mÊt råi. Giê ta ph¶i b¸n c¶ th«ng ®Ó lÊy tiÒn mua quµ cho tôi nhá th«i!!!";
	tbSay, szSay = VET_201211_AdditionDialog(tbSay,szSay);
	Say(szSay,getn(tbSay),tbSay);
end;