function TaskShedule()
	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(22,00);
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d%H")) + random(10000);
	GlobalExecute(format("dw ibc_CallBoss(%d)", tonumber(nDate)));
end