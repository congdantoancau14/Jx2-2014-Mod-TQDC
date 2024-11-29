--Ê¥»ð´«µÝ»î¶¯

g_nInterValTime = 2;	--´¥·¢µÄ¼ä¸ôÊ±¼ä
-- ¶¨Ê±Éè¶¨
function TaskShedule()
	-- ÈÎÎñÃû×Ö
	TaskName("Ho¹t ®éng chuyÓn th¸nh háa")
	
	-- 1·ÖÖÓ´¥·¢Ò»´Î
	TaskInterval(g_nInterValTime)
	
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"))
	--RelayÆô¶¯ºóÏÂÒ»¸öquarterÖ´ÐÐ
	TaskTime(nHour, nMin)

	-- ÖØ¸´Ö´ÐÐÎÞÏÞ´ÎÊý
	TaskCountLimit(0)
	
	local msg = "Ho¹t ®éng chuyÓn th¸nh háa b¾t ®Çu, thêi gian lµ "..nHour.." ®iÓm"..nMin.." Phót "
	OutputMsg(format(msg))
end;

-- ¶¨Ê±Ö´ÐÐµÄÄÚÈÝ
function TaskContent()
	local nTime = tonumber(date("%H%M"))
	if nTime == 1940 or nTime == 1941 then
		GlobalExecute("dw shenghuochuandi_init(1)")
	elseif nTime == 2000 or nTime == 2001 then
		GlobalExecute("dw shenghuochuandi_init(2)")
	elseif nTime > 2001 and nTime < 2104 then
		GlobalExecute("dw shenghuochuandi_init(4)")
	elseif nTime == 2104 or nTime == 2105 then
		GlobalExecute("dw shenghuochuandi_init(3)")
	end
end;
