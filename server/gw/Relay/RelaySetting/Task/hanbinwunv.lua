--Ã¿Ìì20:00×¼Ê±Ë¢ĞÂ

function TaskShedule()
	TaskName("T¹p míi Phï Thñy B¨ng Gi¸");	

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(20,00);
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d%H")) + random(10000);
	GlobalExecute(format("dw oly_hanbingwunv(%d)", tonumber(nDate)));
end