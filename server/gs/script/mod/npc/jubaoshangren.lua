Include("\\script\\equip_shop\\equip_shop_talk.lua")

function main()
	local tbSay = {
		"Ta cã Cæ linh th¹ch/OnOpenShops_GuLingShi",
		"Ta cã Cæ linh ngäc/OnOpenShops_GuLingYu",
		"Ta cã Thiªn m«n kim lÖnh/OnOpenShops_TianMenJinLing",
	}
	local szSay = "B¶o vËt thùc sù kh«ng xuÊt hiÖn chèn phån hoa n¸o nhiÖt mµ xuÊt hiÖn ë th©m s¬n cïng cèc. N¬i ®©y tuy kh«ng ph¶i th©m s¬n cïng cèc nh­ng b¶o vËt th× kh«ng thiÕu. C¸c h¹ cã g× ®Ó trao ®æi nµo?";
	tinsert(tbSay,"Ta chØ ghÐ xem/nothing");
	Say(szSay,getn(tbSay),tbSay);
end;

function nothing() end;
