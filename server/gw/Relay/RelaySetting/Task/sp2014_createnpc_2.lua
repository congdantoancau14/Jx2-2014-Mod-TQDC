function TaskShedule()
	TaskName("Niªn Thó 2014");	

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(21,00);
	OutputMsg(format("Niªn Thó sÏ t¹i %s xuÊt hiÖn...", "21:00"));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw sp_CreateNianShou(%d)", tonumber(nDate)));
end