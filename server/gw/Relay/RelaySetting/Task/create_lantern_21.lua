

function TaskShedule()
	TaskName("L錸g n may m緉");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(21,0);
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	-- 执行创建灯笼的脚本函数
	GlobalExecute("dw mooncake_08_viet()")
end
