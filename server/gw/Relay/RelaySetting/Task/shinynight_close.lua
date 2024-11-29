Include("\\RelaySetting\\Task\\shinynight_head.lua");

INTERVAL_TIME = 1440	-- Ã¿24Ð¡Ê±´¥·¢

function TaskShedule()
	TaskName("§ãng §ªm Huy Hoµng kinh nghiÖm nh©n ®«i");	

	TaskInterval(INTERVAL_TIME);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local hour = TIME_CLOSE
	local min = 15
	TaskTime(hour, min);
	OutputMsg(format("§ãng §ªm Huy Hoµng kinh nghiÖm nh©n ®«i, nhiÖm vô sÏ ®­îc khëi ®éng vµo %d:%d...", hour, min));
	-- Ö´ÐÐÎÞÏÞ´Î
	TaskCountLimit(0);
end

function TaskContent()
	-- »Ô»ÍÖ®Ò¹½áÊø
	SetGlbInt(RELAYGLB_SHINYNIGHT, 0)

	local msg = "Ho¹t ®éng §ªm Huy Hoµng ®· kÕt thóc, mêi mäi ng­êi ngµy mai tham gia ®«ng ®ñ."
	GlobalExecute(format("dw AddGlobalNews([[%s]])", msg))
	GlobalExecute("dw ShinyNight_Close()")
end
