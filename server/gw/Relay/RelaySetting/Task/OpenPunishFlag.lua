-- ÖĞÎç1µã³öÏÖµÄBOSS¶¨Ê±Æ÷

function TaskShedule()
	TaskName("HÑn giê ®ãng më");	

	-- Ò»ÌìÒ»´Î
	TaskInterval(14400);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(23,59);
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute(format("dw OpenPunishFlag(%d)", 1));
end
