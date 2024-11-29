Include("\\RelaySetting\\Task\\shinynight_head.lua");

INTERVAL_TIME = 1440	-- Ã¿24Ğ¡Ê±´¥·¢

function TaskShedule()
	TaskName("C«ng bè §ªm Huy Hoµng");	

	TaskInterval(INTERVAL_TIME);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local hour = 18
	local min = 0
	TaskTime(hour, min);
	OutputMsg(format("NhiÖm vô §ªm Huy Hoµng sÏ ®­îc khëi ®éng vµo %d:%d...", hour, min));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);
end

function TaskContent()
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

	-- Ñ¡Ôñ±¶ÂÊ
	local multiple = get_multiple()
	SetGlbInt(RELAYGLB_MULTIPLE, multiple)

	-- ¹«¸æ
	local multiple_msg = map_sysnames[system][3]
	if (multiple_msg == 0) then
		multiple_msg = multiple / 100
	end
	local msg = format("Ho¹t ®éng ®Õn Huy Hoµng tèi nay sÏ b¾t ®Çu 19:00-23:15, hÖ thèng %s_%s phÇn th­ëng sÏ t¨ng %1.1f lÇn. Hy väng mäi ng­êi tİch cùc tham gia hoÆc dïng B¸ V­¬ng Huy Hoµng lÖnh ®Ó nhanh chãng ®¹t ®­îc phÇn th­ëng nh­ mong muèn!",
		map_sysnames[system][1],
		map_sysnames[system][2],
		multiple_msg)

	GlobalExecute(format("dw AddGlobalNews([[%s]])", msg))
end

