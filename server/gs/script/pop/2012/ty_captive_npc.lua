Include("\\script\\online\\template\\flash_npc.lua");
Include("\\script\\class\\mem.lua")
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\misc\\autocleaner\\autocleaner_head.lua")
Include("\\script\\lib\\globalfunctions.lua");

tCaptive = { --ÌìÒõ·ıÂ²
	nstartDate = 20120301, --»î¶¯¿ªÊ¼Ê±¼ä
	nEndDate = 20301230, --»î¶¯½áÊøÊ±¼ä
	nCheckRoute = 0,  --ÊÇ·ñÒª¼ÓÈëÁ÷ÅÉ
	strNpcMod = "Thiªn ¢m Tï Binh",  --NpcÄ£°å
	strNpcName = "Thiªn ¢m Tï Binh", --npcÃû×Ö
	nCampType = 2,   --¶Ô»°npc»¹ÊÇÕ½¶·npc
	nNeedRoom = 0,   --Èç¹ûÊÇ¶Ô»°npc£¬ĞèÒªÅĞ¶Ï±³°ü¿Õ¼ä£¨¸ù¾İ½±Àø¶ø¶¨£©
	nNeedWeight = 0, --Èç¹ûÊÇ¶Ô»°npc£¬ĞèÒªÅĞ¶Ï±³°ü¸ºÖØ£¨¸ù¾İ½±Àø¶ø¶¨£©
	strThisFile = "\\script\\pop\\2012\\ty_captive_npc.lua",  
	tNpcPos = {
		[5078]={
 {1763,3307},
 {1769,3299},
 {1775,3286},
 {1783,3274},
 {1794,3279},
 {1801,3285},
 {1811,3293},
 {1804,3303},
 {1798,3295},
 {1792,3290},
 {1782,3283},
 {1778,3293},
 {1788,3302},
 {1794,3310},
 {1787,3317},
 {1776,3319},
 {1770,3315},
 {1762,3307},
 {1772,3304},
 {1773,3305},
			},
	},
	-- ĞèÒªÊµÏÖÒÔÏÂ½Ó¿Úº¯Êı
	onTalk = nil,						--¶Ô»°npcÈë¿Ú
	giveDeathAward = nil,	  --É±ËÀnpc½±ÀøÈë¿Ú
	giveTalkAward = nil,		--¶Ô»°npc½±ÀøÈë¿Ú
};

tCaptive = inherit(tFlashNpcInfo,tCaptive);

--function main()
--	autoclean();
--end

function tCaptive.create_captive_npc()
	tCaptive:createFlashNpc(5078,20);
end
	
function tCaptive:giveDeathAward()
	if 1 ~= tGtTask:check_cur_task(78) then return 0 end
	if BigGetItemCount(2,96,135) < 20 and gf_Judge_Room_Weight(1,10,"") ~= 0 then
		gf_SetLogCaption("Tiªu diÖt Thiªn ¢m Tï Binh");
		gf_AddItemEx({2,96,135,1,4},"Tro cèt cña tï binh");
		gf_SetLogCaption("");
	end
	return 0;
end	
function OnDeath(nNpcIdx)
	tCaptive:npc_death(nNpcIdx);
	RemoveNpc(nNpcIdx);
end