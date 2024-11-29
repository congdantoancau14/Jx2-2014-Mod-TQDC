
Include("\\RelaySetting\\Task\\shinynight_head.lua");

INTERVAL_TIME = 5	-- Ã¿5·ÖÖÓ´¥·¢

function TaskShedule()
	TaskName("B¾t ®Çu tuÇn hoµn kinh nghiÖm nh©n ®«i §ªm Huy Hoµng");	

	TaskInterval(INTERVAL_TIME);
	-- ÉèÖÃ´¥·¢Ê±¼ä
  	local hour = tonumber(date("%H"));
    local min = tonumber(date("%M"));
 	TaskTime(hour, min);
	OutputMsg(format("NhiÖm vô tuÇn hoµn kinh nghiÖm nh©n ®«i §ªm Huy Hoµng b¾t ®Çu vµo lóc %d:%d...", hour, min));
	-- Ö´ÐÐÎÞÏÞ´Î
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("ShinyNight loop......")
	
	if (GetGlbInt(RELAYGLB_SHINYNIGHT) == 1) then
		return
	end

  	local hour = tonumber(date("%H"))
    local min = tonumber(date("%M"));
    -- min >= 2²Å¼ÌÐøÖ´ÐÐ£¬±£Ö¤shinynight_loopºÍshinynight_start²»³åÍ»¡£ 
 	if (hour < TIME_START or hour >= TIME_CLOSE or min < 2) then
  		return
  	end
  	
	-- Ñ¡Ôñ±¶ÂÊ	
	local multiple = GetGlbInt(RELAYGLB_MULTIPLE)
	if (multiple == 0) then
		multiple = get_multiple()
	end
	
	-- ÉèÖÃ½ñÌìÍíÉÏ»Ô»ÍÖ®Ò¹µÄÄÚÈÝ
	local system = GetShiningChoice()
	if (system == 0) then
		-- »ñÈ¡±£´æµÄÏµÍ³Ë÷Òý
		system = GetGlbInt(RELAYGLB_SYSTEM)
		if (system == 0) then
			system = get_random_system()
		end
	end

	-- »ñµÃ×îNBµÄÍ¶Æ±ÈËµÄÃû×Ö
	local szVoteName = GetVoteName()

	SetGlbInt(RELAYGLB_SHINYNIGHT, 1)
	GlobalExecute(format("dw ShinyNight_Start(%d,%d,%s)", system, multiple, szVoteName))
	
	-- Çå³ýrelayÖÐµÄ¼ÇÒä
	ClearShiningNight()
end
