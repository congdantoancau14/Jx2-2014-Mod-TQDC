-- BOSS定时器

function TaskShedule()
	TaskName("Boss Lng S琻 Ho祅g Kim");

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(12,30);
	OutputMsg(format("Boss Lng S琻 Ho祅g Kim xu蕋 hi謓 v祇 l骳 12: 30..."));
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	-- 执行召唤脚本函数
	local nRand = random(1,3);
	GlobalExecute(format("dw Create_LSB_BOSS(%d)",nRand));
end