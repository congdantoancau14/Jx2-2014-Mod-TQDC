-- “ª÷‹“ª¥Œ±∏∑›’Ω≥°≈≈––

function TaskShedule()
	TaskName("WeeklyBackupBR");	
	
	local h = tonumber(date("%H"))
	
	-- 60∑÷÷”¥•∑¢“ª¥Œ
	TaskInterval(60)	
	TaskTime(21, 1)
	-- ÷¥––Œﬁœﬁ¥Œ
	TaskCountLimit(0)
end

function TaskContent()

	local w = tonumber(date("%w"))
	local h = tonumber(date("%H"))

	if w == 6 and h == 21 then
		CalcHonorPoint(5)
		OutputMsg("ßang thËng k’ x’p hπng chi’n tr≠Íng!...")
	end
end