-- 激战千寻塔定时数据清理

function TaskShedule()
	TaskName("Thi誸 l藀 th阨 gian Thi猲 T莔 Th竝");

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(00,30);
	OutputMsg(format("M鏸 ng祔 00h30 s� thi誸 l藀 l筰 d� li謚 Thi猲 T莔 Th竝..."));
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
	-- 执行召唤脚本函数
	GlobalExecute("dw Qht_Relay_Clean()")
end