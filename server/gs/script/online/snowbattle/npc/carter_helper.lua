function main()
	local tSay = {
		"TuyÒn Ch©u/#ch_goto_city(1)",
		"BiÖn Kinh/#ch_goto_city(2)",
		"Thµnh §«/#ch_goto_city(3)",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("ChØ cã Thµnh §«, BiÖn Kinh vµ TuyÒn Ch©u míi cã khu nĞm tuyÕt. Ta cã thÓ truyÒn tèng ®¹i hiÖp ®Õn chç Xa Phu_NĞm tuyÕt cña Thµnh §«, BiÖn Kinh, TuyÒn Ch©u, ®¹i hiÖp muèn ®i ®©u?", getn(tSay), tSay);
end

function ch_goto_city(nCity)
	local tCity = {
		{100, 1414, 3007},
		{200, 1372, 2897},
		{300, 1752, 3560},
	}
	NewWorld(tCity[nCity][1], tCity[nCity][2], tCity[nCity][3]); 
end