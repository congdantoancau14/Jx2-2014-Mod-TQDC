--圣火传递活动

g_nInterValTime = 2;	--触发的间隔时间
-- 定时设定
function TaskShedule()
	-- 任务名字
	TaskName("Ho箃 ng chuy觧 th竛h h醓")
	
	-- 1分钟触发一次
	TaskInterval(g_nInterValTime)
	
	-- 设置触发时间
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"))
	--Relay启动后下一个quarter执行
	TaskTime(nHour, nMin)

	-- 重复执行无限次数
	TaskCountLimit(0)
	
	local msg = "Ho箃 ng chuy觧 th竛h h醓 b総 u, th阨 gian l� "..nHour.." 甶觤"..nMin.." Ph髏 "
	OutputMsg(format(msg))
end;

-- 定时执行的内容
function TaskContent()
	local nTime = tonumber(date("%H%M"))
	if nTime == 1940 or nTime == 1941 then
		GlobalExecute("dw shenghuochuandi_init(1)")
	elseif nTime == 2000 or nTime == 2001 then
		GlobalExecute("dw shenghuochuandi_init(2)")
	elseif nTime > 2001 and nTime < 2104 then
		GlobalExecute("dw shenghuochuandi_init(4)")
	elseif nTime == 2104 or nTime == 2105 then
		GlobalExecute("dw shenghuochuandi_init(3)")
	end
end;
