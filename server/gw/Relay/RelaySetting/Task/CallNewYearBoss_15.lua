-- 中午1点出现的BOSS定时器

function TaskShedule()
	TaskName("Цnh Ni猲 th�");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(15,0);
	OutputMsg(format("K� L﹏ xu蕋 hi謓 v祇 l骳 15:00..."));
	-- 执行无限次
	TaskCountLimit(0);

	-- OutputMsg("启动自动滚动公告...");
end

function TaskContent()
	-- 执行召唤年兽的脚本函数
	local m1 = random(11,12)
	local m2 = random(13,15)
	local m3 = random(16,18)
	GlobalExecute(format("dw createNewYearBoss(%d,%d,%d,%d)", 0, m1, m2, m3))
end
