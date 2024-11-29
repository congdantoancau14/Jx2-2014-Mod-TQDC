
-- ±ÈÎä´ó»á×Ê¸ñÅÅÃû

function TaskShedule()
	-- ÈÎÎñÃû×Ö
	TaskName("XÕp h¹ng t­ c¸ch ®¹i héi tû vâ")
	
	local h = tonumber(date("%H"))
	local m = tonumber(date("%M"))
	
	-- 60·ÖÖÓ´¥·¢Ò»´Î
	TaskInterval(60)	
	TaskTime(23, 30)
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0)
end;

-- ¶¨Ê±Ö´ĞĞµÄÄÚÈİ
function TaskContent()
	local w = tonumber(date("%w"))
	local h = tonumber(date("%H"))

	-- ĞÇÆÚÌì23µã
	if w == 0 and h == 23 then
		OutputMsg("§ang xÕp h¹ng t­ c¸ch ®¹i héi tû vâ...")
		CalcGestConvetionRankJf("calc_point")
	end
end

tPoint = {100, 90, 85, 80, 75, 70, 65, 60, 55, 50}

function calc_point(nLevel, nRank)
	local nRetPoint = 0
	if tPoint[nRank] ~= nil then
		nRetPoint = tPoint[nRank]
	end
	return nRetPoint
end
