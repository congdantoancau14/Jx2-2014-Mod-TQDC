
function TaskShedule()
	TaskName("§¸nh m· tÆc");	

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(21,30);
	OutputMsg(format("M· tÆc ®Çu môc xuÊt hiÖn vµo lóc 21:30..."));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

	-- OutputMsg("Æô¶¯×Ô¶¯¹ö¶¯¹«¸æ...");
end

function TaskContent()
	-- Ö´ĞĞÕÙ»½ÂíÔôÍ·Ä¿µÄ½Å±¾º¯Êı
	GlobalExecute("dw createMaZeiBoss()")
end