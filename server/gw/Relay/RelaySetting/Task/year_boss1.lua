--每天12:30,21:30准时刷新

function TaskShedule()
	TaskName("BOSS N╩ M韎");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(12,30);
	OutputMsg(format("BOSS N╩ M韎 s� xu蕋 hi謓 � %s...", "12:30"));
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw Yb_CreateBoss(%d)", tonumber(nDate)));
end