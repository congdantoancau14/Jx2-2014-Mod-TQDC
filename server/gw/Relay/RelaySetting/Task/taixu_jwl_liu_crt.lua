--½Å±¾Ãû³Æ£ºÌ«ĞéÈÎÎñ´´½¨ÁõÌú½³µ÷ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÓÉrelay·¢Ö¸Áî´´½¨µ÷ÓÃ´´½¨ÁõÌú½³µÄ½Å±¾
--²ß»®ÈË£ºÌúÑò
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-03-04
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
function TaskShedule()
	-- ÈÎÎñÃû×Ö
	TaskName("Th¨n cÊp nhiÖm vô Trang søc Th¸i H­")
	-- 24¸öĞ¡Ê±Ò»´Î
	TaskInterval(1440)
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local random_time_m = random(0,30)
	-- ÖØ¸´Ö´ĞĞÎŞÏŞ´ÎÊı
	TaskTime(21,random_time_m)
	TaskCountLimit(0)
	OutputMsg("NhiÖm vô t¨ng cÊp trang søc Th¸i H­: Thî rÌn L­u chÕ t¹o thµnh c«ng!")
end
-- ¶¨Ê±Ö´ĞĞµÄÄÚÈİ
function TaskContent()
	GlobalExecute("dw taixujwl_liu_crt()")
end
