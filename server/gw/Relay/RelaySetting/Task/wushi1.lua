--Ã¿Ìì12:00,19:00×¼Ê±Ë¢ĞÂ

function TaskShedule()
	TaskName("T¹o míi NPC L©n S­...");	

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(12,00);
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw Ws_CreateWushiNpc(%d)", tonumber(nDate)));
end