--File name:	new_year_head.lua
--Describe:		´º½Ú»î¶¯headÎÄ¼þ
--Create Date:	2008-12-24
--Author:		chenbenqian


SWITCH_09_NEWYEAR_VIET	= 1;

DATE_09_NEWYEAR_VIET_START	= 2009011600;			-- ´º½Ú»î¶¯¿ªÊ¼ÈÕÆÚ
DATE_09_NEWYEAR_VIET_END	= 2049021600;			-- ´º½Ú»î¶¯½áÊøÈÕÆÚ

PLUM_EXP_LIMIT_09_NEWYEAR_VIET = 100000000			--´º½Ú»î¶¯Ã·-ÌÒ»î¶¯¿É»ñµÃµÄ×Ü¹²¾­ÑéÖµÉÏÏÞ
SEED_EXP_LIMIT_09_NEWYEAR_VIET = 20000000			--´º½Ú»î¶¯ÐÒ¸£ÖÖ×Ó¿É»ñµÃµÄ×Ü¹²¾­ÑéÖµÉÏÏÞ
PICK_TIME_09_NEWYEAR_VIET = 30						--Ê°È¡ÐÒ¸£ÖÖ×ÓÐèÒªµÄÊ±¼ä(µ¥Î»£ºÃë)
JOIN_TONG_DAY_09_NEWYEAR_VIET = 7					--×îÐ¡Èë°ïÊ±¼ä(µ¥Î»£ºÌì)


--´º½Ú»î¶¯Ê¹ÓÃµÄÈÎÎñ±äÁ¿
GAIN_NEW_BAG_09_NEWYEAR_VIET = 2108					--¼ÇÂ¼µ±Ììµ±ÂÖÊÇ·ñÍ¨¹ýÉ±ÊÖÌÃ»ñµÃÁËÐÂÄêºì°ü
PLUM_TOTALEXP_09_NEWYEAR_VIET = 2109				--¼ÇÂ¼´º½Ú»î¶¯Ã·-ÌÒ»î¶¯»ñµÃµÄ×Ü¹²µÄ¾­Ñé
SEED_TOTALEXP_09_NEWYEAR_VIET = 2110				--¼ÇÂ¼´º½Ú»î¶¯ÐÒ¸£ÖÖ×Ó»ñµÃµÄ×Ü¹²µÄ¾­Ñé
GIVE_PLUM_DATE_09_NEWYEAR_VIET = 2111				--¼ÇÂ¼µ±ÌìÊÇ·ñÓÐÔùËÍ4Ö¦Ã·»¨
AWARD_PLUM_09_NEWYEAR_VIET = 2112					--¼ÇÂ¼µ±ÌìÊÇ·ñÓÐÁìÈ¡Ã·»¨½±Àø
NEW_BAG_WEEK_09_NEWYEAR_VIET = 2113					--¼ÇÂ¼±¾ÖÜÊÇ½ñÄêµÄµÚ¼¸ÖÜ£¨ÓÃÓÚÇå³ýÉÏÖÜÁìÈ¡×Ï¹â¸óÐÂÄêºì°üµÄ¸öÊý£©
NEW_BAG_NUM_09_NEWYEAR_VIET = 2114					--¼ÇÂ¼±¾ÖÜÁìÈ¡×Ï¹â¸óÐÂÄêºì°üµÄ¸öÊý
STAGE_NUM_09_NEWYEAR_VIET = 2115					--¼ÇÂ¼±¾ÖÜÁìÈ¡ÁË×Ï¹â¸óµÚ¼¸¹ØµÄÐÂÄêºì°ü

--´º½Ú»î¶¯Ê¹ÓÃµÄÁÙÊ±ÈÎÎñ±äÁ¿
SEED_INDEX_09_NEWYEAR_VIET = 102					--¼ÇÂ¼ËùµãÐÒ¸£ÖÖ×ÓµÄnpcË÷Òý


--´º½Ú»î¶¯¹²ÏíÊý¾Ý¿â±êÊ¶
RELAY_DB_09_NEWYEAR_VIET = "new_year_09_veit"
--===================================================================================================

--´º½Ú»î¶¯¿ª·Å·µ»Ø1£¬¹Ø±Õ·µ»Ø0
function is_new_year_09_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_09_NEWYEAR_VIET_START and nDate < DATE_09_NEWYEAR_VIET_END then
		return SWITCH_09_NEWYEAR_VIET;
	else
		return 0;
	end
end

function get_new_year_09_info()
	Talk(1,"","Mçi ngµy ng­êi ch¬i cã cÊp 10 trë lªn vµ ®· vµo m«n ph¸i tÆng hoa mai cho NPC Phi YÕn Tiªn Tö sÏ ®­îc phÇn th­ëng cã gi¸ trÞ: \n-Tõ 0:05 ®Õn 19:00 ng­êi ch¬i tÆng 4 hoa mai cho NPC Phi YÕn Tiªn Tö sÏ ®­îc phÇn th­ëng kinh nghiÖm\n-Tõ 19:05 ®Õn 24:00, ng­êi ch¬i ®· tÆng ®ñ 4 hoa mai ®Õn ®èi tho¹i víi Phi YÕn sÏ ®­îc nh÷ng phÇn quµ ®Æc biÖt\n-Ng­êi ch¬i may m¾n nhÊt trong ngµy sÏ ®­îc 1 Ngò Hµnh MËt TÞch.")
end	


