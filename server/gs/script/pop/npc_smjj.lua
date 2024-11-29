Include("\\script\\equip_shop\\equip_shop_head.lua");

function main()
	local strtab = {
			"Mua Ngò Hµnh Thiªn NghÜa Bµn/buy_wuxingpan",
			"Mua Ngò Hµnh LuyÖn Hãa Thªm VËt/buy_lianhuawu",
			"ChÕ t¹o §¸ Ngò Hµnh/#show_equip_shop(46)",
			"KÕt thóc ®èi tho¹i/nothing"
		};
	Say("<color=green>T­ M· Thanh Thanh<color>: Ta ®ang gióp gia gia ph©n lo¹i nguyªn liÖu ngò hµnh, ®¹i ca/®¹i tû, cÇn gióp g× vËy?",
		getn(strtab),
		strtab)
end

--¹ºÂòÎåĞĞÌìÒÇÅÌ
function buy_wuxingpan()
	Sale(146);
end

--¹ºÂòÎåĞĞÁ¶»¯Ìí¼ÓÎï
function buy_lianhuawu()
	Sale(145);
end

function nothing()
	
end

--ÈçºÎ»ñµÃÁ¶»¯ËùĞèµÄ²ÄÁÏ
function get_resource()
       Say("<color=green>T­ M· Thanh Thanh<color>: Ngò Hµnh Nguyªn Th¹ch bao gåm: Ngò Hµnh Nguyªn Th¹ch (S¬) vµ Ngò Hµnh Nguyªn Th¹ch (Cao).<enter>    NhËn Ngò Hµnh Nguyªn Th¹ch (S¬): Tham gia Thiªn M«n TrËn cã c¬ héi nhËn ®­îc [Thiªn M«n TrËn Qu©n Nhu Bao], më Qu©n Nhu Bao nhËn ®­îc Ngò Hµnh Nguyªn Th¹ch (S¬); còng cã thÓ dïng ®iÓm tİch lòy Thiªn M«n TrËn ®Ó ®æi Ngò Hµnh Nguyªn Th¹ch (S¬).<enter>    NhËn Ngò Hµnh Nguyªn Th¹ch (Cao): Mua trong Ngù C¸c [R­¬ng Ngò Hµnh Nguyªn Th¹ch (Cao)].", 1,"trë l¹i/main");
end