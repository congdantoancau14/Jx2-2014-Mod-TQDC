--Ã¿Ìì12:30,21:30×¼Ê±Ë¢ĞÂ

function TaskShedule()
	TaskName("BOSS N¨m Míi");	

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(12,30);
	OutputMsg(format("BOSS N¨m Míi sÏ xuÊt hiÖn ë %s...", "12:30"));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw Yb_CreateBoss(%d)", tonumber(nDate)));
end