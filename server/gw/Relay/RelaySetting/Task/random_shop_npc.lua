-- =====================================================
-- ¶¨Ê±°ÑÉÌ»áÈÎÎñµÄÉÌµênpc·Åµ½Ëæ»úÎ»ÖÃµÄ½Å±¾
-- Tony(Jizheng)
-- =====================================================

-- ¶¨Ê±Éè¶¨
function TaskShedule()
	-- ÈÎÎñÃû×Ö
	TaskName("NPC nhiÖm vô Th­¬ng Héi sÏ thay ®æi c¸c vŞ trİ xuÊt hiÖn")
	
	-- °ë¸öĞ¡Ê±Ò»´Î
	TaskInterval(30)
	
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local nHour = tonumber(date("%H"))
	local nMinute = tonumber(date("%M"))
	
	if (nMinute >= 50) then
		nMinute = nMinute - 50
		if (nHour + 1 == 24) then
			nHour = 0
		else
			nHour = nHour + 1
		end
	else
		nMinute = nMinute + 10
	end
	
	-- µ±Ç°relayÆô¶¯ºó10·ÖÖÓ¾Í¼ÓÔØÆğÀ´
	TaskTime(nHour, nMinute)

	-- ÖØ¸´Ö´ĞĞÎŞÏŞ´ÎÊı
	TaskCountLimit(0)
	
	local msg = "NPC th­¬ng héi"..nHour.." giê "..nMinute.."phót xuÊt hiÖn!"
	OutputMsg(format(msg))
end;

-- ¶¨Ê±Ö´ĞĞµÄÄÚÈİ
function TaskContent()

	--    ³ÇÊĞµØµã£º
	local strMapName = 	{"TuyÒn Ch©u", "BiÖn Kinh", "Thµnh §«", "T­¬ng D­¬ng", "D­¬ng Ch©u", "§¹i Lı"}
	local nMapID 	 =	{100,  	 200,    300,    350,    150,    400}
	local nMapX 	 =	{1499,   1439,   1794,   1497,   1653,   1428}
	local nMapY 	 =	{3059,   2956,   3608,   2882,   3109,   3005}
	
	local nIndex = random(1, 6)
	local msg="NPC th­¬ng héi sÏ xuÊt hiÖn ë:"..strMapName[nIndex].."!"
	OutputMsg(format(msg))

	-- Ö´ĞĞÕÙ»½Ëæ»úÉÌ»ánpcµÄ½Å±¾
	GlobalExecute(format("dw random_shop(%d,%d,%d)", nMapID[nIndex], nMapX[nIndex], nMapY[nIndex]))
end;

