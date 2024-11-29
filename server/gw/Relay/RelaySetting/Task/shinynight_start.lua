Include("\\RelaySetting\\Task\\shinynight_head.lua");

INTERVAL_TIME = 1440	-- Ã¿24Ğ¡Ê±´¥·¢

function TaskShedule()
	TaskName("§ªm Huy Hoµng kinh nghiÖm nh©n ®«i");	

	TaskInterval(INTERVAL_TIME);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local hour = TIME_START
	local min = 0
	TaskTime(hour, min);
	OutputMsg(format("NhiÖm vô §ªm Huy Hoµng kinh nghiÖm nh©n ®«i b¾t ®Çu vµo lóc %d:%d...", hour, min));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("ShinyNight start......")
	-- Ñ¡Ôñ±¶ÂÊ	
	local multiple = GetGlbInt(RELAYGLB_MULTIPLE)
	if (multiple == 0) then
		multiple = get_multiple()
	end
	
	-- ÉèÖÃ½ñÌìÍíÉÏ»Ô»ÍÖ®Ò¹µÄÄÚÈİ
	local system = GetShiningChoice()
	if (system == 0) then
		-- »ñÈ¡±£´æµÄÏµÍ³Ë÷Òı
		system = GetGlbInt(RELAYGLB_SYSTEM)
		if (system == 0) then
			system = get_random_system()
		end
	end
	
	-- »ñµÃ×îNBµÄÍ¶Æ±ÈËµÄÃû×Ö
	local szVoteName = GetVoteName()

	-- ¹«¸æ
	local multiple_msg = map_sysnames[system][3]
	if (multiple_msg == 0) then
		multiple_msg = multiple / 100
	end
	local msg = format("Ho¹t ®éng §ªm Huy Hoµng ®· b¾t ®Çu, tèi 19:00-23:15, %sPhÇn th­ëng%s hÖ thèng t¨ng%1.1f lÇn, hy väng mäi ng­êi tham gia ®«ng ®ñ.",
		map_sysnames[system][1],
		map_sysnames[system][2],
		multiple_msg)
		
	-- »Ô»ÍÖ®Ò¹¿ªÊ¼
	SetGlbInt(RELAYGLB_SHINYNIGHT, 1)

	GlobalExecute(format("dw AddGlobalNews([[%s]])", msg))
	GlobalExecute(format("dw ShinyNight_Start(%d,%d,%s)", system, multiple, szVoteName))
	
	-- Çå³ırelayÖĞµÄ¼ÇÒä
	ClearShiningNight()
end
