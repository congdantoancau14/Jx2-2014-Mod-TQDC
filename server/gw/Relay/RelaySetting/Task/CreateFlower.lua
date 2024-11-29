function TaskShedule()
		TaskName("Hoa Tr飊g Dng");	
		-- 5分钟一次
		TaskInterval(5);
		-- 设置触发时间
		local nHour = tonumber(date("%H"))
		local nMinute = tonumber(date("%M"))
		
		if (nMinute >= 50) then
			nMinute = nMinute - 50
			if (nHour + 1 == 24) then
				nHour = 0
			else
				nHour = nHour + 1
			end
		else
			nMinute = nMinute + 10
		end
		
		-- 当前relay启动后10分钟就加载起来
		TaskTime(nHour, nMinute)
		-- 执行无限次
		TaskCountLimit(0)
end

function TaskContent()
	GlobalExecute("dw double_nineth()")
end
