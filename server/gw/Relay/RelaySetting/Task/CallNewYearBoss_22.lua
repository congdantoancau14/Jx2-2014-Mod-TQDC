-- ÖĞÎç1µã³öÏÖµÄBOSS¶¨Ê±Æ÷

function TaskShedule()
	TaskName("§¸nh Niªn thó");	

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(22,0);
	OutputMsg(format("§¹i Niªn thó xuÊt hiÖn vµo lóc 22:00..."));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

	-- OutputMsg("Æô¶¯×Ô¶¯¹ö¶¯¹«¸æ...");
end

function TaskContent()
	-- Ö´ĞĞÕÙ»½ÄêÊŞµÄ½Å±¾º¯Êı
	local index = random(11,18)
	GlobalExecute(format("dw createNewYearBoss(%d)",index))
end
