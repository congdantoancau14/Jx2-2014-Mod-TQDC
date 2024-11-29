-- ¶¨Ê±Æ÷Éú³É°ÂÔËĞÒÔËÊı×Ö

function TaskShedule()
	TaskName("ThiÕt lËp ch÷ sè may m¾n ho¹t ®éng Olympic");

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(20,58);
	OutputMsg(format("21:00 mçi ngµy sÏ thiÕt lËp ch÷ sè may m¾n Olympic..."));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

end

function TaskContent()
	-- Ö´ĞĞÕÙ»½½Å±¾º¯Êı
	GlobalExecute("dw Relay_Generate_LuckNum()")
end