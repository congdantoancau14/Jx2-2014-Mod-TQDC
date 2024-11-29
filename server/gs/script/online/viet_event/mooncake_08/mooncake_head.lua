--File name:	mooncake_head.lua
--Describe:		ÖÐÇï»î¶¯headÎÄ¼þ
--Create Date:	2008-08-18
--Author:		chenbenqian

SWITCH_08_MOONCAKE_VIET	= 1;

DATE_08_MOONCAKE_VIET_START	= 2008090500;			-- ÖÐÇï»î¶¯¿ªÊ¼ÈÕÆÚ
DATE_08_MOONCAKE_VIET_END	= 2048100600;			-- ÖÐÇï»î¶¯½áÊøÈÕÆÚ

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
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_08_MOONCAKE_VIET_START and nDate < DATE_08_MOONCAKE_VIET_END then
		return SWITCH_08_MOONCAKE_VIET;
	else
		return 0;
	end
end

function get_mooncake_info()
	Talk(1,"","Ho¹t ®éng \"Truy t×m lång ®Ìn may m¾n\" diÔn ra tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008. Lång §Ìn sÏ xuÊt hiÖn Tõ 11:00 ®Õn 14:00 vµ tõ 21:00 ®Õn 24:00 vµo c¸c ngµy Thø 6, Thø 7 vµ Chñ nhËt h»ng tuÇn. Trong thêi gian nµy, ng­êi ch¬i ®Õn NPC TiÓu §ång ®Ó nhËn “NÕn vµng”. ë tr¹ng th¸i chiÕn ®Êu, ng­êi ch¬i mang NÕn Vµng ®Õn c¸c b¶n ®å ®Ó th¾p s¸ng Lång §Ìn May M¾n, sÏ cã c¬ héi nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm vµ c¸c vËt phÈm cã gi¸ trÞ.");
end;
