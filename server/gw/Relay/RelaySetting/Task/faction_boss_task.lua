-- =====================================================
-- ¶¨Ê±°ÑÃÅÅÉbossÈÎÎñµÄ´ó¹Öboss·Åµ½Ëæ»úÎ»ÖÃµÄ½Å±¾
-- Tony(Jizheng)
-- Dec 20th, 2006
-- =====================================================

-- ¶¨Ê±Éè¶¨
function TaskShedule()
	-- ÈÎÎñÃû×Ö
	TaskName("NhiÖm vô BOSS m«n ph¸i")
	-- 24¸öĞ¡Ê±Ò»´Î
	TaskInterval(1440)
	
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local nHour = 21
	local nMinute = 0
	TaskTime(nHour, nMinute)
	-- ÖØ¸´Ö´ĞĞÎŞÏŞ´ÎÊı
	TaskCountLimit(0)
	
	local msg = "NCP nhiÖm vô boss m«n ph¸i tïy lóc…"..nHour.." giê "..nMinute.."phót xuÊt hiÖn!"
	OutputMsg(format(msg))
end;

-- ¶¨Ê±Ö´ĞĞµÄÄÚÈİ
function TaskContent()

	--    bossÃû×Ö£º
	local strBossName = 	{"Thanh Th­", "HuyÒn Ch©n", "D­¬ng Diªn §øc", "§­êng Hû", "Hoµng Chİnh NhÊt", "Cæ MÆc", "TuÖ Minh"}
	
	local szPos = {1, 2, 3, 4, 5, 6, 7}
	local nPos1 = 0
	local nPos2 = 0
	local nPos3 = 0
	
	-- ÔÚ7¸öbossÖĞ¼äËæ»úÑ¡Ôñ3¸ö
	local nSel = random(1, 7)
	nPos1 = szPos[nSel]				-- µÚÒ»¸ö
	szPos[nSel] = szPos[7]
	
	nSel = random(1, 6)
	nPos2 = szPos[nSel]				-- µÚ¶ş¸ö
	szPos[nSel] = szPos[6]
	
	nSel = random(1, 5)
	nPos3 = szPos[nSel]				-- µÚÈı¸ö
	
	local msg="Boss m«n ph¸i sÏ xuÊt hiÖn ë:"..strBossName[nPos1]..", "..strBossName[nPos2]..", "..strBossName[nPos3].."!"
	OutputMsg(format(msg))
	
	-- ·¢¸ø·şÎñÆ÷ÈÃËûÃÇÕĞboss
	GlobalExecute(format("dw call_faction_bt_boss(%d,%d,%d)", nPos1, nPos2, nPos3))
end;

