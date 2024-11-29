-- =====================================================
-- ¶¨Ê±°ÑÔÂÁÁÍÃ»î¶¯µÄnpc·Åµ½Ëæ»úÎ»ÖÃµÄ½Å±¾
-- =====================================================

-- ¶¨Ê±Éè¶¨
function TaskShedule()
	-- ÈÎÎñÃû×Ö
	TaskName("NPC ho¹t ®éng Tr¨ng r»m sÏ tïy lóc xuÊt hiÖn")
	
	-- Ò»¸öĞ¡Ê±Ò»´Î
	TaskInterval(60)
	
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local nHour = tonumber(date("%H"))
	
	if nHour >= 22 or nHour <= 7 then  --23µãµ½8µãÖ®¼ä²»´¥·¢
		nHour = 9
	else
		nHour = nHour + 1
	end
	
	-- µ±Ç°relayÆô¶¯ºóÏÂÒ»¸öĞ¡Ê±¾Í¼ÓÔØÆğÀ´
	TaskTime(nHour, 0)

	-- ÖØ¸´Ö´ĞĞÎŞÏŞ´ÎÊı
	TaskCountLimit(0)
	
	local msg = "TiÓu thè sÏ xuÊt hiÖn lóc"..nHour.." giê 0 phót xuÊt hiÖn "
	OutputMsg(format(msg))
end;

-- ¶¨Ê±Ö´ĞĞµÄÄÚÈİ
function TaskContent()

	--    ³ÇÊĞµØµã£º
	tMap = {
		{"TuyÒn Ch©u", 100, 1459, 2811},
		{"BiÖn Kinh", 200, 1169, 2845},
		{"Thµnh §«", 300, 1653, 3559},
		{"T­¬ng D­¬ng", 350, 1436, 2808},
		{"D­¬ng Ch©u", 150, 1680, 3118},
		{"§¹i Lı", 400, 1485, 3018},
	}
		
	local nIndex = random(1, 6)
	local nHour = tonumber(date("%H"))
	if nHour < 23 and nHour > 8 then
		local msg="TiÓu thè sÏ xuÊt hiÖn ë vŞ trİ míi:"..tMap[nIndex][1].."!"
		OutputMsg(format(msg))
	
		-- Ö´ĞĞÕÙ»½Ëæ»úÉÌ»ánpcµÄ½Å±¾
		GlobalExecute(format("dw abluemoon_start(%d)", nIndex))
	end
end;

