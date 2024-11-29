-- Êı¾İÇåÀí£¬µÇ¼ÇÈËÊıºÍĞÒÔËÊı×Ö

function TaskShedule()
	TaskName("CËp nhËt d÷ liÖu ho¹t ®éng Olympic");

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(23,58);
	OutputMsg(format("22:10 mçi ngµy cËp nhËt l¹i d÷ liÖu ho¹t ®éng Olympic..."));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

end

function TaskContent()
	-- Ö´ĞĞÕÙ»½½Å±¾º¯Êı
	GlobalExecute("dw Relay_Clean_Data()")
end