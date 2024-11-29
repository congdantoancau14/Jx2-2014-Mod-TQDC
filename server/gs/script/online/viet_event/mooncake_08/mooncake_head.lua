--File name:	mooncake_head.lua
--Describe:		ÖÐÇï»î¶¯headÎÄ¼þ
--Create Date:	2008-08-18
--Author:		chenbenqian

SWITCH_08_MOONCAKE_VIET	= 1;

DATE_08_MOONCAKE_VIET_START	= 09;			-- ÖÐÇï»î¶¯¿ªÊ¼ÈÕÆÚ
DATE_08_MOONCAKE_VIET_END	= 10;			-- ÖÐÇï»î¶¯½áÊøÈÕÆÚ

TOTALEXP_08_MOONCAKE_VIET = 2455					--¼ÇÂ¼Ê¹ÓÃÔÂ±ý»ñµÃµÄ×Ü¹²µÄ¾­Ñé
FIRE_TIME_08_MOONCAKE_VIET = 2456					--¼ÇÂ¼µã»ð(Éú³É»ðÂ¯)µÄÊ±¼ä
CAKE_TYPE_08_MOONCAKE_VIET = 2457					--¼ÇÂ¼ÉÕ¿¾ÔÂ±ýµÄÀàÐÍ
BURNER_IDX_08_MOONCAKE_VIET = 2458					--¼ÇÂ¼»ðÂ¯npcµÄË÷Òý
WOOD_NUM_08_MOONCAKE_VIET = 2459					--¼ÇÂ¼³É¹¦·ÅÄ¾²ÄµÄ¸öÊý
OBTAIN_CAKE_08_MOONCAKE_VIET = 2460					--¼ÇÂ¼ÊÇ·ñÁìÈ¡ÁËÔÂ±ý
LUCKY_DATE_08_MOONCAKE_VIET = 2461					--¼ÇÂ¼µ±ÌìµãÁÁÐÒÔËµÆÁýµÄÈÕÆÚ
LUCKY_TIMES_08_MOONCAKE_VIET = 2462					--¼ÇÂ¼µ±ÌìµãÁÁÐÒÔËµÆÁýµÄ´ÎÊý
WOOD_TIME_08_MOONCAKE_VIET = 2463					--¼ÇÂ¼·ÅÄ¾²ñµÄÊ±¼ä
CAKE_DATE_08_MOONCAKE_VIET = 2464					--¼ÇÂ¼½»ÔÂ±ýµÄÈÕÆÚ

RELAY_DB_08_MOONCAKE_VIET = "mooncake_event_08_viet"		--¹²ÏíÊý¾Ý¿â×Ö·û´®±êÊ¶

g_nExpTotal_MoonCakeViet = 50000000					--ÖÐÇï»î¶¯Ê¹ÓÃÔÂ±ý¿É»ñµÃµÄ×Ü¹²¾­ÑéÖµ
g_nTime_MoonCakeViet = 300							--ÉÕ¿¾ÔÂ±ýÐèÒªµÄÊ±¼ä(µ¥Î»£ºÃë)
Include("\\script\\lib\\writelog.lua")
szLogTrungThuName = "Hoat Dong Trung Thu"

--ÖÐÇï»î¶¯¿ª·Å·µ»Ø1£¬¹Ø±Õ·µ»Ø0
function is_mooncake_viet_open()
	local nDate = tonumber(date("%m"));
	if nDate >= DATE_08_MOONCAKE_VIET_START and nDate < DATE_08_MOONCAKE_VIET_END then
		return SWITCH_08_MOONCAKE_VIET;
	else
		return 0;
	end
end

function search_lantern()
	Talk(1,"","Ho¹t ®éng \"Truy t×m lång ®Ìn may m¾n\" diÔn ra tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008. Lång §Ìn sÏ xuÊt hiÖn Tõ 11:00 ®Õn 14:00 vµ tõ 21:00 ®Õn 24:00 vµo c¸c ngµy Thø 6, Thø 7 vµ Chñ nhËt h»ng tuÇn. Trong thêi gian nµy, ng­êi ch¬i ®Õn NPC TiÓu §ång ®Ó nhËn “NÕn vµng”. ë tr¹ng th¸i chiÕn ®Êu, ng­êi ch¬i mang NÕn Vµng ®Õn c¸c b¶n ®å ®Ó th¾p s¸ng Lång §Ìn May M¾n, sÏ cã c¬ héi nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm vµ c¸c vËt phÈm cã gi¸ trÞ.");
end;

function give_cake()
	Talk(1,"","Ho¹t ®éng “TÆng B¸nh Trung Thu” diÔn ra h»ng ngµy tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008. Hµng ngµy tõ 7:00 ®Õn 19:00, ng­êi ch¬i mang 4 b¸nh trung thu b×nh th­êng hoÆc 4 b¸nh trung thu ®Æc biÖt ®Õn tÆng cho NPC Phi YÕn Tiªn Tö ®Ó nhËn lÊy 1 ®iÒu ­íc. Tõ 20:00 ®Õn 06:00 s¸ng h«m sau, ng­êi ch¬i ®Õn NPC Phi YÕn Tû Tû ®Ó nhËn phÇn th­ëng tõ ®iÒu ­íc cña m×nh.\nChó ý: Sau thêi gian quy ®Þnh mµ ng­êi ch¬i kh«ng ®Õn nhËn th­ëng th× phÇn th­ëng sÏ bÞ hñy bá.");
end;

function collect_materials()
	Talk(1,"","Tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008, ng­êi ch¬i cã thÓ ®¸nh qu¸i ®Ó thu thËp nguyªn liÖu lµm b¸nh trung thu (xem chi tiÕt trªn trang chñ).")
end;

function make_cake()
	Talk(1,"","Ho¹t ®éng lµm B¸nh Trung Thu diÔn ra tõ ngµy 05-09-2008 ®Õn 24:00 ngµy 05-10-2008. Trong thêi gian nµy, ng­êi ch¬i tham gia c¸c ho¹t ®éng trong trß ch¬i ®Ó thu thËp c¸c Tói Nguyªn LiÖu, bªn trong cã chøa c¸c nguyªn liÖu cÇn thiÕt ®Ó lµm B¸nh Trung Thu. Ngoµi ra, ng­êi ch¬i cã thÓ lµm ra nh÷ng chiÕc b¸nh trung thu ®Æc biÖt khi mua gãi Gia VÞ tõ Ngù C¸c. Sö dông c¸c lo¹i B¸nh Trung Thu sÏ ®­îc ®iÓm kinh nghiÖm vµ vËt phÈm cã gi¸ trÞ.")
end;
	
function get_mooncake_08_info()
	local tbSay = {
		"Ho¹t ®éng Thu thËp nguyªn liÖu/collect_materials",
		"Ho¹t ®éng Lµm b¸nh Trung Thu/make_cake",
		"Ho¹t ®éng Truy t×m lång ®Ìn may m¾n/search_lantern",
		"Ho¹t ®éng TÆng b¸nh Trung Thu/give_cake",
	}
	Say("Danh s¸ch c¸c ho¹t ®éng Trung Thu 2008",getn(tbSay),tbSay)
end;