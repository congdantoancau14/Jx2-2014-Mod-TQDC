function TaskShedule()
	TaskName("Thi猲 T莔 Th竝 Ho祅g Kim BOSS xu蕋 hi謓!");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(12,30);
	OutputMsg(format("Thi猲 T莔 Th竝 Ho祅g Kim BOSS xu蕋 hi謓 r錳!", "12:30"));
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw Qht_Relay_Create_Gold_boss(%d)", tonumber(nDate)));
end