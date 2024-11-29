function TaskShedule()
	TaskName("Héi Ngé Cao Thñ");		
	TaskInterval(1440);
	TaskTime(22,30);	
	TaskCountLimit(0);
end

function TaskContent()		
	GlobalExecute(format("dw call_faction_boss(%d)", 3))
end
