-- =====================================================
-- Ã¿°ëĞ¡Ê±´¥·¢Ò»´ÎµÄ±ÈÎä´ó»áÇ°×àµÄÍæ¼ÒÅä¶Ô
-- =====================================================
g_nInterValTime = 1;	--´¥·¢µÄ¼ä¸ôÊ±¼ä
-- ¶¨Ê±Éè¶¨
function TaskShedule()
	-- ÈÎÎñÃû×Ö
	TaskName("GhĞp ®«i tr­íc ®¹i héi tû vâ")
	
	-- 15·ÖÖÓ´¥·¢Ò»´Î
	TaskInterval(g_nInterValTime)
	
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"))
	nMin = mod((floor(nMin/g_nInterValTime)+1)*g_nInterValTime,60)
	if nMin == 0 then
		nHour = nHour + 1; --Èç¹ûÔÚxµã48·ÖÆô¶¯µÄ»°£¬ÄÇÃ´¾ÍÔÚx+1µã0·Ö´´½¨NPC
	end;
	--RelayÆô¶¯ºóÏÂÒ»¸öquarterÖ´ĞĞ
	TaskTime(nHour, nMin)

	-- ÖØ¸´Ö´ĞĞÎŞÏŞ´ÎÊı
	TaskCountLimit(0)
	
	local msg = "GhĞp ®«i l¹i thµnh c«ng, thêi gian ghĞp ®«i lÇn ®Çu lµ "..nHour.." ®iÓm"..nMin.." Phót "
	OutputMsg(format(msg))
end;

-- ¶¨Ê±Ö´ĞĞµÄÄÚÈİ
function TaskContent()
	GlobalExecute("dw biwudahuiqianzou_init()")
end;



