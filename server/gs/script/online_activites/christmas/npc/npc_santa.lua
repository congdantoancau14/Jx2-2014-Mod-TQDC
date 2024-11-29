Include("\\script\\online_activites\\201211\\christmas_tree.lua");

function main()
	local tbSay = {}
	local szSay = "Mïa ®«ng ë ®©y nãng qu¸! Kh«ng thÓ mÆc næi ¸o l«ng. ¸o ®á ta còng b¸n mÊt råi. Giê ta ph¶i b¸n c¶ th«ng ®Ó lÊy tiÒn mua quµ cho tôi nhá th«i!!!";
	tbSay, szSay = VET_201211_AdditionDialog(tbSay,szSay);
	tinsert(tbSay,"Gi¸ng sinh vui vÎ!/nothing");
	Say(szSay,getn(tbSay),tbSay);
end;

function nothing() end;