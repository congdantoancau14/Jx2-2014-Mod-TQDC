-- ÖĞÎç1µã³öÏÖµÄBOSS¶¨Ê±Æ÷

function TaskShedule()
	TaskName("§¸nh Niªn thó");	

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(9,0);
	OutputMsg(format("Kú L©n xuÊt hiÖn vµo lóc 09:00..."));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

	-- OutputMsg("Æô¶¯×Ô¶¯¹ö¶¯¹«¸æ...");
end

function TaskContent()
	-- Ö´ĞĞÕÙ»½ÄêÊŞµÄ½Å±¾º¯Êı
	local m1 = random(11,12)
	local m2 = random(13,15)
	local m3 = random(16,18)
	GlobalExecute(format("dw createNewYearBoss(%d,%d,%d,%d)", 0, m1, m2, m3))
end
