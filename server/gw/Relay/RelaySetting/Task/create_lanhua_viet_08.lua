

function TaskShedule()
	TaskName("Lan Hoa");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(8,1);
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	local nRandom = random(1, 4)
	-- 执行创建灯笼的脚本函数
	GlobalExecute(format("dw create_lanhua_boss_viet(%d)", nRandom))
end
