--每天20:00准时刷新

function TaskShedule()
	TaskName("T筽 m韎 Ph� Th駓 B╪g Gi�");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(20,00);
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d%H")) + random(10000);
	GlobalExecute(format("dw oly_hanbingwunv(%d)", tonumber(nDate)));
end