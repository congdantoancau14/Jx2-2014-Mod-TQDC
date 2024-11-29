--Ã¿Ìì8:30£»12:30£»17:30£»22:30×¼Ê±Ë¢ĞÂ£¬Ã¿ÈÕ¹²ËÄÂÖ

function TaskShedule()
	TaskName("Lµm míi ThÎ Tù BOSS ");	

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(22,30);
	OutputMsg(format("ThÎ Tù BOSS  t¹i %s xuÊt hiÖn...", "22:30"));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw Cc_CreateBoss(%d)", tonumber(nDate)));
end