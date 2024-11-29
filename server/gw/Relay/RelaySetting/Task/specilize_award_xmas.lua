

function TaskShedule()
	TaskName("HÈp Quµ ß∆c Bi÷t");	

	-- “ªÃÏ“ª¥Œ
	TaskInterval(1440);
	-- …Ë÷√¥•∑¢ ±º‰
	TaskTime(13,0);
	-- ÷¥––Œﬁœﬁ¥Œ
	TaskCountLimit(0);

end

function TaskContent()
	local index = random(1,3)
	GlobalExecute(format("dw xmas_event_08_viet(%d)",index))
end
