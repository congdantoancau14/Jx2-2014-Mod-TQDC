Include("\\script\\equip_shop\\equip_shop_head.lua");

function main()
	local tbSay = {
		"Xin ®¹i quan dÉn ®Õn Ngù c¸c/OpenIB",
		"Xin ®¹i quan dÉn ®Õn Kim phiÕu ®iÕm/#show_equip_shop(3000)",
		"Xin ®¹i quan dÉn ®Õn Ng©n phiÕu ®iÕm/#show_equip_shop(3033)",
	}
	tinsert(tbSay,"T¹i h¹ chØ ghĞ ngang th«i/nothing");
	Say("C¸c h¹ muèn ®i ®©u?",getn(tbSay),tbSay);
end;

function OpenIB()
	Talk(1,"","Ngù c¸c vÉn ch­a më cöa");
end;

function nothing() end;