-- ¼¤Õ½Ç§Ñ°Ëş¶¨Ê±Êı¾İÇåÀí

function TaskShedule()
	TaskName("ThiÕt lËp thêi gian Thiªn TÇm Th¸p");

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(00,30);
	OutputMsg(format("Mçi ngµy 00h30 sÏ thiÕt lËp l¹i d÷ liÖu Thiªn TÇm Th¸p..."));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);
end

function TaskContent()
	-- Ö´ĞĞÕÙ»½½Å±¾º¯Êı
	GlobalExecute("dw Qht_Relay_Clean()")
end