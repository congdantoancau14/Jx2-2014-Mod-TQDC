

function TaskShedule()
	TaskName("n L錸g");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(17,1);
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	local nDay = tonumber(date("%w"));
	GlobalExecute(format("dw create_npcs(%d)", nDay))
end
